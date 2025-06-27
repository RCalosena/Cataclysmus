#reloadable

import crafttweaker.block.IBlock;
import crafttweaker.world.IBlockPos;
import crafttweaker.player.IPlayer;
import mods.ctintegration.scalinghealth.DifficultyManager;
import crafttweaker.world.IFacing;
import crafttweaker.util.Math;
import crafttweaker.data.IData;
import crafttweaker.enchantments.IEnchantmentDefinition;

function isBlocks(wood as IBlock, plank as IBlock) as bool {
    var condition = 0;

    for wud in <ore:logWood>.items {
        if (wud.asBlock().definition.id == wood.definition.id) { condition += 1; }
    }
    for planck in <ore:plankWood>.items {
        if (planck.asBlock().definition.id == plank.definition.id) { condition += 1; }
    }

    if condition == 1 { return true; }
    return false;
}

//Default Gamerules
events.onPlayerLoggedIn(function(event as crafttweaker.event.PlayerLoggedInEvent){
    if event.player.world.gameRuleHelper.getBoolean("naturalRegeneration") {
    event.player.world.setOrCreateGameRule("naturalRegeneration","false");
    }

    if !event.player.world.gameRuleHelper.getBoolean("reducedDebugInfo") {
    event.player.world.setOrCreateGameRule("reducedDebugInfo","true");
    }

    if event.player.world.gameRuleHelper.getBoolean("commandBlockOutput") {
    event.player.world.setOrCreateGameRule("commandBlockOutput","false");
    }

    if event.player.world.gameRuleHelper.getInt("spawnRadius") != 500 {
    event.player.world.setOrCreateGameRule("spawnRadius","500");
    }
});
//Default Gamerules

//Sleep on 1stNight
events.register(function(event2 as crafttweaker.event.PlayerTickEvent){
if event2.side == "CLIENT" { return; }
if (event2.phase == "START") { return; }
if event2.player.hasGameStage("dayone") { return; }

var player = event2.player;
var world = player.world;

if world.provider.getWorldTime() == 24000 { player.addGameStage("misery"); player.addGameStage("dayone"); }

});

events.register(function(event as crafttweaker.event.PlayerSleepInBedEvent) {
    if event.player.world.isRemote() { return; }
    if event.player.hasGameStage("dayone") { return; }

    var player = event.player;

    //Disable sleeping on the first night
        event.result = "OTHER_PROBLEM";
        if !player.world.isDayTime() { player.sendStatusMessage("You can't sleep on the first night"); }
});
//Sleep on 1stNight

//Log and plank unmineable
events.register(function(event1 as crafttweaker.event.BlockBreakEvent){
if event1.world.isRemote() { return; }

if (isBlocks(event1.block, event1.block) || event1.block.definition.getHarvestTool(event1.block.definition.defaultState) == "axe") {
    if !isNull(event1.player.currentItem) {
        for toolClasses in event1.player.currentItem.toolClasses {
            if toolClasses == event1.block.definition.getHarvestTool(event1.block.definition.defaultState) { return; }
        }
    }
event1.cancel();
event1.world.destroyBlock(event1.position, false);
}});
//Log and plank unmineable

