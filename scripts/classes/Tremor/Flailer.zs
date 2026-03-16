#reloadable

import crafttweaker.player.IPlayer;
import crafttweaker.entity.IEntityEquipmentSlot;
import crafttweaker.item.IItemStack;
import crafttweaker.entity.IEntityLivingBase;
import crafttweaker.world.IBiome;
import crafttweaker.entity.AttributeModifier;
import crafttweaker.entity.AttributeInstance;
import scripts.classes.wildcards;

static runUUID as string = "1f830930-23b6-45dc-904f-6d2c90d953b1";

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
            if (boss.isBoss) {
                if (tick.player.world.getClosestPlayerToEntity(mob, dist, false))
                    return true;
            }
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
        <cqrepoured:helmet_diamond_dyable>,
        <quark:archaeologist_hat>,
        <quark:pirate_hat>,
        <quark:witch_hat>,
        <bountifulbaubles:crowngold>,
        <minecraft:skull:*>,
        <betteranimalsplus:hirschgeistskullwearable>,
        <erebus:mushroom_helmet>,
        <erebus:compound_goggles>,
        <erebus:rein_compound_goggles>,
        <mod_lavacow:skeletonking_crown>,
        <mysticalworld:antler_hat>,
        <mysticalworld:beetle_mask>,
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
        <cqrepoured:chestplate_diamond_dyable>,
        <minecraft:elytra>,
        <erebus:glider_chestplate>,
        <erebus:glider_chestplate_powered>,
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
        <cqrepoured:leggings_diamond_dyable>,
        <erebus:sprint_leggings>,
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
        <cqrepoured:boots_diamond_dyable>,
        <erebus:jump_boots>,
        <erebus:water_striders>,
        <cqrepoured:boots_cloud>,
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
    
    for wildcard in wildcards.getWildcards() {
        if wildcard.anyDamage().matches(helmet) { condition += 1; }
        if wildcard.anyDamage().matches(chestplate) { condition += 1; }
        if wildcard.anyDamage().matches(legging) { condition += 1; }
        if wildcard.anyDamage().matches(boot) { condition += 1; }
    }

    if condition == 4 { return true; }

    return false;
}

