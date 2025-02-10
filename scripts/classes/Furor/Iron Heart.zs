#reloadable

import crafttweaker.player.IPlayer;
import crafttweaker.entity.IEntityEquipmentSlot;
import crafttweaker.item.IItemStack;
import crafttweaker.potions.IPotion;
import crafttweaker.entity.IEntity;
import crafttweaker.entity.IEntityLivingBase;

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

    if condition > 0 { condition = 0; }
}

function isSentientArmor(helmet as IItemStack, chestplate as IItemStack, legging as IItemStack, boot as IItemStack) as bool {

    var condition = 0;

        if (<srparasites:armor_helm_sentient>.withTag({iron_heart: 1}).anyDamage().matches(helmet)) { condition += 1; }
        if (<srparasites:armor_chest_sentient>.withTag({iron_heart: 1}).anyDamage().matches(chestplate)) { condition += 1; }
        if (<srparasites:armor_pants_sentient>.withTag({iron_heart: 1}).anyDamage().matches(legging)) { condition += 1; }
        if (<srparasites:armor_boots_sentient>.withTag({iron_heart: 1}).anyDamage().matches(boot)) { condition += 1; }

    if condition == 4 { return true; }

    return false;

    if condition > 0 { condition = 0; }
}

events.register(function(event as crafttweaker.event.PotionEffectAddedEvent){
    if event.entityLivingBase.world.isRemote() { return; }
    if !event.entityLivingBase instanceof IPlayer { return; }
    if (event.potionEffect.effectName != "mob_effect.srparasites:rage") { return; }

    var player as IPlayer = event.entityLivingBase;
    
    if !isSentientArmor(player.getItemInSlot(IEntityEquipmentSlot.head()), player.getItemInSlot(IEntityEquipmentSlot.chest()), player.getItemInSlot(IEntityEquipmentSlot.legs()), player.getItemInSlot(IEntityEquipmentSlot.feet())) { return; }

        player.addPotionEffect(<potion:lycanitesmobs:repulsion>.makePotionEffect(event.potionEffect.duration, 0));
});

events.register(function(event as crafttweaker.event.EntityLivingDamageEvent){
    if event.entityLivingBase.world.isRemote() { return; }
    if !event.entityLivingBase instanceof IPlayer { return; }
    if isNull(event.damageSource.trueSource) { return; }

    var player as IPlayer = event.entityLivingBase;
    val attacker as IEntityLivingBase = event.damageSource.trueSource;

    if !hasArmor(player.getItemInSlot(IEntityEquipmentSlot.head()), player.getItemInSlot(IEntityEquipmentSlot.chest()), player.getItemInSlot(IEntityEquipmentSlot.legs()), player.getItemInSlot(IEntityEquipmentSlot.feet())) { return; }

    if isSentientArmor(player.getItemInSlot(IEntityEquipmentSlot.head()), player.getItemInSlot(IEntityEquipmentSlot.chest()), player.getItemInSlot(IEntityEquipmentSlot.legs()), player.getItemInSlot(IEntityEquipmentSlot.feet())) {
        if (player.isPotionActive(<potion:srparasites:rage>)) {
            attacker.addPotionEffect(<potion:lycanitesmobs:fear>.makePotionEffect((20 * (player.getActivePotionEffect(<potion:srparasites:rage>).amplifier + 1)), 0));
        }
    }

    if (!player.isPotionActive(<potion:srparasites:rage>) && !isNull(player.getNBT().ForgeData.hasAbility)) { player.update({hasAbility: 0}); }
        
        if (!event.damageSource.magicDamage && !event.damageSource.fireDamage && !event.damageSource.explosion && !event.damageSource.damageUnblockable && !event.damageSource.damageAbsolute) {

        var health = player.health;
        var maxHealth = player.maxHealth;

        if health <= (maxHealth * 0.9) { event.amount *= 0.95; }
        if health <= (maxHealth * 0.8) { event.amount *= 0.95; }
        if health <= (maxHealth * 0.7) { event.amount *= 0.95; }
        if health <= (maxHealth * 0.6) { event.amount *= 0.95; }
        if health <= (maxHealth * 0.5) { event.amount *= 0.95; }
        if health <= (maxHealth * 0.4) { event.amount *= 0.95; }
        if health <= (maxHealth * 0.3) { event.amount *= 0.95; }
        if health <= (maxHealth * 0.2) { event.amount *= 0.95; }
        if health <= (maxHealth * 0.1) { event.amount *= 0.95; }
        if health <= (maxHealth * 0.05) { event.amount *= 0.95; }
        }
});

events.register(function(event2 as crafttweaker.event.EntityLivingJumpEvent) {
    if (event2.entityLivingBase.world.isRemote()) { return; }
	if (!event2.entityLivingBase instanceof IPlayer) { return; }
    if !hasArmor(event2.entityLivingBase.getItemInSlot(IEntityEquipmentSlot.head()), event2.entityLivingBase.getItemInSlot(IEntityEquipmentSlot.chest()), event2.entityLivingBase.getItemInSlot(IEntityEquipmentSlot.legs()), event2.entityLivingBase.getItemInSlot(IEntityEquipmentSlot.feet())) { return; }
    if (!event2.entityLivingBase.isPotionActive(<potion:srparasites:rage>)) { return; }

	var entity = event2.entityLivingBase;
    var rage = <potion:srparasites:rage> as IPotion;
 
	if (isNull(entity.getNBT().ForgeData.hasAbility)) {
 
		entity.setNBT({hasAbility: 0});
 
	}
 
    var player as IPlayer = entity;
 
	var hasAbility = entity.getNBT().ForgeData.hasAbility;

    if (entity instanceof IPlayer && hasAbility < 1 && player.isPotionActive(rage)) {
        if player.isSneaking {

    if (entity instanceof IPlayer) {
 
		if (entity.getNBT().ForgeData.hasAbility) {
 
			entity.setNBT({hasAbility: entity.getNBT().ForgeData.hasAbility as int + 1});
 
		}
	}

            var newAmplifier = (player.getActivePotionEffect(rage).amplifier + 1) as int;
            
            if (player.getActivePotionEffect(rage).duration < 90) { player.sendPlaySoundPacket("minecraft:entity.wither.shoot", "player", player.position, 1.0, 0.5); player.addPotionEffect(rage.makePotionEffect(100, newAmplifier)); player.addPotionEffect(<potion:lycanitesmobs:instability>.makePotionEffect(100, 0)); }
        }
    }
});

events.register(function(event1 as crafttweaker.event.EntityLivingDamageEvent){
    if event1.entityLivingBase.world.isRemote() { return; }
    if !event1.entityLivingBase.isPotionActive(<potion:srparasites:rage>) { return; }
    if isNull(event1.damageSource.trueSource) { return; }
	if !event1.damageSource.trueSource instanceof IPlayer { return; }
    if event1.damageSource.projectile { return; }
    var player as IPlayer = event1.damageSource.trueSource;
    if !hasArmor(player.getItemInSlot(IEntityEquipmentSlot.head()), player.getItemInSlot(IEntityEquipmentSlot.chest()), player.getItemInSlot(IEntityEquipmentSlot.legs()), player.getItemInSlot(IEntityEquipmentSlot.feet())) { return; }

    event1.amount *= 1 + (0.1 * (player.getActivePotionEffect(<potion:srparasites:rage>).amplifier + 1));
});