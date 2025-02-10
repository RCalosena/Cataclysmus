#reloadable

import crafttweaker.player.IPlayer;
import crafttweaker.entity.IEntityLivingBase;
import crafttweaker.item.IItemStack;
import crafttweaker.entity.IEntityMob;
import crafttweaker.entity.IEntity;
import crafttweaker.event.PlayerTickEvent;
import crafttweaker.entity.IEntityEquipmentSlot;
import crafttweaker.event.EntityLivingAttackedEvent;
import crafttweaker.entity.IEntityArrow;
import crafttweaker.potions.IPotion;
import crafttweaker.world.IWorld;
import crafttweaker.data.IData;
import mods.zenutils.DataUpdateOperation.OVERWRITE;
import crafttweaker.entity.IEntityAnimal;

//Copper
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

events.register(function(event as crafttweaker.event.CriticalHitEvent){
    if event.player.world.isRemote() { return; }

    var player = event.player;

    if (!hasCopperArmor(player.getItemInSlot(IEntityEquipmentSlot.head()), player.getItemInSlot(IEntityEquipmentSlot.chest()), player.getItemInSlot(IEntityEquipmentSlot.legs()), player.getItemInSlot(IEntityEquipmentSlot.feet()))) { return; }
    if isNull(player.getNBT().ForgeData.jumpCrit) { return; }

    if (isNull(player.getNBT().ForgeData.critCopperCounter)) {
		player.setNBT({critCopperCounter: 0});
	}

	if (player.motionY < 0.2 && !player.onGround && !player.isInWater && !player.isInLava && !player.isPotionActive(<potion:lycanitesmobs:fear>) && player.getNBT().ForgeData.jumpCrit == 0) {
 
		if (player.getNBT().ForgeData.critCopperCounter as int < 3) {
 
			player.setNBT({critCopperCounter: player.getNBT().ForgeData.critCopperCounter as int + 1}
            );

		} else {
 
			player.update({critCopperCounter: 0});

		}
 

        if player.getNBT().ForgeData.critCopperCounter == 1 { player.sendPlaySoundPacket("ebwizardry:entity.lightning_disc.hit", "player", player.position, 3.0, 0.5); }
        if player.getNBT().ForgeData.critCopperCounter == 2 { player.sendPlaySoundPacket("ebwizardry:entity.lightning_disc.hit", "player", player.position, 3.0, 1.0); }
        if player.getNBT().ForgeData.critCopperCounter == 3 { player.addPotionEffect(<potion:ebwizardry:static_aura>.makePotionEffect(120, 0)); player.update({critCopperCounter: 0}); player.sendPlaySoundPacket("ebwizardry:entity.lightning_disc.hit", "player", player.position, 4.0, 2.0); player.sendPlaySoundPacket("cqrepoured:entity.exterminator.electro_zap", "player", player.position, 4.0, 2.0); }

	} else { player.update({critCopperCounter: 0}); }
});

events.register(function(event1 as crafttweaker.event.PotionEffectAddedEvent){
    if event1.entityLivingBase.world.isRemote() { return; }
    if event1.potionEffect.effectName != "potion.ebwizardry:static_aura" { return; }
    if !event1.entityLivingBase instanceof IPlayer { return; }

    var player as IPlayer = event1.entityLivingBase;
    
    if (!hasCopperArmor(player.getItemInSlot(IEntityEquipmentSlot.head()), player.getItemInSlot(IEntityEquipmentSlot.chest()), player.getItemInSlot(IEntityEquipmentSlot.legs()), player.getItemInSlot(IEntityEquipmentSlot.feet()))) { return; }
        if (player.getAttribute("generic.attackSpeed").baseValue == 4.0) { player.getAttribute("generic.attackSpeed").baseValue *= 1.5; }
});

events.register(function(event2 as crafttweaker.event.PotionEffectRemoveEvent){
    if event2.entityLivingBase.world.isRemote() { return; }
    if isNull(event2.potionEffect) { return; }
    if event2.potionEffect.effectName != "potion.ebwizardry:static_aura" { return; }
    if !event2.entityLivingBase instanceof IPlayer { return; }

    var player as IPlayer = event2.entityLivingBase;

    if !hasCopperArmor(player.getItemInSlot(IEntityEquipmentSlot.head()), player.getItemInSlot(IEntityEquipmentSlot.chest()), player.getItemInSlot(IEntityEquipmentSlot.legs()), player.getItemInSlot(IEntityEquipmentSlot.feet())) { return; }

            if player.getAttribute("generic.attackSpeed").baseValue != 4.0 { player.getAttribute("generic.attackSpeed").baseValue = 4.0; }
});

