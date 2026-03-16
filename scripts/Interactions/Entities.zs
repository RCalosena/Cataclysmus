#reloadable

import crafttweaker.player.IPlayer;
import crafttweaker.entity.IEntity;
import crafttweaker.entity.IEntityLivingBase;
import crafttweaker.entity.IEntityEquipmentSlot;
import crafttweaker.entity.IEntityItem;
import crafttweaker.world.IBlockPos;
import crafttweaker.block.IMaterial as material;
import crafttweaker.enchantments.IEnchantmentDefinition;
import crafttweaker.data.IData;

import crafttweaker.entity.IEntityThrowable;    

//Eyes attack detection
function eyeDist(mob as IEntity, dist as double) as bool{
            if (!isNull(mob.definition) && mob.definition.id == "eyesinthedarkness:eyes") {
                if (mob.world.getClosestPlayerToEntity(mob, dist, false)){
                    return true;
                }
            }
    return false;
    }

//Eyes Effect Expansion
events.register(function(event1 as crafttweaker.event.PotionEffectAddedEvent){
    if event1.entityLivingBase.world.isRemote() { return; }
    if (event1.potionEffect.effectName != "effect.poison") { return; }
    if !event1.entityLivingBase instanceof IPlayer { return; }

        var player as IPlayer = event1.entityLivingBase;

    for entity in player.world.getEntities() {
        if (eyeDist(entity, 1.5)) { 
            player.addPotionEffect(<potion:lycanitesmobs:insomnia>.makePotionEffect(6020, 0));
            player.addPotionEffect(<potion:lycanitesmobs:plague>.makePotionEffect(120, 0));
            player.addPotionEffect(<potion:minecraft:wither>.makePotionEffect(120, 0));
            player.addPotionEffect(<potion:lycanitesmobs:bleed>.makePotionEffect(120, 0));
            player.addPotionEffect(<potion:lycanitesmobs:fear>.makePotionEffect(120, 0));
            player.addPotionEffect(<potion:lycanitesmobs:decay>.makePotionEffect(820, 0));
        }
    }
});
//Eyedruden Effect Expansion

//SkeletonKing Changes
events.register(function(event as crafttweaker.event.EntityLivingDeathEvent){
    if event.entityLivingBase.world.isRemote() return;
    if isNull(event.entityLivingBase.definition) return;
    if event.entityLivingBase.definition.id != "mod_lavacow:skeletonking" return;

    server.commandManager.executeCommandSilent(server,"kill @e[type=mod_lavacow:forsaken]");
});

events.register(function(event as crafttweaker.event.EntityLivingDamageEvent){
    if event.entityLivingBase.world.isRemote() return;
    if isNull(event.entityLivingBase.definition) return;
    if (event.entityLivingBase.definition.id != "mod_lavacow:skeletonking" && event.entityLivingBase.definition.id != "erebus:erebus.antlion_boss" && event.entityLivingBase.definition.id != "erebus:erebus.tarantula_mini_boss") { return; }
    if isNull(event.damageSource.trueSource) return;
    if !event.damageSource.trueSource instanceof IPlayer return;

    var victim = event.entityLivingBase;

    if (victim.health <= (victim.maxHealth * 0.75) && victim.health > (victim.maxHealth * 0.5)) { event.amount *= 0.50; }
    if (victim.health <= (victim.maxHealth * 0.5) && victim.health > (victim.maxHealth * 0.25)) { event.amount *= 0.30; }
    if (victim.health <= (victim.maxHealth * 0.25)) { event.amount *= 0.15; }
});
//SkeletonKing Changes

//killminionssuperbosses
events.register(function(event as crafttweaker.event.EntityLivingDeathEvent){
    if event.entityLivingBase.world.isRemote() return;
    if isNull(event.entityLivingBase.definition) return;
    if event.entityLivingBase.definition.id != "lycanitesmobs:rahovart" return;

    server.commandManager.executeCommandSilent(server,"kill @e[type=lycanitesmobs:belph]");
    server.commandManager.executeCommandSilent(server,"kill @e[type=lycanitesmobs:behemoth]");
    server.commandManager.executeCommandSilent(server,"kill @e[type=lycanitesmobs:archvile]");
});

