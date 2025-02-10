#reloadable

import crafttweaker.player.IPlayer;
import crafttweaker.item.IItemStack;
import crafttweaker.potions.IPotion;
import crafttweaker.world.IBiome;
import crafttweaker.entity.IEntityMob;
import crafttweaker.entity.IEntityEquipmentSlot;
import crafttweaker.enchantments.IEnchantmentDefinition;
import crafttweaker.data.IData;

//Special thanks to Shibva
function EnchantCheck(enchant as IData, IEnchID as [IEnchantmentDefinition]) as bool {
    if (!isNull(enchant)) {
        for target in IEnchID{
            for j in 0 to enchant.length {
                if (enchant[j].id == target.id) {
                    return true;
                }
            }
        }
    }
    else {
        return false;
    }
}

function listContains(biome as string[], pos as string) as bool {
  for playerbiome in biome {
    if (playerbiome == pos) return true;
  }
  return false;
}

function mobDist(tick as crafttweaker.event.PlayerTickEvent, dist as double) as bool{
    val mobs = tick.player.world.getEntities();
    for mob in mobs{
        if mob instanceof IEntityMob {
            if tick.player.world.getClosestPlayerToEntity(mob, dist, false){
                return true;
            }
        }
    }
    return false;
}

function isAnyBow(item as IItemStack) as bool {

    val Bows = [
        <erebus:max_speed_bow>,
        <nyx:meteor_bow>,
        <srparasites:weapon_bow>,
        <srparasites:weapon_bow_sentient>,
        <spartanweaponry:longbow_wood>,
        <spartanweaponry:longbow_leather>,
        <spartanweaponry:longbow_iron>,
        <spartanweaponry:longbow_diamond>,
        <spartanweaponry:longbow_copper>,
        <minecraft:bow>,
        <spartanweaponry:longbow_tin>,
        <spartanweaponry:longbow_bronze>,
        <spartanweaponry:longbow_steel>,
        <spartanweaponry:longbow_silver>,
        <spartanweaponry:longbow_invar>,
        <spartanweaponry:longbow_platinum>,
        <spartanweaponry:longbow_electrum>,
        <spartanweaponry:longbow_nickel>,
        <spartanweaponry:longbow_lead>,
        <switchbow:switchbow>
    ] as IItemStack[];

        for Bow in Bows {
            if (Bow.anyDamage().matches(item)) {
                return true;
            }
        }

    return false;

}

function hasArmor(helmet as IItemStack, chestplate as IItemStack, legging as IItemStack, boot as IItemStack) as bool {

    var condition = 0;

val Helmets = [
    <cqrepoured:helmet_spider>,
    <mod_lavacow:faminearmor_helmet>,
    <metallurgy:carmot_helmet>,
    <mysticalworld:silver_helmet>,
    <metallurgy:krik_helmet>,
    <nyx:meteor_helm>,
    <minecraft:leather_helmet>,
    <srparasites:armor_helm_sentient>.withTag({quick_fingers: 1})
] as IItemStack[];

val Chestplates = [
    <cqrepoured:chestplate_spider>,
    <mod_lavacow:faminearmor_chestplate>,
    <metallurgy:carmot_chestplate>,
    <mysticalworld:silver_chestplate>,
    <metallurgy:krik_chestplate>,
    <nyx:meteor_chest>,
    <minecraft:leather_chestplate>,
    <srparasites:armor_chest_sentient>.withTag({quick_fingers: 1})
] as IItemStack[];

val Leggings = [
    <cqrepoured:leggings_spider>,
    <mod_lavacow:faminearmor_leggings>,
    <metallurgy:carmot_leggings>,
    <mysticalworld:silver_leggings>,
    <metallurgy:krik_leggings>,
    <nyx:meteor_pants>,
    <minecraft:leather_leggings>,
    <srparasites:armor_pants_sentient>.withTag({quick_fingers: 1})
] as IItemStack[];

val Boots = [
    <cqrepoured:boots_spider>,
    <mod_lavacow:faminearmor_boots>,
    <metallurgy:carmot_boots>,
    <mysticalworld:silver_boots>,
    <metallurgy:krik_boots>,
    <nyx:meteor_boots>,
    <minecraft:leather_boots>,
    <srparasites:armor_boots_sentient>.withTag({quick_fingers: 1})
] as IItemStack[];

    for helmut in Helmets {
        if (helmut.anyDamage().matches(helmet)) { condition += 1; }
    }
    for chestplute in Chestplates {
        if (chestplute.anyDamage().matches(chestplate)) { condition += 1; }
    }
    for leggung in Leggings {
        if (leggung.anyDamage().matches(legging)) { condition += 1; }
    }
    for but in Boots {
        if (but.anyDamage().matches(boot)) { condition += 1; }
    }

    if condition == 4 { return true; }

    return false;
}

function isSentientArmor(helmet as IItemStack, chestplate as IItemStack, legging as IItemStack, boot as IItemStack) as bool {

    var condition = 0;

        if (<srparasites:armor_helm_sentient>.withTag({quick_fingers: 1}).anyDamage().matches(helmet)) { condition += 1; }
        if (<srparasites:armor_chest_sentient>.withTag({quick_fingers: 1}).anyDamage().matches(chestplate)) { condition += 1; }
        if (<srparasites:armor_pants_sentient>.withTag({quick_fingers: 1}).anyDamage().matches(legging)) { condition += 1; }
        if (<srparasites:armor_boots_sentient>.withTag({quick_fingers: 1}).anyDamage().matches(boot)) { condition += 1; }

    if condition == 4 { return true; }

    return false;

    if condition > 0 { condition = 0; }
}

//Mount Element arrays
val Normal = [
    "minecraft:horse",
    "minecraft:skeleton_horse",
    "minecraft:boat"
] as string[];

val Acid = [
    "lycanitesmobs:quetzodracl",
    "lycanitesmobs:ioray"
] as string[];

val AcidPotion = [
    <potion:minecraft:weakness>,
    <potion:potioncore:broken_magic_shield>,
    <potion:potioncore:broken_armor>,
    <potion:mod_lavacow:corroded>,
    <potion:srparasites:corrosive>,
    <potion:potioncore:rust>,
    <potion:minecraft:wither>,
    <potion:minecraft:nausea>,
    <potion:champions:injured>,
    <potion:ebwizardry:decay>,
    <potion:ebwizardry:arcane_jammer>,
    <potion:potioncore:klutz>,
    <potion:srparasites:bleed>
] as IPotion[];

val Air = [
    "lycanitesmobs:uvaraptor",
    "lycanitesmobs:ventoraptor"
] as string[];

val AirPotion = [
    <potion:minecraft:jump_boost>, 
    <potion:tombstone:feather_fall>,
    <potion:potioncraft:gravity>,
    <potion:lycanitesmobs:weight>,
    <potion:midnight:unstable_fall>,
    <potion:rustic:feather>,
    <potion:potioncore:flight>,
    <potion:potioncore:launch>,
    <potion:potioncore:weight>,
    <potion:potioncore:slow_fall>,
    <potion:potioncore:explode>,
    <potion:potioncraft:fly>,
    <potion:rlmixins:delayed_launch>,
    <potion:lycanitesmobs:fallresist>
] as IPotion[];