events.register(function(event3 as crafttweaker.event.PotionEffectExpiryEvent){
    if event3.entityLivingBase.world.isRemote() { return; }
    if isNull(event3.potionEffect) { return; }
    if event3.potionEffect.effectName != "potion.ebwizardry:static_aura" { return; }
    if !event3.entityLivingBase instanceof IPlayer { return; }

    var player as IPlayer = event3.entityLivingBase;

    if !hasCopperArmor(player.getItemInSlot(IEntityEquipmentSlot.head()), player.getItemInSlot(IEntityEquipmentSlot.chest()), player.getItemInSlot(IEntityEquipmentSlot.legs()), player.getItemInSlot(IEntityEquipmentSlot.feet())) { return; }

        if player.getAttribute("generic.attackSpeed").baseValue != 4.0 { player.getAttribute("generic.attackSpeed").baseValue = 4.0; }
});

events.register(function(event4 as crafttweaker.event.EntityLivingDamageEvent){
    if event4.entityLivingBase.world.isRemote() { return; }
    if !event4.entityLivingBase instanceof IPlayer { return; }
    
    var player as IPlayer = event4.entityLivingBase;

    if (!hasCopperArmor(player.getItemInSlot(IEntityEquipmentSlot.head()), player.getItemInSlot(IEntityEquipmentSlot.chest()), player.getItemInSlot(IEntityEquipmentSlot.legs()), player.getItemInSlot(IEntityEquipmentSlot.feet())) || !player.isPotionActive(<potion:ebwizardry:static_aura>)) { return; }

        player.addPotionEffect(<potion:lycanitesmobs:instability>.makePotionEffect(80, 0)); player.sendPlaySoundPacket("minecraft:entity.lightning.thunder", "player", player.position, 4.0, 2.0);
});

events.register(function(event4 as crafttweaker.event.EntityLivingDamageEvent){
    if event4.entityLivingBase.world.isRemote() { return; }
    if event4.entityLivingBase instanceof IPlayer { return; }
    if isNull(event4.damageSource.trueSource) { return; }
    if !event4.damageSource.trueSource instanceof IEntityLivingBase { return; }
    
    var player as IPlayer = event4.damageSource.trueSource;

    if (!hasCopperArmor(player.getItemInSlot(IEntityEquipmentSlot.head()), player.getItemInSlot(IEntityEquipmentSlot.chest()), player.getItemInSlot(IEntityEquipmentSlot.legs()), player.getItemInSlot(IEntityEquipmentSlot.feet())) || !player.isPotionActive(<potion:ebwizardry:static_aura>)) { return; }

        event4.amount *= 0.75;
});
//Copper

//Slime
function hasSlimeArmor(helmet as IItemStack, chestplate as IItemStack, legging as IItemStack, boot as IItemStack) as bool {

    var condition = 0;

        if (<cqrepoured:helmet_slime>.anyDamage().matches(helmet)) { condition += 1; }
        if (<cqrepoured:chestplate_slime>.anyDamage().matches(chestplate)) { condition += 1; }
        if (<cqrepoured:leggings_slime>.anyDamage().matches(legging)) { condition += 1; }
        if (<cqrepoured:boots_slime>.anyDamage().matches(boot)) { condition += 1; }

    if condition == 4 { return true; }

    return false;

    if condition > 0 { condition = 0; }
}

