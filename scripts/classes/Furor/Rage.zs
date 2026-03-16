#reloadable

import crafttweaker.player.IPlayer;
import crafttweaker.entity.IEntity;
import crafttweaker.potions.IPotion;
import crafttweaker.entity.IEntityEquipmentSlot;
import crafttweaker.entity.IEntityLivingBase;
import crafttweaker.item.IItemStack;
import crafttweaker.damage.IDamageSource;
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
        <cqrepoured:helmet_heavy_diamond>,
        <metallurgy:haderoth_helmet>,
        <metallurgy:black_steel_helmet>,
        <cqrepoured:helmet_turtle>,
        <metallurgy:vulcanite_helmet>,
        <metallurgy:osmium_helmet>,
        <metallurgy:bronze_helmet>,
        <metallurgy:steel_helmet>,
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
        <minecraft:elytra>,
        <erebus:glider_chestplate>,
        <erebus:glider_chestplate_powered>,
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
        <erebus:sprint_leggings>,
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
        <erebus:jump_boots>,
        <erebus:water_striders>,
        <cqrepoured:boots_cloud>,
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
}

events.register(function(event as crafttweaker.event.EntityLivingDamageEvent){
    if (event.entityLivingBase.world.isRemote() || !event.entityLivingBase instanceof IPlayer) return;
    
    var entity = event.entityLivingBase;
    var player as IPlayer = entity;

    var helmet as IItemStack = player.getItemInSlot(IEntityEquipmentSlot.head());
    var chestplate as IItemStack = player.getItemInSlot(IEntityEquipmentSlot.chest());
    var leggings as IItemStack = player.getItemInSlot(IEntityEquipmentSlot.legs());
    var boots as IItemStack = player.getItemInSlot(IEntityEquipmentSlot.feet());

    if (player.isPotionActive(<potion:srparasites:rage>) || !hasArmor(helmet, chestplate, leggings, boots) || !wildcards.isWithinLimit(player)) { return; }

    if (isNull(player.getNBT().ForgeData.rageDamage)) { player.setNBT({rageDamage: 0}); }

    if event.damageSource.getDamageType() == "outOfWorld" {
        if (player.getNBT().ForgeData.rageDamage < 4) {
            player.setNBT({rageDamage: player.getNBT().ForgeData.rageDamage as int + 1});
        } else { 
            if (player.getNBT().ForgeData.rageDamage == 4 && !isNull(player.getNBT().ForgeData.hits) && player.getNBT().ForgeData.hits >= 4) {
                player.setNBT({hits: player.getNBT().ForgeData.hits as int - 5});
            }

            player.update({rageDamage: 0});
        }
    } else { player.update({rageDamage: 0}); }

	if (!event.damageSource.trueSource instanceof IEntityLivingBase) { return; }

	if (isNull(player.getNBT().ForgeData.hits)) { player.setNBT({hits: 0}); }
 
    if (player.getNBT().ForgeData.hits <= 30) {
        player.setNBT({hits: player.getNBT().ForgeData.hits as int + 1});
    }

    if event.damageSource.getDamageType() != "outOfWorld" {
        if (player.getNBT().ForgeData.hits == 5) { server.commandManager.executeCommandSilent(server,"particle flame " ~ player.x ~ " " ~ (player.y + 1) ~ " " ~ player.z ~ " 0.5 0.5 0.5 0 10 force @a"); player.sendPlaySoundPacket("ebwizardry:block.receptacle.ignite", "player", player.position, 1.0, 0.5); }
        if (player.getNBT().ForgeData.hits == 10) { server.commandManager.executeCommandSilent(server,"particle flame " ~ player.x ~ " " ~ (player.y + 1) ~ " " ~ player.z ~ " 0.5 0.5 0.5 0 15 force @a"); player.sendPlaySoundPacket("ebwizardry:block.receptacle.ignite", "player", player.position, 1.0, 0.6); }
        if (player.getNBT().ForgeData.hits == 15) { server.commandManager.executeCommandSilent(server,"particle flame " ~ player.x ~ " " ~ (player.y + 1) ~ " " ~ player.z ~ " 0.5 0.5 0.5 0 20 force @a"); player.sendPlaySoundPacket("ebwizardry:block.receptacle.ignite", "player", player.position, 1.0, 0.7); }
        if (player.getNBT().ForgeData.hits == 20) { server.commandManager.executeCommandSilent(server,"particle flame " ~ player.x ~ " " ~ (player.y + 1) ~ " " ~ player.z ~ " 0.5 0.5 0.5 0 25 force @a"); player.sendPlaySoundPacket("ebwizardry:block.receptacle.ignite", "player", player.position, 1.0, 0.8); }
        if (player.getNBT().ForgeData.hits == 25) { server.commandManager.executeCommandSilent(server,"particle flame " ~ player.x ~ " " ~ (player.y + 1) ~ " " ~ player.z ~ " 0.5 0.5 0.5 0 30 force @a"); player.sendPlaySoundPacket("ebwizardry:block.receptacle.ignite", "player", player.position, 1.0, 0.9); }
        if (player.getNBT().ForgeData.hits == 30) { server.commandManager.executeCommandSilent(server,"particle flame " ~ player.x ~ " " ~ (player.y + 1) ~ " " ~ player.z ~ " 0.5 0.5 0.5 0 35 force @a"); player.sendPlaySoundPacket("ebwizardry:block.receptacle.ignite", "player", player.position, 1.0, 1.0); }
    }
});

