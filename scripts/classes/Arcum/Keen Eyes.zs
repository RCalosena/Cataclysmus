#reloadable

import crafttweaker.player.IPlayer;
import crafttweaker.entity.IEntityLivingBase;
import crafttweaker.item.IItemStack;
import crafttweaker.entity.IEntityArrow;
import crafttweaker.event.PlayerTickEvent;
import crafttweaker.entity.IEntityEquipmentSlot;
import crafttweaker.event.EntityLivingAttackedEvent;
import scripts.classes.wildcards;

//armor set detection
function hasArmor(helmet as IItemStack, chestplate as IItemStack, legging as IItemStack, boot as IItemStack) as bool {

    var condition = 0;

    val Helmets = [
        <metallurgy:brass_helmet>,
        <metallurgy:kalendrite_helmet>,
        <metallurgy:tartarite_helmet>,
        <metallurgy:deep_iron_helmet>,
        <metallurgy:celenegil_helmet>,
        <erebus:rein_exoskeleton_helmet>,
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
        <srparasites:armor_helm_sentient>.withTag({keen_eyes: 1})
    ] as IItemStack[];

    val Chestplates = [
        <metallurgy:brass_chestplate>,
        <metallurgy:kalendrite_chestplate>,
        <metallurgy:tartarite_chestplate>,
        <metallurgy:deep_iron_chestplate>,
        <metallurgy:celenegil_chestplate>,
        <erebus:rein_exoskeleton_chestplate>,
        <erebus:glider_chestplate_powered>,
        <minecraft:elytra>,
        <erebus:glider_chestplate>,
        <srparasites:armor_chest_sentient>.withTag({keen_eyes: 1})
    ] as IItemStack[];

    val Leggings = [
        <metallurgy:brass_leggings>,
        <metallurgy:kalendrite_leggings>,
        <metallurgy:tartarite_leggings>,
        <metallurgy:deep_iron_leggings>,
        <metallurgy:celenegil_leggings>,
        <erebus:rein_exoskeleton_leggings>,
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
        <erebus:jump_boots>,
        <erebus:water_striders>,
        <cqrepoured:boots_cloud>,
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

    if (condition >= 4) { return true; }

    return false;
}

//sentient armor set detection
function isSentientArmor(helmet as IItemStack, chestplate as IItemStack, legging as IItemStack, boot as IItemStack) as bool {

    var condition = 0;

    if (<srparasites:armor_helm_sentient>.withTag({keen_eyes: 1}).anyDamage().matches(helmet)) { condition += 1; }
    if (<srparasites:armor_chest_sentient>.withTag({keen_eyes: 1}).anyDamage().matches(chestplate)) { condition += 1; }
    if (<srparasites:armor_pants_sentient>.withTag({keen_eyes: 1}).anyDamage().matches(legging)) { condition += 1; }
    if (<srparasites:armor_boots_sentient>.withTag({keen_eyes: 1}).anyDamage().matches(boot)) { condition += 1; }
    
    for wildcard in wildcards.getWildcards() {
        if wildcard.anyDamage().matches(helmet) { condition += 1; }
        if wildcard.anyDamage().matches(chestplate) { condition += 1; }
        if wildcard.anyDamage().matches(legging) { condition += 1; }
        if wildcard.anyDamage().matches(boot) { condition += 1; }
    }

    if condition >= 4 { return true; }

    return false;
}

//distance from the player to a mob
function mobDist(tick as PlayerTickEvent, dist as double) as bool{
    for mob in tick.player.world.getEntities(){
        if (mob instanceof IEntityLivingBase && !mob instanceof IPlayer) {
            if tick.player.world.getClosestPlayerToEntity(mob, dist, false)
                return true;
        }
    }
    return false;
}

events.register(function(event as PlayerTickEvent){
if (event.player.world.isRemote()) { return; }
if (event.phase == "START") { return; }
if event.player.world.time %25 != 0 { return; }

    var player = event.player;
    var helmet as IItemStack = player.getItemInSlot(IEntityEquipmentSlot.head());
    var chestplate as IItemStack = player.getItemInSlot(IEntityEquipmentSlot.chest());
    var leggings as IItemStack = player.getItemInSlot(IEntityEquipmentSlot.legs());
    var boots as IItemStack = player.getItemInSlot(IEntityEquipmentSlot.feet());
    
    var range = 5.0;

//if player has armor set and isn't wearing more than 2 wildcards
if (!hasArmor(helmet, chestplate, leggings, boots) || !wildcards.isWithinLimit(player)) { return; }
            

    if (isNull(player.getNBT().ForgeData.timer)) { player.setNBT({timer: 0}); }
    
    //check distance from a mob
    if (player.isSneaking && mobDist(event, range)) { 

    if player.world.time %25 != 0 { return; }

        if (player.getNBT().ForgeData.timer as int < 5) {
            //increment sneak timer
            player.setNBT({timer: player.getNBT().ForgeData.timer as int + 1});
		} else { player.update({timer: 0}); }

        var timer = player.getNBT().ForgeData.timer;

        //optimize
        if timer == 1
        { player.sendPlaySoundPacket("lycanitesmobs:projectile.aetherwave", "player", player.position, 0.6, 1.25); server.commandManager.executeCommandSilent(server,"particle fallingdust " ~ player.x ~ " " ~ player.y ~ " " ~ player.z ~ " 0.5 1 0.5 1 20 force @a 0089"); }
            
        if timer == 3
        { player.sendPlaySoundPacket("lycanitesmobs:projectile.aetherwave", "player", player.position, 0.6, 1.5); server.commandManager.executeCommandSilent(server,"particle fallingdust " ~ player.x ~ " " ~ player.y ~ " " ~ player.z ~ " 0.5 1 0.5 1 20 force @a 0089"); }

        if timer == 5
        { player.sendPlaySoundPacket("lycanitesmobs:projectile.aetherwave", "player", player.position, 0.6, 2.0); server.commandManager.executeCommandSilent(server,"effect " ~ player.name ~ " dynamicstealth:soulsight 20"); server.commandManager.executeCommandSilent(server,"particle fallingdust " ~ player.x ~ " " ~ player.y ~ " " ~ player.z ~ " 0.5 1 0.5 1 20 force @a 0089"); }

    } else { player.update({timer: 0}); }
});

events.register(function(event2 as EntityLivingAttackedEvent) {
    if event2.entity.world.isRemote() { return; }

    var player as IPlayer = event2.entity;

    if (!event2.entity instanceof IPlayer) { return; }
    if (isNull(player.getNBT().ForgeData.timer)) { return; }

        if (player.getNBT().ForgeData.timer >= 2) { player.addPotionEffect(<potion:potioncore:vulnerable>.makePotionEffect(200, 1)); player.removePotionEffect(<potion:dynamicstealth:soulsight>); player.sendPlaySoundPacket("ebwizardry:spell.arcane_jammer", "player", player.position, 1.0, 0.5); player.update({timer: 0}); }
});

events.register(function(event as crafttweaker.event.EntityLivingDeathEvent){
    if (event.entityLivingBase.world.isRemote() || isNull(event.damageSource.trueSource) || !event.damageSource.trueSource instanceof IPlayer) { return; }

    var player as IPlayer = event.damageSource.trueSource;
    var helmet as IItemStack = player.getItemInSlot(IEntityEquipmentSlot.head());
    var chestplate as IItemStack = player.getItemInSlot(IEntityEquipmentSlot.chest());
    var leggings as IItemStack = player.getItemInSlot(IEntityEquipmentSlot.legs());
    var boots as IItemStack = player.getItemInSlot(IEntityEquipmentSlot.feet());
    
    if (!isSentientArmor(helmet, chestplate, leggings, boots) || !wildcards.isWithinLimit(player)) { return; }
    if !player.isPotionActive(<potion:dynamicstealth:soulsight>) { return; }

    if (event.damageSource.projectile && !event.damageSource.magicDamage) { server.commandManager.executeCommandSilent(server,"effect " ~ player.name ~ " dynamicstealth:soulsight 10"); player.sendPlaySoundPacket("lycanitesmobs:projectile.aetherwave", "player", player.position, 0.6, 2.0); }
});

//arrow time

//optimize
events.register(function(event as crafttweaker.event.EntityJoinWorldEvent) {
    if (event.entity.world.isRemote()) return;
    if (!event.entity instanceof IEntityArrow) return;
    var arrow as IEntityArrow = event.entity;

    if (!arrow.shooter instanceof IPlayer) return;

    var player as IPlayer = arrow.shooter;
    var helmet as IItemStack = player.getItemInSlot(IEntityEquipmentSlot.head());
    var chestplate as IItemStack = player.getItemInSlot(IEntityEquipmentSlot.chest());
    var leggings as IItemStack = player.getItemInSlot(IEntityEquipmentSlot.legs());
    var boots as IItemStack = player.getItemInSlot(IEntityEquipmentSlot.feet());

    if (!hasArmor(helmet, chestplate, leggings, boots) || !wildcards.isWithinLimit(player)) return;

    arrow.definition.onTick(function(entity) {
        if !isNull(arrow.getNBT().ForgeData.arrowDoneTicking) return;

        var arrows as IEntityArrow = entity;

        if (arrow.shake > 0) {
            arrow.motionX = 0;
            arrow.motionY = 0;
            arrow.motionZ = 0;
        }


        if (isNull(arrow.getNBT().ForgeData.arrowAirTime)) { arrow.setNBT({arrowAirTime: 0}); }
        
            if (arrow.motionX != 0 || arrow.motionY != 0 || arrow.motionZ != 0) {
                arrow.update({arrowAirTime: arrow.getNBT().ForgeData.arrowAirTime as int + 1});

            } else {
                arrow.update({arrowAirTime: 0});
                arrow.setNBT({arrowDoneTicking: 1});
            }
    });
});

events.register(function(event as crafttweaker.event.EntityLivingDamageEvent){
    if event.entityLivingBase.world.isRemote() return;

    if (isNull(event.damageSource.immediateSource) ||
        isNull(event.damageSource.immediateSource.getNBT().ForgeData.arrowAirTime) ||
        isNull(event.damageSource.trueSource)) 
        { return; }

    if (!event.damageSource.immediateSource instanceof IEntityArrow ||
        !event.damageSource.trueSource instanceof IPlayer) 
        { return; }

        var arrow as IEntityArrow = event.damageSource.immediateSource;
        var player as IPlayer =  event.damageSource.trueSource;
        var airTime = event.damageSource.immediateSource.getNBT().ForgeData.arrowAirTime;

        var helmet as IItemStack = player.getItemInSlot(IEntityEquipmentSlot.head());
        var chestplate as IItemStack = player.getItemInSlot(IEntityEquipmentSlot.chest());
        var leggings as IItemStack = player.getItemInSlot(IEntityEquipmentSlot.legs());
        var boots as IItemStack = player.getItemInSlot(IEntityEquipmentSlot.feet());

    if (!hasArmor(helmet, chestplate, leggings, boots) || !wildcards.isWithinLimit(player)) return;

    if arrow.isCritical {
    if airTime >= 2 {
        if !event.entityLivingBase.isBoss {
            event.amount *= 1 + (0.3 * (airTime - 2));
        } else {
            if airTime > 30 { event.amount *= 4; } else { event.amount *= 1 + (0.1 * (airTime - 2)); }
        }  
    }
        if (airTime >= 2 && airTime < 4) { player.sendPlaySoundPacket("minecraft:entity.arrow.hit_player", "player", player.position, 0.5, 0.5); }
        if (airTime >= 6 && airTime < 12)  { player.sendPlaySoundPacket("minecraft:entity.arrow.hit_player", "player", player.position, 0.75, 0.7); }
        if (airTime >= 12)  { player.sendPlaySoundPacket("cqrepoured:item.musket.shoot", "player", player.position, 0.8, 1.5); }
    } else {
        if airTime >= 5 {
            if !event.entityLivingBase.isBoss {
                event.amount *= 1 + (1.6 * (airTime - 5));
            } else {
                if airTime > 30 { event.amount *= 16; } else { event.amount *= 1 + (0.8 * (airTime - 5)); }
            }
        }
        if (airTime >= 5 && airTime < 10) { player.sendPlaySoundPacket("minecraft:entity.arrow.hit_player", "player", player.position, 0.5, 0.5); }
        if (airTime >= 10 && airTime < 30)  { player.sendPlaySoundPacket("minecraft:entity.arrow.hit_player", "player", player.position, 0.75, 0.7); }
        if (airTime >= 30)  { player.sendPlaySoundPacket("cqrepoured:item.musket.shoot", "player", player.position, 0.8, 1.5); }
    }

});