events.register(function(event as crafttweaker.event.EntityLivingDeathEvent){
    if event.entityLivingBase.world.isRemote() return;
    if isNull(event.entityLivingBase.definition) return;
    if event.entityLivingBase.definition.id != "lycanitesmobs:asmodeus" return;

    server.commandManager.executeCommandSilent(server,"kill @e[type=lycanitesmobs:trite]");
    server.commandManager.executeCommandSilent(server,"kill @e[type=lycanitesmobs:grell]");
    server.commandManager.executeCommandSilent(server,"kill @e[type=lycanitesmobs:astaroth]");
});

events.register(function(event as crafttweaker.event.EntityLivingDeathEvent){
    if event.entityLivingBase.world.isRemote() return;
    if isNull(event.entityLivingBase.definition) return;
    if event.entityLivingBase.definition.id != "lycanitesmobs:amalgalich" return;

    server.commandManager.executeCommandSilent(server,"kill @e[type=lycanitesmobs:darkling]");
    server.commandManager.executeCommandSilent(server,"kill @e[type=lycanitesmobs:epion]");
    server.commandManager.executeCommandSilent(server,"kill @e[type=lycanitesmobs:reaper]");
});
//killminionssuperbosses

//healing superbosses
events.register(function(event11 as crafttweaker.event.EntityLivingHealEvent) {
if event11.entityLivingBase.world.isRemote() { return; }
if !event11.entityLivingBase.isBoss return;

event11.amount *= 1 + (event11.entityLivingBase.maxHealth * 0.001);
});
//healing superbosses

//Behemophet no grab because super unfair and buggy and makes me mad
events.register(function(event as crafttweaker.event.EntityLivingDamageEvent){
    if event.entityLivingBase.world.isRemote() return;
    if isNull(event.damageSource.trueSource) return;
    if isNull(event.damageSource.trueSource.definition) return;
    if event.damageSource.trueSource.definition.id != "lycanitesmobs:behemoth" return;
    if !event.entityLivingBase instanceof IPlayer return;

    var victim as IPlayer = event.entityLivingBase;

    victim.addPotionEffect(<potion:lycanitesmobs:repulsion>.makePotionEffect(1, 0));
});
//Behemophet no grab because super unfair and buggy and makes me mad

//No Cave Scarecrow/Weta/forsaken
events.register(function(event as crafttweaker.event.EntityJoinWorldEvent){
    if event.entity.world.isRemote() return;
    if isNull(event.entity.definition) return;
    if (event.entity.definition.id != "mod_lavacow:scarecrow" &&
        event.entity.definition.id != "mod_lavacow:weta" &&
        event.entity.definition.id != "mod_lavacow:forsaken") { return; }

    if event.entity.y <= 55 {
        for players in event.entity.world.getAllPlayers() {
            if players.y > 55 {
                event.cancel();
            }
        }
    }
});
//No Cave Scarecrow/Weta/forsaken

//Mobs That Inflict Insomnia
val insomnious = [
    "quark:wraith",
    "beneath:shadow",
    "beneath:hand",
    "mod_lavacow:scarecrow",
    "mod_lavacow:ghostray",
    "mod_lavacow:banshee",
    "mod_lavacow:ghostbomb",
    "midnight:rifter",
    "midnight:hunter",
    "lycanitesmobs:wendigo",
    "lycanitesmobs:geist",
    "lycanitesmobs:spectre",
    "lycanitesmobs:jabberwock",
    "lycanitesmobs:wraith",
    "lycanitesmobs:reaper",
    "lycanitesmobs:grue",
    "lycanitesmobs:shade",
    "lycanitesmobs:banshee",
    "lycanitesmobs:darkling",
    "lycanitesmobs:necrovore",
    "lycanitesmobs:argus"
] as string[];

events.register(function(event3 as crafttweaker.event.EntityLivingDamageEvent){
if event3.entityLivingBase.world.isRemote() { return; }
if isNull(event3.damageSource.trueSource) { return; }
if event3.damageSource.trueSource instanceof IPlayer { return; }

    var victim = event3.entityLivingBase;

for infInsomnia in insomnious {
    if (victim instanceof IEntityLivingBase && event3.damageSource.trueSource.definition.id == infInsomnia) {
        victim.addPotionEffect(<potion:lycanitesmobs:insomnia>.makePotionEffect(6020, 0));
    }
}});
//Mobs That Inflict Insomnia