events.register(function(event2 as crafttweaker.event.EntityLivingJumpEvent) {
    if (event2.entity.world.isRemote() || !event2.entity instanceof IPlayer) { return; }

    var player as IPlayer = event2.entity;
    
    if (!player.isSneaking || isNull(player.getNBT().ForgeData.hits)) { return; }

    var hits = player.getNBT().ForgeData.hits;
    var Rage = <potion:srparasites:rage> as IPotion;

    if (hits >= 5 && hits < 10) { server.commandManager.executeCommandSilent(server,"particle flame " ~ player.x ~ " " ~ (player.y + 1) ~ " " ~ player.z ~ " 0.5 0.5 0.5 0 10 force @a"); player.sendPlaySoundPacket("minecraft:entity.wither.hurt", "player", player.position, 1.0, 0.1); player.addPotionEffect(Rage.makePotionEffect(100, 0)); }
    if (hits >= 10 && hits < 15) { server.commandManager.executeCommandSilent(server,"particle flame " ~ player.x ~ " " ~ (player.y + 1) ~ " " ~ player.z ~ " 0.5 0.5 0.5 0 10 force @a"); player.sendPlaySoundPacket("minecraft:entity.wither.hurt", "player", player.position, 1.0, 0.1); player.addPotionEffect(Rage.makePotionEffect(100, 1)); }
    if (hits >= 15 && hits < 20) { server.commandManager.executeCommandSilent(server,"particle flame " ~ player.x ~ " " ~ (player.y + 1) ~ " " ~ player.z ~ " 0.5 0.5 0.5 0 10 force @a"); player.sendPlaySoundPacket("minecraft:entity.wither.hurt", "player", player.position, 1.0, 0.1); player.addPotionEffect(Rage.makePotionEffect(100, 2)); }
    if (hits >= 20 && hits < 25) { server.commandManager.executeCommandSilent(server,"particle flame " ~ player.x ~ " " ~ (player.y + 1) ~ " " ~ player.z ~ " 0.5 0.5 0.5 0 10 force @a"); player.sendPlaySoundPacket("minecraft:entity.wither.hurt", "player", player.position, 1.0, 0.1); player.addPotionEffect(Rage.makePotionEffect(100, 3)); }
    if (hits >= 25 && hits < 30) { server.commandManager.executeCommandSilent(server,"particle flame " ~ player.x ~ " " ~ (player.y + 1) ~ " " ~ player.z ~ " 0.5 0.5 0.5 0 10 force @a"); player.sendPlaySoundPacket("minecraft:entity.wither.hurt", "player", player.position, 1.0, 0.1); player.addPotionEffect(Rage.makePotionEffect(100, 4)); }
    if (hits >= 30) { server.commandManager.executeCommandSilent(server,"particle flame " ~ player.x ~ " " ~ (player.y + 1) ~ " " ~ player.z ~ " 0.5 0.5 0.5 0 10 force @a"); player.sendPlaySoundPacket("minecraft:entity.wither.hurt", "player", player.position, 1.0, 0.1); player.addPotionEffect(Rage.makePotionEffect(100, 5)); }
    if (hits > 0) { player.update({hits: 0}); }
});