val Arbour = [
    "lycanitesmobs:eyewig",
    "lycanitesmobs:uvaraptor"
] as string[];

val Arcane = [
    "lycanitesmobs:beholder",
    "lycanitesmobs:cockatrice",
    "lycanitesmobs:erepede"
] as string[];

val Earth = [
    "lycanitesmobs:quetzodracl",
    "lycanitesmobs:raiko",
    "lycanitesmobs:zoataur"
] as string[];

val EarthPotion = [
    <potion:minecraft:poison>, 
    <potion:lycanitesmobs:plague>,
    <potion:mod_lavacow:soiled>,
    <potion:potioncore:repair>,
    <potion:midnight:stunned>,
    <potion:minecraft:blindness>,
    <potion:minecraft:hunger>,
    <potion:ebwizardry:oakflesh>,
    <potion:srparasites:coth>,
    <potion:midnight:pollinated>,
    <potion:midnight:darkness>,
    <potion:lycanitesmobs:insomnia>
] as IPotion[];

val Fae = [
    "lycanitesmobs:barghest",
    "lycanitesmobs:feradon"
] as string[];

val Frost = [
    "lycanitesmobs:morock",
    "lycanitesmobs:maug"
] as string[];

val FrostPotion = [
    <potion:minecraft:mining_fatigue>, 
    <potion:tombstone:frost_resistance>,
    <potion:ebwizardry:frost>,
    <potion:ebwizardry:ice_shroud>,
    <potion:ebwizardry:frost_step>,
    <potion:potioncraft:freeze>,
    <potion:potioncraft:freezeaoe>,
    <potion:switchbow:freeze>
] as IPotion[];

val Lava = [
    "lycanitesmobs:ignibus",
    "lycanitesmobs:salamander"
] as string[];

val LavaPotion = [
    <potion:rustic:blazing_trail>,
    <potion:ebwizardry:fireskin>,
    <potion:rlmixins:lesser_fire_resistance>,
    <potion:midnight:dragon_guard>,
    <potion:potioncore:fire>
] as IPotion[];

val Lightning = [
    "lycanitesmobs:cockatrice",
    "lycanitesmobs:strider"
] as string[];

val LightningPotion = [
    <potion:minecraft:speed>,
    <potion:minecraft:glowing>,
    <potion:tombstone:lightning_resistance>,
    <potion:ebwizardry:static_aura>,
    <potion:ebwizardry:paralysis>,
    <potion:potioncore:lightning>,
    <potion:potioncraft:lightning>,
    <potion:lycanitesmobs:instability>
] as IPotion[];

val Nether = [
    "lycanitesmobs:pinky",
    "lycanitesmobs:grell",
    "lycanitesmobs:cacodemon"
] as string[];

val Order = [
    "lycanitesmobs:feradon",
    "lycanitesmobs:morock",
    "lycanitesmobs:roc",
    "lycanitesmobs:ventoraptor"
] as string[];

val Quake = [
    "lycanitesmobs:barghest",
    "lycanitesmobs:quetzodracl",
    "lycanitesmobs:warg"
] as string[];

val Shadow = [
    "lycanitesmobs:epion",
    "lycanitesmobs:eyewig",
    "lycanitesmobs:warg"
] as string[];

val Void = [
    "lycanitesmobs:shade",
    "lycanitesmobs:pinky",
    "lycanitesmobs:beholder"
] as string[];

val Water = [
    "lycanitesmobs:thresher",
    "lycanitesmobs:strider",
    "lycanitesmobs:roa",
    "lycanitesmobs:quetzoracl"
] as string[];

val stages = [ "m", "m1", "m2", "m3", "m4", "m5", "m6", "m7", "m8", "m9", "m10", "m11", "m12", "m13", "m14", "m15", "B", "B2", "C", "C2", "D1", "D2", "D3", "D4" ] as string[];

val mounting = [ "mounting", "mounting1", "mounting2", "mounting3", "mounting4", "mounting5", "mounting6", "mounting7", "mounting8", "mounting9", "mounting10", "mounting11", "mounting12", "mounting13", "mounting14", "mounting15" ] as string[];



//Basically, remove all abilities when logging in
events.onPlayerLoggedIn(function(event3 as crafttweaker.event.PlayerLoggedInEvent) {

for mount in mounting {
    event3.player.removeGameStage(mount);
}});

events.register(function(event as crafttweaker.event.EntityMountEvent) {
    if (!event.world.isRemote()) { return; }
    if !event.mountingEntity instanceof IPlayer { return; }

    var player as IPlayer = event.mountingEntity;
    var mountedDefinition = event.mountedEntity.definition;

//Element identifiers

    if (event.isMounting) {

    ##Horse/Boat Ability##
        for Minecraft in Normal {
            if (mountedDefinition.id == Minecraft) {
                server.commandManager.executeCommandSilent(server,"gamestage silentadd " ~ player.name ~ " mounting");
        }
    }
    ##Horse/Boat Ability##

    ##Acid Ability##
        for Balls in Acid {
            if (mountedDefinition.id == Balls) {
                server.commandManager.executeCommandSilent(server,"gamestage silentadd " ~ player.name ~ " mounting1");
        }
    }
    ##Acid Ability##

    ##Air Ability##
        for Bird in Air {
            if (mountedDefinition.id == Bird) {
                server.commandManager.executeCommandSilent(server,"gamestage silentadd " ~ player.name ~ " mounting2");
        }
    }
    ##Air Ability##

    ##Arbour Ability##
        for No in Arbour {
            if (mountedDefinition.id == No) {
                server.commandManager.executeCommandSilent(server,"gamestage silentadd " ~ player.name ~ " mounting3");
        }
    }
    ##Arbour Ability##

    ##Arcane Ability##
        for Mre in Arcane {
            if (mountedDefinition.id == Mre) {
                server.commandManager.executeCommandSilent(server,"gamestage silentadd " ~ player.name ~ " mounting4");
        }
    }
    ##Arcane Ability##

    ##Earth Ability##
        for Dert in Earth {
            if (mountedDefinition.id == Dert) {
                server.commandManager.executeCommandSilent(server,"gamestage silentadd " ~ player.name ~ " mounting5");
        }
    }
    ##Earth Ability##

    ##Fae Ability##
        for Light in Fae {
            if (mountedDefinition.id == Light) {
                server.commandManager.executeCommandSilent(server,"gamestage silentadd " ~ player.name ~ " mounting6");
        }
    }
    ##Fae Ability##

    ##Frost Ability##
        for Ice in Frost {
            if (mountedDefinition.id == Ice) {
                server.commandManager.executeCommandSilent(server,"gamestage silentadd " ~ player.name ~ " mounting7");
        }
    }
    ##Frost Ability##

    ##Lava Ability##
        for Fire in Lava {
            if (mountedDefinition.id == Fire) {
                server.commandManager.executeCommandSilent(server,"gamestage silentadd " ~ player.name ~ " mounting8");
        }
    }
    ##Lava Ability##

    ##Lightning Ability##
        for Shock in Lightning {
            if (mountedDefinition.id == Shock) {
                server.commandManager.executeCommandSilent(server,"gamestage silentadd " ~ player.name ~ " mounting9");
        }
    }
    ##Lightning Ability##

    ##Nether Ability##
        for Hell in Nether {
            if (mountedDefinition.id == Hell) {
                server.commandManager.executeCommandSilent(server,"gamestage silentadd " ~ player.name ~ " mounting10");
        }
    }
    ##Nether Ability##

    ##Order Ability##
        for Entropy in Order {
            if (mountedDefinition.id == Entropy) {
                server.commandManager.executeCommandSilent(server,"gamestage silentadd " ~ player.name ~ " mounting11");
        }
    }
    ##Order Ability##

    ##Quake Ability##
        for Chaos in Quake {
            if (mountedDefinition.id == Chaos) {
                server.commandManager.executeCommandSilent(server,"gamestage silentadd " ~ player.name ~ " mounting12");
        }
    }
    ##Quake Ability##

    ##Shadow Ability##
        for Night in Shadow {
            if (mountedDefinition.id == Night) {
                server.commandManager.executeCommandSilent(server,"gamestage silentadd " ~ player.name ~ " mounting13");
        }
    }
    ##Shadow Ability##

    ##Void Ability##
        for Null in Void {
            if (mountedDefinition.id == Null) {
                server.commandManager.executeCommandSilent(server,"gamestage silentadd " ~ player.name ~ " mounting14");
        }
    }
    ##Void Ability##

    ##Water Ability##
        for Salt in Water {
            if (mountedDefinition.id == Salt) {
                server.commandManager.executeCommandSilent(server,"gamestage silentadd " ~ player.name ~ " mounting15");
        }
    }
    ##Water Ability##

    }

    if (!event.isMounting) {
        for mount in mounting {
            server.commandManager.executeCommandSilent(server,"gamestage silentremove " ~ player.name ~ " " ~ mount);
        }
    }

});