events.register(function(event as crafttweaker.event.LivingKnockBackEvent){
    if event.entityLivingBase.world.isRemote()  { return; }

    var attacker = event.attacker;
    var player as IPlayer = event.entityLivingBase;
    var attackerPlayer as IPlayer = event.attacker;
    var playerAttack = event.attacker instanceof IPlayer;

    if (playerAttack && hasSlimeArmor(attackerPlayer.getItemInSlot(IEntityEquipmentSlot.head()), attackerPlayer.getItemInSlot(IEntityEquipmentSlot.chest()), attackerPlayer.getItemInSlot(IEntityEquipmentSlot.legs()), attackerPlayer.getItemInSlot(IEntityEquipmentSlot.feet()))) {

        if (event.entityLivingBase instanceof IEntityLivingBase) { event.strength *= 0.5; }
    }
    
    if (attacker instanceof IEntityLivingBase || attacker instanceof IEntityArrow) {

        if (event.entityLivingBase instanceof IPlayer && hasSlimeArmor(player.getItemInSlot(IEntityEquipmentSlot.head()), player.getItemInSlot(IEntityEquipmentSlot.chest()), player.getItemInSlot(IEntityEquipmentSlot.legs()), player.getItemInSlot(IEntityEquipmentSlot.feet()))) 
        { event.strength *= 5.0; player.sendPlaySoundPacket("minecraft:block.slime.break", "player", player.position, 5.0, 0.5); }
    } 
});

events.register(function(event as crafttweaker.event.EntityLivingDamageEvent){
if event.entityLivingBase.world.isRemote() { return; }
if isNull(event.damageSource.trueSource) { return; }
if !event.damageSource.trueSource instanceof IEntityLivingBase { return; }
if !event.entityLivingBase instanceof IPlayer { return; }

var player as IPlayer = event.entityLivingBase;

if !hasSlimeArmor(player.getItemInSlot(IEntityEquipmentSlot.head()), player.getItemInSlot(IEntityEquipmentSlot.chest()), player.getItemInSlot(IEntityEquipmentSlot.legs()), player.getItemInSlot(IEntityEquipmentSlot.feet())) { return; }

    player.sendPlaySoundPacket("minecraft:block.slime.break", "player", player.position, 5.0, 0.5);
});
//Slime

//leather
function hasLeatherArmor(helmet as IItemStack, chestplate as IItemStack, legging as IItemStack, boot as IItemStack) as bool {

    var condition = 0;

        if (<minecraft:leather_helmet>.anyDamage().matches(helmet)) { condition += 1; }
        if (<minecraft:leather_chestplate>.anyDamage().matches(chestplate)) { condition += 1; }
        if (<minecraft:leather_leggings>.anyDamage().matches(legging)) { condition += 1; }
        if (<minecraft:leather_boots>.anyDamage().matches(boot)) { condition += 1; }

    if condition == 4 { return true; }

    return false;

    if condition > 0 { condition = 0; }
}

function getItem(type as string) as IItemStack {
    return <item:${type}>;
}

events.register(function(event as crafttweaker.event.EntityLivingDamageEvent){
    if event.entityLivingBase.world.isRemote() { return; }
    if event.amount <= 0 { return; }
    if !event.damageSource.projectile { return; }
    if isNull(event.damageSource.trueSource) { return; }
    if !event.damageSource.trueSource instanceof IPlayer { return; }
    if isNull(event.damageSource.immediateSource) { return; }

    var player as IPlayer = event.damageSource.trueSource;

    if !hasLeatherArmor(player.getItemInSlot(IEntityEquipmentSlot.head()), player.getItemInSlot(IEntityEquipmentSlot.chest()), player.getItemInSlot(IEntityEquipmentSlot.legs()), player.getItemInSlot(IEntityEquipmentSlot.feet())) { return; }
        
        if (player.world.random.nextInt(0, 1) == 1) {
        
            player.sendPlaySoundPacket("minecraft:block.dispenser.launch", "player", player.position, 10.0, 1.2);
            player.give(getItem(event.damageSource.immediateSource.definition.id));

                if event.damageSource.immediateSource.definition.id == "spartanweaponry:bolt_specral" {
                    player.give(<spartanweaponry:bolt_spectral>);
                }
        
        }
});
//leather

//Chainmail
function hasChainArmor(helmet as IItemStack, chestplate as IItemStack, legging as IItemStack, boot as IItemStack) as bool {

    var condition = 0;

        if (<minecraft:chainmail_helmet>.anyDamage().matches(helmet)) { condition += 1; }
        if (<minecraft:chainmail_chestplate>.anyDamage().matches(chestplate)) { condition += 1; }
        if (<minecraft:chainmail_leggings>.anyDamage().matches(legging)) { condition += 1; }
        if (<minecraft:chainmail_boots>.anyDamage().matches(boot)) { condition += 1; }

    if condition == 4 { return true; }

    return false;

    if condition > 0 { condition = 0; }
}