//Leaves Stick Drop && Gravel Flint Drop && Ores Dust Drop
events.register(function(event2 as crafttweaker.event.BlockHarvestDropsEvent){
    if event2.world.isRemote() { return; }
    var bDef = event2.block.definition;

    for leves in <ore:treeLeaves>.items {
        if (bDef.id == leves.asBlock().definition.id) { event2.drops += <minecraft:stick> % 20; }
    }
        if event2.world.random.nextInt(0, 3) == 3 {

            if (bDef.id == "minecraft:gravel") { event2.drops = [<minecraft:flint>.weight(1.0)]; }

            for copper in <ore:oreCopper>.items {
                if (bDef.id == copper.asBlock().definition.id) { event2.drops = [<metallurgy:copper_dust>.weight(1.0), <metallurgy:copper_dust>.weight(0.5)]; }
            }
            for manganese in <ore:oreManganese>.items {
                if (bDef.id == manganese.asBlock().definition.id) { event2.drops = [<metallurgy:manganese_dust>.weight(1.0), <metallurgy:manganese_dust>.weight(0.5)]; }
            }
            for tin in <ore:oreTin>.items {
                if (bDef.id == tin.asBlock().definition.id) { event2.drops = [<metallurgy:tin_dust>.weight(1.0), <metallurgy:tin_dust>.weight(0.5)]; }
            }
            for iron in <ore:oreIron>.items {
                if (bDef.id == iron.asBlock().definition.id) { event2.drops = [<metallurgy:iron_dust>.weight(1.0), <metallurgy:iron_dust>.weight(0.5)]; }
            }
        }
});
//Leaves Stick Drop && Gravel Flint Drop && Ores Dust Drop

//Stagnant Sky
events.onGameStageAdded(function(event5 as mods.ctintegration.gamestages.GameStageAddedEvent){
    if (event5.gameStage == "Death" && isNull(event5.player.world.getCustomWorldData().postStagSky)) {
        server.commandManager.executeCommandSilent(server,"tellraw @a {\"text\":\"§6Time has come to a stop...\"}");
        server.commandManager.executeCommandSilent(server,"gamerule doDaylightCycle_tc false");
        server.commandManager.executeCommandSilent(server,"gamerule doDaylightCycle false");
        server.commandManager.executeCommandSilent(server,"time set 12500");
    }
});
events.onGameStageRemoved(function(event6 as mods.ctintegration.gamestages.GameStageRemovedEvent){
    if event6.gameStage == "Death" {
        server.commandManager.executeCommandSilent(server,"gamerule doDaylightCycle_tc true");
        server.commandManager.executeCommandSilent(server,"gamerule doDaylightCycle true");
        event6.player.world.setCustomWorldData({postStagSky: 1});
    }
});
    //Bugfix (The beneath for some reason resumes but also doesn't the daylight cycle)
    events.register(function(event as crafttweaker.event.PlayerChangedDimensionEvent){
        if (event.to == 0 && event.player.hasGameStage("Death") && isNull(event.player.world.getCustomWorldData().postStagSky)) { 
            server.commandManager.executeCommandSilent(server,"gamerule doDaylightCycle_tc false");
            server.commandManager.executeCommandSilent(server,"gamerule doDaylightCycle false");
            server.commandManager.executeCommandSilent(server,"time set 12500");
        }
    });
events.register(function(event as crafttweaker.event.PlayerSleepInBedEvent) {
    if event.player.world.isRemote() { return; }
    if !event.player.hasGameStage("Death") { return; }
    if !isNull(event.player.world.getCustomWorldData().postStagSky) { return; }

    var player = event.player;

    //Disable sleeping on the first night
        event.result = "OTHER_PROBLEM";
        if !player.world.isDayTime() { player.sendStatusMessage("You don't feel tired"); }
});
//Stagnant Sky

//Deep Caverns Lock
events.register(function(event as crafttweaker.event.PlayerBreakSpeedEvent){
    if event.y != 1 { return; }

    if !event.player.hasGameStage("BansheeSpawn") { event.player.sendStatusMessage("§5Malignant energy stops you from going further"); event.cancel(); }
});
events.register(function(event as crafttweaker.event.ExplosionStartEvent){
    if event.y > 5 { return; }

    for player in event.world.getAllPlayers(){
        if !player.hasGameStage("BansheeSpawn") { player.sendStatusMessage("§5Malignant energy stops you from going further"); event.explosion.doExplosionB(true); event.cancel(); }
    }
});
//Deep Caverns Lock

