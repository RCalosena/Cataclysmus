#reloadable

import crafttweaker.player.IPlayer;
import crafttweaker.entity.IEntityEquipmentSlot;
import crafttweaker.item.IItemStack;
import crafttweaker.entity.IEntityLivingBase;
import crafttweaker.world.IWorld;

function hasArmor(helmet as IItemStack, chestplate as IItemStack, legging as IItemStack, boot as IItemStack) as bool {

    var condition = 0;

val Helmets = [
    <cqrepoured:helmet_heavy_diamond>,
    <metallurgy:haderoth_helmet>,
    <metallurgy:black_steel_helmet>,
    <cqrepoured:helmet_turtle>,
    <metallurgy:vulcanite_helmet>,
    <metallurgy:osmium_helmet>,
    <srparasites:armor_helm_sentient>.withTag({horde_tamer: 1})
] as IItemStack[];

val Chestplates = [
    <cqrepoured:chestplate_heavy_diamond>,
    <metallurgy:haderoth_chestplate>,
    <metallurgy:black_steel_chestplate>,
    <cqrepoured:chestplate_turtle>,
    <metallurgy:vulcanite_chestplate>,
    <metallurgy:osmium_chestplate>,
    <srparasites:armor_chest_sentient>.withTag({horde_tamer: 1})
] as IItemStack[];

val Leggings = [
    <cqrepoured:leggings_heavy_diamond>,
    <metallurgy:haderoth_leggings>,
    <metallurgy:black_steel_leggings>,
    <cqrepoured:leggings_turtle>,
    <metallurgy:vulcanite_leggings>,
    <metallurgy:osmium_leggings>,
    <srparasites:armor_pants_sentient>.withTag({horde_tamer: 1})
] as IItemStack[];

val Boots = [
    <cqrepoured:boots_heavy_diamond>,
    <metallurgy:haderoth_boots>,
    <metallurgy:black_steel_boots>,
    <cqrepoured:boots_turtle>,
    <metallurgy:vulcanite_boots>,
    <metallurgy:osmium_boots>,
    <srparasites:armor_boots_sentient>.withTag({horde_tamer: 1})
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

        if (<srparasites:armor_helm_sentient>.withTag({horde_tamer: 1}).anyDamage().matches(helmet)) { condition += 1; }
        if (<srparasites:armor_chest_sentient>.withTag({horde_tamer: 1}).anyDamage().matches(chestplate)) { condition += 1; }
        if (<srparasites:armor_pants_sentient>.withTag({horde_tamer: 1}).anyDamage().matches(legging)) { condition += 1; }
        if (<srparasites:armor_boots_sentient>.withTag({horde_tamer: 1}).anyDamage().matches(boot)) { condition += 1; }

    if condition == 4 { return true; }

    return false;

    if condition > 0 { condition = 0; }
}

events.register(function(event as crafttweaker.event.EntityLivingHurtEvent){
if (event.entityLivingBase.world.isRemote()) { return; }
if isNull(event.damageSource.trueSource) { return; }
if (!event.damageSource.trueSource instanceof IEntityLivingBase) { return; }

var entity = event.entityLivingBase;
var player as IPlayer = entity;
var damageSource = event.damageSource;
var playerA as IPlayer = event.damageSource.trueSource;


if isSentientArmor(playerA.getItemInSlot(IEntityEquipmentSlot.head()), playerA.getItemInSlot(IEntityEquipmentSlot.chest()), playerA.getItemInSlot(IEntityEquipmentSlot.legs()), playerA.getItemInSlot(IEntityEquipmentSlot.feet())) {
    if (damageSource.explosion && event.damageSource.trueSource instanceof IPlayer) {
        entity.addPotionEffect(<potion:lycanitesmobs:paralysis>.makePotionEffect(100, 0));
    }
}});

events.register(function(event2 as crafttweaker.event.EntityLivingJumpEvent) {
    if (event2.entityLivingBase.world.isRemote()) { return; }
	if (!event2.entityLivingBase instanceof IPlayer) { return; }
    if !hasArmor(event2.entityLivingBase.getItemInSlot(IEntityEquipmentSlot.head()), event2.entityLivingBase.getItemInSlot(IEntityEquipmentSlot.chest()), event2.entityLivingBase.getItemInSlot(IEntityEquipmentSlot.legs()), event2.entityLivingBase.getItemInSlot(IEntityEquipmentSlot.feet())) { return; }
    if (!event2.entityLivingBase.isPotionActive(<potion:srparasites:rage>)) { return; }

    var player as IPlayer = event2.entityLivingBase;

        if player.isSneaking {

            val worldObj as IWorld = player.world;
            
            if (player.isPotionActive(<potion:srparasites:rage>)) { player.addPotionEffect(<potion:potioncore:vulnerable>.makePotionEffect(200, player.getActivePotionEffect(<potion:srparasites:rage>).amplifier)); worldObj.performExplosion(event2.entityLivingBase, player.x, player.y, player.z, (player.getActivePotionEffect(<potion:srparasites:rage>).amplifier + 1), false, false); player.removePotionEffect(<potion:srparasites:rage>); }
        }
});

events.register(function(event3 as crafttweaker.event.PlayerTickEvent){

if event3.side == "CLIENT" { return; }
if event3.phase == "START" { return; }
if event3.player.world.time %5 != 0 { return; }
if !hasArmor(event3.player.getItemInSlot(IEntityEquipmentSlot.head()), event3.player.getItemInSlot(IEntityEquipmentSlot.chest()), event3.player.getItemInSlot(IEntityEquipmentSlot.legs()), event3.player.getItemInSlot(IEntityEquipmentSlot.feet())) { return; }

    if (!isNull(event3.player.getNBT().ForgeData.hits_per_second)) {

        if event3.player.getNBT().ForgeData.hits_per_second > 0 { 

            if event3.player.world.time %100 != 0 { return; }

            event3.player.update({hits_per_second: 0});
         }
    }
});

events.register(function(event1 as crafttweaker.event.EntityLivingDamageEvent){
    if event1.entityLivingBase.world.isRemote() { return; }
    if !event1.entityLivingBase.isPotionActive(<potion:srparasites:rage>) { return; }
	if !event1.entityLivingBase instanceof IPlayer { return; }
    var player as IPlayer = event1.entityLivingBase;
    if !hasArmor(player.getItemInSlot(IEntityEquipmentSlot.head()), player.getItemInSlot(IEntityEquipmentSlot.chest()), player.getItemInSlot(IEntityEquipmentSlot.legs()), player.getItemInSlot(IEntityEquipmentSlot.feet())) { return; }

    event1.amount *= 0.6 - (0.1 * player.getActivePotionEffect(<potion:srparasites:rage>).amplifier); 
});