events.register(function(event as crafttweaker.event.EntityLivingDamageEvent){
    if event.entityLivingBase.world.isRemote() { return; }
    if event.amount <= 0 { return; }
    if !event.damageSource.projectile { return; }
    if isNull(event.damageSource.trueSource) { return; }
    if !event.damageSource.trueSource instanceof IPlayer { return; }
    if isNull(event.damageSource.immediateSource) { return; }

    var player as IPlayer = event.damageSource.trueSource;

    if !hasChainArmor(player.getItemInSlot(IEntityEquipmentSlot.head()), player.getItemInSlot(IEntityEquipmentSlot.chest()), player.getItemInSlot(IEntityEquipmentSlot.legs()), player.getItemInSlot(IEntityEquipmentSlot.feet())) { return; }

        event.amount *= 0.8;

        var entity as IEntity = event.entityLivingBase;
        var dist = event.damageSource.trueSource.getDistanceSqToEntity(entity);

        if (dist >= 5 && dist < 10) {
            event.amount *= 1.2;
        }
        if (dist >= 10 && dist < 15) {
            event.amount *= 1.4;
        }
        if (dist >= 15 && dist < 20) {
            event.amount *= 1.6;
        }
        if (dist >= 20 && dist < 25) {
            event.amount *= 1.8;
        }
        if (dist >= 25 && dist < 30) {
            event.amount *= 2.0;
        }
        if (dist >= 30 && dist < 35) {
            event.amount *= 2.2;
        }
        if (dist >= 35 && dist < 40) {
            event.amount *= 2.4;
        }
        if (dist >= 40 && dist < 45) {
            event.amount *= 2.6;
        }
        if (dist >= 45 && dist < 50) {
            event.amount *= 2.8;
        }
        if dist >= 50 {
            event.amount *= 3.0;
        }

        if (dist >= 30) {
            if dist < 50 {
                player.sendPlaySoundPacket("cqrepoured:item.gun.shoot", "player", player.position, 1.0, 2.0);
            } else { player.sendPlaySoundPacket("cqrepoured:item.musket.shoot", "player", player.position, 0.8, 1.5); }
            server.commandManager.executeCommandSilent(server,"give " ~ player.name ~ " " ~ event.damageSource.immediateSource.definition.id);
            if event.damageSource.immediateSource.definition.id == "spartanweaponry:bolt_specral" {
                server.commandManager.executeCommandSilent(server,"give " ~ player.name ~ " spartanweaponry:bolt_spectral");
            }
        }
});
//Chainmail

//Steel
function hasSteelArmor(helmet as IItemStack, chestplate as IItemStack, legging as IItemStack, boot as IItemStack) as bool {

    var condition = 0;

        if (<metallurgy:steel_helmet>.anyDamage().matches(helmet)) { condition += 1; }
        if (<metallurgy:steel_chestplate>.anyDamage().matches(chestplate)) { condition += 1; }
        if (<metallurgy:steel_leggings>.anyDamage().matches(legging)) { condition += 1; }
        if (<metallurgy:steel_boots>.anyDamage().matches(boot)) { condition += 1; }

    if condition == 4 { return true; }

    return false;

    if condition > 0 { condition = 0; }
}

events.register(function(event as crafttweaker.event.CriticalHitEvent){
    if event.player.world.isRemote() { return; }

    var player = event.player;
    var worldObj as IWorld = player.world;

    if !hasSteelArmor(player.getItemInSlot(IEntityEquipmentSlot.head()), player.getItemInSlot(IEntityEquipmentSlot.chest()), player.getItemInSlot(IEntityEquipmentSlot.legs()), player.getItemInSlot(IEntityEquipmentSlot.feet())) { return; }
    if isNull(player.getNBT().ForgeData.jumpCrit) { return; }
    if player.getNBT().ForgeData.jumpCrit != 0 { return; }
    if isNull(player.currentItem) { return; }
    if (!player.currentItem.isDamageable) { return; }
    if player.onGround { return; }
    if player.isInWater { return; }
    if player.isInLava { return; }
    if player.isPotionActive(<potion:lycanitesmobs:fear>) { return; }

    if (player.motionY < 0.2) {
            event.deny();
            worldObj.performExplosion(player, player.x, player.y, player.z, 2, false, false);
            player.currentItem.mutable().damageItem(30, event.player);
    }
});
events.register(function(event1 as crafttweaker.event.EntityLivingDamageEvent){
    if event1.entityLivingBase.world.isRemote() { return; }
    if !event1.entityLivingBase.isPotionActive(<potion:srparasites:rage>) { return; }
	if !event1.entityLivingBase instanceof IPlayer { return; }
    var player as IPlayer = event1.entityLivingBase;
    if !hasSteelArmor(player.getItemInSlot(IEntityEquipmentSlot.head()), player.getItemInSlot(IEntityEquipmentSlot.chest()), player.getItemInSlot(IEntityEquipmentSlot.legs()), player.getItemInSlot(IEntityEquipmentSlot.feet())) { return; }

    event1.amount *= 0.6;
});
//Steel

