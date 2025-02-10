#reloadable

import crafttweaker.player.IPlayer;
import crafttweaker.entity.IEntityEquipmentSlot;
import crafttweaker.item.IItemStack;
import crafttweaker.entity.IEntityLivingBase;
import crafttweaker.entity.IEntityArrow;
import crafttweaker.potions.IPotion;
import crafttweaker.world.IBiome;
import crafttweaker.entity.AttributeModifier;
import crafttweaker.entity.AttributeInstance;

static runUUID as string = "c8c7e4cc-eb32-4881-b20b-782392ea067f";

function inBiome(biome as string[], pos as string) as bool {
  for playerbiome in biome {
    if (playerbiome == pos) return true;
  }
  return false;
}

function mobDist(tick as crafttweaker.event.PlayerTickEvent, dist as double) as bool{
    var mobs = tick.player.world.getEntities();
    for mob in mobs{
        if mob instanceof IEntityLivingBase {
            var boss as IEntityLivingBase = mob;
            if boss.isBoss{
            if tick.player.world.getClosestPlayerToEntity(mob, dist, false){
                return true;
            }}
        }
    }
    return false;
}

function hasArmor(helmet as IItemStack, chestplate as IItemStack, legging as IItemStack, boot as IItemStack) as bool {

    var condition = 0;

val Helmets = [
    <metallurgy:oureclase_helmet>,
    <mutantbeasts:mutant_skeleton_skull>,
    <erebus:jade_helmet>,
    <metallurgy:quicksilver_helmet>,
    <metallurgy:eximite_helmet>,
    <metallurgy:shadow_iron_helmet>,
    <minecraft:diamond_helmet>,
    <srparasites:armor_helm_sentient>.withTag({flailer: 1})
] as IItemStack[];

val Chestplates = [
    <metallurgy:oureclase_chestplate>,
    <mutantbeasts:mutant_skeleton_chestplate>,
    <erebus:jade_chestplate>,
    <metallurgy:quicksilver_chestplate>,
    <metallurgy:eximite_chestplate>,
    <metallurgy:shadow_iron_chestplate>,
    <minecraft:diamond_chestplate>,
    <srparasites:armor_chest_sentient>.withTag({flailer: 1})
] as IItemStack[];

val Leggings = [
    <metallurgy:oureclase_leggings>,
    <mutantbeasts:mutant_skeleton_leggings>,
    <erebus:jade_leggings>,
    <metallurgy:quicksilver_leggings>,
    <metallurgy:eximite_leggings>,
    <metallurgy:shadow_iron_leggings>,
    <minecraft:diamond_leggings>,
    <srparasites:armor_pants_sentient>.withTag({flailer: 1})
] as IItemStack[];

val Boots = [
    <metallurgy:oureclase_boots>,
    <mutantbeasts:mutant_skeleton_boots>,
    <erebus:jade_boots>,
    <metallurgy:quicksilver_boots>,
    <metallurgy:eximite_boots>,
    <metallurgy:shadow_iron_boots>,
    <minecraft:diamond_boots>,
    <srparasites:armor_boots_sentient>.withTag({flailer: 1})
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

        if (<srparasites:armor_helm_sentient>.withTag({flailer: 1}).anyDamage().matches(helmet)) { condition += 1; }
        if (<srparasites:armor_chest_sentient>.withTag({flailer: 1}).anyDamage().matches(chestplate)) { condition += 1; }
        if (<srparasites:armor_pants_sentient>.withTag({flailer: 1}).anyDamage().matches(legging)) { condition += 1; }
        if (<srparasites:armor_boots_sentient>.withTag({flailer: 1}).anyDamage().matches(boot)) { condition += 1; }

    if condition == 4 { return true; }

    return false;

    if condition > 0 { condition = 0; }
}

events.register(function(event as crafttweaker.event.LivingKnockBackEvent){
    if event.entityLivingBase.world.isRemote() { return; }

    var attacker = event.attacker;
    var player as IPlayer = event.entityLivingBase;
    var attackerPlayer as IPlayer = event.attacker;
    var playerAttack = event.attacker instanceof IPlayer;

if (playerAttack && hasArmor(attackerPlayer.getItemInSlot(IEntityEquipmentSlot.head()), attackerPlayer.getItemInSlot(IEntityEquipmentSlot.chest()), attackerPlayer.getItemInSlot(IEntityEquipmentSlot.legs()), attackerPlayer.getItemInSlot(IEntityEquipmentSlot.feet()))) {

    if (event.entityLivingBase instanceof IEntityLivingBase) { event.strength *= 0.5; }

}
    if (attacker instanceof IEntityLivingBase || attacker instanceof IEntityArrow) {

        if (event.entityLivingBase instanceof IPlayer && hasArmor(player.getItemInSlot(IEntityEquipmentSlot.head()), player.getItemInSlot(IEntityEquipmentSlot.chest()), player.getItemInSlot(IEntityEquipmentSlot.legs()), player.getItemInSlot(IEntityEquipmentSlot.feet()))) 
        
        {
        var health = player.health;
        var maxHealth = player.maxHealth;

        event.strength *= 2.0;

        if health <= (maxHealth * 0.9) { event.strength *= 1.2; }
        if health <= (maxHealth * 0.8) { event.strength *= 1.2; }
        if health <= (maxHealth * 0.7) { event.strength *= 1.2; }
        if health <= (maxHealth * 0.6) { event.strength *= 1.2; }
        if health <= (maxHealth * 0.5) { event.strength *= 1.2; }
        if health <= (maxHealth * 0.4) { event.strength *= 1.2; }
        if health <= (maxHealth * 0.3) { event.strength *= 1.2; }
        if health <= (maxHealth * 0.2) { event.strength *= 1.2; }
        if health <= (maxHealth * 0.1) { event.strength *= 1.2; }
        if health <= (maxHealth * 0.05) { event.strength *= 1.2; }
        }
    } 
});

//Adversity
events.register(function(event2 as crafttweaker.event.PlayerTickEvent){
if (event2.side == "CLIENT") { return; }
if (event2.phase == "START") { return; }

    var player = event2.player;

if !hasArmor(player.getItemInSlot(IEntityEquipmentSlot.head()), player.getItemInSlot(IEntityEquipmentSlot.chest()), player.getItemInSlot(IEntityEquipmentSlot.legs()), player.getItemInSlot(IEntityEquipmentSlot.feet())) { return; }

    var count = 0;


    if (isNull(player.getNBT().ForgeData.adversity)) {
		player.setNBT({adversity: 0});
	}

        var adversity = player.getNBT().ForgeData.adversity;

    //75% health
    var health = player.health;
    var maxHealth = player.maxHealth;

    if (health <= (maxHealth * 0.75)) { 

        count += 1;
         
        }

    //50% health
    if (health <= (maxHealth * 0.5)) { 

        count += 1;
         
        }

    //25% health
    if (health <= (maxHealth * 0.25)) { 

        count += 1;
         
        }

    //10% health
    if (health <= (maxHealth * 0.1)) { 

        count += 1;
         
        }

    //75% hunger
    var foodLevel = player.foodStats.foodLevel;

    if (foodLevel <= 15) { 

        count += 1;
         
        }

    //50% hunger
    if (foodLevel <= 10) { 

        count += 1;
         
        }

    //25% hunger
    if (foodLevel <= 5) { 

        count += 1;
         
        }

    //10% hunger
    if (foodLevel <= 2) { 

        count += 1;
         
        }

    //Debuff and Amplifier
        var pcount = 0;
        var ampcount = 0;
    for allPotions in game.potions {
        if allPotions.badEffect {
        if player.isPotionActive(allPotions) {
            if player.isPotionActive(allPotions) {
                pcount += 1;
            }
            if (player.isPotionActive(allPotions) && player.getActivePotionEffect(allPotions).amplifier > 0) {
                ampcount += (player.getActivePotionEffect(allPotions).amplifier);
            }
        }}
    }

        if pcount > 0 { count += pcount; }
        if ampcount > 0 { count += ampcount; }

    //Night/Moonphase
    var world = player.world;

        if (world.dimension == 0 && !world.dayTime) {
            count += 1;
        }
    //Dimension
    var dimension = world.dimension;

        if dimension == -1 { count += 1; }
        if dimension == 10 { count += 2; }
        if dimension == 1 { count += 2; }
        if dimension == -23 { count += 3; }
        if dimension == 23 { count += 4; }
    
    //light Level
        if world.getBrightness(player.position) <= 5 { count += 1; }

    //Weather
        if world.raining {
            if world.worldInfo.thundering { count += 2; } else { count += 1; }
        }

    //On Fire/In Lava
        if player.isBurning { count += 1; }
        if player.isInLava { count += 2; }

    //Sprinting
        if player.isSprinting { count += 1; }

    //Biome
        var playerBiome as IBiome = world.getBiome(player.position);
        if inBiome([
                "Petrified Forest",
                "The Void",
                "Wasteland",  
                "Phantasmagoric Inferno", 
                "Undergarden", 
                "Visceral Heap"
        ], playerBiome.name) { count += 1; }

        if inBiome([
                "Volcanic Island", 
                "Corrupted Sands", 
                "Volcanic Desert", 
                "Parasite Biome"
        ], playerBiome.name) { count += 2; }

    //Boss
        if mobDist(event2, 100.0) { count += 1; }

    if (adversity != count && count < 5) { player.sendStatusMessage("§7Adversity Level: §2" ~ count, true); }

    player.update({adversity: count});


    var adversityFormula = (1.0 + (0.1 * adversity)) as double;
    if (adversity > 0 && player.getAttribute("generic.attackSpeed").baseValue == 4.0) { player.getAttribute("generic.attackSpeed").baseValue *= adversityFormula; }
    if isSentientArmor(player.getItemInSlot(IEntityEquipmentSlot.head()), player.getItemInSlot(IEntityEquipmentSlot.chest()), player.getItemInSlot(IEntityEquipmentSlot.legs()), player.getItemInSlot(IEntityEquipmentSlot.feet())) { 
        val attributeSpeed as AttributeInstance = player.getAttribute("generic.movementSpeed");
        var speedAdversityFormula = (0.05 * adversity) as double;
        val runSpeed as AttributeModifier = AttributeModifier.createModifier("MovementRun", speedAdversityFormula, 1, runUUID);

        if (adversity > 0 && adversity == count && !attributeSpeed.hasModifier(runSpeed)) { attributeSpeed.applyModifier(runSpeed); }
        if (adversity != count) { attributeSpeed.removeModifier(runUUID); }
    }

    if (adversity != count && count >= 5 && count < 10) { player.sendStatusMessage("§7Adversity Level: §6" ~ count, true); }
    if (adversity != count && count >= 10 && count < 20) { player.sendStatusMessage("§7Adversity Level: §4" ~ count, true); }
    if (adversity != count && count >= 20) { player.sendStatusMessage("§7Adversity Level: §5" ~ count, true); }

    if (adversity != count && player.getAttribute("generic.attackSpeed").baseValue != 4.0) { player.getAttribute("generic.attackSpeed").baseValue = 4.0; }


});

function hasCopperArmor(helmet as IItemStack, chestplate as IItemStack, legging as IItemStack, boot as IItemStack) as bool {

    var condition = 0;

        if (<mysticalworld:copper_helmet>.anyDamage().matches(helmet)) { condition += 1; }
        if (<mysticalworld:copper_chestplate>.anyDamage().matches(chestplate)) { condition += 1; }
        if (<mysticalworld:copper_leggings>.anyDamage().matches(legging)) { condition += 1; }
        if (<mysticalworld:copper_boots>.anyDamage().matches(boot)) { condition += 1; }

    if condition == 4 { return true; }

    return false;

    if condition > 0 { condition = 0; }
}

events.register(function(event3 as crafttweaker.event.EntityLivingEquipmentChangeEvent){
    if event3.entityLivingBase.world.isRemote() { return; }
    if !event3.entityLivingBase instanceof IPlayer { return; }
    if (hasCopperArmor(event3.entityLivingBase.getItemInSlot(IEntityEquipmentSlot.head()), event3.entityLivingBase.getItemInSlot(IEntityEquipmentSlot.chest()), event3.entityLivingBase.getItemInSlot(IEntityEquipmentSlot.legs()), event3.entityLivingBase.getItemInSlot(IEntityEquipmentSlot.feet()))) { return; }

    if !isNull(event3.entityLivingBase.getAttribute("generic.movementSpeed").getModifier(runUUID)) {
        event3.entityLivingBase.getAttribute("generic.movementSpeed").removeModifier(runUUID);
    }
    if event3.entityLivingBase.getAttribute("generic.movementSpeed").baseValue != 4.0 {
        event3.entityLivingBase.getAttribute("generic.attackSpeed").baseValue = 4.0;
    }
});

events.register(function(event3 as crafttweaker.event.EntityLivingDamageEvent){
    if event3.entityLivingBase.world.isRemote() { return; }
    if isNull(event3.damageSource.trueSource) { return; }
    if !event3.damageSource.trueSource instanceof IPlayer { return; }

    var player as IPlayer = event3.damageSource.trueSource;

    if (isNull(player.getNBT().ForgeData.adversity)) { return; }
    if !hasArmor(player.getItemInSlot(IEntityEquipmentSlot.head()), player.getItemInSlot(IEntityEquipmentSlot.chest()), player.getItemInSlot(IEntityEquipmentSlot.legs()), player.getItemInSlot(IEntityEquipmentSlot.feet())) { return; }

        var adversity = player.getNBT().ForgeData.adversity;

        if adversity < 20 {
            var reverseAdversityFormula = (1.0 - (0.1 * adversity)) as double;
            event3.amount *= reverseAdversityFormula;
            if (!isNull(player.currentItem) && event3.amount < 2) { event3.amount = 2; }
        } else { 
            event3.amount = 2;
            var damageAdversityFormula = (1.0 + (0.05 * adversity)) as double;
            event3.amount *= damageAdversityFormula;
        }
});