//Nether Portal Lock
events.register(function(event as crafttweaker.event.PortalSpawnEvent){
    if event.world.isRemote() { return; }

    for player in event.world.getAllPlayers(){
        if !player.hasGameStage("Portalkey") { player.sendStatusMessage("§dThe Skeleton King holds the key to this dimension"); event.cancel(); }
    }
});
events.register(function(event as crafttweaker.event.EntityTravelToDimensionEvent){
    if event.entity.world.isRemote() { return; }
    if !event.entity instanceof IPlayer { return; }

    var player as IPlayer = event.entity;

    if player.hasGameStage("Portalkey") { return; }
    
    if (event.dimension == -1) { player.sendStatusMessage("§dThe Skeleton King holds the key to this dimension"); event.cancel(); }
});
//Nether Portal Lock

//Vitalberry tutorial

var playerCache = {} as IData[string];

events.register(function(event as crafttweaker.event.PlayerTickEvent){
if event.side == "CLIENT" return; 
if event.phase == "END" return;
if event.player.world.time %20 != 0 return;
if event.player.hasGameStage("gatheredberries") return;

    val player = event.player;
    val pName = player.name;
    val px = player.x;
    val pz = player.z;
    val py = player.y as int;
    val yaw = (player.rotationYaw + 90);
    val time = player.world.time;

    //if !isNull(playerCache[pName]) {
    //    var lastData = playerCache[pName] as IData[string];
//
    //if (!isNull(lastData)) {
    //    print("lastData contents: " ~ toString(lastData));
//
    //    var lastTick = (lastData["lastTick"] as IData).asLong();
    //    var lastYaw = (lastData["yaw"] as IData).asFloat();
//
    //    // Skip if player scanned recently and didn't rotate much
    //    if ((time - lastTick) < 100 && Math.abs(lastYaw - yaw) < 10.0) {
    //        var bushList = (lastData["bushes"]).asMap();
//
    //        for bush in bushList {
    //            var bx = bush["x"] as int;
    //            var by = bush["y"] as int;
    //            var bz = bush["z"] as int;
//
    //            var pos = crafttweaker.util.Position3f.create(bx, by, bz) as IBlockPos;
    //            var state = player.world.getBlockState(pos);
//
    //            if (state.compare(<blockstate:rustic:wildberry_bush:berries=true>) == 0) {
    //                server.commandManager.executeCommandSilent(server,
    //                    "particle heart " ~ bx ~ " " ~ (by + 1) ~ " " ~ bz ~ " 0.2 0.0 0.2 0 1 force " ~ pName);
    //            }
    //        }
    //        return;
    //    }
    //}}  

    val pi = 3.14159265;
    val rad = yaw * pi / 180.0;
    val cosJaw = Math.cos(rad);
    val sinJaw = Math.sin(rad);
    val range = 12;

    //var newBushes = {} as IData[string];
    //var bushCount = 0;

    for offset in 1 to range {
        val spread = (range - (range - offset));

        for sideOffset in ((spread - 1) * -1) to spread {
            // Build triangle
            val fx = offset;
            val fz = sideOffset;

            // Rotate fx/fz by yaw
            val dx = cosJaw * fx - sinJaw * fz;
            val dz = sinJaw * fx + cosJaw * fz;

            val x = (px + dx) as int;
            val z = (pz + dz) as int;

            val pos = crafttweaker.util.Position3f.create(x, py, z) as IBlockPos;
            val blockstate = player.world.getBlockState(pos);

            if (blockstate.compare(<blockstate:rustic:wildberry_bush:berries=true>) == 0) {
                server.commandManager.executeCommandSilent(server, "particle heart " ~ x ~ " " ~ (py + 1) ~ " " ~ z ~ " 0.2 0.0 0.2 0 1 force " ~ pName);
            
                //var bushData = {
                //        "x": x,
                //        "y": py,
                //        "z": z
                //} as IData;
//
                //newBushes[bushCount as string] = bushData;
                //print(toString(newBushes));
                //bushCount += 1;
                
            }
        }
    }
    
    //var cacheData = {
    //    "lastTick": time,
    //    "yaw": yaw,
    //} as IData[string];
    //    
    //cacheData["bushes"] = newBushes;
//
    //playerCache[pName] = cacheData;
});

