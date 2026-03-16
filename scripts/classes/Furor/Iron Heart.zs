#reloadable

import crafttweaker.player.IPlayer;
import crafttweaker.entity.IEntityEquipmentSlot;
import crafttweaker.item.IItemStack;
import crafttweaker.potions.IPotion;
import crafttweaker.entity.IEntityLivingBase;
import scripts.classes.wildcards;

function hasArmor(helmet as IItemStack, chestplate as IItemStack, legging as IItemStack, boot as IItemStack) as bool {

    var condition = 0;

    val Helmets = [
        <cqrepoured:helmet_heavy_iron>,
        <metallurgy:orichalcum_helmet>,
        <metallurgy:electrum_helmet>,
        <cqrepoured:helmet_bull>,
        <midnight:tenebrum_helmet>,
        <erebus:rhino_exoskeleton_helmet>,
        <metallurgy:lutetium_helmet>,
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
        <srparasites:armor_helm_sentient>.withTag({iron_heart: 1})
    ] as IItemStack[];

    val Chestplates = [
        <cqrepoured:chestplate_heavy_iron>,
        <metallurgy:orichalcum_chestplate>,
        <metallurgy:electrum_chestplate>,
        <cqrepoured:chestplate_bull>,
        <midnight:tenebrum_chestplate>,
        <erebus:rhino_exoskeleton_chestplate>,
        <metallurgy:lutetium_chestplate>,
        <minecraft:elytra>,
        <erebus:glider_chestplate>,
        <erebus:glider_chestplate_powered>,
        <srparasites:armor_chest_sentient>.withTag({iron_heart: 1})
    ] as IItemStack[];

    val Leggings = [
        <cqrepoured:leggings_heavy_iron>,
        <metallurgy:orichalcum_leggings>,
        <metallurgy:electrum_leggings>,
        <cqrepoured:leggings_bull>,
        <midnight:tenebrum_leggings>,
        <erebus:rhino_exoskeleton_leggings>,
        <metallurgy:lutetium_leggings>,
        <erebus:sprint_leggings>,
        <srparasites:armor_pants_sentient>.withTag({iron_heart: 1})
    ] as IItemStack[];

    val Boots = [
        <cqrepoured:boots_heavy_iron>,
        <metallurgy:orichalcum_boots>,
        <metallurgy:electrum_boots>,
        <cqrepoured:boots_bull>,
        <midnight:tenebrum_boots>,
        <erebus:rhino_exoskeleton_boots>,
        <metallurgy:lutetium_boots>,
        <erebus:jump_boots>,
        <erebus:water_striders>,
        <cqrepoured:boots_cloud>,
        <srparasites:armor_boots_sentient>.withTag({iron_heart: 1})
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

    if (<srparasites:armor_helm_sentient>.withTag({iron_heart: 1}).anyDamage().matches(helmet)) { condition += 1; }
    if (<srparasites:armor_chest_sentient>.withTag({iron_heart: 1}).anyDamage().matches(chestplate)) { condition += 1; }
    if (<srparasites:armor_pants_sentient>.withTag({iron_heart: 1}).anyDamage().matches(legging)) { condition += 1; }
    if (<srparasites:armor_boots_sentient>.withTag({iron_heart: 1}).anyDamage().matches(boot)) { condition += 1; }
    
    for wildcard in wildcards.getWildcards() {
        if wildcard.anyDamage().matches(helmet) { condition += 1; }
        if wildcard.anyDamage().matches(chestplate) { condition += 1; }
        if wildcard.anyDamage().matches(legging) { condition += 1; }
        if wildcard.anyDamage().matches(boot) { condition += 1; }
    }

    if condition == 4 { return true; }

    return false;
}

events.register(function(event as crafttweaker.event.PotionEffectAddedEvent){
    if (event.entityLivingBase.world.isRemote() || event.potionEffect.effectName != "mob_effect.srparasites:rage" || !event.entityLivingBase instanceof IPlayer) { return; }

    var player as IPlayer = event.entityLivingBase;
    var helmet as IItemStack = player.getItemInSlot(IEntityEquipmentSlot.head());
    var chestplate as IItemStack = player.getItemInSlot(IEntityEquipmentSlot.chest());
    var leggings as IItemStack = player.getItemInSlot(IEntityEquipmentSlot.legs());
    var boots as IItemStack = player.getItemInSlot(IEntityEquipmentSlot.feet());
    
    if (!isSentientArmor(helmet, chestplate, leggings, boots) || !wildcards.isWithinLimit(player)) { return; }
    player.addPotionEffect(<potion:lycanitesmobs:repulsion>.makePotionEffect(event.potionEffect.duration, 0));
});

events.register(function(event as crafttweaker.event.EntityLivingDamageEvent){
    if (event.entityLivingBase.world.isRemote() || isNull(event.damageSource.trueSource) || !event.entityLivingBase instanceof IPlayer) { return; }

    var player as IPlayer = event.entityLivingBase;
    val attacker as IEntityLivingBase = event.damageSource.trueSource;

    var helmet as IItemStack = player.getItemInSlot(IEntityEquipmentSlot.head());
    var chestplate as IItemStack = player.getItemInSlot(IEntityEquipmentSlot.chest());
    var leggings as IItemStack = player.getItemInSlot(IEntityEquipmentSlot.legs());
    var boots as IItemStack = player.getItemInSlot(IEntityEquipmentSlot.feet());

    if (!hasArmor(helmet, chestplate, leggings, boots) || !wildcards.isWithinLimit(player)) { return; }

    if (player.isPotionActive(<potion:srparasites:rage>) && isSentientArmor(helmet, chestplate, leggings, boots) && wildcards.isWithinLimit(player)) {
        attacker.addPotionEffect(<potion:lycanitesmobs:fear>.makePotionEffect((20 * (player.getActivePotionEffect(<potion:srparasites:rage>).amplifier + 1)), 0));
    }

    if (!player.isPotionActive(<potion:srparasites:rage>) && !isNull(player.getNBT().ForgeData.hasAbility)) { player.update({hasAbility: 0}); }

    if (!event.damageSource.magicDamage && !event.damageSource.fireDamage && !event.damageSource.explosion && !event.damageSource.damageUnblockable && !event.damageSource.damageAbsolute) {

        var health = player.health;
        var maxHealth = player.maxHealth;
        var damage = event.amount;

        if health <= (maxHealth * 0.9) { damage *= 0.95; }
        if health <= (maxHealth * 0.8) { damage *= 0.95; }
        if health <= (maxHealth * 0.7) { damage *= 0.95; }
        if health <= (maxHealth * 0.6) { damage *= 0.95; }
        if health <= (maxHealth * 0.5) { damage *= 0.95; }
        if health <= (maxHealth * 0.4) { damage *= 0.95; }
        if health <= (maxHealth * 0.3) { damage *= 0.95; }
        if health <= (maxHealth * 0.2) { damage *= 0.95; }
        if health <= (maxHealth * 0.1) { damage *= 0.95; }
        if health <= (maxHealth * 0.05) { damage *= 0.95; }
    }
});

events.register(function(event2 as crafttweaker.event.EntityLivingJumpEvent) {
    if (event2.entityLivingBase.world.isRemote() || !event2.entityLivingBase instanceof IPlayer) { return; }

	var entity = event2.entityLivingBase;
    var player as IPlayer = entity;

    var helmet as IItemStack = player.getItemInSlot(IEntityEquipmentSlot.head());
    var chestplate as IItemStack = player.getItemInSlot(IEntityEquipmentSlot.chest());
    var leggings as IItemStack = player.getItemInSlot(IEntityEquipmentSlot.legs());
    var boots as IItemStack = player.getItemInSlot(IEntityEquipmentSlot.feet());

    if (!player.isPotionActive(<potion:srparasites:rage>) || !hasArmor(helmet, chestplate, leggings, boots) || !wildcards.isWithinLimit(player)) { return; }
    
    var rage = <potion:srparasites:rage> as IPotion;
 
	if (isNull(entity.getNBT().ForgeData.hasAbility)) { entity.setNBT({hasAbility: 0}); }
 
	var hasAbility = entity.getNBT().ForgeData.hasAbility;

    if (entity instanceof IPlayer && player.isSneaking && player.isPotionActive(rage) && hasAbility < 1) {
        entity.setNBT({hasAbility: entity.getNBT().ForgeData.hasAbility as int + 1});
    }

    var newAmplifier = (player.getActivePotionEffect(rage).amplifier + 1) as int;
        
    if (player.getActivePotionEffect(rage).duration < 90) { player.sendPlaySoundPacket("minecraft:entity.wither.shoot", "player", player.position, 1.0, 0.5); player.addPotionEffect(rage.makePotionEffect(100, newAmplifier)); player.addPotionEffect(<potion:lycanitesmobs:instability>.makePotionEffect(50, 0)); }
});

events.register(function(event1 as crafttweaker.event.EntityLivingDamageEvent){
    if (event1.entityLivingBase.world.isRemote() || !event1.entityLivingBase.isPotionActive(<potion:srparasites:rage>)) { return; }
    if (isNull(event1.damageSource.trueSource) || !event1.damageSource.trueSource instanceof IPlayer || event1.damageSource.projectile) { return; }

    var player as IPlayer = event1.damageSource.trueSource;
    var helmet as IItemStack = player.getItemInSlot(IEntityEquipmentSlot.head());
    var chestplate as IItemStack = player.getItemInSlot(IEntityEquipmentSlot.chest());
    var leggings as IItemStack = player.getItemInSlot(IEntityEquipmentSlot.legs());
    var boots as IItemStack = player.getItemInSlot(IEntityEquipmentSlot.feet());

    if (!hasArmor(helmet, chestplate, leggings, boots) || !wildcards.isWithinLimit(player)) { return; }

    event1.amount *= 1 + (0.1 * (player.getActivePotionEffect(<potion:srparasites:rage>).amplifier + 1));
});