events.register(function(event3 as crafttweaker.event.EntityLivingHurtEvent){
    if event3.entity.world.isRemote() { return; }
    if !event3.entity instanceof IPlayer { return; }

    var players as IPlayer = event3.entity;

    if !hasArmor(players.getItemInSlot(IEntityEquipmentSlot.head()), players.getItemInSlot(IEntityEquipmentSlot.chest()), players.getItemInSlot(IEntityEquipmentSlot.legs()), players.getItemInSlot(IEntityEquipmentSlot.feet())) { return; }
	
        //Damage detection for Quake ability
        if(players.hasGameStage("mounting12")) { players.addGameStage("m12"); }
});

events.register(function(event as crafttweaker.event.EntityLivingDeathEvent) {
    //Kill count system
	if (event.entityLivingBase.world.isRemote()) { return; }
	if (!event.damageSource.trueSource instanceof IPlayer) { return; }

	var entity = event.damageSource.trueSource;
    var player as IPlayer = entity;

    if !hasArmor(player.getItemInSlot(IEntityEquipmentSlot.head()), player.getItemInSlot(IEntityEquipmentSlot.chest()), player.getItemInSlot(IEntityEquipmentSlot.legs()), player.getItemInSlot(IEntityEquipmentSlot.feet())) { return; }
    if !player.hasGameStage("mounting10") { return; }

	if (isNull(entity.getNBT().ForgeData.kills)) {
		entity.setNBT({kills: 0});
	}
 

	if (event.entityLivingBase instanceof IEntityMob) {
 
		if (entity.getNBT().ForgeData.kills as int < 10) {
 
			entity.setNBT({kills: entity.getNBT().ForgeData.kills as int + 1});
 
		} else {
 
			entity.update({kills: 1});

		}
 
	}
});