events.register(function(event as crafttweaker.event.PlayerInteractBlockEvent){
if event.player.world.isRemote() { return; }
if event.player.hasGameStage("gatheredberries") { return; }
    if event.blockState.compare(<blockstate:rustic:wildberry_bush:berries=true>) == 0 {
        event.player.addGameStage("gatheredberries");
    }
});
//Vitalberry tutorial

//Spawner enchant drop
val enchs = [
    <enchantment:minecraft:sweeping>,
    <enchantment:minecraft:thorns>,
    <enchantment:spartanweaponry:expanse>,
    <enchantment:mod_lavacow:corrosive>,
    <enchantment:mujmajnkraftsbettersurvival:assassinate>,
    <enchantment:mujmajnkraftsbettersurvival:multishot>,
    <enchantment:mujmajnkraftsbettersurvival:weightless>,
    <enchantment:tombstone:blessing>,
    <enchantment:minecraft:frost_walker>,
    <enchantment:minecraft:punch>,
    <enchantment:mujmajnkraftsbettersurvival:fling>,
    <enchantment:minecraft:sharpness>,
    <enchantment:uniqueebattle:artemis_soul>,
    <enchantment:minecraft:efficiency>,
    <enchantment:mujmajnkraftsbettersurvival:blast>,
    <enchantment:mujmajnkraftsbettersurvival:bash>,
    <enchantment:minecraft:lure>,
    <enchantment:spartanweaponry:sharpshooter>,
    <enchantment:minecraft:fire_aspect>,
    <enchantment:tombstone:plague_bringer>,
    <enchantment:switchbow:activescope>,
    <enchantment:uniquee:smart_ass>,
    <enchantment:mujmajnkraftsbettersurvival:penetration>,
    <enchantment:spartanweaponry:supercharge>,
    <enchantment:elenaidodge2:lightweight>,
    <enchantment:spartanweaponry:propulsion>,
    <enchantment:minecraft:fortune>,
    <enchantment:minecraft:knockback>,
    <enchantment:ebwizardry:shock_protection>,
    <enchantment:spartanweaponry:lucky_throw>,
    <enchantment:mujmajnkraftsbettersurvival:rapidfire>,
    <enchantment:minecraft:aqua_affinity>,
    <enchantment:mod_lavacow:lifesteal>,
    <enchantment:mujmajnkraftsbettersurvival:reflection>,
    <enchantment:mujmajnkraftsbettersurvival:range>,
    <enchantment:uniqueebattle:granis_soul>,
    <enchantment:mujmajnkraftsbettersurvival:heavy>,
    <enchantment:uniquee:berserk>,
    <enchantment:mujmajnkraftsbettersurvival:tunneling>,
    <enchantment:uniqueebattle:fury>,
    <enchantment:uniqueebattle:celestial_blessing>,
    <enchantment:minecraft:depth_strider>,
    <enchantment:mujmajnkraftsbettersurvival:agility>,
    <enchantment:mujmajnkraftsbettersurvival:arrowrecovery>,
    <enchantment:uniquee:sages_blessing>,
    <enchantment:mod_lavacow:poisonous>,
    <enchantment:mujmajnkraftsbettersurvival:disarm>,
    <enchantment:tombstone:soulbound>,
    <enchantment:switchbow:cooldownreduce>,
    <enchantment:minecraft:protection>,
    <enchantment:spartanweaponry:return>,
    <enchantment:uniquee:climate_tranquility>,
    <enchantment:uniquee:momentum>,
    <enchantment:minecraft:luck_of_the_sea>,
    <enchantment:mujmajnkraftsbettersurvival:highjump>,
    <enchantment:uniquee:midas_blessing>,
    <enchantment:uniquee:phoenixs_blessing>,
    <enchantment:minecraft:flame>,
    <enchantment:minecraft:feather_falling>,
    <enchantment:uniquee:treasurers_eyes>,
    <enchantment:mujmajnkraftsbettersurvival:education>,
    <enchantment:uniquee:ifrits_grace>,
    <enchantment:minecraft:projectile_protection>,
    <enchantment:uniquee:spartanweapon>,
    <enchantment:uniquee:focus_impact>,
    <enchantment:uniquee:ender_eyes>,
    <enchantment:spartanweaponry:hydrodynamic>,
    <enchantment:minecraft:smite>,
    <enchantment:mujmajnkraftsbettersurvival:versatility>,
    <enchantment:uniqueebattle:streakers_will>,
    <enchantment:mujmajnkraftsbettersurvival:smelting>,
    <enchantment:mujmajnkraftsbettersurvival:vampirism>,
    <enchantment:ebwizardry:magic_protection>,
    <enchantment:spartanweaponry:razors_edge>,
    <enchantment:tombstone:magic_siphon>,
    <enchantment:cqrepoured:spectral>,
    <enchantment:uniquee:vitae>,
    <enchantment:minecraft:unbreaking>,
    <enchantment:switchbow:pullspeed>,
    <enchantment:ebwizardry:frost_protection>,
    <enchantment:spartanweaponry:spreadshot>,
    <enchantment:minecraft:fire_protection>,
    <enchantment:minecraft:power>,
    <enchantment:uniquee:perpetualstrike>,
    <enchantment:uniquee:swiftblade>,
    <enchantment:tombstone:shadow_step>,
    <enchantment:uniquee:bone_crusher>,
    <enchantment:minecraft:blast_protection>,
    <enchantment:spartanweaponry:rapid_load>,
    <enchantment:uniquee:icarus_aegis>,
    <enchantment:minecraft:bane_of_arthropods>,
    <enchantment:mujmajnkraftsbettersurvival:combo>,
    <enchantment:minecraft:silk_touch>,
    <enchantment:minecraft:looting>,
    <enchantment:mujmajnkraftsbettersurvival:blockpower>,
    <enchantment:uniquee:ender_librarian>,
    <enchantment:walljump:doublejump>,
    <enchantment:minecraft:respiration>,
    <enchantment:cqrepoured:lightning_protection>,
    <enchantment:mujmajnkraftsbettersurvival:diamonds>,
    <enchantment:uniqueebattle:golem_soul>,
    <enchantment:uniqueebattle:ares_grace>,
    <enchantment:uniqueebattle:iron_bird>,
    <enchantment:uniqueebattle:ifrits_blessing>,
    <enchantment:minecraft:infinity>,
    <enchantment:mujmajnkraftsbettersurvival:spellshield>,
    <enchantment:spartanweaponry:incendiary>
] as IEnchantmentDefinition[];