events.register(function(event3 as crafttweaker.event.PlayerTickEvent){
    if (event3.side == "CLIENT" || event3.phase == "START" || event3.player.world.time % 5 != 0) { return; }
    if isNull(event3.player.getNBT().ForgeData.hits) { return; }

    var player = event3.player;
    var entity as IEntity = player;
    var hits = player.getNBT().ForgeData.hits;
    var world = player.world;

    var helmet as IItemStack = player.getItemInSlot(IEntityEquipmentSlot.head());
    var chestplate as IItemStack = player.getItemInSlot(IEntityEquipmentSlot.chest());
    var leggings as IItemStack = player.getItemInSlot(IEntityEquipmentSlot.legs());
    var boots as IItemStack = player.getItemInSlot(IEntityEquipmentSlot.feet());

    if (hits != 0 && !hasArmor(helmet, chestplate, leggings, boots) || !wildcards.isWithinLimit(player)) { 
        player.update({hits: 0}); 
    }


    if hits >= 30 {
        if world.time %10 != 0 { return; }
        
        if (player.health > 1) { player.sendPlaySoundPacket("minecraft:entity.wither.hurt", "player", player.position, 0.2, 0.5); player.attackEntityFrom(IDamageSource.OUT_OF_WORLD(), 1); entity.native.hurtResistantTime = 0; }
    }


    if (hits >= 25 && hits < 30) {
        if world.time %20 != 0 { return; }
        
        if (player.health > 1) { player.sendPlaySoundPacket("minecraft:entity.wither.hurt", "player", player.position, 0.2, 0.5); player.attackEntityFrom(IDamageSource.OUT_OF_WORLD(), 1); entity.native.hurtResistantTime = 0; }
    }


    if (hits >= 20 && hits < 25) {
        if world.time %40 != 0 { return; }

        if (player.health > 1) { player.sendPlaySoundPacket("minecraft:entity.wither.hurt", "player", player.position, 0.2, 0.5); player.attackEntityFrom(IDamageSource.OUT_OF_WORLD(), 1); entity.native.hurtResistantTime = 0; }
    }

    if (hits >= 15 && hits < 20) {
        if world.time %60 != 0 { return; }
        
        if (player.health > 1) { player.sendPlaySoundPacket("minecraft:entity.wither.hurt", "player", player.position, 0.2, 0.5); player.attackEntityFrom(IDamageSource.OUT_OF_WORLD(), 1); entity.native.hurtResistantTime = 0; }
    }

    if (hits >= 10 && hits < 15) {
        if world.time %80 != 0 { return; }
        
        if (player.health > 1) { player.sendPlaySoundPacket("minecraft:entity.wither.hurt", "player", player.position, 0.2, 0.5); player.attackEntityFrom(IDamageSource.OUT_OF_WORLD(), 1); entity.native.hurtResistantTime = 0; }
    }

    if (hits >= 5 && hits < 10) {
        if world.time %100 != 0 { return; }
        
        if (player.health > 1) { player.sendPlaySoundPacket("minecraft:entity.wither.hurt", "player", player.position, 0.2, 0.5); }
    }
});