events.onLivingKnockBack(function(event as crafttweaker.event.LivingKnockBackEvent){
    if event.entityLivingBase.world.isRemote() { return; }

    var attacker = event.attacker;
    var player as IPlayer = event.entityLivingBase;

    var helmet as IItemStack = player.getItemInSlot(IEntityEquipmentSlot.head());
    var chestplate as IItemStack = player.getItemInSlot(IEntityEquipmentSlot.chest());
    var leggings as IItemStack = player.getItemInSlot(IEntityEquipmentSlot.legs());
    var boots as IItemStack = player.getItemInSlot(IEntityEquipmentSlot.feet());

    var playerAttack = event.attacker instanceof IPlayer;

    if (playerAttack) {

        var attackerPlayer as IPlayer = event.attacker;

        var helmetA as IItemStack = attackerPlayer.getItemInSlot(IEntityEquipmentSlot.head());
        var chestplateA as IItemStack = attackerPlayer.getItemInSlot(IEntityEquipmentSlot.chest());
        var leggingsA as IItemStack = attackerPlayer.getItemInSlot(IEntityEquipmentSlot.legs());
        var bootsA as IItemStack = attackerPlayer.getItemInSlot(IEntityEquipmentSlot.feet());

        if (hasArmor(helmetA, chestplateA, leggingsA, bootsA) && wildcards.isWithinLimit(attackerPlayer)) {
            if (event.entityLivingBase instanceof IEntityLivingBase) { event.strength *= 0.5; }
        }
    }

    if (attacker instanceof IEntityLivingBase) {

        if (event.entityLivingBase instanceof IPlayer && hasArmor(helmet, chestplate, leggings, boots) && wildcards.isWithinLimit(player)) {
            var health = player.health;
            var maxHealth = player.maxHealth;

            event.strength *= 1.5;

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
    if (event2.side == "CLIENT" || event2.phase == "START") { return; }

    var player = event2.player;
    var helmet as IItemStack = player.getItemInSlot(IEntityEquipmentSlot.head());
    var chestplate as IItemStack = player.getItemInSlot(IEntityEquipmentSlot.chest());
    var leggings as IItemStack = player.getItemInSlot(IEntityEquipmentSlot.legs());
    var boots as IItemStack = player.getItemInSlot(IEntityEquipmentSlot.feet());

    if (!hasArmor(helmet, chestplate, leggings, boots) || !wildcards.isWithinLimit(player)) { return; }

    var count = 0;

    if (isNull(player.getNBT().ForgeData.adversity)) { player.setNBT({adversity: 0}); }

    var adversity = player.getNBT().ForgeData.adversity;

    var health = player.health;
    var maxHealth = player.maxHealth;
    
    //75% health
    if (health <= (maxHealth * 0.75)) { count += 1; }

    //50% health
    if (health <= (maxHealth * 0.5)) { count += 1; }

    //25% health
    if (health <= (maxHealth * 0.25)) { count += 1; }

    //10% health
    if (health <= (maxHealth * 0.1)) { count += 1; }

    var foodLevel = player.foodStats.foodLevel;

    //75% hunger
    if (foodLevel <= 15) { count += 1; }

    //50% hunger
    if (foodLevel <= 10) { count += 1; }

    //25% hunger
    if (foodLevel <= 5) { count += 1; }

    //10% hunger
    if (foodLevel <= 2) { count += 1; }

    //Debuff and Amplifier
    var pcount = 0;
    var ampcount = 0;
    
    for allPotions in game.potions {
        if (allPotions.badEffect && player.isPotionActive(allPotions)) {
            //increase potion count
            pcount += 1;
            
            if (player.getActivePotionEffect(allPotions).amplifier > 0) {
                //increase amplifier count
                ampcount += (player.getActivePotionEffect(allPotions).amplifier);
            }
        }
    }

    if pcount > 0 { count += pcount; }
    if ampcount > 0 { count += ampcount; }

    //Night/Moonphase
    var world = player.world;

    if (world.dimension == 0 && !world.dayTime) { count += 1; }

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
        count += 1;
        if world.worldInfo.thundering { count += 1; }
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

    var adversityFormula = (1.0 + (0.05 * adversity)) as double;

    if (adversity > 0 && player.getAttribute("generic.attackSpeed").baseValue == 4.0) { player.getAttribute("generic.attackSpeed").baseValue *= adversityFormula; }
    
    if (isSentientArmor(helmet, chestplate, leggings, boots) && wildcards.isWithinLimit(player)) { 
        val attributeSpeed as AttributeInstance = player.getAttribute("generic.movementSpeed");
        var speedAdversityFormula = (0.05 * adversity) as double;
        val runSpeed as AttributeModifier = AttributeModifier.createModifier("MovementRun", speedAdversityFormula, 1, runUUID);

        if (adversity > 0 && adversity == count && !attributeSpeed.hasModifier(runSpeed)) { attributeSpeed.applyModifier(runSpeed); }
        if (adversity != count) { attributeSpeed.removeModifier(runUUID); }
    }

    if adversity != count {
        if (count >= 5 && count < 10) { player.sendStatusMessage("§7Adversity Level: §6" ~ count, true); }
        if (count >= 10 && count < 20) { player.sendStatusMessage("§7Adversity Level: §4" ~ count, true); }
        if (count >= 20) { player.sendStatusMessage("§7Adversity Level: §5" ~ count, true); }

        if (player.getAttribute("generic.attackSpeed").baseValue != 4.0) { player.getAttribute("generic.attackSpeed").baseValue = 4.0; }
    }
});

function hasCopperArmor(helmet as IItemStack, chestplate as IItemStack, legging as IItemStack, boot as IItemStack) as bool {
    var condition = 0;

    if (<mysticalworld:copper_helmet>.anyDamage().matches(helmet)) { condition += 1; }
    if (<mysticalworld:copper_chestplate>.anyDamage().matches(chestplate)) { condition += 1; }
    if (<mysticalworld:copper_leggings>.anyDamage().matches(legging)) { condition += 1; }
    if (<mysticalworld:copper_boots>.anyDamage().matches(boot)) { condition += 1; }
    
    for wildcard in wildcards.getWildcards() {
        if wildcard.anyDamage().matches(helmet) { condition += 1; }
        if wildcard.anyDamage().matches(chestplate) { condition += 1; }
        if wildcard.anyDamage().matches(legging) { condition += 1; }
        if wildcard.anyDamage().matches(boot) { condition += 1; }
    }

    if condition == 4 { return true; }

    return false;
}

events.register(function(event3 as crafttweaker.event.EntityLivingEquipmentChangeEvent){
    if (event3.entityLivingBase.world.isRemote() || !event3.entityLivingBase instanceof IPlayer) { return; }

    var player as IPlayer = event3.entityLivingBase;
    var helmet as IItemStack = player.getItemInSlot(IEntityEquipmentSlot.head());
    var chestplate as IItemStack = player.getItemInSlot(IEntityEquipmentSlot.chest());
    var leggings as IItemStack = player.getItemInSlot(IEntityEquipmentSlot.legs());
    var boots as IItemStack = player.getItemInSlot(IEntityEquipmentSlot.feet());

    if (hasCopperArmor(helmet, chestplate, leggings, boots) && wildcards.isWithinLimit(player)) { return; }

    if !isNull(player.getAttribute("generic.movementSpeed").getModifier(runUUID)) {
        player.getAttribute("generic.movementSpeed").removeModifier(runUUID);
    }

    if player.getAttribute("generic.movementSpeed").baseValue != 4.0 {
        player.getAttribute("generic.attackSpeed").baseValue = 4.0;
    }
});

events.register(function(event3 as crafttweaker.event.EntityLivingDamageEvent){
    if event3.entityLivingBase.world.isRemote() { return; }
    if (isNull(event3.damageSource.trueSource) || !event3.damageSource.trueSource instanceof IPlayer) { return; }

    var player as IPlayer = event3.damageSource.trueSource;
    var helmet as IItemStack = player.getItemInSlot(IEntityEquipmentSlot.head());
    var chestplate as IItemStack = player.getItemInSlot(IEntityEquipmentSlot.chest());
    var leggings as IItemStack = player.getItemInSlot(IEntityEquipmentSlot.legs());
    var boots as IItemStack = player.getItemInSlot(IEntityEquipmentSlot.feet());

    if (isNull(player.getNBT().ForgeData.adversity) || !hasArmor(helmet, chestplate, leggings, boots) || !wildcards.isWithinLimit(player)) { return; }

        var adversity = player.getNBT().ForgeData.adversity;
        var reverseAdversityFormula = (1.0 - (0.03 * adversity)) as double;
        
        player.sendPlaySoundPacket("bowdamagetweaker:player.criticalstrike", "player", player.position, 1.0, 1.5);

        if adversity < 10 {
            event3.amount *= reverseAdversityFormula;
            if (!isNull(player.currentItem) && event3.amount < 2) { event3.amount = 2; }
        } else { 
            event3.amount *= 0.7;
            var damageAdversityFormula = (1.0 + (0.05 * adversity)) as double;
            event3.amount *= damageAdversityFormula;
        }
});