events.register(function(event as crafttweaker.event.BlockHarvestDropsEvent){
    if !event.isPlayer return;
    if event.player.world.isRemote() return;
    if event.block.definition.id != "minecraft:mob_spawner" return;

    if event.fortuneLevel == 0 {
        event.drops += <minecraft:enchanted_book>.withTag({StoredEnchantments: [{lvl: 1 as short, id: enchs[event.world.random.nextInt(0, 105)].id as short}]}).weight(100);
    }
    if event.fortuneLevel == 1 {
        event.drops += <minecraft:enchanted_book>.withTag({StoredEnchantments: [{lvl: 1 as short, id: enchs[event.world.random.nextInt(0, 105)].id as short}]}).weight(100);
        event.drops += <minecraft:enchanted_book>.withTag({StoredEnchantments: [{lvl: 1 as short, id: enchs[event.world.random.nextInt(0, 105)].id as short}]}).weight(100);
    }
    if event.fortuneLevel == 2 {
        event.drops += <minecraft:enchanted_book>.withTag({StoredEnchantments: [{lvl: 1 as short, id: enchs[event.world.random.nextInt(0, 105)].id as short}]}).weight(100);
        event.drops += <minecraft:enchanted_book>.withTag({StoredEnchantments: [{lvl: 1 as short, id: enchs[event.world.random.nextInt(0, 105)].id as short}]}).weight(100);
        event.drops += <minecraft:enchanted_book>.withTag({StoredEnchantments: [{lvl: 1 as short, id: enchs[event.world.random.nextInt(0, 105)].id as short}]}).weight(100);
    }
    if event.fortuneLevel == 3 {
        event.drops += <minecraft:enchanted_book>.withTag({StoredEnchantments: [{lvl: 1 as short, id: enchs[event.world.random.nextInt(0, 105)].id as short}]}).weight(100);
        event.drops += <minecraft:enchanted_book>.withTag({StoredEnchantments: [{lvl: 1 as short, id: enchs[event.world.random.nextInt(0, 105)].id as short}]}).weight(100);
        event.drops += <minecraft:enchanted_book>.withTag({StoredEnchantments: [{lvl: 1 as short, id: enchs[event.world.random.nextInt(0, 105)].id as short}]}).weight(100);
        event.drops += <minecraft:enchanted_book>.withTag({StoredEnchantments: [{lvl: 1 as short, id: enchs[event.world.random.nextInt(0, 105)].id as short}]}).weight(100);
    }
    if event.fortuneLevel == 4 {
        event.drops += <minecraft:enchanted_book>.withTag({StoredEnchantments: [{lvl: 1 as short, id: enchs[event.world.random.nextInt(0, 105)].id as short}]}).weight(100);
        event.drops += <minecraft:enchanted_book>.withTag({StoredEnchantments: [{lvl: 1 as short, id: enchs[event.world.random.nextInt(0, 105)].id as short}]}).weight(100);
        event.drops += <minecraft:enchanted_book>.withTag({StoredEnchantments: [{lvl: 1 as short, id: enchs[event.world.random.nextInt(0, 105)].id as short}]}).weight(100);
        event.drops += <minecraft:enchanted_book>.withTag({StoredEnchantments: [{lvl: 1 as short, id: enchs[event.world.random.nextInt(0, 105)].id as short}]}).weight(100);
        event.drops += <minecraft:enchanted_book>.withTag({StoredEnchantments: [{lvl: 1 as short, id: enchs[event.world.random.nextInt(0, 105)].id as short}]}).weight(100);
    }
});