//Mob spawns after the first boss

    val mod_lavacow_entities = [
        "mod_lavacow:banshee",
        "mod_lavacow:avaton",
        "mod_lavacow:boneworm",
        "mod_lavacow:cactoid",
        "mod_lavacow:cactyrant",
        "mod_lavacow:deathcoil",
        "mod_lavacow:enigmoth",
        "mod_lavacow:enigmoth_larva",
        "mod_lavacow:foglet",
        "mod_lavacow:forsaken",
        "mod_lavacow:ghostray",
        "mod_lavacow:ithaqua",
        "mod_lavacow:lavacow",
        "mod_lavacow:lilsludge",
        "mod_lavacow:mummy",
        "mod_lavacow:parasite",
        "mod_lavacow:ptera",
        "mod_lavacow:raven",
        "mod_lavacow:salamander",
        "mod_lavacow:scarecrow",
        "mod_lavacow:skeletonking",
        "mod_lavacow:sludgelord",
        "mod_lavacow:unburied",
        "mod_lavacow:undeadswine",
        "mod_lavacow:undertaker",
        "mod_lavacow:vespa",
        "mod_lavacow:vespacocoon",
        "mod_lavacow:weta",
        "mod_lavacow:zombiefrozen",
        "mod_lavacow:zombiemushroom"
    ] as string[];

events.register(function(event as crafttweaker.event.EntityJoinWorldEvent){
    if event.entity.world.isRemote() { return; }
    if isNull(event.entity.definition) { return; }
    if isNull(event.entity.definition.id) { return; }

for ectoplasm_mobs in mod_lavacow_entities {
    if (event.entity.definition.id == ectoplasm_mobs) {
        for players in event.world.getAllPlayers() {
            if (!players.hasGameStage("BansheeSpawn")) {
                event.cancel();
            }
        }
    }
}});

//Mutant Spawns
    val mutantbeasts_entities = [
        "mutantbeasts:mutant_creeper",
        "mutantbeasts:mutant_enderman",
        "mutantbeasts:mutant_skeleton",
        "mutantbeasts:mutant_snow_golem",
        "mutantbeasts:mutant_zombie"
    ] as string[];

events.register(function(event as crafttweaker.event.EntityJoinWorldEvent){
    if event.entity.world.isRemote() { return; }
    if isNull(event.entity.definition) { return; }
    if isNull(event.entity.definition.id) { return; }

for mutantbeasts in mutantbeasts_entities {
    if (event.entity.definition.id == mutantbeasts) {
        for players in event.world.getAllPlayers() {
            if (!players.hasGameStage("Rahovart")) {
                event.cancel();
            }
        }
    }
}});
//Mutant Spawns

