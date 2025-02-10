#reloadable

import crafttweaker.block.IBlock;
import crafttweaker.player.IPlayer;
import mods.ctintegration.scalinghealth.DifficultyManager;

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

//Cutscene On Join
//Cutscene On Join

//Stagnant Sky
events.onGameStageAdded(function(event5 as mods.ctintegration.gamestages.GameStageAddedEvent){
    if (event5.gameStage == "Death" && isNull(event5.player.world.getCustomWorldData().postStagSky)) {
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
events.register(function(event as crafttweaker.event.PlayerChangedDimensionEvent){
    if (event.to == 0 && event.player.hasGameStage("Death") && isNull(event.player.world.getCustomWorldData().postStagSky)) { 
        server.commandManager.executeCommandSilent(server,"gamerule doDaylightCycle_tc false");
        server.commandManager.executeCommandSilent(server,"gamerule doDaylightCycle false");
        server.commandManager.executeCommandSilent(server,"time set 12500");
    }
});
//Stagnant Sky

//Difficulty System Overhaul
events.register(function(event as crafttweaker.event.PlayerChangedDimensionEvent){
    //Nether
    if (event.to == -1 && !event.player.hasAnyGameStages("nightmare", "one", "two", "oatmeal")) { DifficultyManager.setDifficulty(event.player, 300.0); }
    //Nether

    //End
    if (event.to == 1 && !event.player.hasAnyGameStages("nightmare", "two", "oatmeal")) { DifficultyManager.setDifficulty(event.player, 600.0); }
    //End
    
    //Midnight
    if (event.to == -23 && !event.player.hasAnyGameStages("nightmare", "oatmeal")) { DifficultyManager.setDifficulty(event.player, 800.0); }
    //Midnight

    //Overworld
    if (event.to == 0 && !event.player.hasAnyGameStages("nightmare", "one", "two", "oatmeal")) { DifficultyManager.setDifficulty(event.player, 0.0); }
    if (event.to == 0 && event.player.hasGameStage("two")) { DifficultyManager.setDifficulty(event.player, 700.0); }
    //Overworld
});

events.onPlayerClone(function(event as crafttweaker.event.PlayerCloneEvent){
    if event.player.world.isRemote() { return; }

    //From End to Overworld (bc for some reason it has to be different)
    if (!event.wasDeath && !event.player.hasAnyGameStages("nightmare", "one", "two", "oatmeal")) { DifficultyManager.setDifficulty(event.originalPlayer, 0.0); }
    if (!event.wasDeath && event.player.hasGameStage("one")) { DifficultyManager.setDifficulty(event.originalPlayer, 400.0); }
    //From End to Overworld (bc for some reason it has to be different)
});

//Gamestage Difficulties
events.register(function(event as mods.ctintegration.gamestages.GameStageAddedEvent){
    //Rahovart
    if event.gameStage == "one" { DifficultyManager.setDifficulty(event.player, 400.0); }
    //Rahovart

    //Asmodeus
    if event.gameStage == "two" { DifficultyManager.setDifficulty(event.player, 700.0); }
    //Asmodeus

    //Insect
    if event.gameStage == "oatmeal" { DifficultyManager.setDifficulty(event.player, 1000.0); }
    //Insect

    //Amalgalich
    if event.gameStage == "nightmare" { DifficultyManager.setDifficulty(event.player, 2000.0); }
    //Amalgalich
});
//Gamestage Difficulties

//Nightmare mode day counter
events.register(function(event as crafttweaker.event.PlayerTickEvent){
        if event.side == "CLIENT" { return; }
        if (event.phase == "START") { return; }
        if !event.player.hasGameStage("nightmare") { return; }

        var world = event.player.world;

        if(world.provider.getWorldTime() == 24000)
        {
                event.player.sendStatusMessage("§6Difficulty §6increased §6by §c+50");
                DifficultyManager.addDifficulty(event.player, 16.6666666, false);
        }
});
//Nightmare mode day counter

//Difficulty System Overhaul

//Anvil lightweight
events.register(function(event as crafttweaker.event.PlayerAnvilUpdateEvent){
    if (event.leftItem.matches(<minecraft:enchanted_book>.withTag({StoredEnchantments: [{lvl: 2 as short, id: 141 as short}]})) && event.rightItem.matches(<minecraft:enchanted_book>.withTag({StoredEnchantments: [{lvl: 2 as short, id: 141 as short}]})))
    { event.cancel(); }
    if (event.leftItem.matches(<minecraft:enchanted_book>.withTag({StoredEnchantments: [{lvl: 1 as short, id: 141 as short}]})) && event.rightItem.matches(<minecraft:enchanted_book>.withTag({StoredEnchantments: [{lvl: 1 as short, id: 141 as short}]})))
    { event.cancel(); }
});
//Anvil lightweight

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

//Avoid Cave Spawn and vice versa

//Avoid Cave Spawn and vice versa

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