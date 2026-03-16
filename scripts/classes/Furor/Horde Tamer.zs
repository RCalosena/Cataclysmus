#reloadable

import crafttweaker.player.IPlayer;
import crafttweaker.entity.IEntityEquipmentSlot;
import crafttweaker.item.IItemStack;
import crafttweaker.entity.IEntityLivingBase;
import crafttweaker.world.IWorld;
import scripts.classes.wildcards;

function hasArmor(helmet as IItemStack, chestplate as IItemStack, legging as IItemStack, boot as IItemStack) as bool {

    var condition = 0;

    val Helmets = [
        <cqrepoured:helmet_heavy_diamond>,
        <metallurgy:haderoth_helmet>,
        <metallurgy:black_steel_helmet>,
        <cqrepoured:helmet_turtle>,
        <metallurgy:vulcanite_helmet>,
        <metallurgy:osmium_helmet>,
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
        <srparasites:armor_helm_sentient>.withTag({horde_tamer: 1})
    ] as IItemStack[];

    val Chestplates = [
        <cqrepoured:chestplate_heavy_diamond>,
        <metallurgy:haderoth_chestplate>,
        <metallurgy:black_steel_chestplate>,
        <cqrepoured:chestplate_turtle>,
        <metallurgy:vulcanite_chestplate>,
        <metallurgy:osmium_chestplate>,
        <minecraft:elytra>,
        <erebus:glider_chestplate>,
        <erebus:glider_chestplate_powered>,
        <srparasites:armor_chest_sentient>.withTag({horde_tamer: 1})
    ] as IItemStack[];

    val Leggings = [
        <cqrepoured:leggings_heavy_diamond>,
        <metallurgy:haderoth_leggings>,
        <metallurgy:black_steel_leggings>,
        <cqrepoured:leggings_turtle>,
        <metallurgy:vulcanite_leggings>,
        <metallurgy:osmium_leggings>,
        <erebus:sprint_leggings>,
        <srparasites:armor_pants_sentient>.withTag({horde_tamer: 1})
    ] as IItemStack[];

    val Boots = [
        <cqrepoured:boots_heavy_diamond>,
        <metallurgy:haderoth_boots>,
        <metallurgy:black_steel_boots>,
        <cqrepoured:boots_turtle>,
        <metallurgy:vulcanite_boots>,
        <metallurgy:osmium_boots>,
        <erebus:jump_boots>,
        <erebus:water_striders>,
        <cqrepoured:boots_cloud>,
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
}

function isSentientArmor(helmet as IItemStack, chestplate as IItemStack, legging as IItemStack, boot as IItemStack) as bool {
    var condition = 0;

    if (<srparasites:armor_helm_sentient>.withTag({horde_tamer: 1}).anyDamage().matches(helmet)) { condition += 1; }
    if (<srparasites:armor_chest_sentient>.withTag({horde_tamer: 1}).anyDamage().matches(chestplate)) { condition += 1; }
    if (<srparasites:armor_pants_sentient>.withTag({horde_tamer: 1}).anyDamage().matches(legging)) { condition += 1; }
    if (<srparasites:armor_boots_sentient>.withTag({horde_tamer: 1}).anyDamage().matches(boot)) { condition += 1; }
    
    for wildcard in wildcards.getWildcards() {
        if wildcard.anyDamage().matches(helmet) { condition += 1; }
        if wildcard.anyDamage().matches(chestplate) { condition += 1; }
        if wildcard.anyDamage().matches(legging) { condition += 1; }
        if wildcard.anyDamage().matches(boot) { condition += 1; }
    }

    if condition == 4 { return true; }

    return false;
}

events.register(function(event as crafttweaker.event.EntityLivingHurtEvent){
    if (event.entityLivingBase.world.isRemote() || isNull(event.damageSource.trueSource) || !event.damageSource.trueSource instanceof IEntityLivingBase) return;

    var entity = event.entityLivingBase;
    var player as IPlayer = entity;
    var damageSource = event.damageSource;
    var playerA as IPlayer = event.damageSource.trueSource;

    var helmet as IItemStack = playerA.getItemInSlot(IEntityEquipmentSlot.head());
    var chestplate as IItemStack = playerA.getItemInSlot(IEntityEquipmentSlot.chest());
    var leggings as IItemStack = playerA.getItemInSlot(IEntityEquipmentSlot.legs());
    var boots as IItemStack = playerA.getItemInSlot(IEntityEquipmentSlot.feet());

    if (damageSource.explosion && event.damageSource.trueSource instanceof IPlayer && isSentientArmor(helmet, chestplate, leggings, boots) && wildcards.isWithinLimit(player)) {
        entity.addPotionEffect(<potion:lycanitesmobs:paralysis>.makePotionEffect(100, 0));
    }
});

events.register(function(event2 as crafttweaker.event.EntityLivingJumpEvent) {
    if (event2.entityLivingBase.world.isRemote() || !event2.entityLivingBase instanceof IPlayer) return;

    var player as IPlayer = event2.entityLivingBase;
    var helmet as IItemStack = player.getItemInSlot(IEntityEquipmentSlot.head());
    var chestplate as IItemStack = player.getItemInSlot(IEntityEquipmentSlot.chest());
    var leggings as IItemStack = player.getItemInSlot(IEntityEquipmentSlot.legs());
    var boots as IItemStack = player.getItemInSlot(IEntityEquipmentSlot.feet());

    if (!player.isSneaking || 
        !player.isPotionActive(<potion:srparasites:rage>) || 
        !hasArmor(helmet, chestplate, leggings, boots) || 
        !wildcards.isWithinLimit(player)) 
    { return; }

    val worldObj as IWorld = player.world;
            
    player.addPotionEffect(<potion:potioncore:vulnerable>.makePotionEffect(200, player.getActivePotionEffect(<potion:srparasites:rage>).amplifier)); worldObj.performExplosion(event2.entityLivingBase, player.x, player.y, player.z, (player.getActivePotionEffect(<potion:srparasites:rage>).amplifier + 1), false, false); player.removePotionEffect(<potion:srparasites:rage>);
});

events.register(function(event3 as crafttweaker.event.PlayerTickEvent){
    if (event3.side == "CLIENT" || event3.phase == "START" || event3.player.world.time %5 != 0) return;

    var player = event3.player;

    var helmet as IItemStack = player.getItemInSlot(IEntityEquipmentSlot.head());
    var chestplate as IItemStack = player.getItemInSlot(IEntityEquipmentSlot.chest());
    var leggings as IItemStack = player.getItemInSlot(IEntityEquipmentSlot.legs());
    var boots as IItemStack = player.getItemInSlot(IEntityEquipmentSlot.feet());

    if (!hasArmor(helmet, chestplate, leggings, boots) || !wildcards.isWithinLimit(player)) return;

    if (!isNull(event3.player.getNBT().ForgeData.hits_per_second) && event3.player.getNBT().ForgeData.hits_per_second > 0) { 
        if event3.player.world.time %100 != 0 return;
        event3.player.update({hits_per_second: 0});
    }
});

events.register(function(event1 as crafttweaker.event.EntityLivingDamageEvent){
    if (event1.entityLivingBase.world.isRemote() || !event1.entityLivingBase.isPotionActive(<potion:srparasites:rage>) || !event1.entityLivingBase instanceof IPlayer) return;

    var player as IPlayer = event1.entityLivingBase;
    var helmet as IItemStack = player.getItemInSlot(IEntityEquipmentSlot.head());
    var chestplate as IItemStack = player.getItemInSlot(IEntityEquipmentSlot.chest());
    var leggings as IItemStack = player.getItemInSlot(IEntityEquipmentSlot.legs());
    var boots as IItemStack = player.getItemInSlot(IEntityEquipmentSlot.feet());

    if (!hasArmor(helmet, chestplate, leggings, boots) || !wildcards.isWithinLimit(player)) return;

    event1.amount *= 0.6 - (0.1 * player.getActivePotionEffect(<potion:srparasites:rage>).amplifier); 
});