//Parasite drop whitelist
    val srparasite_mobs = [
        "srparasites:ada_arachnida",
        "srparasites:ada_bolster",
        "srparasites:ada_longarms",
        "srparasites:ada_manducater",
        "srparasites:ada_reeker",
        "srparasites:ada_summoner",
        "srparasites:ada_yelloweye",
        "srparasites:anc_dreadnaut",
        "srparasites:anc_dreadnaut_ten",
        "srparasites:anc_overlord",
        "srparasites:anc_pod",
        "srparasites:ancientball",
        "srparasites:antiinfestedblock",
        "srparasites:architect",
        "srparasites:ballball",
        "srparasites:ballmall",
        "srparasites:balltall",
        "srparasites:beckon_si",
        "srparasites:beckon_sii",
        "srparasites:beckon_siii",
        "srparasites:beckon_siv",
        "srparasites:biomass",
        "srparasites:biomassball",
        "srparasites:bogle",
        "srparasites:bomb",
        "srparasites:bomber_heavy",
        "srparasites:bomber_light",
        "srparasites:buglin",
        "srparasites:carrier_colony",
        "srparasites:carrier_flying",
        "srparasites:carrier_heavy",
        "srparasites:carrier_light",
        "srparasites:cloudtoxic",
        "srparasites:crux",
        "srparasites:dispatcher_si",
        "srparasites:dispatcher_sii",
        "srparasites:dispatcher_siii",
        "srparasites:dispatcher_siv",
        "srparasites:dispatcherten",
        "srparasites:fer_bear",
        "srparasites:fer_cow",
        "srparasites:fer_enderman",
        "srparasites:fer_horse",
        "srparasites:fer_human",
        "srparasites:fer_pig",
        "srparasites:fer_sheep",
        "srparasites:fer_villager",
        "srparasites:fer_wolf",
        "srparasites:gnat",
        "srparasites:gore",
        "srparasites:grunt",
        "srparasites:haunter",
        "srparasites:heed",
        "srparasites:hi_blaze",
        "srparasites:hi_golem",
        "srparasites:hi_skeleton",
        "srparasites:homming",
        "srparasites:host",
        "srparasites:hostii",
        "srparasites:incompleteform_medium",
        "srparasites:incompleteform_small",
        "srparasites:kyphosis",
        "srparasites:mangler",
        "srparasites:marauder",
        "srparasites:missile",
        "srparasites:monarch",
        "srparasites:movingflesh",
        "srparasites:nade",
        "srparasites:nadeball",
        "srparasites:orb",
        "srparasites:overseer",
        "srparasites:pri_arachnida",
        "srparasites:pri_bolster",
        "srparasites:pri_devourer",
        "srparasites:pri_longarms",
        "srparasites:pri_manducater",
        "srparasites:pri_reeker",
        "srparasites:pri_summoner",
        "srparasites:pri_tozoon",
        "srparasites:pri_vermin",
        "srparasites:pri_yelloweye",
        "srparasites:pullingball",
        "srparasites:remain",
        "srparasites:rupter",
        "srparasites:salivaball",
        "srparasites:scent",
        "srparasites:seeker",
        "srparasites:seizer",
        "srparasites:sentry",
        "srparasites:sim_adventurer",
        "srparasites:sim_adventurerhead",
        "srparasites:sim_bear",
        "srparasites:sim_bigspider",
        "srparasites:sim_cow",
        "srparasites:sim_cowhead",
        "srparasites:sim_dragone",
        "srparasites:sim_dragonehead",
        "srparasites:sim_enderman",
        "srparasites:sim_endermanhead",
        "srparasites:sim_horse",
        "srparasites:sim_horsehead",
        "srparasites:sim_human",
        "srparasites:sim_humanhead",
        "srparasites:sim_pig",
        "srparasites:sim_pighead",
        "srparasites:sim_sheep",
        "srparasites:sim_sheephead",
        "srparasites:sim_squid",
        "srparasites:sim_villager",
        "srparasites:sim_villagerhead",
        "srparasites:sim_wolf",
        "srparasites:sim_wolfhead",
        "srparasites:source",
        "srparasites:spineball",
        "srparasites:succor",
        "srparasites:tendril",
        "srparasites:thrall",
        "srparasites:vigilante",
        "srparasites:warden",
        "srparasites:wave",
        "srparasites:waveshock",
        "srparasites:webball",
        "srparasites:worker",
        "srparasites:worm",
        "srparasites:wraith"
    ] as string[];

events.register(function(event as crafttweaker.event.EntityJoinWorldEvent){
    if event.entity.world.isRemote() return;
    if !event.entity instanceof IEntityLivingBase return;
    if event.entity instanceof IPlayer return;
    if !isNull(event.entity.world.getCustomWorldData().parasitePhase) return;

    var entity as IEntityLivingBase = event.entity;

    for srp in srparasite_mobs {
        if entity.definition.id == srp {
            if (entity.world.dimension == 0 && entity.maxHealth > 100) {
                event.cancel();
            }
            if entity.world.dimension == 10 {
                event.cancel();
            }
        }
    }
});

val jadearmor = [
    "erebus:jade_helmet",
    "erebus:jade_chestplate",
    "erebus:jade_leggings",
    "erebus:jade_boots"
] as string[];

events.register(function(event as crafttweaker.event.EntityJoinWorldEvent){
    if event.entity.world.isRemote() return;
    if !event.entity instanceof IEntityItem return;
    var item as IEntityItem = event.entity;
    if isNull(item.item) return;
    if event.entity.world.getClosestPlayerToEntity(event.entity, 20, false).hasGameStage("jade") return;

    for items in jadearmor {
        if item.item.definition.id == items {
            event.cancel();
        }
    }
});

events.register(function(event as crafttweaker.event.EntityLivingDeathDropsEvent){
    if event.entityLivingBase.world.isRemote() return;
    if !isNull(event.entityLivingBase.world.getCustomWorldData().parasitePhase) return;
    if event.entityLivingBase instanceof IPlayer return;

    for srp in srparasite_mobs {
        if event.entityLivingBase.definition.id == srp {
            event.cancel();
        }
    }
});