//Spawner enchant drop

events.register(function(event1 as crafttweaker.event.BlockBreakEvent){
if event1.world.isRemote() { return; }

if (event1.block.definition.id == "erebus:preserved_block") {
event1.cancel();
event1.world.destroyBlock(event1.position, false);
}});

events.register(function(event1 as crafttweaker.event.BlockHarvestDropsEvent){
if event1.world.isRemote() { return; }

if (event1.block.definition.id == "dimstack:bedrock") {
    event1.dropChance = 0.0;
}});

events.register(function(event1 as crafttweaker.event.PlayerInteractBlockEvent){
if event1.world.isRemote() { return; }
if event1.dimension != 23 return;

if (event1.block.definition.id == "minecraft:chest" && isNull(event1.world.getCustomWorldData().parasitePhase)) {
    event1.player.sendStatusMessage("§2It's Locked");
    event1.cancel();
}
if (event1.block.definition.id == "minecraft:tnt" && isNull(event1.world.getCustomWorldData().parasitePhase)) {
    event1.cancel();
}
});

events.register(function(event1 as crafttweaker.event.PlayerBreakSpeedEvent){
if event1.player.world.isRemote() { return; }

if (event1.block.definition.id == "minecraft:chest" && isNull(event1.player.world.getCustomWorldData().parasitePhase)) {
    event1.cancel();
}});

