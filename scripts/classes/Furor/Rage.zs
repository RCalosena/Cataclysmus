#reloadable

import crafttweaker.player.IPlayer;
import crafttweaker.potions.IPotion;
import crafttweaker.entity.IEntityEquipmentSlot;
import crafttweaker.entity.IEntityLivingBase;
import crafttweaker.item.IItemStack;
import crafttweaker.damage.IDamageSource;

function hasArmor(helmet as IItemStack, chestplate as IItemStack, legging as IItemStack, boot as IItemStack) as bool {

    var condition = 0;

val Helmets = [
    <cqrepoured:helmet_heavy_iron>,
    <metallurgy:orichalcum_helmet>,
    <metallurgy:electrum_helmet>,
    <cqrepoured:helmet_bull>,
    <midnight:tenebrum_helmet>,
    <erebus:rhino_exoskeleton_helmet>,
    <cqrepoured:helmet_heavy_diamond>,
    <metallurgy:haderoth_helmet>,
    <metallurgy:black_steel_helmet>,
    <cqrepoured:helmet_turtle>,
    <metallurgy:vulcanite_helmet>,
    <metallurgy:osmium_helmet>,
    <metallurgy:bronze_helmet>,
    <metallurgy:steel_helmet>,
    <metallurgy:lutetium_helmet>,
    <srparasites:armor_helm_sentient>.withTag({furor: 1})
] as IItemStack[];

val Chestplates = [
    <cqrepoured:chestplate_heavy_iron>,
    <metallurgy:orichalcum_chestplate>,
    <metallurgy:electrum_chestplate>,
    <cqrepoured:chestplate_bull>,
    <midnight:tenebrum_chestplate>,
    <erebus:rhino_exoskeleton_chestplate>,
    <cqrepoured:chestplate_heavy_diamond>,
    <metallurgy:haderoth_chestplate>,
    <metallurgy:black_steel_chestplate>,
    <cqrepoured:chestplate_turtle>,
    <metallurgy:vulcanite_chestplate>,
    <metallurgy:osmium_chestplate>,
    <metallurgy:bronze_chestplate>,
    <metallurgy:steel_chestplate>,
    <metallurgy:lutetium_chestplate>,
    <srparasites:armor_chest_sentient>.withTag({furor: 1})
] as IItemStack[];

val Leggings = [
    <cqrepoured:leggings_heavy_iron>,
    <metallurgy:orichalcum_leggings>,
    <metallurgy:electrum_leggings>,
    <cqrepoured:leggings_bull>,
    <midnight:tenebrum_leggings>,
    <erebus:rhino_exoskeleton_leggings>,
    <cqrepoured:leggings_heavy_diamond>,
    <metallurgy:haderoth_leggings>,
    <metallurgy:black_steel_leggings>,
    <cqrepoured:leggings_turtle>,
    <metallurgy:vulcanite_leggings>,
    <metallurgy:osmium_leggings>,
    <metallurgy:bronze_leggings>,
    <metallurgy:steel_leggings>,
    <metallurgy:lutetium_leggings>,
    <srparasites:armor_pants_sentient>.withTag({furor: 1})
] as IItemStack[];

val Boots = [
    <cqrepoured:boots_heavy_iron>,
    <metallurgy:orichalcum_boots>,
    <metallurgy:electrum_boots>,
    <cqrepoured:boots_bull>,
    <midnight:tenebrum_boots>,
    <erebus:rhino_exoskeleton_boots>,
    <cqrepoured:boots_heavy_diamond>,
    <metallurgy:haderoth_boots>,
    <metallurgy:black_steel_boots>,
    <cqrepoured:boots_turtle>,
    <metallurgy:vulcanite_boots>,
    <metallurgy:osmium_boots>,
    <metallurgy:bronze_boots>,
    <metallurgy:steel_boots>,
    <metallurgy:lutetium_boots>,
    <srparasites:armor_boots_sentient>.withTag({furor: 1})
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

events.register(function(event as crafttweaker.event.EntityLivingDamageEvent){
    if (event.entityLivingBase.world.isRemote()) { return; }
	if (!event.damageSource.trueSource instanceof IEntityLivingBase) { return; }

    var entity = event.entityLivingBase;
    var player as IPlayer = entity;

    if !hasArmor(player.getItemInSlot(IEntityEquipmentSlot.head()), player.getItemInSlot(IEntityEquipmentSlot.chest()), player.getItemInSlot(IEntityEquipmentSlot.legs()), player.getItemInSlot(IEntityEquipmentSlot.feet())) { return; }
    
 
	if (isNull(entity.getNBT().ForgeData.hits)) {
		entity.setNBT({hits: 0});
	}

	if (event.damageSource.trueSource instanceof IEntityLivingBase) {
 
		if (entity.getNBT().ForgeData.hits) {
 
			entity.setNBT({hits: entity.getNBT().ForgeData.hits as int + 1});
 
		}
	}
});

events.register(function(event2 as crafttweaker.event.EntityLivingJumpEvent) {
    if event2.entity.world.isRemote() { return; }
    if !event2.entity instanceof IPlayer { return; }

    var player as IPlayer = event2.entity;
    
    if (isNull(player.getNBT().ForgeData.hits)) { return; }
    if !player.isSneaking { return; }

            var hits = player.getNBT().ForgeData.hits;
            var Rage = <potion:srparasites:rage> as IPotion;

            if (hits >= 5) { player.sendPlaySoundPacket("minecraft:entity.wither.hurt", "player", player.position, 1.0, 0.1); player.addPotionEffect(Rage.makePotionEffect(100, 0)); }
            if (hits >= 10) { player.sendPlaySoundPacket("minecraft:entity.wither.hurt", "player", player.position, 1.0, 0.1); player.addPotionEffect(Rage.makePotionEffect(100, 1)); }
            if (hits >= 15) { player.sendPlaySoundPacket("minecraft:entity.wither.hurt", "player", player.position, 1.0, 0.1); player.addPotionEffect(Rage.makePotionEffect(100, 2)); }
            if (hits >= 20) { player.sendPlaySoundPacket("minecraft:entity.wither.hurt", "player", player.position, 1.0, 0.1); player.addPotionEffect(Rage.makePotionEffect(100, 3)); }
            if (hits >= 25) { player.sendPlaySoundPacket("minecraft:entity.wither.hurt", "player", player.position, 1.0, 0.1); player.addPotionEffect(Rage.makePotionEffect(100, 4)); }
            if (hits >= 30) { player.sendPlaySoundPacket("minecraft:entity.wither.hurt", "player", player.position, 1.0, 0.1); player.addPotionEffect(Rage.makePotionEffect(100, 5)); }
            if (hits > 0) { player.update({hits: 0}); }
});

events.register(function(event3 as crafttweaker.event.PlayerTickEvent){
    if event3.side == "CLIENT" { return; }
    if (event3.phase == "START") { return; }
    if event3.player.world.time %5 != 0 { return; }
    if isNull(event3.player.getNBT().ForgeData.hits) { return; }

    var player = event3.player;
    var hits = player.getNBT().ForgeData.hits;
    var world = player.world;


    if (hits != 0 && !hasArmor(player.getItemInSlot(IEntityEquipmentSlot.head()), player.getItemInSlot(IEntityEquipmentSlot.chest()), player.getItemInSlot(IEntityEquipmentSlot.legs()), player.getItemInSlot(IEntityEquipmentSlot.feet())))
    { player.update({hits: 0}); }


if hits >= 30 {
    if world.time %10 != 0 { return; }

    world.catenation()
    .run(function(world, context) {
            context.data = world.time;
        })
    .sleepUntil(function(world, context) {
            return hits >= 30;
        }).sleep(40)
    .then(function(world, context) {
            if player.health > 1 { player.sendPlaySoundPacket("minecraft:entity.wither.hurt", "player", player.position, 0.2, 0.5); player.attackEntityFrom(IDamageSource.OUT_OF_WORLD(), 1); }
        })
    .stopWhen(function(world, context) {
            return hits < 5;
        }).start();
}


if (hits >= 25 && hits < 30) {
    if world.time %20 != 0 { return; }

    world.catenation()
    .run(function(world, context) {
            context.data = world.time;
        })
    .sleepUntil(function(world, context) {
            return hits >= 25;
        }).sleep(40)
    .then(function(world, context) {
            if player.health > 1 { player.sendPlaySoundPacket("minecraft:entity.wither.hurt", "player", player.position, 0.2, 0.5); player.attackEntityFrom(IDamageSource.OUT_OF_WORLD(), 1); }
        })
    .stopWhen(function(world, context) {
            return hits < 5 || hits >= 30;
        }).start();
}


if (hits >= 20 && hits < 25) {
    if world.time %40 != 0 { return; }

    world.catenation()
    .run(function(world, context) {
            context.data = world.time;
        })
    .sleepUntil(function(world, context) {
            return hits >= 20;
        }).sleep(40)
    .then(function(world, context) {
            if player.health > 1 { player.sendPlaySoundPacket("minecraft:entity.wither.hurt", "player", player.position, 0.2, 0.5); player.attackEntityFrom(IDamageSource.OUT_OF_WORLD(), 1); }
        })
    .stopWhen(function(world, context) {
            return hits < 5 || hits >= 25;
        }).start();
}


if (hits >= 15 && hits < 20) {
    if world.time %60 != 0 { return; }

    world.catenation()
    .run(function(world, context) {
            context.data = world.time;
        })
    .sleepUntil(function(world, context) {
            return hits >= 15;
        }).sleep(40)
    .then(function(world, context) {
            if player.health > 1 { player.sendPlaySoundPacket("minecraft:entity.wither.hurt", "player", player.position, 0.2, 0.5); player.attackEntityFrom(IDamageSource.OUT_OF_WORLD(), 1); }
        })
    .stopWhen(function(world, context) {
            return hits < 5 || hits >= 20;
        }).start();
}


if (hits >= 10 && hits < 15) {
    if world.time %80 != 0 { return; }

    world.catenation()
    .run(function(world, context) {
            context.data = world.time;
        })
    .sleepUntil(function(world, context) {
            return hits >= 10;
        }).sleep(40)
    .then(function(world, context) {
            if player.health > 1 { player.sendPlaySoundPacket("minecraft:entity.wither.hurt", "player", player.position, 0.2, 0.5); player.attackEntityFrom(IDamageSource.OUT_OF_WORLD(), 1); }
        })
    .stopWhen(function(world, context) {
            return hits < 5 || hits >= 15;
        }).start();
}


if (hits >= 5 && hits < 10) {
    if world.time %100 != 0 { return; }

    world.catenation()
    .run(function(world, context) {
            context.data = world.time;
        })
    .sleepUntil(function(world, context) {
            return hits >= 5;
        }).sleep(40)
    .then(function(world, context) {
            if player.health > 1 { player.sendPlaySoundPacket("minecraft:entity.wither.hurt", "player", player.position, 0.2, 0.5); }
        })
    .stopWhen(function(world, context) {
            return hits < 5 || hits >= 10;
        }).start();
    }

    if hits >= 30 { if world.time %1200 != 0 { return; } player.update({hits: 25}); }
    if (hits >= 25 && hits < 30) { if world.time %1200 != 0 { return; } player.update({hits: 20}); }
    if (hits >= 20 && hits < 25) { if world.time %1200 != 0 { return; } player.update({hits: 15}); }
    if (hits >= 15 && hits < 20) { if world.time %1200 != 0 { return; } player.update({hits: 10}); }
    if (hits >= 10 && hits < 15) { if world.time %1200 != 0 { return; } player.update({hits: 5}); }
    if (hits >= 5 && hits < 10) { if world.time %1200 != 0 { return; } player.update({hits: 0}); }
});