events.register(function(event as mods.ctintegration.gamestages.GameStageAddedEvent){
    if event.gameStage == "oatmeal" {
        event.player.world.setCustomWorldData({parasitePhase: 1});
    }
});
//Parasite drop whitelist

events.register(function(event as crafttweaker.event.PlayerAttackEntityEvent){
    if event.target.world.isRemote() return;
    if isNull(event.target.definition) return;
    if event.target.definition.id != "betteranimalsplus:hirschgeist" return;
    if !event.player.hasAnyGameStages("two","oatmeal","nightmare") {
        event.cancel();
    }
});

//Prevent Some Enchant Drops
function EnchantDropCheck(enchant as IData, IEnchID as [IEnchantmentDefinition]) as bool {
    if (!isNull(enchant)) {
        for target in IEnchID{
            for n in 0 to enchant.length {
                if (enchant[n].id == target.id) {
                    return true;
                }
            }
        }
    }
    else {
        return false;
    }
}

events.register(function(event as crafttweaker.event.EntityLivingDeathDropsEvent){
    if event.entityLivingBase.world.isRemote() return;
    if event.entityLivingBase instanceof IPlayer return;
    for drop in event.drops {

        if (EnchantDropCheck(drop.item.tag.StoredEnchantments, [
                <enchantment:minecraft:mending>,
                <enchantment:uniquee:all>,
                <enchantment:uniquee:undead>,
                <enchantment:uniquee:arthropods>,
                <enchantment:uniquee:swift>,
                <enchantment:uniquee:ender_mending>,
                <enchantment:uniquee:alchemistsgrace>,
                <enchantment:uniquee:endest_reap>,
                <enchantment:uniquee:grimoire>,
                <enchantment:walljump:walljump>,
                <enchantment:walljump:speedboost>,
                <enchantment:uniqueebattle:ares_fragment>,
                <enchantment:uniquee:warriorsgrace>,
                <enchantment:uniquee:endermarksmen>,
                <enchantment:uniquee:aresblessing>,
                <enchantment:uniquee:cloudwalker>,
                <enchantment:uniquee:fastfood>,
                <enchantment:uniquee:naturesgrace>,
                <enchantment:uniquee:ecological>,
                <enchantment:uniqueebattle:deep_wounds>,
                <enchantment:uniquee:pestilences_odium>,
                <enchantment:uniquee:deaths_odium>,
                <enchantment:uniqueebattle:lunatic_despair>,
                <enchantment:uniquee:ranged>,
                <enchantment:mujmajnkraftsbettersurvival:vitality>,
                <enchantment:ebwizardry:freezing_weapon>,
                <enchantment:ebwizardry:magic_sword>,
                <enchantment:ebwizardry:magic_bow>,
                <enchantment:ebwizardry:flaming_weapon>,
                <enchantment:uniqueebattle:ifrits_judgement>
            ])) {
            drop.setDead();
            event.entityLivingBase.world.spawnEntity(<minecraft:enchanted_book>.withTag({StoredEnchantments: [{lvl: 5 as short, id: 16 as short}]}).createEntityItem(event.entityLivingBase.world, event.entityLivingBase.position3f as IBlockPos));
        }
    }
});
//Prevent Some Enchant Drops

//Disc Quest
events.register(function(event as crafttweaker.event.ItemExpireEvent){
     if event.item.world.isRemote() { return; }
     if !event.item.item.matches(<customdisc:empty_disc>) { return; }
     var world = event.item.world;

     if (world.isRaining()) { world.spawnEntity(<customdisc:rcalosena_-_impending_rain>.createEntityItem(world, event.item.position3f as IBlockPos)); }
});

events.onEntityItemFall(function(event as mods.zenutils.event.EntityItemFallEvent) {
    if event.item.world.isRemote() { return; }
    if !event.item.item.matches(<customdisc:empty_disc>) { return; }

    if (event.item.world.provider.getWorldTime() == 12500 && event.item.isInWater) { event.item.world.spawnEntity(<customdisc:rcalosena_-_shining_nightfall>.createEntityItem(event.item.world, event.item.position3f as IBlockPos)); event.item.setDead(); }
});

