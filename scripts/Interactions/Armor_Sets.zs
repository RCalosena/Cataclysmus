#reloadable
#priority 99

import crafttweaker.player.IPlayer;
import crafttweaker.entity.IEntityLivingBase;
import crafttweaker.item.IItemStack;
import crafttweaker.entity.IEntity;
import crafttweaker.event.PlayerTickEvent;
import crafttweaker.entity.IEntityEquipmentSlot;
import crafttweaker.event.EntityLivingAttackedEvent;
import crafttweaker.entity.IEntityArrow;
import crafttweaker.potions.IPotion;
import crafttweaker.world.IWorld;
import crafttweaker.data.IData;
import crafttweaker.entity.IEntityAnimal;
import scripts.classes.wildcards;
import crafttweaker.util.Math;
import native.com.elenai.elenaidodge2.api.DodgeEvent;
import mods.zenutils.EventPriority;
import native.net.minecraft.entity.EntityLiving;
import native.net.minecraft.entity.player.EntityPlayer;
import native.net.minecraft.util.math.MathHelper;
import native.com.elenai.elenaidodge2.util.Utils;
import crafttweaker.damage.IDamageSource;

//Nether Armor Bonus
function hasNetherArmor(helmet as IItemStack, chestplate as IItemStack, legging as IItemStack, boot as IItemStack) as bool {

    var condition = 0;

    val Helmets = [
        <metallurgy:oureclase_helmet>,
        <metallurgy:desichalkos_helmet>,
        <metallurgy:vulcanite_helmet>,
        <metallurgy:electrum_helmet>,
        <metallurgy:ignatius_helmet>,
        <metallurgy:midasium_helmet>,
        <metallurgy:kalendrite_helmet>,
        <metallurgy:carmot_helmet>,
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
        <mysticalworld:beetle_mask>
    ] as IItemStack[];

    val Chestplates = [
        <metallurgy:oureclase_chestplate>,
        <metallurgy:desichalkos_chestplate>,
        <metallurgy:vulcanite_chestplate>,
        <metallurgy:electrum_chestplate>,
        <metallurgy:ignatius_chestplate>,
        <metallurgy:midasium_chestplate>,
        <metallurgy:kalendrite_chestplate>,
        <metallurgy:carmot_chestplate>,
        <minecraft:elytra>,
        <erebus:glider_chestplate>,
        <erebus:glider_chestplate_powered>,
    ] as IItemStack[];

    val Leggings = [
        <metallurgy:oureclase_leggings>,
        <metallurgy:desichalkos_leggings>,
        <metallurgy:vulcanite_leggings>,
        <metallurgy:electrum_leggings>,
        <metallurgy:ignatius_leggings>,
        <metallurgy:midasium_leggings>,
        <metallurgy:kalendrite_leggings>,
        <metallurgy:carmot_leggings>,
        <erebus:sprint_leggings>,
    ] as IItemStack[];

    val Boots = [
        <metallurgy:oureclase_boots>,
        <metallurgy:desichalkos_boots>,
        <metallurgy:vulcanite_boots>,
        <metallurgy:electrum_boots>,
        <metallurgy:ignatius_boots>,
        <metallurgy:midasium_boots>,
        <metallurgy:kalendrite_boots>,
        <metallurgy:carmot_boots>,
        <erebus:jump_boots>,
        <erebus:water_striders>,
        <cqrepoured:boots_cloud>
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

events.register(function(event as crafttweaker.event.EntityLivingHurtEvent){
    if event.entityLivingBase.world.isRemote() { return; }
    if event.entityLivingBase instanceof IPlayer { return; }
    if isNull(event.damageSource.trueSource) { return; }
    if !event.damageSource.trueSource instanceof IPlayer { return; }
    if isNull(event.entityLivingBase.definition) { return; }
    
    if (event.entityLivingBase.definition.id == "lycanitesmobs:behemoth" || event.entityLivingBase.definition.id == "lycanitesmobs:belph") {

        var player as IPlayer = event.damageSource.trueSource;
        var helmet as IItemStack = player.getItemInSlot(IEntityEquipmentSlot.head());
        var chestplate as IItemStack = player.getItemInSlot(IEntityEquipmentSlot.chest());
        var leggings as IItemStack = player.getItemInSlot(IEntityEquipmentSlot.legs());
        var boots as IItemStack = player.getItemInSlot(IEntityEquipmentSlot.feet());

        if (hasNetherArmor(helmet, chestplate, leggings, boots) && wildcards.isWithinLimit(player)) {
            //multiplies damage for the listed enemies
            event.amount *= 2.0; 
        }
    }
}); 
//Nether Armor Bonus

//Copper
function hasCopperArmor(helmet as IItemStack, chestplate as IItemStack, legging as IItemStack, boot as IItemStack) as bool {

    var condition = 0;

        if (<mysticalworld:copper_helmet>.anyDamage().matches(helmet)) { condition += 1; }
        if (<mysticalworld:copper_chestplate>.anyDamage().matches(chestplate)) { condition += 1; }
        if (<mysticalworld:copper_leggings>.anyDamage().matches(legging)) { condition += 1; }
        if (<mysticalworld:copper_boots>.anyDamage().matches(boot)) { condition += 1; }

    for wildcard in wildcards.getWildcards() {
        if (wildcard.anyDamage().matches(helmet)) { condition += 1; }
        if (wildcard.anyDamage().matches(chestplate)) { condition += 1; }
        if (wildcard.anyDamage().matches(legging)) { condition += 1; }
        if (wildcard.anyDamage().matches(boot)) { condition += 1; }
    }

    if condition >= 4 { return true; }

    return false;
}

events.register(function(event as crafttweaker.event.CriticalHitEvent){
    if event.player.world.isRemote() { return; }

    var player = event.player;
    var helmet as IItemStack = player.getItemInSlot(IEntityEquipmentSlot.head());
    var chestplate as IItemStack = player.getItemInSlot(IEntityEquipmentSlot.chest());
    var leggings as IItemStack = player.getItemInSlot(IEntityEquipmentSlot.legs());
    var boots as IItemStack = player.getItemInSlot(IEntityEquipmentSlot.feet());

    if (!hasCopperArmor(helmet, chestplate, leggings, boots) || !wildcards.isWithinLimit(player)) { return; }

    if (isNull(player.getNBT().ForgeData.critCopperCounter)) {
		player.setNBT({critCopperCounter: 0});
	}

	if (((player.isBaubleEquipped(<bountifulbaubles:trinketballoon>) != -1 && !player.onGround && !player.isInWater && !player.isInLava && !player.isPotionActive(<potion:lycanitesmobs:fear>)) || !isNull(player.getNBT().ForgeData.FromDodge) && player.getNBT().ForgeData.FromDodge == 1) && player.motionY < 0.2) {
 
		if (player.getNBT().ForgeData.critCopperCounter as int < 3) {
 
			player.setNBT({critCopperCounter: player.getNBT().ForgeData.critCopperCounter as int + 1});

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
    var helmet as IItemStack = player.getItemInSlot(IEntityEquipmentSlot.head());
    var chestplate as IItemStack = player.getItemInSlot(IEntityEquipmentSlot.chest());
    var leggings as IItemStack = player.getItemInSlot(IEntityEquipmentSlot.legs());
    var boots as IItemStack = player.getItemInSlot(IEntityEquipmentSlot.feet());
    
    if (!hasCopperArmor(helmet, chestplate, leggings, boots) || !wildcards.isWithinLimit(player)) { return; }
        if (player.getAttribute("generic.attackSpeed").baseValue == 4.0) { player.getAttribute("generic.attackSpeed").baseValue *= 1.5; }
});

events.register(function(event2 as crafttweaker.event.PotionEffectRemoveEvent){
    if event2.entityLivingBase.world.isRemote() { return; }
    if isNull(event2.potionEffect) { return; }
    if event2.potionEffect.effectName != "potion.ebwizardry:static_aura" { return; }
    if !event2.entityLivingBase instanceof IPlayer { return; }

    var player as IPlayer = event2.entityLivingBase;
    var helmet as IItemStack = player.getItemInSlot(IEntityEquipmentSlot.head());
    var chestplate as IItemStack = player.getItemInSlot(IEntityEquipmentSlot.chest());
    var leggings as IItemStack = player.getItemInSlot(IEntityEquipmentSlot.legs());
    var boots as IItemStack = player.getItemInSlot(IEntityEquipmentSlot.feet());

    if (!hasCopperArmor(helmet, chestplate, leggings, boots) || !wildcards.isWithinLimit(player)) { return; }

            if player.getAttribute("generic.attackSpeed").baseValue != 4.0 { player.getAttribute("generic.attackSpeed").baseValue = 4.0; }
});

events.register(function(event3 as crafttweaker.event.PotionEffectExpiryEvent){
    if event3.entityLivingBase.world.isRemote() { return; }
    if isNull(event3.potionEffect) { return; }
    if event3.potionEffect.effectName != "potion.ebwizardry:static_aura" { return; }
    if !event3.entityLivingBase instanceof IPlayer { return; }

    var player as IPlayer = event3.entityLivingBase;
    var helmet as IItemStack = player.getItemInSlot(IEntityEquipmentSlot.head());
    var chestplate as IItemStack = player.getItemInSlot(IEntityEquipmentSlot.chest());
    var leggings as IItemStack = player.getItemInSlot(IEntityEquipmentSlot.legs());
    var boots as IItemStack = player.getItemInSlot(IEntityEquipmentSlot.feet());

    if (!hasCopperArmor(helmet, chestplate, leggings, boots) || !wildcards.isWithinLimit(player)) { return; }

        if player.getAttribute("generic.attackSpeed").baseValue != 4.0 { player.getAttribute("generic.attackSpeed").baseValue = 4.0; }
});

events.register(function(event4 as crafttweaker.event.EntityLivingDamageEvent){
    if event4.entityLivingBase.world.isRemote() { return; }
    if !event4.entityLivingBase instanceof IPlayer { return; }
    
    var player as IPlayer = event4.entityLivingBase;
    var helmet as IItemStack = player.getItemInSlot(IEntityEquipmentSlot.head());
    var chestplate as IItemStack = player.getItemInSlot(IEntityEquipmentSlot.chest());
    var leggings as IItemStack = player.getItemInSlot(IEntityEquipmentSlot.legs());
    var boots as IItemStack = player.getItemInSlot(IEntityEquipmentSlot.feet());

    if (!hasCopperArmor(helmet, chestplate, leggings, boots) || !wildcards.isWithinLimit(player) || !player.isPotionActive(<potion:ebwizardry:static_aura>)) { return; }

        player.addPotionEffect(<potion:lycanitesmobs:instability>.makePotionEffect(80, 0)); player.sendPlaySoundPacket("minecraft:entity.lightning.thunder", "player", player.position, 3.0, 2.0);
});

events.register(function(event4 as crafttweaker.event.EntityLivingDamageEvent){
    if event4.entityLivingBase.world.isRemote() { return; }
    if event4.entityLivingBase instanceof IPlayer { return; }
    if isNull(event4.damageSource.trueSource) { return; }
    if !event4.damageSource.trueSource instanceof IEntityLivingBase { return; }
    
    var player as IPlayer = event4.damageSource.trueSource;
    var helmet as IItemStack = player.getItemInSlot(IEntityEquipmentSlot.head());
    var chestplate as IItemStack = player.getItemInSlot(IEntityEquipmentSlot.chest());
    var leggings as IItemStack = player.getItemInSlot(IEntityEquipmentSlot.legs());
    var boots as IItemStack = player.getItemInSlot(IEntityEquipmentSlot.feet());

    if (!hasCopperArmor(helmet, chestplate, leggings, boots) || !wildcards.isWithinLimit(player) || !player.isPotionActive(<potion:ebwizardry:static_aura>)) { return; }

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
    
    for wildcard in wildcards.getWildcards() {
        if (wildcard.anyDamage().matches(helmet)) { condition += 1; }
        if (wildcard.anyDamage().matches(chestplate)) { condition += 1; }
        if (wildcard.anyDamage().matches(legging)) { condition += 1; }
        if (wildcard.anyDamage().matches(boot)) { condition += 1; }
    }

    if condition >= 4 { return true; }

    return false;
}

//decrease player knockback
//increase entity knockback
events.onLivingKnockBack(function(event as crafttweaker.event.LivingKnockBackEvent){
    if event.entityLivingBase.world.isRemote()  { return; }

    var player as IPlayer = event.entityLivingBase;
    var helmet as IItemStack = player.getItemInSlot(IEntityEquipmentSlot.head());
    var chestplate as IItemStack = player.getItemInSlot(IEntityEquipmentSlot.chest());
    var leggings as IItemStack = player.getItemInSlot(IEntityEquipmentSlot.legs());
    var boots as IItemStack = player.getItemInSlot(IEntityEquipmentSlot.feet());

    var attacker = event.attacker;

    var playerAttack = event.attacker instanceof IPlayer;

    if (playerAttack) {
        var attackerPlayer as IPlayer = attacker;
        var helmetA as IItemStack = attackerPlayer.getItemInSlot(IEntityEquipmentSlot.head());
        var chestplateA as IItemStack = attackerPlayer.getItemInSlot(IEntityEquipmentSlot.chest());
        var leggingsA as IItemStack = attackerPlayer.getItemInSlot(IEntityEquipmentSlot.legs());
        var bootsA as IItemStack = attackerPlayer.getItemInSlot(IEntityEquipmentSlot.feet());
        if (hasSlimeArmor(helmetA, chestplateA, leggingsA, bootsA) && wildcards.isWithinLimit(attackerPlayer)) {
            if (event.entityLivingBase instanceof IEntityLivingBase) { event.strength *= 0.5; }
        }
    }
    
    if (attacker instanceof IEntityLivingBase || attacker instanceof IEntityArrow) {

        if (event.entityLivingBase instanceof IPlayer && hasSlimeArmor(helmet, chestplate, leggings, boots) && wildcards.isWithinLimit(player)) 
        { event.strength *= 5.0; player.sendPlaySoundPacket("minecraft:block.slime.break", "player", player.position, 5.0, 0.5); }
    } 
});
//Slime

//leather
function hasLeatherArmor(helmet as IItemStack, chestplate as IItemStack, legging as IItemStack, boot as IItemStack) as bool {

    var condition = 0;

    if (<minecraft:leather_helmet>.anyDamage().matches(helmet)) { condition += 1; }
    if (<minecraft:leather_chestplate>.anyDamage().matches(chestplate)) { condition += 1; }
    if (<minecraft:leather_leggings>.anyDamage().matches(legging)) { condition += 1; }
    if (<minecraft:leather_boots>.anyDamage().matches(boot)) { condition += 1; }
    
    for wildcard in wildcards.getWildcards() {
        if wildcard.anyDamage().matches(helmet) { condition += 1; }
        if wildcard.anyDamage().matches(chestplate) { condition += 1; }
        if wildcard.anyDamage().matches(legging) { condition += 1; }
        if wildcard.anyDamage().matches(boot) { condition += 1; }
    }

    if condition == 4 { return true; }

    return false;
}

function getItem(type as string) as IItemStack {
    return <item:${type}>;
}

//add chance of returning the arrow (affected by luck)
events.register(function(event as crafttweaker.event.EntityLivingDamageEvent){
    if event.entityLivingBase.world.isRemote() { return; }
    if event.amount <= 0 { return; }
    if !event.damageSource.projectile { return; }
    if isNull(event.damageSource.trueSource) { return; }
    if !event.damageSource.trueSource instanceof IPlayer { return; }
    if isNull(event.damageSource.immediateSource) { return; }

    var player as IPlayer = event.damageSource.trueSource;
    var helmet as IItemStack = player.getItemInSlot(IEntityEquipmentSlot.head());
    var chestplate as IItemStack = player.getItemInSlot(IEntityEquipmentSlot.chest());
    var leggings as IItemStack = player.getItemInSlot(IEntityEquipmentSlot.legs());
    var boots as IItemStack = player.getItemInSlot(IEntityEquipmentSlot.feet());

    if (!hasLeatherArmor(helmet, chestplate, leggings, boots) || !wildcards.isWithinLimit(player)) { return; }
        
        var luckModifier = (player.getAttribute("generic.luck").getAttributeValue() * 0.1) as float;
        var totalChance = (0.5 + luckModifier) as float;

        if (player.world.random.nextFloat() <= totalChance) {
        
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
    
    for wildcard in wildcards.getWildcards() {
        if wildcard.anyDamage().matches(helmet) { condition += 1; }
        if wildcard.anyDamage().matches(chestplate) { condition += 1; }
        if wildcard.anyDamage().matches(legging) { condition += 1; }
        if wildcard.anyDamage().matches(boot) { condition += 1; }
    }

    if condition == 4 { return true; }

    return false;
}

//increase damage based on distance from the victim
events.register(function(event as crafttweaker.event.EntityLivingDamageEvent){
    if event.entityLivingBase.world.isRemote() { return; }
    if event.amount <= 0 { return; }
    if !event.damageSource.projectile { return; }
    if isNull(event.damageSource.trueSource) { return; }
    if !event.damageSource.trueSource instanceof IPlayer { return; }
    if isNull(event.damageSource.immediateSource) { return; }

    var player as IPlayer = event.damageSource.trueSource;
    var helmet as IItemStack = player.getItemInSlot(IEntityEquipmentSlot.head());
    var chestplate as IItemStack = player.getItemInSlot(IEntityEquipmentSlot.chest());
    var leggings as IItemStack = player.getItemInSlot(IEntityEquipmentSlot.legs());
    var boots as IItemStack = player.getItemInSlot(IEntityEquipmentSlot.feet());

    if (!hasChainArmor(helmet, chestplate, leggings, boots) || !wildcards.isWithinLimit(player)) { return; }

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
    
    for wildcard in wildcards.getWildcards() {
        if wildcard.anyDamage().matches(helmet) { condition += 1; }
        if wildcard.anyDamage().matches(chestplate) { condition += 1; }
        if wildcard.anyDamage().matches(legging) { condition += 1; }
        if wildcard.anyDamage().matches(boot) { condition += 1; }
    }

    if condition == 4 { return true; }

    return false;
}

events.register(function(event as crafttweaker.event.CriticalHitEvent){
    if event.player.world.isRemote() { return; }

    var player = event.player;
    var helmet as IItemStack = player.getItemInSlot(IEntityEquipmentSlot.head());
    var chestplate as IItemStack = player.getItemInSlot(IEntityEquipmentSlot.chest());
    var leggings as IItemStack = player.getItemInSlot(IEntityEquipmentSlot.legs());
    var boots as IItemStack = player.getItemInSlot(IEntityEquipmentSlot.feet());
    var worldObj as IWorld = player.world;

    if (!hasSteelArmor(helmet, chestplate, leggings, boots) || !wildcards.isWithinLimit(player)) { return; }
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
    var helmet as IItemStack = player.getItemInSlot(IEntityEquipmentSlot.head());
    var chestplate as IItemStack = player.getItemInSlot(IEntityEquipmentSlot.chest());
    var leggings as IItemStack = player.getItemInSlot(IEntityEquipmentSlot.legs());
    var boots as IItemStack = player.getItemInSlot(IEntityEquipmentSlot.feet());

    if (!hasSteelArmor(helmet, chestplate, leggings, boots) || !wildcards.isWithinLimit(player)) { return; }

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
    
    for wildcard in wildcards.getWildcards() {
        if wildcard.anyDamage().matches(helmet) { condition += 1; }
        if wildcard.anyDamage().matches(chestplate) { condition += 1; }
        if wildcard.anyDamage().matches(legging) { condition += 1; }
        if wildcard.anyDamage().matches(boot) { condition += 1; }
    }

    if condition == 4 { return true; }

    return false;
}

function hasPrometheumArmor(helmet as IItemStack, chestplate as IItemStack, legging as IItemStack, boot as IItemStack) as bool {

    var condition = 0;

    if (<metallurgy:prometheum_helmet>.anyDamage().matches(helmet)) { condition += 1; }
    if (<metallurgy:prometheum_chestplate>.anyDamage().matches(chestplate)) { condition += 1; }
    if (<metallurgy:prometheum_leggings>.anyDamage().matches(legging)) { condition += 1; }
    if (<metallurgy:prometheum_boots>.anyDamage().matches(boot)) { condition += 1; }
    
    for wildcard in wildcards.getWildcards() {
        if wildcard.anyDamage().matches(helmet) { condition += 1; }
        if wildcard.anyDamage().matches(chestplate) { condition += 1; }
        if wildcard.anyDamage().matches(legging) { condition += 1; }
        if wildcard.anyDamage().matches(boot) { condition += 1; }
    }

    if condition == 4 { return true; }

    return false;
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
    var helmet as IItemStack = player.getItemInSlot(IEntityEquipmentSlot.head());
    var chestplate as IItemStack = player.getItemInSlot(IEntityEquipmentSlot.chest());
    var leggings as IItemStack = player.getItemInSlot(IEntityEquipmentSlot.legs());
    var boots as IItemStack = player.getItemInSlot(IEntityEquipmentSlot.feet());
    
    if (hasGoldArmor(helmet, chestplate, leggings, boots) && wildcards.isWithinLimit(player)) {
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

    if (hasPrometheumArmor(helmet, chestplate, leggings, boots) && wildcards.isWithinLimit(player)) {
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

    for wildcard in wildcards.getWildcards() {
        if wildcard.anyDamage().matches(helmet) { condition += 1; }
        if wildcard.anyDamage().matches(chestplate) { condition += 1; }
        if wildcard.anyDamage().matches(legging) { condition += 1; }
        if wildcard.anyDamage().matches(boot) { condition += 1; }
    }

    if condition == 4 { return true; }

    return false;
}

events.register(function(event as crafttweaker.event.EntityLivingDeathEvent){
if event.entityLivingBase.world.isRemote() { return; }
if isNull(event.damageSource.trueSource) { return; }
if !event.damageSource.trueSource instanceof IPlayer { return; }

var player as IPlayer = event.damageSource.trueSource;
var helmet as IItemStack = player.getItemInSlot(IEntityEquipmentSlot.head());
var chestplate as IItemStack = player.getItemInSlot(IEntityEquipmentSlot.chest());
var leggings as IItemStack = player.getItemInSlot(IEntityEquipmentSlot.legs());
var boots as IItemStack = player.getItemInSlot(IEntityEquipmentSlot.feet());

if (!hasLivingArmor(helmet, chestplate, leggings, boots) || !wildcards.isWithinLimit(player)) { return; }
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

//Wildcard reworks

//Archaeologist Hat
events.register(function(event as crafttweaker.event.BlockHarvestDropsEvent){
    if event.world.isRemote() { return; }
    if event.silkTouch return;

    var bDef = event.block.definition;

    if !event.isPlayer return;
    if isNull(event.player.getItemInSlot(IEntityEquipmentSlot.head())) return;
    if !<quark:archaeologist_hat>.anyDamage().matches(event.player.getItemInSlot(IEntityEquipmentSlot.head())) { return; }

    //giant fckin list of ores that have dust counterparts (couldn't figure out another way of coding this)
    for copper in <ore:oreCopper>.items {
        if (bDef.id == copper.asBlock().definition.id && event.fortuneLevel < 1) { event.drops = [<metallurgy:copper_dust>.weight(1.0), <metallurgy:copper_dust>.weight(0.5)]; }
        if (bDef.id == copper.asBlock().definition.id && event.fortuneLevel >= 1) { event.drops = [<metallurgy:copper_dust> * (1 + event.fortuneLevel)]; }
    }
    for manganese in <ore:oreManganese>.items {
        if (bDef.id == manganese.asBlock().definition.id && event.fortuneLevel < 1) { event.drops = [<metallurgy:manganese_dust>.weight(1.0), <metallurgy:manganese_dust>.weight(0.5)]; }
        if (bDef.id == manganese.asBlock().definition.id && event.fortuneLevel >= 1) { event.drops = [<metallurgy:manganese_dust> * (1 + event.fortuneLevel)]; }
    }
    for tin in <ore:oreTin>.items {
        if (bDef.id == tin.asBlock().definition.id && event.fortuneLevel < 1) { event.drops = [<metallurgy:tin_dust>.weight(1.0), <metallurgy:tin_dust>.weight(0.5)]; }
        if (bDef.id == tin.asBlock().definition.id && event.fortuneLevel >= 1) { event.drops = [<metallurgy:tin_dust> * (1 + event.fortuneLevel)]; }
    }
    for iron in <ore:oreIron>.items {
        if (bDef.id == iron.asBlock().definition.id && event.fortuneLevel < 1) { event.drops = [<metallurgy:iron_dust>.weight(1.0), <metallurgy:iron_dust>.weight(0.5)]; }
        if (bDef.id == iron.asBlock().definition.id && event.fortuneLevel >= 1) { event.drops = [<metallurgy:iron_dust> * (1 + event.fortuneLevel)]; }
    }
    for infuscolium in <ore:oreInfuscolium>.items {
        if (bDef.id == infuscolium.asBlock().definition.id && event.fortuneLevel < 1) { event.drops = [<metallurgy:infuscolium_dust>.weight(1.0), <metallurgy:infuscolium_dust>.weight(0.5)]; }
        if (bDef.id == infuscolium.asBlock().definition.id && event.fortuneLevel >= 1) { event.drops = [<metallurgy:infuscolium_dust> * (1 + event.fortuneLevel)]; }
    }
    for gold in <ore:oreGold>.items {
        if (bDef.id == gold.asBlock().definition.id && event.fortuneLevel < 1) { event.drops = [<metallurgy:gold_dust>.weight(1.0), <metallurgy:gold_dust>.weight(0.5)]; }
        if (bDef.id == gold.asBlock().definition.id && event.fortuneLevel >= 1) { event.drops = [<metallurgy:gold_dust> * (1 + event.fortuneLevel)]; }
    }
    for orichalcum in <ore:oreOrichalcum>.items {
        if (bDef.id == orichalcum.asBlock().definition.id && event.fortuneLevel < 1) { event.drops = [<metallurgy:orichalcum_dust>.weight(1.0), <metallurgy:orichalcum_dust>.weight(0.5)]; }
        if (bDef.id == orichalcum.asBlock().definition.id && event.fortuneLevel >= 1) { event.drops = [<metallurgy:orichalcum_dust> * (1 + event.fortuneLevel)]; }
    }
    for lutetium in <ore:oreLutetium>.items {
        if (bDef.id == lutetium.asBlock().definition.id && event.fortuneLevel < 1) { event.drops = [<metallurgy:lutetium_dust>.weight(1.0), <metallurgy:lutetium_dust>.weight(0.5)]; }
        if (bDef.id == lutetium.asBlock().definition.id && event.fortuneLevel >= 1) { event.drops = [<metallurgy:lutetium_dust> * (1 + event.fortuneLevel)]; }
    }
    for mithril in <ore:oreMithril>.items {
        if (bDef.id == mithril.asBlock().definition.id && event.fortuneLevel < 1) { event.drops = [<metallurgy:mithril_dust>.weight(1.0), <metallurgy:mithril_dust>.weight(0.5)]; }
        if (bDef.id == mithril.asBlock().definition.id && event.fortuneLevel >= 1) { event.drops = [<metallurgy:mithril_dust> * (1 + event.fortuneLevel)]; }
    }
    for carmot in <ore:oreCarmot>.items {
        if (bDef.id == carmot.asBlock().definition.id && event.fortuneLevel < 1) { event.drops = [<metallurgy:carmot_dust>.weight(1.0), <metallurgy:carmot_dust>.weight(0.5)]; }
        if (bDef.id == carmot.asBlock().definition.id && event.fortuneLevel >= 1) { event.drops = [<metallurgy:carmot_dust> * (1 + event.fortuneLevel)]; }
    }
    for ceruclase in <ore:oreCeruclase>.items {
        if (bDef.id == ceruclase.asBlock().definition.id && event.fortuneLevel < 1) { event.drops = [<metallurgy:ceruclase_dust>.weight(1.0), <metallurgy:ceruclase_dust>.weight(0.5)]; }
        if (bDef.id == ceruclase.asBlock().definition.id && event.fortuneLevel >= 1) { event.drops = [<metallurgy:ceruclase_dust> * (1 + event.fortuneLevel)]; }
    }
    for deepIron in <ore:oreDeepIron>.items {
        if (bDef.id == deepIron.asBlock().definition.id && event.fortuneLevel < 1) { event.drops = [<metallurgy:deep_iron_dust>.weight(1.0), <metallurgy:deep_iron_dust>.weight(0.5)]; }
        if (bDef.id == deepIron.asBlock().definition.id && event.fortuneLevel >= 1) { event.drops = [<metallurgy:deep_iron_dust> * (1 + event.fortuneLevel)]; }
    }
    for meutoite in <ore:oreMeutoite>.items {
        if (bDef.id == meutoite.asBlock().definition.id && event.fortuneLevel < 1) { event.drops = [<metallurgy:meutoite_dust>.weight(1.0), <metallurgy:meutoite_dust>.weight(0.5)]; }
        if (bDef.id == meutoite.asBlock().definition.id && event.fortuneLevel >= 1) { event.drops = [<metallurgy:meutoite_dust> * (1 + event.fortuneLevel)]; }
    }
    for vyroxeres in <ore:oreVyroxeres>.items {
        if (bDef.id == vyroxeres.asBlock().definition.id && event.fortuneLevel < 1) { event.drops = [<metallurgy:vyroxeres_dust>.weight(1.0), <metallurgy:vyroxeres_dust>.weight(0.5)]; }
        if (bDef.id == vyroxeres.asBlock().definition.id && event.fortuneLevel >= 1) { event.drops = [<metallurgy:vyroxeres_dust> * (1 + event.fortuneLevel)]; }
    }
    for prometheum in <ore:orePrometheum>.items {
        if (bDef.id == prometheum.asBlock().definition.id && event.fortuneLevel < 1) { event.drops = [<metallurgy:prometheum_dust>.weight(1.0), <metallurgy:prometheum_dust>.weight(0.5)]; }
        if (bDef.id == prometheum.asBlock().definition.id && event.fortuneLevel >= 1) { event.drops = [<metallurgy:prometheum_dust> * (1 + event.fortuneLevel)]; }
    }
    for sanguinite in <ore:oreSanguinite>.items {
        if (bDef.id == sanguinite.asBlock().definition.id && event.fortuneLevel < 1) { event.drops = [<metallurgy:sanguinite_dust>.weight(1.0), <metallurgy:sanguinite_dust>.weight(0.5)]; }
        if (bDef.id == sanguinite.asBlock().definition.id && event.fortuneLevel >= 1) { event.drops = [<metallurgy:sanguinite_dust> * (1 + event.fortuneLevel)]; }
    }
    for eximite in <ore:oreEximite>.items {
        if (bDef.id == eximite.asBlock().definition.id && event.fortuneLevel < 1) { event.drops = [<metallurgy:eximite_dust>.weight(1.0), <metallurgy:eximite_dust>.weight(0.5)]; }
        if (bDef.id == eximite.asBlock().definition.id && event.fortuneLevel >= 1) { event.drops = [<metallurgy:eximite_dust> * (1 + event.fortuneLevel)]; }
    }
    for iron in <ore:oreIron>.items {
        if (bDef.id == iron.asBlock().definition.id && event.fortuneLevel < 1) { event.drops = [<metallurgy:iron_dust>.weight(1.0), <metallurgy:iron_dust>.weight(0.5)]; }
        if (bDef.id == iron.asBlock().definition.id && event.fortuneLevel >= 1) { event.drops = [<metallurgy:iron_dust> * (1 + event.fortuneLevel)]; }
    }
    for silver in <ore:oreSilver>.items {
        if (bDef.id == silver.asBlock().definition.id && event.fortuneLevel < 1) { event.drops = [<metallurgy:silver_dust>.weight(1.0), <metallurgy:silver_dust>.weight(0.5)]; }
        if (bDef.id == silver.asBlock().definition.id && event.fortuneLevel >= 1) { event.drops = [<metallurgy:silver_dust> * (1 + event.fortuneLevel)]; }
    }
    for shadowIron in <ore:oreShadowIron>.items {
        if (bDef.id == shadowIron.asBlock().definition.id && event.fortuneLevel < 1) { event.drops = [<metallurgy:shadow_iron_dust>.weight(1.0), <metallurgy:shadow_iron_dust>.weight(0.5)]; }
        if (bDef.id == shadowIron.asBlock().definition.id && event.fortuneLevel >= 1) { event.drops = [<metallurgy:shadow_iron_dust> * (1 + event.fortuneLevel)]; }
    }
    for oureclase in <ore:oreOureclase>.items {
        if (bDef.id == oureclase.asBlock().definition.id && event.fortuneLevel < 1) { event.drops = [<metallurgy:oureclase_dust>.weight(1.0), <metallurgy:oureclase_dust>.weight(0.5)]; }
        if (bDef.id == oureclase.asBlock().definition.id && event.fortuneLevel >= 1) { event.drops = [<metallurgy:oureclase_dust> * (1 + event.fortuneLevel)]; }
    }
    for osmium in <ore:oreOsmium>.items {
        if (bDef.id == osmium.asBlock().definition.id && event.fortuneLevel < 1) { event.drops = [<metallurgy:osmium_dust>.weight(1.0), <metallurgy:osmium_dust>.weight(0.5)]; }
        if (bDef.id == osmium.asBlock().definition.id && event.fortuneLevel >= 1) { event.drops = [<metallurgy:osmium_dust> * (1 + event.fortuneLevel)]; }
    }
    for adamantine in <ore:oreAdamantine>.items {
        if (bDef.id == adamantine.asBlock().definition.id && event.fortuneLevel < 1) { event.drops = [<metallurgy:adamantine_dust>.weight(1.0), <metallurgy:adamantine_dust>.weight(0.5)]; }
        if (bDef.id == adamantine.asBlock().definition.id && event.fortuneLevel >= 1) { event.drops = [<metallurgy:adamantine_dust> * (1 + event.fortuneLevel)]; }
    }
    for kalendrite in <ore:oreKalendrite>.items {
        if (bDef.id == kalendrite.asBlock().definition.id && event.fortuneLevel < 1) { event.drops = [<metallurgy:kalendrite_dust>.weight(1.0), <metallurgy:kalendrite_dust>.weight(0.5)]; }
        if (bDef.id == kalendrite.asBlock().definition.id && event.fortuneLevel >= 1) { event.drops = [<metallurgy:kalendrite_dust> * (1 + event.fortuneLevel)]; }
    }
    for ignatius in <ore:oreIgnatius>.items {
        if (bDef.id == ignatius.asBlock().definition.id && event.fortuneLevel < 1) { event.drops = [<metallurgy:ignatius_dust>.weight(1.0), <metallurgy:ignatius_dust>.weight(0.5)]; }
        if (bDef.id == ignatius.asBlock().definition.id && event.fortuneLevel >= 1) { event.drops = [<metallurgy:ignatius_dust> * (1 + event.fortuneLevel)]; }
    }
    for zinc in <ore:oreZinc>.items {
        if (bDef.id == zinc.asBlock().definition.id && event.fortuneLevel < 1) { event.drops = [<metallurgy:zinc_dust>.weight(1.0), <metallurgy:zinc_dust>.weight(0.5)]; }
        if (bDef.id == zinc.asBlock().definition.id && event.fortuneLevel >= 1) { event.drops = [<metallurgy:zinc_dust> * (1 + event.fortuneLevel)]; }
    }
    for rubracium in <ore:oreRubracium>.items {
        if (bDef.id == rubracium.asBlock().definition.id && event.fortuneLevel < 1) { event.drops = [<metallurgy:rubracium_dust>.weight(1.0), <metallurgy:rubracium_dust>.weight(0.5)]; }
        if (bDef.id == rubracium.asBlock().definition.id && event.fortuneLevel >= 1) { event.drops = [<metallurgy:rubracium_dust> * (1 + event.fortuneLevel)]; }
    }
    for alduorite in <ore:oreAlduorite>.items {
        if (bDef.id == alduorite.asBlock().definition.id && event.fortuneLevel < 1) { event.drops = [<metallurgy:alduorite_dust>.weight(1.0), <metallurgy:alduorite_dust>.weight(0.5)]; }
        if (bDef.id == alduorite.asBlock().definition.id && event.fortuneLevel >= 1) { event.drops = [<metallurgy:alduorite_dust> * (1 + event.fortuneLevel)]; }
    }
    for platinum in <ore:orePlatinum>.items {
        if (bDef.id == platinum.asBlock().definition.id && event.fortuneLevel < 1) { event.drops = [<metallurgy:platinum_dust>.weight(1.0), <metallurgy:platinum_dust>.weight(0.5)]; }
        if (bDef.id == platinum.asBlock().definition.id && event.fortuneLevel >= 1) { event.drops = [<metallurgy:platinum_dust> * (1 + event.fortuneLevel)]; }
    }
    for vulcanite in <ore:oreVulcanite>.items {
        if (bDef.id == vulcanite.asBlock().definition.id && event.fortuneLevel < 1) { event.drops = [<metallurgy:vulcanite_dust>.weight(1.0), <metallurgy:vulcanite_dust>.weight(0.5)]; }
        if (bDef.id == vulcanite.asBlock().definition.id && event.fortuneLevel >= 1) { event.drops = [<metallurgy:vulcanite_dust> * (1 + event.fortuneLevel)]; }
    }
    for midasium in <ore:oreMidasium>.items {
        if (bDef.id == midasium.asBlock().definition.id && event.fortuneLevel < 1) { event.drops = [<metallurgy:midasium_dust>.weight(1.0), <metallurgy:midasium_dust>.weight(0.5)]; }
        if (bDef.id == midasium.asBlock().definition.id && event.fortuneLevel >= 1) { event.drops = [<metallurgy:midasium_dust> * (1 + event.fortuneLevel)]; }
    }
    if (bDef.id == <scalinghealth:crystalore>.asBlock().definition.id && event.fortuneLevel < 1) { event.drops = [<scalinghealth:heartdust>.weight(1.0), <scalinghealth:heartdust>.weight(0.5)]; }
    if (bDef.id == <scalinghealth:crystalore>.asBlock().definition.id && event.fortuneLevel >= 1) { event.drops = [<scalinghealth:heartdust> * (1 + event.fortuneLevel)]; }
});
//Archaeologist Hat

//Pirate Hat
events.register(function(event as PlayerTickEvent) {
    if event.phase == "END" return;

    if isNull(event.player.getRidingEntity()) return;
    if isNull(event.player.getItemInSlot(IEntityEquipmentSlot.head())) return;
    if !<quark:pirate_hat>.anyDamage().matches(event.player.getItemInSlot(IEntityEquipmentSlot.head())) { return; }

    if event.player.isRiding {
        var entity = event.player.getRidingEntity();
        val speed = Math.sqrt(entity.motionX * entity.motionX + entity.motionZ * entity.motionZ);

        if (event.player.getRidingEntity().definition.id.contains("boat")) {

            //increase acceleration and speed (speed == speed cap which is normally about 0.3 for boats)
            if (speed < 0.70) {
                if event.player.moveForward > 0 {

                    //take side-to-side motion into account to prevent extremely slidey behavior
                    entity.motionX += -Math.sin(((entity.rotationYaw * 3.14)/180)) * 0.05;
                    entity.motionZ +=  Math.cos(((entity.rotationYaw * 3.14)/180)) * 0.05;
                }
            }
        }

        if (event.player.getRidingEntity().definition.id == "lycanitesmobs:thresher"
        || event.player.getRidingEntity().definition.id == "lycanitesmobs:strider"
        || event.player.getRidingEntity().definition.id == "lycanitesmobs:roa"
        || event.player.getRidingEntity().definition.id == "lycanitesmobs:quetzoracl"
        || event.player.getRidingEntity().definition.id == "minecraft:skeleton_horse") {

            // different calculations for lycan pets bc they are faster than boats
            if (speed < 2.0) {
                if event.player.moveForward > 0 {
                    entity.motionX += -Math.sin(((entity.rotationYaw * 3.14)/180)) * 0.05;
                    entity.motionZ +=  Math.cos(((entity.rotationYaw * 3.14)/180)) * 0.05;
                }
            }
        }
    }
});
//Pirate Hat

//Witch Hat
events.register(function(event as crafttweaker.event.PotionEffectAddedEvent){
if event.entityLivingBase.world.isRemote() return;

if (isNull(event.entityLivingBase.getNBT().ForgeData) || isNull(event.entityLivingBase.getNBT().ForgeData.addedPotion)) return;

//data is needed to prevent infinite activations of the event
if (!isNull(event.entityLivingBase.getNBT().ForgeData.addedPotion) && event.entityLivingBase.getNBT().ForgeData.addedPotion == 1) { 
    event.entityLivingBase.setNBT({addedPotion: 0});
    return; }

var newEffect = event.potionEffect;
var duration = newEffect.duration;
var potion as IPotion = newEffect.potion;
var amplifier = newEffect.amplifier;
var entityLiving = event.entityLivingBase;

    if (!isNull(entityLiving.getItemInSlot(IEntityEquipmentSlot.head())) && <quark:witch_hat>.anyDamage().matches(entityLiving.getItemInSlot(IEntityEquipmentSlot.head()))) {
        if !newEffect.potion.badEffect {

            //only increase buff duration for the wearer
            entityLiving.removePotionEffect(newEffect.potion);
            entityLiving.setNBT({addedPotion: 1});
            entityLiving.addPotionEffect(newEffect.potion.makePotionEffect((duration as float * 1.5) as int, amplifier));            
        }
    }
    
    if (isNull(entityLiving.getItemInSlot(IEntityEquipmentSlot.head())) || !<quark:witch_hat>.anyDamage().matches(entityLiving.getItemInSlot(IEntityEquipmentSlot.head()))) {
        if !entityLiving instanceof IPlayer {
            var entity as IEntity = entityLiving;
            var player = entity.native.world.getClosestPlayerToEntity(entity.native, 100.0);

            //if it isn't the wearer, check for one within 100 blocks
            if !isNull(player) {
            if (!isNull(player.wrapper.getItemInSlot(IEntityEquipmentSlot.head())) && <quark:witch_hat>.anyDamage().matches(player.wrapper.getItemInSlot(IEntityEquipmentSlot.head()))) {
                if newEffect.potion.badEffect {
                    //if a wearer exists, entities will have increased debuff durations
                    entityLiving.removePotionEffect(newEffect.potion);
                    entityLiving.setNBT({addedPotion: 1});
                    event.entityLivingBase.addPotionEffect(newEffect.potion.makePotionEffect((duration as float * 2.0) as int, amplifier));               
                }
            }
            }
        }
    }
});

events.register(function(event as crafttweaker.event.EntityLivingEquipmentChangeEvent){
    if event.entityLivingBase.world.isRemote() { return; }
    if event.slot.name != "head" return;
    if isNull(event.entityLivingBase.activePotionEffects) return;
    if (<quark:witch_hat>.anyDamage().matches(event.oldItem) && !<quark:witch_hat>.anyDamage().matches(event.newItem)) {
        event.entityLivingBase.clearActivePotions();
    }
});
//Witch Hat

//Dragon Head
events.register(function(event as DodgeEvent.ServerDodgeEvent) {
    var player = event.player;

    if isNull(player.wrapper.getItemInSlot(IEntityEquipmentSlot.head())) return;
    if !player.wrapper.getItemInSlot(IEntityEquipmentSlot.head()).matches(<minecraft:skull:5>) { return; }

    //check for all kinds of flying
    if (player.capabilities.isFlying || player.isElytraFlying() || <erebus:glider_chestplate>.withTag({isGliding: 1 as byte}).matches(player.wrapper.getItemInSlot(IEntityEquipmentSlot.chest())) || <erebus:glider_chestplate_powered>.withTag({isPowered: 1 as byte}).matches(player.wrapper.getItemInSlot(IEntityEquipmentSlot.chest()))) {
            
            //increase dodge force
            event.setForce(event.getForce() * 5);

            //sfx and vfx
            server.commandManager.executeCommandSilent(server,"playsound minecraft:entity.enderdragon.flap player @a " + player.wrapper.x + " " + player.wrapper.y + " " + player.wrapper.z + " 2 1");
            server.commandManager.executeCommandSilent(server,"playsound minecraft:entity.enderdragon.flap player @a " + player.wrapper.x + " " + player.wrapper.y + " " + player.wrapper.z + " 2 1");
            server.commandManager.executeCommandSilent(server,"particle dragonbreath " ~ player.wrapper.x ~ " " ~ player.wrapper.y ~ " " ~ player.wrapper.z ~ " 3.0 1.0 3.0 0.5 100 force @a");
    }
//loads after Elenai Dodge 2's events to prevent glitches
}, EventPriority.lowest());
//Dragon Head

//Golden Crown

//counter for how many times the ability activated
val successCount as int[string] = {};

events.register(function(event as EntityLivingAttackedEvent){
    if event.entityLivingBase.world.isRemote() return;
    if !event.entityLivingBase instanceof IPlayer return;
        
        var player as IPlayer = event.entityLivingBase;

    if isNull(player.getItemInSlot(IEntityEquipmentSlot.head())) return;
    if !<bountifulbaubles:crowngold>.anyDamage().matches(player.getItemInSlot(IEntityEquipmentSlot.head())) return;

    //give data to the crown (also used for client/server communication)
    if isNull(player.getItemInSlot(IEntityEquipmentSlot.head()).tag.CrownSuccess) { 
        player.getItemInSlot(IEntityEquipmentSlot.head()).mutable().updateTag({CrownSuccess: 0}); 
    }

    if (player.getItemInSlot(IEntityEquipmentSlot.head()).tag.CrownSuccess == 0) {

        var baseChance = 0.3 as float;

        //luck potion would give 10% luck to this ability
        var luckModifier = (player.getAttribute("generic.luck").getAttributeValue() * 0.1) as float;

        if isNull(successCount[player.uuid]) {
            successCount[player.uuid] = 0;
        }

        //final formula: (0.5 + luck) / (successCount + 1)
        var totalChance = ((baseChance + luckModifier) / (successCount[player.uuid] + 1)) as float;

        if (player.world.random.nextFloat() <= totalChance && (player.health >= player.maxHealth * 0.9 || (player.isBaubleEquipped(<bountifulbaubles:amuletcross>) != -1 && player.health >= player.maxHealth * 0.75))) {

            //sfx
            server.commandManager.executeCommandSilent(server,"playsound ebwizardry:spell.magic_missile player @a " + player.x + " " + player.y + " " + player.z + " 2 1.0");
            server.commandManager.executeCommandSilent(server,"playsound minecraft:block.anvil.land player @a " + player.x + " " + player.y + " " + player.z + " 2 2");

            //launch player backwards
            var motionX = -((-MathHelper.sin(player.rotationYaw / 180.0 * 3.14) * MathHelper.cos(0.5)));
            var motionZ = -((MathHelper.cos(player.rotationYaw / 180.0 * 3.14) * MathHelper.cos(0.5)));
            Utils.setPlayerVelocity(motionX, 0.5, motionZ, player.native);

            //update data for visuals (Armor_Sets_Client.zs)
            player.getItemInSlot(IEntityEquipmentSlot.head()).mutable().updateTag({CrownSuccess: 1});

            //increment counter
            successCount[player.uuid] = successCount[player.uuid] + 1;

            //prevent damage
            event.cancel();
        } else { successCount[player.uuid] = 0; }
    } 

    
});

//due to event activation order, I set crown data to 0 after it updates in the player's inventory (changing nbt also updates inventory)
events.register(function(event as crafttweaker.event.EntityLivingEquipmentChangeEvent){
    if event.entityLivingBase.world.isRemote() { return; }
    if event.slot.name != "head" return;
    if isNull(event.oldItem) return;
    if isNull(event.newItem) return;
    if isNull(event.newItem.tag.CrownSuccess) return;
    if (<bountifulbaubles:crowngold>.anyDamage().matches(event.oldItem) && <bountifulbaubles:crowngold>.anyDamage().matches(event.newItem)) {
        if event.entityLivingBase.getItemInSlot(IEntityEquipmentSlot.head()).tag.CrownSuccess != 0 { event.entityLivingBase.getItemInSlot(IEntityEquipmentSlot.head()).mutable().updateTag({CrownSuccess: 0}); }
    }
});
//Golden Crown

//Mob heads (DS mob head invis doesn't seem to be working && I want mobs to defend themselves)
events.register(function(event as native.net.minecraftforge.event.entity.living.LivingSetAttackTargetEvent){
    if event.getTarget() instanceof EntityPlayer {

        var player = event.getTarget() as EntityPlayer;

        if <minecraft:skull>.anyDamage().matches(player.wrapper.getItemInSlot(IEntityEquipmentSlot.head())) {

            var damage = player.wrapper.getItemInSlot(IEntityEquipmentSlot.head()).metadata;
            var entityCT = event.entity.wrapper;

            //filter mob head by mob type
            if (damage == 0 && entityCT.definition.id == "minecraft:skeleton" || damage == 1 && entityCT.definition.id == "minecraft:wither_skeleton" || damage == 2 && entityCT.definition.id == "minecraft:zombie" || damage == 4 && entityCT.definition.id == "minecraft:creeper") {
                
                //allows enemies to attack you if you attacked them
                if event.getTarget().lastAttackedEntity != event.entity {
                    var entity = event.getEntityLiving() as EntityLiving;
                    entity.setAttackTarget(null);
                }
            }
        }
    }
});
//Mob heads (DS mob head invis doesn't seem to be working && I want mobs to defend themselves)

//Antler Hat Rework (passive healing is handled in "mechanics.zs")
events.register(function(event as crafttweaker.event.EntityLivingDeathEvent){
    if event.entityLivingBase.world.isRemote() return;
    if isNull(event.damageSource.trueSource) return;
    if !event.damageSource.trueSource instanceof IPlayer return;
    if event.entityLivingBase instanceof IPlayer return;

    var player as IPlayer = event.damageSource.trueSource;

    if !<mysticalworld:antler_hat>.anyDamage().matches(player.getItemInSlot(IEntityEquipmentSlot.head())) return;

    //scan inventory for damaged items
    for slots in 0 .. player.inventorySize {
        if !isNull(player.getInventoryStack(slots)) {
            
            var items = player.getInventoryStack(slots);

            if (items.isDamageable && items.isDamaged) {
                //repair all by 1 durability
                items.mutable().withDamage(items.damage - 1);
            }   
        }
    }
});
//Antler Hat Rework (passive healing is handled in "mechanics.zs")

//Beetle Mask Rework
    
val nonDamageCount as int[string] = {}; //count how many times the ability didn't activate

events.register(function(event as crafttweaker.event.EntityLivingHurtEvent){
    if event.entityLivingBase.world.isRemote() return;
    if isNull(event.damageSource.trueSource) return;

    var victim = event.entityLivingBase;

    if !<mysticalworld:beetle_mask>.anyDamage().matches(victim.getItemInSlot(IEntityEquipmentSlot.head())) return;

    var baseChance = 0.9 as float;

    //potion of luck would give 10% luck to this ability
    var luckModifier = (victim.getAttribute("generic.luck").getAttributeValue() * 0.1) as float;
    var chanceSaved = baseChance;

    if isNull(nonDamageCount[victim.uuid]) {
        nonDamageCount[victim.uuid] = 1;
    }

    //nonDamageCount = exponent
    if (nonDamageCount[victim.uuid] > 1) {
        for multiply in 1 .. nonDamageCount[victim.uuid] {
            baseChance *= chanceSaved;
        }
    }

    //final formula: 1 - (0.85^x + luck)
    //so luck lowers the chance, which allows for higher damage
    var totalChance = 1.0 - (baseChance + luckModifier) as float;

    if (event.entityLivingBase.world.random.nextFloat() <= totalChance) {
    var attacker = event.damageSource.trueSource;

    //same damage as the original beetle mask
    var baseDamage = 1.4;

    var attack = victim.getAttribute("generic.attackDamage").getAttributeValue();
    var weaponmod = victim.getAttribute("generic.attackDamage").getModifiers();

    //subtract weapon damage to balance attack damage compared to other damage types
    for dmg in weaponmod {
        if (dmg.getUUID() == "cb3f55d3-645c-4f38-a497-9c13a33db5cf") {
            attack -= (dmg.getAmount() + 1);
        }
    }

    var ranged = victim.getAttribute("potioncore.projectileDamage").getAttributeValue();
    var magic = victim.getAttribute("potioncore.magicDamage").getAttributeValue();

    //get which damage type does the most damage (eg: ranged players will deal more ranged damage)
    var bestAttribute = Math.max(attack, Math.max(ranged, magic)) - 1.0;

    //final damage formula: 2(1 + 1(dmgCount - 1) + bestDmgStat)
    var totalDamage = baseDamage * (1.0 + (1.0 * (nonDamageCount[victim.uuid] - 1)) + bestAttribute);

    // perform damage as Mob Damage
    var randomPitch = victim.world.random.nextFloat(0.75, 1.0);

    if (event.entityLivingBase.getDistanceSqToEntity(attacker) <= event.entityLivingBase.getAttribute("generic.reachDistance").getAttributeValue()) { 
        server.commandManager.executeCommandSilent(server,"particle sweepAttack " ~ attacker.x ~ " " ~ (attacker.y + 1) ~ " " ~ attacker.z ~ " 1.0 1.0 1.0 0 " + (nonDamageCount[victim.uuid] * 5) + " force @a");
        server.commandManager.executeCommandSilent(server,"playsound bowdamagetweaker:player.criticalstrike player @a " + victim.x + " " + victim.y + " " + victim.z + " 2 0.75");

        // play beetle audio
        server.commandManager.executeCommandSilent(server,"playsound erebus:fire_ant_hurt player @a " + victim.x + " " + victim.y + " " + victim.z + " 2 " + randomPitch); 


        attacker.attackEntityFrom(IDamageSource.createMobDamage(event.entityLivingBase), totalDamage as float);
        attacker.native.hurtResistantTime = 0;
        victim.getItemInSlot(IEntityEquipmentSlot.head()).mutable().damageItem(2, victim as IEntity);
    } else {
        // lower pitch for a failed beetle attack
        randomPitch -= 0.3;
    }

    // play beetle audio for failed attack. For successful attack it plays a second time for a higher output gain
    server.commandManager.executeCommandSilent(server,"playsound erebus:fire_ant_hurt player @a " + victim.x + " " + victim.y + " " + victim.z + " 2 " + randomPitch); 
    
    //reset counter
    nonDamageCount[victim.uuid] = 1;

    } else {
        //if the ability doesn't activate, increment the counter
        nonDamageCount[victim.uuid] = nonDamageCount[victim.uuid] + 1;
    }
});
//Beetle Mask Rework

//Hircshgeist Skull Rework
val repelCount = {} as int[string];

val VoidShadow = [
    "lycanitesmobs:astaroth",
    "lycanitesmobs:behemoth",
    "lycanitesmobs:beholder",
    "lycanitesmobs:belph",
    "lycanitesmobs:pinky",
    "lycanitesmobs:shade",
    "lycanitesmobs:spectre",
    "lycanitesmobs:trite",
    "lycanitesmobs:vorach",
    "lycanitesmobs:balayang",
    "lycanitesmobs:darkling",
    "lycanitesmobs:epion",
    "lycanitesmobs:eyewig",
    "lycanitesmobs:geist",
    "lycanitesmobs:grue",
    "lycanitesmobs:skylus",
    "lycanitesmobs:warg",
    "midnight:rifter",
    "midnight:nova",
    "midnight:deceitful_snapper",
    "midnight:stinger",
    "midnight:nightstag",
    "midnight:crystal_bug",
    "midnight:hunter",
    "midnight:skulk",
    "minecraft:enderman",
    "minecraft:endermite",
    "beneath:shadow",
    "mysticalworld:entity_endermini"
] as string[];

events.register(function(event as crafttweaker.event.WorldTickEvent){
    if event.side == "CLIENT" return;
    if event.phase == "END" return;
    if event.world.time %5 != 0 return;


    val radius as double = 5.0;

    for e in event.world.getEntities() {
        if !e instanceof IEntityLivingBase continue;
        if isNull(e.definition) continue;
        if isNull(e.definition.id) continue;
        if isNull(event.world.getClosestPlayerToEntity(e, radius, false)) continue;

        // Only consider Void/Shadow entities
        if !VoidShadow.contains(e.definition.id) continue;

        // Get the closest player within radius
        var player as IPlayer = event.world.getClosestPlayerToEntity(e, radius, false);

        if isNull(player.getItemInSlot(IEntityEquipmentSlot.head())) continue;
        if !<betteranimalsplus:hirschgeistskullwearable>.anyDamage().matches(player.getItemInSlot(IEntityEquipmentSlot.head())) continue;
    
        var helm = player.getItemInSlot(IEntityEquipmentSlot.head());

        if (!isNull(helm.tag.lit) && helm.tag.lit == 1) {

            var living as IEntityLivingBase = e;

            server.commandManager.executeCommandSilent(server,"playsound minecraft:entity.generic.burn player @a " + living.x + " " + living.y + " " + living.z + " 1 " + event.world.random.nextFloat(0.7,1.3));
            server.commandManager.executeCommandSilent(server,"particle flame " ~ living.x ~ " " ~ living.y ~ " " ~ living.z ~ " 1.0 1.0 1.0 0 25 force @a");

            var teleDistX = event.world.random.nextInt(5, 8);
            var teleDistZ = event.world.random.nextInt(5, 8);

            if event.world.random.nextInt() == 1 {
                teleDistX *= -1;
            }

            if event.world.random.nextInt() == 1 {
                teleDistZ *= -1;
            }

            living.attemptTeleport(player.x + teleDistX, player.y, player.z + teleDistZ);

            var attack = player.getAttribute("generic.attackDamage").getAttributeValue();
            var weaponmod = player.getAttribute("generic.attackDamage").getModifiers();

            //subtract weapon damage to balance attack damage compared to other damage types
            for dmg in weaponmod {
                if (dmg.getUUID() == "cb3f55d3-645c-4f38-a497-9c13a33db5cf") {
                    attack -= (dmg.getAmount() + 1);
                }
            }

            var ranged = player.getAttribute("potioncore.projectileDamage").getAttributeValue();
            var magic = player.getAttribute("potioncore.magicDamage").getAttributeValue();

            //get which damage type does the most damage (eg: ranged players will deal more ranged damage)
            var bestAttribute = Math.max(attack, Math.max(ranged, magic));

            var totalDamage = (living.maxHealth * 0.15) * bestAttribute;

            living.attackEntityFrom(IDamageSource.createPlayerDamage(player), totalDamage);
            e.native.hurtResistantTime = 0;
            
            if (isNull(repelCount[player.uuid])) {
                repelCount[player.uuid] = 0;
            }

            repelCount[player.uuid] = repelCount[player.uuid] + 1;

            //if 6 entities were repelled, enter cooldown, damage item, turn off its dynamic lights
            if repelCount[player.uuid] >= 6 { 
                player.native.getCooldownTracker().setCooldown(<betteranimalsplus:hirschgeistskullwearable>.definition.native, 200);
                helm.mutable().damageItem(5, player as IEntity);
                helm.mutable().updateTag({lit: 0});
            }
        }

    }
});

events.register(function(event as PlayerTickEvent){
if event.phase == "CLIENT" return;
if event.phase == "END" return;

if isNull(event.player.getItemInSlot(IEntityEquipmentSlot.head())) return;
if !<betteranimalsplus:hirschgeistskullwearable>.anyDamage().matches(event.player.getItemInSlot(IEntityEquipmentSlot.head())) return;

if (isNull(event.player.getItemInSlot(IEntityEquipmentSlot.head()).tag.lit) || event.player.getItemInSlot(IEntityEquipmentSlot.head()).tag.lit == 0) {

    //if the cooldown is over, reset repel count, turn on the item's dynamic lights
    if (!event.player.native.getCooldownTracker().hasCooldown(<betteranimalsplus:hirschgeistskullwearable>.definition.native) || isNull(event.player.getItemInSlot(IEntityEquipmentSlot.head()).tag.lit)) {
        event.player.getItemInSlot(IEntityEquipmentSlot.head()).mutable().updateTag({lit: 1});
        repelCount[event.player.uuid] = 0;
    }
}

}, EventPriority.highest());
//Hircshgeist Skull Rework

//Wildcard reworks