//Ore Harvest Levels
<biomesoplenty:gem_ore:0>.asBlock().definition.setHarvestLevel("pickaxe", 6);
<biomesoplenty:gem_ore:0>.asBlock().definition.hardness = 9;
<biomesoplenty:gem_ore:0>.asBlock().definition.resistance = 99;
<nyx:meteor_rock>.asBlock().definition.setHarvestLevel("pickaxe", 7);
<nyx:meteor_rock>.asBlock().definition.hardness = 10;
<nyx:meteor_rock>.asBlock().definition.resistance = 99;
<midnight:rockshroom>.asBlock().definition.setHarvestLevel("pickaxe", 7);
<midnight:rockshroom>.asBlock().definition.hardness = 10;
<midnight:rockshroom>.asBlock().definition.resistance = 99;
<midnight:dark_pearl_ore>.asBlock().definition.setHarvestLevel("pickaxe", 7);
<midnight:dark_pearl_ore>.asBlock().definition.hardness = 10;
<midnight:dark_pearl_ore>.asBlock().definition.resistance = 99;
<midnight:tenebrum_ore>.asBlock().definition.setHarvestLevel("pickaxe", 7);
<midnight:tenebrum_ore>.asBlock().definition.hardness = 10;
<midnight:tenebrum_ore>.asBlock().definition.resistance = 99;
<midnight:nagrilite_ore>.asBlock().definition.setHarvestLevel("pickaxe", 7);
<midnight:nagrilite_ore>.asBlock().definition.hardness = 10;
<midnight:nagrilite_ore>.asBlock().definition.resistance = 99;
<midnight:ebonys_ore>.asBlock().definition.setHarvestLevel("pickaxe", 7);
<midnight:ebonys_ore>.asBlock().definition.hardness = 10;
<midnight:ebonys_ore>.asBlock().definition.resistance = 99;
<nyx:gleaning_meteor_rock>.asBlock().definition.setHarvestLevel("pickaxe", 7);
<nyx:gleaning_meteor_rock>.asBlock().definition.hardness = 10;
<nyx:gleaning_meteor_rock>.asBlock().definition.resistance = 99;
<erebus:ore_fossil>.asBlock().definition.setHarvestLevel("pickaxe", 8);
<erebus:ore_fossil>.asBlock().definition.hardness = 12;
<erebus:ore_fossil>.asBlock().definition.resistance = 99;
<erebus:ore_gneiss>.asBlock().definition.setHarvestLevel("pickaxe", 8);
<erebus:ore_gneiss>.asBlock().definition.hardness = 12;
<erebus:ore_gneiss>.asBlock().definition.resistance = 99;
<erebus:ore_temple>.asBlock().definition.setHarvestLevel("pickaxe", 8);
<erebus:ore_temple>.asBlock().definition.hardness = 12;
<erebus:ore_temple>.asBlock().definition.resistance = 99;
<erebus:ore_petrified_wood>.asBlock().definition.setHarvestLevel("pickaxe", 8);
<erebus:ore_petrified_wood>.asBlock().definition.hardness = 12;
<erebus:ore_petrified_wood>.asBlock().definition.resistance = 99;
<erebus:ore_jade>.asBlock().definition.setHarvestLevel("pickaxe", 8);
<erebus:ore_jade>.asBlock().definition.hardness = 12;
<erebus:ore_jade>.asBlock().definition.resistance = 99;
    //metallurgy
    <metallurgy:adamantine_ore>.asBlock().definition.setHarvestLevel("pickaxe", 7);
    <metallurgy:ceruclase_ore>.asBlock().definition.setHarvestLevel("pickaxe", 7);
    <metallurgy:lemurite_ore>.asBlock().definition.setHarvestLevel("pickaxe", 7);
    <metallurgy:mithril_ore>.asBlock().definition.setHarvestLevel("pickaxe", 7);
    <metallurgy:alduorite_ore>.asBlock().definition.setHarvestLevel("pickaxe", 8);
    <metallurgy:lutetium_ore>.asBlock().definition.setHarvestLevel("pickaxe", 8);
    <metallurgy:vyroxeres_ore>.asBlock().definition.setHarvestLevel("pickaxe", 8);
    <metallurgy:sanguinite_ore>.asBlock().definition.setHarvestLevel("pickaxe", 8);
//Ore Harvest Levels