events.onWorldTick(function(event as crafttweaker.event.WorldTickEvent) {
    if event.side == "CLIENT" return;
    if event.phase == "END" return;
    if event.world.time %20 != 0 return;
    for itemEntity in event.world.getEntityItems() {
    if isNull(itemEntity.item) { return; }
    if itemEntity.item.matches(<customdisc:empty_disc>) {
    var world = itemEntity.world;

    if (world.dimension == 1 && itemEntity.y < -5) { world.spawnEntity(<customdisc:rcalosena_-_dark_space>.createEntityItem(world, itemEntity.position3f as IBlockPos)); itemEntity.setDead(); }
    }}
});

events.register(function(event as crafttweaker.event.EntityJoinWorldEvent){
    if event.entity.world.isRemote() { return; }
    if !event.entity instanceof IEntityItem { return; }
    var itemEntity as IEntityItem = event.entity;
    if isNull(itemEntity.item) { return; }
    if !itemEntity.item.matches(<customdisc:rcalosena_-_dark_space>) { return; }

    if itemEntity.y < 0 {
    event.entity.hasNoGravity = true;
    event.entity.motionY = 2.5;
    }
});

events.register(function(event as crafttweaker.event.PlayerTickEvent) {
    if event.side == "CLIENT" return;
    if event.phase == "END" return;
    if event.player.world.time %20 != 0 return;
    if !event.player.isElytraFlying return;
    if isNull(event.player.currentItem) return;
    if !event.player.currentItem.matches(<customdisc:empty_disc>) { return; }
    if event.player.motionY > -3.2 return;

    event.player.setItemToSlot(IEntityEquipmentSlot.mainHand(), <customdisc:rcalosena_-_opdoun>);
});

events.register(function(event as crafttweaker.event.EntityLivingDamageEvent){
    if event.entityLivingBase.world.isRemote() { return; }
    if !event.entityLivingBase instanceof IPlayer { return; }
    if event.damageSource.damageType != "flyIntoWall" { return; }

    var player as IPlayer = event.entityLivingBase;

    if isNull(player.currentItem) { return; }
    if !player.currentItem.matches(<customdisc:empty_disc>) { return; }

    if (event.amount >= (player.maxHealth/3)) { player.setItemToSlot(IEntityEquipmentSlot.mainHand(), <customdisc:rcalosena_-_stopgo>); }
});

events.register(function(event as crafttweaker.event.ItemExpireEvent){
     if event.item.world.isRemote() { return; }
     if !event.item.item.matches(<customdisc:empty_disc>) { return; }
     var world = event.item.world;

     if (!world.isDayTime() && !world.isRaining()) { world.spawnEntity(<customdisc:rcalosena_-_apprehension>.createEntityItem(world, event.item.position3f as IBlockPos)); }
});

events.onEntityItemFall(function(event as mods.zenutils.event.EntityItemFallEvent) {
    if event.item.world.isRemote() { return; }
    if !event.item.item.matches(<customdisc:empty_disc>) { return; }
    if !event.item.isInsideOfMaterial(material.fire()) { return; }
    if event.item.isInLava { return; }

    var world = event.item.world;
    if world.dimension == -1 { world.spawnEntity(<customdisc:rcalosena_-_fierce>.createEntityItem(world, event.item.position3f as IBlockPos)); event.item.setDead(); }
});

events.onEntityItemFall(function(event as mods.zenutils.event.EntityItemFallEvent) {
    if event.item.world.isRemote() { return; }
    if !event.item.item.matches(<customdisc:empty_disc>) { return; }
    if !event.item.isInLava { return; }

    var world = event.item.world;
    if world.dimension == -1 { world.spawnEntity(<customdisc:rcalosena_-_laberint>.createEntityItem(world, event.item.position3f as IBlockPos)); event.item.setDead(); }
});

events.onEntityItemFall(function(event as mods.zenutils.event.EntityItemFallEvent) {
    if event.item.world.isRemote() { return; }
    if !event.item.item.matches(<customdisc:empty_disc>) { return; }

    for entity in event.item.world.getEntities() {
        if (!isNull(entity.definition) && entity.definition.id == "eyesinthedarkness:eyes"){
            if event.item.getDistanceSqToEntity(entity) < 0.7 {
                var world = event.item.world;
                world.spawnEntity(<customdisc:rcalosena_-_mister_mistery>.createEntityItem(world, event.item.position3f as IBlockPos));
                event.item.setDead();
            }
        }
    }
});

