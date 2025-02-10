#reloadable

import crafttweaker.player.IPlayer;
import crafttweaker.entity.IEntityLivingBase;
import crafttweaker.item.IItemStack;
import crafttweaker.entity.IEntityMob;
import crafttweaker.event.PlayerTickEvent;
import crafttweaker.entity.IEntityEquipmentSlot;
import crafttweaker.event.EntityLivingAttackedEvent;

function hasArmor(helmet as IItemStack, chestplate as IItemStack, legging as IItemStack, boot as IItemStack) as bool {

    var condition = 0;

val Helmets = [
    <metallurgy:brass_helmet>,
    <metallurgy:kalendrite_helmet>,
    <metallurgy:tartarite_helmet>,
    <metallurgy:deep_iron_helmet>,
    <metallurgy:celenegil_helmet>,
    <erebus:rein_compound_goggles>,
    <srparasites:armor_helm_sentient>.withTag({keen_eyes: 1})
] as IItemStack[];

val Chestplates = [
    <metallurgy:brass_chestplate>,
    <metallurgy:kalendrite_chestplate>,
    <metallurgy:tartarite_chestplate>,
    <metallurgy:deep_iron_chestplate>,
    <metallurgy:celenegil_chestplate>,
    <erebus:glider_chestplate_powered>,
    <srparasites:armor_chest_sentient>.withTag({keen_eyes: 1})
] as IItemStack[];

val Leggings = [
    <metallurgy:brass_leggings>,
    <metallurgy:kalendrite_leggings>,
    <metallurgy:tartarite_leggings>,
    <metallurgy:deep_iron_leggings>,
    <metallurgy:celenegil_leggings>,
    <erebus:sprint_leggings>,
    <srparasites:armor_pants_sentient>.withTag({keen_eyes: 1})
] as IItemStack[];

val Boots = [
    <metallurgy:brass_boots>,
    <metallurgy:kalendrite_boots>,
    <metallurgy:tartarite_boots>,
    <metallurgy:deep_iron_boots>,
    <metallurgy:celenegil_boots>,
    <erebus:rein_exoskeleton_boots>,
    <srparasites:armor_boots_sentient>.withTag({keen_eyes: 1})
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

        if (<srparasites:armor_helm_sentient>.withTag({keen_eyes: 1}).anyDamage().matches(helmet)) { condition += 1; }
        if (<srparasites:armor_chest_sentient>.withTag({keen_eyes: 1}).anyDamage().matches(chestplate)) { condition += 1; }
        if (<srparasites:armor_pants_sentient>.withTag({keen_eyes: 1}).anyDamage().matches(legging)) { condition += 1; }
        if (<srparasites:armor_boots_sentient>.withTag({keen_eyes: 1}).anyDamage().matches(boot)) { condition += 1; }

    if condition == 4 { return true; }

    return false;

    if condition > 0 { condition = 0; }
}

function mobDist(tick as PlayerTickEvent, dist as double) as bool{
    val mobs = tick.player.world.getEntities();
    for mob in mobs{
        if mob instanceof IEntityMob {

            var attacker = mobs instanceof IEntityLivingBase;

            if (tick.player.world.getClosestPlayerToEntity(mob, dist, false)) {
                return true;
            }
        }
    }
    return false;
}

events.register(function(event as PlayerTickEvent){

if (event.player.world.isRemote()) { return; }
if (event.phase == "START") { return; }
if event.player.world.time %25 != 0 { return; }

    var player = event.player;

if (!hasArmor(player.getItemInSlot(IEntityEquipmentSlot.head()), player.getItemInSlot(IEntityEquipmentSlot.chest()), player.getItemInSlot(IEntityEquipmentSlot.legs()), player.getItemInSlot(IEntityEquipmentSlot.feet()))) { return; }
            
        var range = 3.0;

    if (isNull(player.getNBT().ForgeData.timer)) {
		player.setNBT({timer: 0});
	}
            if (player.isSneaking && mobDist(event, range)) { 

    if player.world.time %25 != 0 { return; }


    if (player.getNBT().ForgeData.timer as int < 5) {

        player.setNBT({timer: player.getNBT().ForgeData.timer as int + 1});
 
		} else {
 
			player.update({timer: 0});

		}

        var timer = player.getNBT().ForgeData.timer;

        if timer == 1
                { player.sendPlaySoundPacket("lycanitesmobs:projectile.aetherwave", "player", player.position, 0.6, 1.25); server.commandManager.executeCommandSilent(server,"particle fallingdust " ~ player.x ~ " " ~ player.y ~ " " ~ player.z ~ " 0.5 1 0.5 1 20 force @a 0089"); }
            
        if timer == 3
                { player.sendPlaySoundPacket("lycanitesmobs:projectile.aetherwave", "player", player.position, 0.6, 1.5); server.commandManager.executeCommandSilent(server,"particle fallingdust " ~ player.x ~ " " ~ player.y ~ " " ~ player.z ~ " 0.5 1 0.5 1 20 force @a 0089"); }

        if timer == 5
                { player.sendPlaySoundPacket("lycanitesmobs:projectile.aetherwave", "player", player.position, 0.6, 2.0); server.commandManager.executeCommandSilent(server,"effect " ~ player.name ~ " dynamicstealth:soulsight 10"); server.commandManager.executeCommandSilent(server,"particle fallingdust " ~ player.x ~ " " ~ player.y ~ " " ~ player.z ~ " 0.5 1 0.5 1 20 force @a 0089"); }

        } else { player.update({timer: 0}); }
});

events.register(function(event2 as EntityLivingAttackedEvent) {

    if event2.entity.world.isRemote() { return; }

    var player as IPlayer = event2.entity;

    if (!event2.entity instanceof IPlayer) { return; }
    if (isNull(player.getNBT().ForgeData.timer)) { return; }
    if (!event2.damageSource.trueSource instanceof IEntityMob) { return; }

        if (player.getNBT().ForgeData.timer >= 2) { player.addPotionEffect(<potion:potioncore:vulnerable>.makePotionEffect(200, 1)); player.removePotionEffect(<potion:dynamicstealth:soulsight>); player.sendPlaySoundPacket("ebwizardry:spell.arcane_jammer", "player", player.position, 1.0, 0.5); player.update({timer: 0}); }
});

events.register(function(event as crafttweaker.event.EntityLivingDeathEvent){
    if event.entityLivingBase.world.isRemote() { return; }
    if isNull(event.damageSource.trueSource) { return; }
    if (!event.damageSource.trueSource instanceof IPlayer) { return; }

    var player as IPlayer = event.damageSource.trueSource;
    
    if (!isSentientArmor(player.getItemInSlot(IEntityEquipmentSlot.head()), player.getItemInSlot(IEntityEquipmentSlot.chest()), player.getItemInSlot(IEntityEquipmentSlot.legs()), player.getItemInSlot(IEntityEquipmentSlot.feet()))) { return; }
    
    if !player.isPotionActive(<potion:dynamicstealth:soulsight>) { return; }

        if (event.damageSource.projectile && !event.damageSource.magicDamage) { server.commandManager.executeCommandSilent(server,"effect " ~ player.name ~ " dynamicstealth:soulsight 10"); player.sendPlaySoundPacket("lycanitesmobs:projectile.aetherwave", "player", player.position, 0.6, 2.0); }
});