events.register(function(event2 as crafttweaker.event.PlayerTickEvent){
if event2.side == "CLIENT" { return; }
if (event2.phase == "START") { return; }
if (event2.player.world.time % 20 != 0) { return; }

    var usespeed = <potion:potioncraft:usespeed> as IPotion;
    var players = event2.player; 
    var inf = 1000000;
    var world = players.world;

    if (players.isRiding && hasArmor(players.getItemInSlot(IEntityEquipmentSlot.head()), players.getItemInSlot(IEntityEquipmentSlot.chest()), players.getItemInSlot(IEntityEquipmentSlot.legs()), players.getItemInSlot(IEntityEquipmentSlot.feet()))) { 

    world.catenation().sleep(5)
        // the context is a data holder that catenation tasks share
        .run(function(world, context) {
            for mount in mounting {
            if (!players.hasGameStage("mounting") && !players.hasGameStage("mounting1") && !players.hasGameStage("mounting2") && !players.hasGameStage("mounting3") && !players.hasGameStage("mounting4") && !players.hasGameStage("mounting5") && !players.hasGameStage("mounting6") && !players.hasGameStage("mounting7") && !players.hasGameStage("mounting8") && !players.hasGameStage("mounting9") && !players.hasGameStage("mounting10") && !players.hasGameStage("mounting11") && !players.hasGameStage("mounting12") && !players.hasGameStage("mounting13") && !players.hasGameStage("mounting14") && !players.hasGameStage("mounting15")) {
            players.dismountRidingEntity();
            }}
        })
        .stopWhen(function(world, context) {
            return !players.isRiding;
        }).start();
    }

    var mainhand = isAnyBow(players.currentItem);

    //Failsafe in case the player keeps any of the Game Stages
        for gamestages in stages {
        if (players.isPotionActive(usespeed) && !players.hasGameStage("mounting") && !players.hasGameStage("mounting1") && !players.hasGameStage("mounting2") && !players.hasGameStage("mounting3") && !players.hasGameStage("mounting4") && !players.hasGameStage("mounting5") && !players.hasGameStage("mounting6") && !players.hasGameStage("mounting7") && !players.hasGameStage("mounting8") && !players.hasGameStage("mounting9") && !players.hasGameStage("mounting10") && !players.hasGameStage("mounting11") && !players.hasGameStage("mounting12") && !players.hasGameStage("mounting13") && !players.hasGameStage("mounting14") && !players.hasGameStage("mounting15")) {
            players.removePotionEffect(usespeed);
            players.removeGameStage(gamestages);
            }
        }
        

    ##Horse/Boat Ability##
        if (mainhand && players.hasGameStage("mounting")) {
            //Give the ability if the player moves while mounting Horse/Boat
            if (players.moveForward > 0 && players.moveStrafing == 0) {
                players.addPotionEffect(usespeed.makePotionEffect(inf, 4));
            
                //Identifier to prevent interaction with other conditions (when a player mounts an entity of more than one element)
                players.addGameStage("m");
            }
        }
            if (players.isPotionActive(usespeed) && players.moveForward <= 0|| players.moveStrafing != 0 && players.hasGameStage("mounting") && players.hasGameStage("m")) { 
            players.removePotionEffect(usespeed);
            players.removeGameStage("m");
    }
    ##Horse/Boat Ability##

    ##Acid Ability##
    for MikeHawk in AcidPotion {
        if (mainhand && players.hasGameStage("mounting1")) {
            if players.isPotionActive(MikeHawk) {
                var count = 0;
for pution in AcidPotion {
    if (players.isPotionActive(pution)) {
        count += 1;
    }
}

                if count > 0 { players.addPotionEffect(usespeed.makePotionEffect(inf, (3 + (count - 1)))); }

                players.addGameStage("m1");

                if (players.getActivePotionEffect(usespeed).amplifier >= (3 + (count)) && count > 0) {
                    players.removePotionEffect(usespeed); count = 0;
                    if count > 0 { count = 0; }
                    }
            }
        }
            if (players.isPotionActive(usespeed) && players.hasGameStage("mounting1") && players.hasGameStage("m1")) { 
                if players.isPotionActive(MikeHawk) {
                    return;
            }
            players.removePotionEffect(usespeed); 
            players.removeGameStage("m1");
        }
    }
    ##Acid Ability##

    ##Air Ability##
    for Empty in AirPotion {
        if (mainhand && players.hasGameStage("mounting2")) {
            if players.isPotionActive(Empty) {
                var count1 = 0;
for  pition in AirPotion {
    if (players.isPotionActive(pition)) {
        count1 += 1;
    }
}

                if count1 > 0 { players.addPotionEffect(usespeed.makePotionEffect(inf, (3 + (count1 - 1)))); }

                players.addGameStage("m2");

                if (players.getActivePotionEffect(usespeed).amplifier >= (3 + (count1)) && count1 > 0) {
                    players.removePotionEffect(usespeed); count1 = 0;
                    if count1 > 0 { count1 = 0; }
                    }
            }
        } 
            if (players.isPotionActive(usespeed) && players.hasGameStage("mounting2") && players.hasGameStage("m2")) { 
                if players.isPotionActive(Empty) {
                    return;
                }
            players.removePotionEffect(usespeed);
            players.removeGameStage("m2"); 
        }
    }
    ##Air Ability##

    ##Arbour Ability##
            var playerBiome = world.getBiome(players.position) as IBiome;
            val lush = [ "Forest", "Taiga", "Swampland", "ForestHills", "TaigaHills", "Jungle", "JungleHills", "JungleEdge", "Birch Forest", "Birch Forest Hills", "Roofed Forest", "Cold Taiga", "Cold Taiga Hills", "Mega Taiga", "Mega Taiga Hills", "Bamboo Forest", "Bayou", "Bog", "Boreal Forest", "Chaparral", "Cherry Blossom Grove", "Coniferous Forest", "Eucalyptus Forest", "Fen", "Flower Field", "Grove", "Lavender Fields", "Lush Desert", "Lush Swamp", "Mangrove", "Maple Woods", "Marsh", "Mystic Grove", "Orchard", "Overgrown Cliffs", "Rainforest", "RedwoodForest", "Sacred Springs", "Seasonal Forest", "Shield", "Snowy Coniferous Forest", "Snowy Forest", "Temperate Rainforest", "Tropical Rainforest", "Wetland", "Woodland", "RedwoodForestEdge", "Pasture", "Oasis", "Kelp Forest", "Tropical Island", "Flower Island", "Underground Jungle", "Fungal Forest", "Submerged Swamp", "Elysian Forest", "Petrified Forest", "Flower Forest" ] as string[];
        
        for nature in lush {
        if (mainhand && players.hasGameStage("mounting3")) {
            
            if (listContains([nature], playerBiome.name)) {
                players.addPotionEffect(usespeed.makePotionEffect(inf, 4));
                players.addGameStage("m3");
        }
        }
            if (players.isPotionActive(usespeed) && players.hasGameStage("mounting3") && players.hasGameStage("m3")) { 
                if (listContains([nature], playerBiome.name)) {
                    return; 
                }
            players.removePotionEffect(usespeed);
            players.removeGameStage("m3");
        
    }}
    ##Arbour Ability##

    ##Arcane Ability##
        if (mainhand && players.hasGameStage("mounting4")) {
            if mobDist(event2, 30.0) {
                if (!mobDist(event2, 20.0) && players.hasGameStage("A1")) {players.removePotionEffect(usespeed);}
                players.removeGameStage("A1");

                players.addPotionEffect(usespeed.makePotionEffect(inf, 3));
                players.addGameStage("m4");
            }
            if mobDist(event2, 20.0) {
                if (!mobDist(event2, 10.0) && players.hasGameStage("A2")) {players.removePotionEffect(usespeed);}
                players.removeGameStage("A2");
                
                players.addPotionEffect(usespeed.makePotionEffect(inf, 4));
                players.addGameStage("m4");
                players.addGameStage("A1");
            }
            if mobDist(event2, 10.0) {
                if (!mobDist(event2, 5.0) && players.hasGameStage("A3")) {players.removePotionEffect(usespeed);}
                players.removeGameStage("A3");

                players.addPotionEffect(usespeed.makePotionEffect(inf, 5));
                players.addGameStage("m4");
                players.addGameStage("A2");
            }
            if mobDist(event2, 5.0) {
                if (!mobDist(event2, 2.0) && players.hasGameStage("A4")) {players.removePotionEffect(usespeed);}
                players.removeGameStage("A4");

                players.addPotionEffect(usespeed.makePotionEffect(inf, 6));
                players.addGameStage("m4");
                players.addGameStage("A3");
            }
            if mobDist(event2, 2.0) {
                players.addPotionEffect(usespeed.makePotionEffect(inf, 7));
                players.addGameStage("m4");
                players.addGameStage("A4");
            }
        } 
            if (players.isPotionActive(usespeed) && players.hasGameStage("mounting4") && players.hasGameStage("m4")) { 
                if (!mobDist(event2, 30.0)) {
            players.removePotionEffect(usespeed);
            players.removeGameStage("m4");
                }
    }
    ##Arcane Ability##

    ##Earth Ability##
    for Dirt in EarthPotion {
        if (mainhand && players.hasGameStage("mounting5")) {
            if players.isPotionActive(Dirt) {
                var count2 = 0;
for  petion in EarthPotion {
    if (players.isPotionActive(petion)) {
        count2 += 1;
    }
}

                if count2 > 0 { players.addPotionEffect(usespeed.makePotionEffect(inf, (3 + (count2 - 1)))); }

                players.addGameStage("m5");

                if (players.getActivePotionEffect(usespeed).amplifier >= (3 + (count2)) && count2 > 0) {
                    players.removePotionEffect(usespeed); count2 = 0;
                    if count2 > 0 { count2 = 0; }
                    }
            }
        } 
            if (players.isPotionActive(usespeed) && players.hasGameStage("mounting5") && players.hasGameStage("m5")) { 
                if players.isPotionActive(Dirt){
                    return;
            }
            players.removePotionEffect(usespeed); 
            players.removeGameStage("m5");
        }
    }
    ##Earth Ability##

    ##Fae Ability##
        if (mainhand && players.hasGameStage("mounting6")) {
            if (world.isDayTime()) {
                players.addPotionEffect(usespeed.makePotionEffect(inf, 4));
                players.addGameStage("m6");
            }
        }
        if (players.isPotionActive(usespeed) && players.hasGameStage("mounting6") && players.hasGameStage("m6")) {
            if (!world.isDayTime()) {
                players.removePotionEffect(usespeed);
                players.removeGameStage("m6");
            }
        }
    ##Fae Ability##

    ##Frost Ability##
    for ColdDrink in FrostPotion {
        var frostP = <enchantment:ebwizardry:frost_protection>;
        var count3 = 0;
    if (mainhand && players.hasGameStage("mounting7")) {
        if (players.isPotionActive(ColdDrink) || listContains(["The End", "FrozenOcean", "FrozenRiver", "Ice Plains", "Ice Mountains", "Cold Beach", "Cold Taiga", "Cold Taiga Hills", "Cold Desert", "Snowy Coniferous Forest", "Snowy Forest", "Tundra", "Alps", "AlpsFoothills", "Glacier", "SnowyTundra", "The Void"], playerBiome.name) || !isNull(players.getItemInSlot(IEntityEquipmentSlot.head())) || !isNull(players.getItemInSlot(IEntityEquipmentSlot.feet())) || !isNull(players.getItemInSlot(IEntityEquipmentSlot.chest())) || !isNull(players.getItemInSlot(IEntityEquipmentSlot.legs()))) {
            for potui in FrostPotion {
                if players.isPotionActive(potui) {
                    count3 += 1;
                    players.addGameStage("m7");
                    players.addGameStage("B");
                }
            }
        if listContains(["The End", "FrozenOcean", "FrozenRiver", "Ice Plains", "Ice Mountains", "Cold Beach", "Cold Taiga", "Cold Taiga Hills", "Cold Desert", "Snowy Coniferous Forest", "Snowy Forest", "Tundra", "Alps", "AlpsFoothills", "Glacier", "SnowyTundra", "The Void"], playerBiome.name) {
            count3 += 1;
            players.addGameStage("m7");
            players.addGameStage("B1");
        }

            if (!isNull(players.getItemInSlot(IEntityEquipmentSlot.head())) && !isNull(players.getItemInSlot(IEntityEquipmentSlot.head()).tag) && !isNull(players.getItemInSlot(IEntityEquipmentSlot.head()).tag.ench)) {
            if (EnchantCheck(players.getItemInSlot(IEntityEquipmentSlot.head()).tag.ench, [frostP])) { 
                players.addGameStage("m7"); 
                players.addGameStage("B2"); 
                count3 += 1; 
                }}
            if (!isNull(players.getItemInSlot(IEntityEquipmentSlot.chest())) && !isNull(players.getItemInSlot(IEntityEquipmentSlot.chest()).tag) && !isNull(players.getItemInSlot(IEntityEquipmentSlot.chest()).tag.ench)) {
            if (EnchantCheck(players.getItemInSlot(IEntityEquipmentSlot.chest()).tag.ench, [frostP])) { 
                players.addGameStage("m7"); 
                players.addGameStage("B3"); 
                count3 += 1; 
                }}
            if (!isNull(players.getItemInSlot(IEntityEquipmentSlot.legs())) && !isNull(players.getItemInSlot(IEntityEquipmentSlot.legs()).tag) && !isNull(players.getItemInSlot(IEntityEquipmentSlot.legs()).tag.ench)) {
            if (EnchantCheck(players.getItemInSlot(IEntityEquipmentSlot.legs()).tag.ench, [frostP])) { 
                players.addGameStage("m7"); 
                players.addGameStage("B4"); 
                count3 += 1; 
                }}
            if (!isNull(players.getItemInSlot(IEntityEquipmentSlot.feet())) && !isNull(players.getItemInSlot(IEntityEquipmentSlot.feet()).tag) && !isNull(players.getItemInSlot(IEntityEquipmentSlot.feet()).tag.ench)) {
            if (EnchantCheck(players.getItemInSlot(IEntityEquipmentSlot.feet()).tag.ench, [frostP])) { 
                players.addGameStage("m7"); 
                players.addGameStage("B5"); 
                count3 += 1; 
                }}

        if count3 > 0 { players.addPotionEffect(usespeed.makePotionEffect(inf, (3 + (count3 - 1)))); }

        if (players.isPotionActive(usespeed) && players.getActivePotionEffect(usespeed).amplifier >= (3 + (count3)) && count3 > 0 && players.hasGameStage("m7")) {
                    players.removePotionEffect(usespeed); count3 = 0;
                    if count3 > 0 { count3 = 0; }
                    }
        }

        if (players.hasAnyGameStages("B2", "B3", "B4", "B5") && players.hasGameStage("m7") && players.isPotionActive(usespeed)) {
            if (players.hasGameStage("B2") && players.hasGameStage("m7")) {
                if (!EnchantCheck(players.getItemInSlot(IEntityEquipmentSlot.head()).tag.ench, [frostP])) {
                players.removePotionEffect(usespeed);
                players.removeGameStage("B2");
                players.removeGameStage("m7");  
                }}
 
            if (players.hasGameStage("B3") && players.hasGameStage("m7")) {
                if (!EnchantCheck(players.getItemInSlot(IEntityEquipmentSlot.chest()).tag.ench, [frostP])) {
                players.removePotionEffect(usespeed);
                players.removeGameStage("B3");
                players.removeGameStage("m7");  
                }}
 
            if (players.hasGameStage("B4") && players.hasGameStage("m7")) {
                if (!EnchantCheck(players.getItemInSlot(IEntityEquipmentSlot.legs()).tag.ench, [frostP])) {
                players.removePotionEffect(usespeed);
                players.removeGameStage("B4");
                players.removeGameStage("m7");  
                }}
 
            if (players.hasGameStage("B5") && players.hasGameStage("m7")) {    
                if (!EnchantCheck(players.getItemInSlot(IEntityEquipmentSlot.feet()).tag.ench, [frostP])) {
                players.removePotionEffect(usespeed);
                players.removeGameStage("B5");
                players.removeGameStage("m7");  
                }}
        }

        if (!listContains(["The End", "FrozenOcean", "FrozenRiver", "Ice Plains", "Ice Mountains", "Cold Beach", "Cold Taiga", "Cold Taiga Hills", "Cold Desert", "Snowy Coniferous Forest", "Snowy Forest", "Tundra", "Alps", "AlpsFoothills", "Glacier", "SnowyTundra", "The Void"], playerBiome.name) && players.hasAllGameStages("m7", "B1") && players.isPotionActive(usespeed)) {
            players.removePotionEffect(usespeed); 
            players.removeGameStage("B1");
        }

        if (players.isPotionActive(usespeed) && players.hasGameStage("B")) { 
                
                if (players.isPotionActive(ColdDrink)){
                    return;
            }
            players.removePotionEffect(usespeed);
            players.removeGameStage("m7");
            players.removeGameStage("B");
        }

    }}
    ##Frost Ability##

    ##Lava Ability##
    for Soup in LavaPotion{
        var fireP = <enchantment:minecraft:fire_protection>;
        var count4 = 0;
    if (mainhand && players.hasGameStage("mounting8")) {
        if (players.isPotionActive(Soup) || players.isInLava || listContains(["Hell", "Mesa", "Mesa Plateau", "Brushland", "Crag", "Lush Desert", "Wasteland", "Oasis", "Volcanic Island", "Corrupted Sands", "Phantasmagoric Inferno", "Undergarden", "Visceral Heap", "Volcanic Desert", "Desert"], playerBiome.name) || !isNull(players.getItemInSlot(IEntityEquipmentSlot.head())) || !isNull(players.getItemInSlot(IEntityEquipmentSlot.feet())) || !isNull(players.getItemInSlot(IEntityEquipmentSlot.chest())) || !isNull(players.getItemInSlot(IEntityEquipmentSlot.legs()))) {
       for potu in LavaPotion {
            if players.isPotionActive(potu) {
                count4 += 1;
                players.addGameStage("m8");
                players.addGameStage("C");
            }
       }
       if players.isInLava { count4 += 1; players.addGameStage("m8"); players.addGameStage("C1"); }

       if listContains(["Hell", "Mesa", "Mesa Plateau", "Brushland", "Crag", "Lush Desert", "Wasteland", "Oasis", "Volcanic Island", "Corrupted Sands", "Phantasmagoric Inferno", "Undergarden", "Visceral Heap", "Volcanic Desert", "Desert"], playerBiome.name) {
            count4 += 1; 
            players.addGameStage("m8"); 
            players.addGameStage("C2");
       }

            if (!isNull(players.getItemInSlot(IEntityEquipmentSlot.head())) && !isNull(players.getItemInSlot(IEntityEquipmentSlot.head()).tag) && !isNull(players.getItemInSlot(IEntityEquipmentSlot.head()).tag.ench)) {
            if (EnchantCheck(players.getItemInSlot(IEntityEquipmentSlot.head()).tag.ench, [fireP])) { 
                players.addGameStage("m8"); 
                players.addGameStage("C3"); 
                count4 += 1; 
                }}
            if (!isNull(players.getItemInSlot(IEntityEquipmentSlot.chest())) && !isNull(players.getItemInSlot(IEntityEquipmentSlot.chest()).tag) && !isNull(players.getItemInSlot(IEntityEquipmentSlot.chest()).tag.ench)) {
            if (EnchantCheck(players.getItemInSlot(IEntityEquipmentSlot.chest()).tag.ench, [fireP])) { 
                players.addGameStage("m8"); 
                players.addGameStage("C4"); 
                count4 += 1; 
                }}
            if (!isNull(players.getItemInSlot(IEntityEquipmentSlot.legs())) && !isNull(players.getItemInSlot(IEntityEquipmentSlot.legs()).tag) && !isNull(players.getItemInSlot(IEntityEquipmentSlot.legs()).tag.ench)) {
            if (EnchantCheck(players.getItemInSlot(IEntityEquipmentSlot.legs()).tag.ench, [fireP])) { 
                players.addGameStage("m8"); 
                players.addGameStage("C5"); 
                count4 += 1; 
                }}
            if (!isNull(players.getItemInSlot(IEntityEquipmentSlot.feet())) && !isNull(players.getItemInSlot(IEntityEquipmentSlot.feet()).tag) && !isNull(players.getItemInSlot(IEntityEquipmentSlot.feet()).tag.ench)) {
            if (EnchantCheck(players.getItemInSlot(IEntityEquipmentSlot.feet()).tag.ench, [fireP])) { 
                players.addGameStage("m8"); 
                players.addGameStage("C6"); 
                count4 += 1; 
                }}
       
       if count4 > 0 { players.addPotionEffect(usespeed.makePotionEffect(inf, (3 + (count4 - 1)))); }

       if (players.isPotionActive(usespeed) && players.getActivePotionEffect(usespeed).amplifier >= (3 + (count4)) && count4 > 0 && players.hasGameStage("m8")) {
                    players.removePotionEffect(usespeed); count4 = 0;
                    if count4 > 0 { count4 = 0; }
                    }
        }

         if (players.hasAnyGameStages("C3", "C4", "C5", "C6") && players.hasGameStage("m8") && players.isPotionActive(usespeed)) {
            if (players.hasGameStage("C3") && players.hasGameStage("m8")) {
                if (!EnchantCheck(players.getItemInSlot(IEntityEquipmentSlot.head()).tag.ench, [fireP])) {
                players.removePotionEffect(usespeed);
                players.removeGameStage("C3");
                players.removeGameStage("m8");  
                }}
 
            if (players.hasGameStage("C4") && players.hasGameStage("m8")) {
                if (!EnchantCheck(players.getItemInSlot(IEntityEquipmentSlot.chest()).tag.ench, [fireP])) {
                players.removePotionEffect(usespeed);
                players.removeGameStage("C4");
                players.removeGameStage("m8");  
                }}
 
            if (players.hasGameStage("C5") && players.hasGameStage("m8")) {
                if (!EnchantCheck(players.getItemInSlot(IEntityEquipmentSlot.legs()).tag.ench, [fireP])) {
                players.removePotionEffect(usespeed);
                players.removeGameStage("C5");
                players.removeGameStage("m8");  
                }}
 
            if (players.hasGameStage("C6") && players.hasGameStage("m8")) {    
                if (!EnchantCheck(players.getItemInSlot(IEntityEquipmentSlot.feet()).tag.ench, [fireP])) {
                players.removePotionEffect(usespeed);
                players.removeGameStage("C6");
                players.removeGameStage("m8");  
                }}
        }

        if (!listContains(["Hell", "Mesa", "Mesa Plateau", "Brushland", "Crag", "Lush Desert", "Wasteland", "Oasis", "Volcanic Island", "Corrupted Sands", "Phantasmagoric Inferno", "Undergarden", "Visceral Heap", "Volcanic Desert", "Desert"], playerBiome.name) && players.hasAllGameStages("m8", "C2") && players.isPotionActive(usespeed)) {
            players.removePotionEffect(usespeed);
            players.removeGameStage("C2");
        }

        if (!players.isInLava && players.hasAllGameStages("C1", "m8") && players.isPotionActive(usespeed)) { players.removePotionEffect(usespeed); players.removeGameStage("C1"); }

        if (players.isPotionActive(usespeed) && players.hasGameStage("C")) { 
                
                if (players.isPotionActive(Soup)){
                    return;
            }
            players.removePotionEffect(usespeed);
            players.removeGameStage("m8");
            players.removeGameStage("C");
        }
    }}
    
    ##Lava Ability##

    ##Lightning Ability##
    for CoCReference in LightningPotion {
        var shockP = <enchantment:ebwizardry:shock_protection>;
        var count5 = 0;
    if (mainhand && players.hasGameStage("mounting9")) {
        if (players.isPotionActive(CoCReference) || !isNull(players.getItemInSlot(IEntityEquipmentSlot.head())) || !isNull(players.getItemInSlot(IEntityEquipmentSlot.feet())) || !isNull(players.getItemInSlot(IEntityEquipmentSlot.chest())) || !isNull(players.getItemInSlot(IEntityEquipmentSlot.legs()))) {
       for potiu in LightningPotion {
            if players.isPotionActive(potiu) {
                count5 += 1;
                players.addGameStage("m9");
                players.addGameStage("D");
            }
       }

            if (!isNull(players.getItemInSlot(IEntityEquipmentSlot.head())) && !isNull(players.getItemInSlot(IEntityEquipmentSlot.head()).tag) && !isNull(players.getItemInSlot(IEntityEquipmentSlot.head()).tag.ench)) {
            if (EnchantCheck(players.getItemInSlot(IEntityEquipmentSlot.head()).tag.ench, [shockP])) { 
                players.addGameStage("m9"); 
                players.addGameStage("D1"); 
                count5 += 1; 
                }}
            if (!isNull(players.getItemInSlot(IEntityEquipmentSlot.chest())) && !isNull(players.getItemInSlot(IEntityEquipmentSlot.chest()).tag) && !isNull(players.getItemInSlot(IEntityEquipmentSlot.chest()).tag.ench)) {
            if (EnchantCheck(players.getItemInSlot(IEntityEquipmentSlot.chest()).tag.ench, [shockP])) { 
                players.addGameStage("m9"); 
                players.addGameStage("D2"); 
                count5 += 1; 
                }}
            if (!isNull(players.getItemInSlot(IEntityEquipmentSlot.legs())) && !isNull(players.getItemInSlot(IEntityEquipmentSlot.legs()).tag) && !isNull(players.getItemInSlot(IEntityEquipmentSlot.legs()).tag.ench)) {
            if (EnchantCheck(players.getItemInSlot(IEntityEquipmentSlot.legs()).tag.ench, [shockP])) { 
                players.addGameStage("m9"); 
                players.addGameStage("D3"); 
                count5 += 1; 
                }}
            if (!isNull(players.getItemInSlot(IEntityEquipmentSlot.feet())) && !isNull(players.getItemInSlot(IEntityEquipmentSlot.feet()).tag) && !isNull(players.getItemInSlot(IEntityEquipmentSlot.feet()).tag.ench)) {
            if (EnchantCheck(players.getItemInSlot(IEntityEquipmentSlot.feet()).tag.ench, [shockP])) { 
                players.addGameStage("m9"); 
                players.addGameStage("D4"); 
                count5 += 1; 
                }}

                if count5 > 0 { players.addPotionEffect(usespeed.makePotionEffect(inf, (3 + (count5 - 1)))); }
                
                if (players.isPotionActive(usespeed) && players.getActivePotionEffect(usespeed).amplifier >= (3 + (count5)) && count5 > 0 && players.hasGameStage("m9")) {
                    players.removePotionEffect(usespeed); count5 = 0;
                    if count5 > 0 { count5 = 0; }
                    }
                
                }

        if (players.hasAnyGameStages("D1", "D2", "D3", "D4") && players.hasGameStage("m9") && players.isPotionActive(usespeed)) {
            if (players.hasAllGameStages("D1", "m9")) {
                if (!EnchantCheck(players.getItemInSlot(IEntityEquipmentSlot.head()).tag.ench, [shockP])) {
                players.removePotionEffect(usespeed);
                players.removeGameStage("D1");
                players.removeGameStage("m9");  
                }}
 
            if (players.hasAllGameStages("D2", "m9")) {
                if (!EnchantCheck(players.getItemInSlot(IEntityEquipmentSlot.chest()).tag.ench, [shockP])) {
                players.removePotionEffect(usespeed);
                players.removeGameStage("D2");
                players.removeGameStage("m9");  
                }}
 
            if (players.hasAllGameStages("D3", "m9")) {
                if (!EnchantCheck(players.getItemInSlot(IEntityEquipmentSlot.legs()).tag.ench, [shockP])) {
                players.removePotionEffect(usespeed);
                players.removeGameStage("D3");
                players.removeGameStage("m9");  
                }}
 
            if (players.hasAllGameStages("D4", "m9")) {    
                if (!EnchantCheck(players.getItemInSlot(IEntityEquipmentSlot.feet()).tag.ench, [shockP])) {
                players.removePotionEffect(usespeed);
                players.removeGameStage("D4");
                players.removeGameStage("m9");  
                }}
        }
                if (players.isPotionActive(usespeed) && players.hasAllGameStages("D", "m9")) { 
                
                if (players.isPotionActive(CoCReference)){
                    return;
            }
            players.removePotionEffect(usespeed); 
            players.removeGameStage("m9");
            players.removeGameStage("D");
        }
    }}
    ##Lightning Ability##

    ##Nether Ability##
    if (mainhand && players.hasGameStage("mounting10")) {

        if !isNull(players.getNBT().ForgeData.kills) {

        var kills = players.getNBT().ForgeData.kills;
 
        if (kills > 0) { players.addPotionEffect(usespeed.makePotionEffect(inf, (3 + (kills - 1)))); }
        }

    }
    ##Nether Ability##

    ##Order Ability##
    if (mainhand && players.hasGameStage("mounting11")) {
        var health = players.health;
        var maxHealth = players.maxHealth;

        if health <= (maxHealth * 0.9) { players.addPotionEffect(usespeed.makePotionEffect(inf, 3)); players.addGameStage("F1.1"); }
        if health <= (maxHealth * 0.8) { players.addPotionEffect(usespeed.makePotionEffect(inf, 4)); players.addGameStage("F1.2"); }
        if health <= (maxHealth * 0.7) { players.addPotionEffect(usespeed.makePotionEffect(inf, 5)); players.addGameStage("F1.3"); }
        if health <= (maxHealth * 0.6) { players.addPotionEffect(usespeed.makePotionEffect(inf, 6)); players.addGameStage("F1.4"); }
        if health <= (maxHealth * 0.5) { players.addPotionEffect(usespeed.makePotionEffect(inf, 7)); players.addGameStage("F1.5"); }
        if health <= (maxHealth * 0.4) { players.addPotionEffect(usespeed.makePotionEffect(inf, 8)); players.addGameStage("F1.6"); }
        if health <= (maxHealth * 0.3) { players.addPotionEffect(usespeed.makePotionEffect(inf, 9)); players.addGameStage("F1.7"); }
        if health <= (maxHealth * 0.2) { players.addPotionEffect(usespeed.makePotionEffect(inf, 10)); players.addGameStage("F1.8"); }
        if health <= (maxHealth * 0.1) { players.addPotionEffect(usespeed.makePotionEffect(inf, 11)); players.addGameStage("F1.9"); }
        if health <= (maxHealth * 0.05) { players.addPotionEffect(usespeed.makePotionEffect(inf, 12)); players.addGameStage("F1.10"); }

        players.addGameStage("m11");

    if players.hasGameStage("m11") {
        if (health > (maxHealth * 0.9) && players.hasGameStage("F1.1")) { players.removePotionEffect(usespeed); players.removeGameStage("F1.1"); }
        if (health > (maxHealth * 0.8) && players.hasGameStage("F1.2")) { players.removePotionEffect(usespeed); players.removeGameStage("F1.2"); }
        if (health > (maxHealth * 0.7) && players.hasGameStage("F1.3")) { players.removePotionEffect(usespeed); players.removeGameStage("F1.3"); }
        if (health > (maxHealth * 0.6) && players.hasGameStage("F1.4")) { players.removePotionEffect(usespeed); players.removeGameStage("F1.4"); }
        if (health > (maxHealth * 0.5) && players.hasGameStage("F1.5")) { players.removePotionEffect(usespeed); players.removeGameStage("F1.5"); }
        if (health > (maxHealth * 0.4) && players.hasGameStage("F1.6")) { players.removePotionEffect(usespeed); players.removeGameStage("F1.6"); }
        if (health > (maxHealth * 0.3) && players.hasGameStage("F1.7")) { players.removePotionEffect(usespeed); players.removeGameStage("F1.7"); }
        if (health > (maxHealth * 0.2) && players.hasGameStage("F1.8")) { players.removePotionEffect(usespeed); players.removeGameStage("F1.8"); }
        if (health > (maxHealth * 0.1) && players.hasGameStage("F1.9")) { players.removePotionEffect(usespeed); players.removeGameStage("F1.9"); }
        if (health > (maxHealth * 0.05) && players.hasGameStage("F1.10")) { players.removePotionEffect(usespeed); players.removeGameStage("F1.10"); }
    }}
    ##Order Ability##

    ##Quake Ability##
        if (mainhand && players.hasGameStage("m12") && players.hasGameStage("mounting12")) { players.addPotionEffect(usespeed.makePotionEffect(60, 6)); players.removeGameStage("m12"); }
    ##Quake Ability##

    ##Shadow Ability##
        if (mainhand && players.hasGameStage("mounting13")) {
            if (!world.isDayTime()) {
                players.addPotionEffect(usespeed.makePotionEffect(inf, 4));
                players.addGameStage("m13");
            }
        }
            if (players.isPotionActive(usespeed) && players.hasGameStage("mounting13") && players.hasGameStage("m13")) {
                if (world.isDayTime()) {
                    players.removePotionEffect(usespeed);
                    players.removeGameStage("m13");
                }
            }
        
    ##Shadow Ability##

    ##Void Ability##
    for V in game.potions {
        if (mainhand && players.hasGameStage("mounting14")) {
            var count6 = 0;
            if players.isPotionActive(V) {

for allPotions in game.potions {
    if V.badEffect{
    if (players.isPotionActive(allPotions)) {
        count6 += 1;
    }}}

                if count6 > 0 { players.addPotionEffect(usespeed.makePotionEffect(inf, (3 + (count6 - 1)))); }

                players.addGameStage("m14");

                    if (players.isPotionActive(usespeed) && players.getActivePotionEffect(usespeed).amplifier >= (3 + (count6)) && count6 > 0 && players.hasGameStage("m7")) { count6 = 0; }
                    
            }
        }
            if (players.isPotionActive(usespeed) && players.hasGameStage("mounting14") && players.hasGameStage("m14")) { 
                
                if players.isPotionActive(V){
                    return;
            }

            players.removePotionEffect(usespeed); 
            players.removeGameStage("m14");
        }
    }
    ##Void Ability##

    ##Water Ability##
        if (mainhand && players.hasGameStage("mounting15")) {
            if players.isInWater { players.addPotionEffect(usespeed.makePotionEffect(inf, 4)); players.addGameStage("m15"); }
            if (!players.isInWater && players.hasGameStage("m15")) { players.removePotionEffect(usespeed); players.removeGameStage("m15"); }
        }
    ##Water Ability##
for gamestages in stages {
    if(!hasArmor(players.getItemInSlot(IEntityEquipmentSlot.head()), players.getItemInSlot(IEntityEquipmentSlot.chest()), players.getItemInSlot(IEntityEquipmentSlot.legs()), players.getItemInSlot(IEntityEquipmentSlot.feet()))) {
        players.removePotionEffect(usespeed);
        players.removeGameStage(gamestages);
        for mount in mounting {
        players.removeGameStage(mount);
        }}

    if (mainhand){
        return;
    }
        if !isNull(players.getNBT().ForgeData.kills) { players.update({kills: 0}); }
        players.removePotionEffect(usespeed);
        players.removeGameStage(gamestages);
        }});