events.onWorldTick(function(event as crafttweaker.event.WorldTickEvent) {
    if event.side == "CLIENT" return;
    if event.phase == "END" return;
    if event.world.time %20 != 0 return;
    for itemEntity in event.world.getEntityItems() {
    if isNull(itemEntity.item) { return; }
    if itemEntity.item.matches(<customdisc:empty_disc>) {
    var world = itemEntity.world;

    if (!world.isDayTime() && world.dimension == 0 && itemEntity.y > 300) { world.spawnEntity(<customdisc:rcalosena_-_the_breach>.createEntityItem(world, itemEntity.position3f as IBlockPos)); itemEntity.setDead(); }
    }}
});

events.register(function(event as crafttweaker.event.ItemTossEvent){
    if event.item.world.isRemote() { return; }
    if !event.item.item.matches(<customdisc:empty_disc>) { return; }

    if (!event.item.world.isDayTime() && event.item.world.dimension == 0 && event.item.y > 250) { event.item.hasNoGravity = true; }
});
//Disc Quest

//Drops
game.getEntity("rahovart").addDropFunction(function(entity, dmgSource) {
        var count as int = 15 * entity.world.getAllPlayers().length;
        return <erebus:materials:39> * count;
});
game.getEntity("asmodeus").addDropFunction(function(entity, dmgSource) {
        var count as int = 10 * entity.world.getAllPlayers().length;
        return <biomesoplenty:gem:1> * count;
});
game.getEntity("amalgalich").addDropFunction(function(entity, dmgSource) {
        var count1 as int = 10 * entity.world.getAllPlayers().length;
        return <srparasites:living_core> * count1;
});
game.getEntity("amalgalich").addDropFunction(function(entity, dmgSource) {
        var count2 as int = 20 * entity.world.getAllPlayers().length;
        return <srparasites:vile_shell> * count2;
});
<entity:minecraft:ender_dragon>.addDropFunction(function(entity, dmgSource) {
        var count as int = 5 * (entity.world.getAllPlayers().length);
        return <bountifulbaubles:enderdragonscale> * count;
});
//Drops

//Summons
events.register(function(event as crafttweaker.event.EntityJoinWorldEvent){
if event.world.isRemote() return;
if isNull(event.entity.nbt) return;
if isNull(event.entity.nbt.ForgeCaps) return;
if isNull(event.entity.nbt.ForgeCaps.memberGet("champions:championship")) return;
if isNull(event.entity.nbt.IsMinion) return;
if (event.entity.nbt.ForgeCaps.memberGet("champions:championship").tier != 0 && event.entity.nbt.IsMinion == 1) {
    event.entity.updateNBT({ForgeCaps: { "champions:championship": {tier: 0}}});
}
});

events.register(function(event as crafttweaker.event.EntityJoinWorldEvent){
if event.world.isRemote() return;
if isNull(event.entity.nbt) return;
if isNull(event.entity.nbt.ForgeCaps) return;
if isNull(event.entity.nbt.ForgeCaps.memberGet("champions:championship")) return;
if isNull(event.entity.nbt.OwnerUUID) return;
if (event.entity.nbt.ForgeCaps.memberGet("champions:championship").tier != 0 && event.entity.nbt.OwnerUUID.asString().contains("-")) {
    event.entity.updateNBT({ForgeCaps: { "champions:championship": {tier: 0}}});
}
});

events.register(function(event as crafttweaker.event.EntityLivingDeathDropsEvent){
if event.entityLivingBase.world.isRemote() return;
if isNull(event.entityLivingBase.nbt) return;
if isNull(event.entityLivingBase.nbt.OwnerUUID) return;
if (event.entity.nbt.OwnerUUID.asString().contains("-")) {
    event.cancel();
}
});
//Summons

//Wither overworld blacklist
events.register(function(event as native.net.minecraftforge.event.entity.living.LivingSpawnEvent.SpecialSpawn) {
    if (event.getEntity().wrapper.definition.id == "minecraft:wither" && event.getWorld().provider.getDimension() == 0) {
        event.setCanceled(true);
    }
});
//Wither overworld blacklist