//Gold && Prometheum
function hasGoldArmor(helmet as IItemStack, chestplate as IItemStack, legging as IItemStack, boot as IItemStack) as bool {

    var condition = 0;

        if (<minecraft:golden_helmet>.anyDamage().matches(helmet)) { condition += 1; }
        if (<minecraft:golden_chestplate>.anyDamage().matches(chestplate)) { condition += 1; }
        if (<minecraft:golden_leggings>.anyDamage().matches(legging)) { condition += 1; }
        if (<minecraft:golden_boots>.anyDamage().matches(boot)) { condition += 1; }

    if condition == 4 { return true; }

    return false;

    if condition > 0 { condition = 0; }
}

function hasPrometheumArmor(helmet as IItemStack, chestplate as IItemStack, legging as IItemStack, boot as IItemStack) as bool {

    var condition = 0;

        if (<metallurgy:prometheum_helmet>.anyDamage().matches(helmet)) { condition += 1; }
        if (<metallurgy:prometheum_chestplate>.anyDamage().matches(chestplate)) { condition += 1; }
        if (<metallurgy:prometheum_leggings>.anyDamage().matches(legging)) { condition += 1; }
        if (<metallurgy:prometheum_boots>.anyDamage().matches(boot)) { condition += 1; }

    if condition == 4 { return true; }

    return false;

    if condition > 0 { condition = 0; }
}

val spellPotions = [
    <potion:ebwizardry:transience>,
    <potion:ebwizardry:fireskin>,
    <potion:ebwizardry:ice_shroud>,
    <potion:ebwizardry:static_aura>,
    <potion:ebwizardry:sixth_sense>,
    <potion:ebwizardry:font_of_mana>,
    <potion:ebwizardry:muffle>,
    <potion:ebwizardry:ward>,
    <potion:ebwizardry:slow_time>,
    <potion:ebwizardry:empowerment>,
    <potion:ebwizardry:frost_step>,
    <potion:ebwizardry:mirage>,
    <potion:ebwizardry:oakflesh>,
    <potion:ebwizardry:ironflesh>,
    <potion:ebwizardry:diamondflesh>
] as IPotion[];

events.register(function(event as crafttweaker.event.EntityLivingJumpEvent){
    if event.entityLivingBase.world.isRemote() { return; }
    if !event.entityLivingBase.isSneaking { return; }

    var player as IPlayer = event.entityLivingBase;
    
    if (hasGoldArmor(player.getItemInSlot(IEntityEquipmentSlot.head()), player.getItemInSlot(IEntityEquipmentSlot.chest()), player.getItemInSlot(IEntityEquipmentSlot.legs()), player.getItemInSlot(IEntityEquipmentSlot.feet()))) {
        for iiii in game.potions {
            if (player.isPotionActive(iiii)) {
                var count = 0;
                

            for eeee in game.potions {
                if (!eeee.badEffect && eeee.name != "dynamicstealth.soulsight") {
                if player.isPotionActive(eeee) {
                    count += 1;
                }}
            }

        if count > 0 { var potionFormula = 100 * count; player.addPotionEffect(<potion:dynamicstealth:soulsight>.makePotionEffect(potionFormula, 0)); player.removePotionEffect(iiii); player.sendPlaySoundPacket("ebwizardry:item.wand.melee", "player", player.position, 1.0, 1.0); }

            if count > 0 { count = 0; }

            }
        }
    }

    if (hasPrometheumArmor(player.getItemInSlot(IEntityEquipmentSlot.head()), player.getItemInSlot(IEntityEquipmentSlot.chest()), player.getItemInSlot(IEntityEquipmentSlot.legs()), player.getItemInSlot(IEntityEquipmentSlot.feet()))) {
        for oooo in game.potions {
            if (player.isPotionActive(oooo)) {
                var count = 0;
                

            for uuuu in game.potions {
                if (!uuuu.badEffect && uuuu.name != "tombstone.potion.ghostly_shape.name") {
                if player.isPotionActive(uuuu) {
                    count += 1;
                }}
            }

        if count > 0 { var potionFormula = 100 * count; player.addPotionEffect(<potion:tombstone:ghostly_shape>.makePotionEffect(potionFormula, 0)); player.removePotionEffect(oooo); player.sendPlaySoundPacket("ebwizardry:item.wand.melee", "player", player.position, 1.0, 1.0); }

            if count > 0 { count = 0; }

            }
        }
    }
});
//Gold && Prometheum