//sfx
events.register(function(event as crafttweaker.event.PotionEffectAddedEvent){
    if event.entityLivingBase.world.isRemote() { return; }
    if !event.entityLivingBase instanceof IPlayer { return; }

    var player as IPlayer = event.entityLivingBase;

    if player.isPotionActive(<potion:potioncraft:usespeed>) { return; }

    if (event.potionEffect.effectName == "Use-Speed") { 
        server.commandManager.executeCommandSilent(server,"particle sweepAttack " ~ player.x ~ " " ~ player.y ~ " " ~ player.z ~ " 0.5 1 0.5 0 5 force @a");
    }
});
//sfx

events.register(function(event as crafttweaker.event.EntityLivingDamageEvent){
if event.entityLivingBase.world.isRemote() { return; }
if isNull(event.damageSource.trueSource) { return; }
if !event.damageSource.trueSource instanceof IPlayer { return; }

var player as IPlayer = event.damageSource.trueSource;

if !isSentientArmor(player.getItemInSlot(IEntityEquipmentSlot.head()), player.getItemInSlot(IEntityEquipmentSlot.chest()), player.getItemInSlot(IEntityEquipmentSlot.legs()), player.getItemInSlot(IEntityEquipmentSlot.feet())) { return; }

var entity = event.entityLivingBase;

if !player.isPotionActive(<potion:potioncraft:usespeed>) { return; }

        if player.hasGameStage("mounting") { entity.addPotionEffect(<potion:minecraft:nausea>.makePotionEffect(80, 0)); }
        if player.hasGameStage("mounting1") { entity.addPotionEffect(<potion:lycanitesmobs:penetration>.makePotionEffect(40, 0)); }
        if player.hasGameStage("mounting2") { entity.addPotionEffect(<potion:minecraft:levitation>.makePotionEffect(40, 0)); }
        if player.hasGameStage("mounting3") { entity.addPotionEffect(<potion:minecraft:poison>.makePotionEffect(40, 0)); }
        if player.hasGameStage("mounting4") { entity.addPotionEffect(<potion:lycanitesmobs:aphagia>.makePotionEffect(40, 0)); }
        if player.hasGameStage("mounting5") { entity.addPotionEffect(<potion:lycanitesmobs:weight>.makePotionEffect(40, 0)); }
        if player.hasGameStage("mounting6") { entity.addPotionEffect(<potion:lycanitesmobs:bleed>.makePotionEffect(40, 0)); }
        if player.hasGameStage("mounting7") { entity.addPotionEffect(<potion:minecraft:slowness>.makePotionEffect(40, 0)); }
        if player.hasGameStage("mounting8") { entity.addPotionEffect(<potion:lycanitesmobs:smouldering>.makePotionEffect(40, 0)); }
        if player.hasGameStage("mounting9") { entity.addPotionEffect(<potion:lycanitesmobs:paralysis>.makePotionEffect(40, 0)); }
        if player.hasGameStage("mounting10") { entity.addPotionEffect(<potion:minecraft:wither>.makePotionEffect(40, 0)); }
        if player.hasGameStage("mounting11") { entity.addPotionEffect(<potion:minecraft:weakness>.makePotionEffect(40, 0)); }
        if player.hasGameStage("mounting12") { entity.addPotionEffect(<potion:minecraft:hunger>.makePotionEffect(40, 0)); }
        if player.hasGameStage("mounting13") { entity.addPotionEffect(<potion:minecraft:blindness>.makePotionEffect(40, 0)); }
        if player.hasGameStage("mounting14") { entity.addPotionEffect(<potion:lycanitesmobs:decay>.makePotionEffect(40, 0)); }
        if player.hasGameStage("mounting15") { entity.addPotionEffect(<potion:minecraft:mining_fatigue>.makePotionEffect(40, 0)); }
});