//Living Kill Count
function hasLivingArmor(helmet as IItemStack, chestplate as IItemStack, legging as IItemStack, boot as IItemStack) as bool {

    var condition = 0;

        if (<srparasites:armor_helm>.anyDamage().matches(helmet)) { condition += 1; }
        if (<srparasites:armor_chest>.anyDamage().matches(chestplate)) { condition += 1; }
        if (<srparasites:armor_pants>.anyDamage().matches(legging)) { condition += 1; }
        if (<srparasites:armor_boots>.anyDamage().matches(boot)) { condition += 1; }

    if condition == 4 { return true; }

    return false;

    if condition > 0 { condition = 0; }
}

events.register(function(event as crafttweaker.event.EntityLivingDeathEvent){
if event.entityLivingBase.world.isRemote() { return; }
if isNull(event.damageSource.trueSource) { return; }
if !event.damageSource.trueSource instanceof IPlayer { return; }

var player as IPlayer = event.damageSource.trueSource;

if !hasLivingArmor(player.getItemInSlot(IEntityEquipmentSlot.head()), player.getItemInSlot(IEntityEquipmentSlot.chest()), player.getItemInSlot(IEntityEquipmentSlot.legs()), player.getItemInSlot(IEntityEquipmentSlot.feet())) { return; }
if event.entityLivingBase instanceof IEntityAnimal { return; }
if isNull(event.entityLivingBase.definition) { return; }
if event.entityLivingBase.definition.id == "lycanitesmobs:silex" { return; }
if event.entityLivingBase instanceof IPlayer { return; }
    
    if event.damageSource.magicDamage { 

            val magic_kills as IData = {
                magic_kills: 0
            };
        if (isNull(player.getItemInSlot(IEntityEquipmentSlot.head()).tag.magic_kills)) {
            player.getItemInSlot(IEntityEquipmentSlot.head()).mutable().updateTag(magic_kills);
        }
        if (isNull(player.getItemInSlot(IEntityEquipmentSlot.chest()).tag.magic_kills)) {
            player.getItemInSlot(IEntityEquipmentSlot.chest()).mutable().updateTag(magic_kills);
        }
        if (isNull(player.getItemInSlot(IEntityEquipmentSlot.legs()).tag.magic_kills)) {
            player.getItemInSlot(IEntityEquipmentSlot.legs()).mutable().updateTag(magic_kills);
        }
        if (isNull(player.getItemInSlot(IEntityEquipmentSlot.feet()).tag.magic_kills)) {
            player.getItemInSlot(IEntityEquipmentSlot.feet()).mutable().updateTag(magic_kills);
        }

            if player.getItemInSlot(IEntityEquipmentSlot.head()).tag.magic_kills < 100 {
                val newValue = player.getItemInSlot(IEntityEquipmentSlot.head()).tag.magic_kills + 1;
                player.getItemInSlot(IEntityEquipmentSlot.head()).mutable().updateTag({magic_kills: newValue});
                player.getItemInSlot(IEntityEquipmentSlot.head()).mutable().updateTag({display:{Lore:["§6Magic Kills: " ~ player.getItemInSlot(IEntityEquipmentSlot.head()).tag.magic_kills]}});
            }
            if player.getItemInSlot(IEntityEquipmentSlot.chest()).tag.magic_kills < 100 {
                val newValue = player.getItemInSlot(IEntityEquipmentSlot.chest()).tag.magic_kills + 1;
                player.getItemInSlot(IEntityEquipmentSlot.chest()).mutable().updateTag({magic_kills: newValue});
                player.getItemInSlot(IEntityEquipmentSlot.chest()).mutable().updateTag({display:{Lore:["§6Magic Kills: " ~ player.getItemInSlot(IEntityEquipmentSlot.chest()).tag.magic_kills]}});
            }
            if player.getItemInSlot(IEntityEquipmentSlot.legs()).tag.magic_kills < 100 {
                val newValue = player.getItemInSlot(IEntityEquipmentSlot.legs()).tag.magic_kills + 1;
                player.getItemInSlot(IEntityEquipmentSlot.legs()).mutable().updateTag({magic_kills: newValue});
                player.getItemInSlot(IEntityEquipmentSlot.legs()).mutable().updateTag({display:{Lore:["§6Magic Kills: " ~ player.getItemInSlot(IEntityEquipmentSlot.legs()).tag.magic_kills]}});
            }
            if player.getItemInSlot(IEntityEquipmentSlot.feet()).tag.magic_kills < 100 {
                val newValue = player.getItemInSlot(IEntityEquipmentSlot.feet()).tag.magic_kills + 1;
                player.getItemInSlot(IEntityEquipmentSlot.feet()).mutable().updateTag({magic_kills: newValue});
                player.getItemInSlot(IEntityEquipmentSlot.feet()).mutable().updateTag({display:{Lore:["§6Magic Kills: " ~ player.getItemInSlot(IEntityEquipmentSlot.feet()).tag.magic_kills]}});
            }
 
	}
    if (event.damageSource.projectile && !event.damageSource.magicDamage) { 

            val ranged_kills as IData = {
                ranged_kills: 0
            };
        if (isNull(player.getItemInSlot(IEntityEquipmentSlot.head()).tag.ranged_kills)) {
            player.getItemInSlot(IEntityEquipmentSlot.head()).mutable().updateTag(ranged_kills);
        }
        if (isNull(player.getItemInSlot(IEntityEquipmentSlot.chest()).tag.ranged_kills)) {
            player.getItemInSlot(IEntityEquipmentSlot.chest()).mutable().updateTag(ranged_kills);
        }
        if (isNull(player.getItemInSlot(IEntityEquipmentSlot.legs()).tag.ranged_kills)) {
            player.getItemInSlot(IEntityEquipmentSlot.legs()).mutable().updateTag(ranged_kills);
        }
        if (isNull(player.getItemInSlot(IEntityEquipmentSlot.feet()).tag.ranged_kills)) {
            player.getItemInSlot(IEntityEquipmentSlot.feet()).mutable().updateTag(ranged_kills);
        }

            if player.getItemInSlot(IEntityEquipmentSlot.head()).tag.ranged_kills < 100 {
                val newValue = player.getItemInSlot(IEntityEquipmentSlot.head()).tag.ranged_kills + 1;
                player.getItemInSlot(IEntityEquipmentSlot.head()).mutable().updateTag({ranged_kills: newValue});
                player.getItemInSlot(IEntityEquipmentSlot.head()).mutable().updateTag({display:{Lore:["§3Ranged Kills: " ~ player.getItemInSlot(IEntityEquipmentSlot.head()).tag.ranged_kills]}});
            }
            if player.getItemInSlot(IEntityEquipmentSlot.chest()).tag.ranged_kills < 100 {
                val newValue = player.getItemInSlot(IEntityEquipmentSlot.chest()).tag.ranged_kills + 1;
                player.getItemInSlot(IEntityEquipmentSlot.chest()).mutable().updateTag({ranged_kills: newValue});
                player.getItemInSlot(IEntityEquipmentSlot.chest()).mutable().updateTag({display:{Lore:["§3Ranged Kills: " ~ player.getItemInSlot(IEntityEquipmentSlot.chest()).tag.ranged_kills]}});
            }
            if player.getItemInSlot(IEntityEquipmentSlot.legs()).tag.ranged_kills < 100 {
                val newValue = player.getItemInSlot(IEntityEquipmentSlot.legs()).tag.ranged_kills + 1;
                player.getItemInSlot(IEntityEquipmentSlot.legs()).mutable().updateTag({ranged_kills: newValue});
                player.getItemInSlot(IEntityEquipmentSlot.legs()).mutable().updateTag({display:{Lore:["§3Ranged Kills: " ~ player.getItemInSlot(IEntityEquipmentSlot.legs()).tag.ranged_kills]}});
            }
            if player.getItemInSlot(IEntityEquipmentSlot.feet()).tag.ranged_kills < 100 {
                val newValue = player.getItemInSlot(IEntityEquipmentSlot.feet()).tag.ranged_kills + 1;
                player.getItemInSlot(IEntityEquipmentSlot.feet()).mutable().updateTag({ranged_kills: newValue});
                player.getItemInSlot(IEntityEquipmentSlot.feet()).mutable().updateTag({display:{Lore:["§3Ranged Kills: " ~ player.getItemInSlot(IEntityEquipmentSlot.feet()).tag.ranged_kills]}});
            }
 
	}
    if (event.damageSource.immediateSource instanceof IPlayer && !event.damageSource.magicDamage) { 

            val melee_kills as IData = {
                melee_kills: 0
            };
        if (isNull(player.getItemInSlot(IEntityEquipmentSlot.head()).tag.melee_kills)) {
            player.getItemInSlot(IEntityEquipmentSlot.head()).mutable().updateTag(melee_kills);
        }
        if (isNull(player.getItemInSlot(IEntityEquipmentSlot.chest()).tag.melee_kills)) {
            player.getItemInSlot(IEntityEquipmentSlot.chest()).mutable().updateTag(melee_kills);
        }
        if (isNull(player.getItemInSlot(IEntityEquipmentSlot.legs()).tag.melee_kills)) {
            player.getItemInSlot(IEntityEquipmentSlot.legs()).mutable().updateTag(melee_kills);
        }
        if (isNull(player.getItemInSlot(IEntityEquipmentSlot.feet()).tag.melee_kills)) {
            player.getItemInSlot(IEntityEquipmentSlot.feet()).mutable().updateTag(melee_kills);
        }

            if player.getItemInSlot(IEntityEquipmentSlot.head()).tag.melee_kills < 100 {
                val newValue = player.getItemInSlot(IEntityEquipmentSlot.head()).tag.melee_kills + 1;
                player.getItemInSlot(IEntityEquipmentSlot.head()).mutable().updateTag({melee_kills: newValue});
                player.getItemInSlot(IEntityEquipmentSlot.head()).mutable().updateTag({display:{Lore:["§cMelee Kills: " ~ player.getItemInSlot(IEntityEquipmentSlot.head()).tag.melee_kills]}});
            }
            if player.getItemInSlot(IEntityEquipmentSlot.chest()).tag.melee_kills < 100 {
                val newValue = player.getItemInSlot(IEntityEquipmentSlot.chest()).tag.melee_kills + 1;
                player.getItemInSlot(IEntityEquipmentSlot.chest()).mutable().updateTag({melee_kills: newValue});
                player.getItemInSlot(IEntityEquipmentSlot.chest()).mutable().updateTag({display:{Lore:["§cMelee Kills: " ~ player.getItemInSlot(IEntityEquipmentSlot.chest()).tag.melee_kills]}});
            }
            if player.getItemInSlot(IEntityEquipmentSlot.legs()).tag.melee_kills < 100 {
                val newValue = player.getItemInSlot(IEntityEquipmentSlot.legs()).tag.melee_kills + 1;
                player.getItemInSlot(IEntityEquipmentSlot.legs()).mutable().updateTag({melee_kills: newValue});
                player.getItemInSlot(IEntityEquipmentSlot.legs()).mutable().updateTag({display:{Lore:["§cMelee Kills: " ~ player.getItemInSlot(IEntityEquipmentSlot.legs()).tag.melee_kills]}});
            }
            if player.getItemInSlot(IEntityEquipmentSlot.feet()).tag.melee_kills < 100 {
                val newValue = player.getItemInSlot(IEntityEquipmentSlot.feet()).tag.melee_kills + 1;
                player.getItemInSlot(IEntityEquipmentSlot.feet()).mutable().updateTag({melee_kills: newValue});
                player.getItemInSlot(IEntityEquipmentSlot.feet()).mutable().updateTag({display:{Lore:["§cMelee Kills: " ~ player.getItemInSlot(IEntityEquipmentSlot.feet()).tag.melee_kills]}});
            }
 
	}
});
//Living Kill Count