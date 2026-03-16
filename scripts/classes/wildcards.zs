#reloadable
#priority 9999

import crafttweaker.item.IItemStack;
import crafttweaker.player.IPlayer;
import crafttweaker.entity.IEntityEquipmentSlot;
import crafttweaker.entity.AttributeModifier;
import crafttweaker.entity.AttributeInstance;

function getWildcards() as IItemStack[] {
    return [
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
            <minecraft:elytra>,
            <erebus:glider_chestplate>,
            <erebus:glider_chestplate_powered>,
            <erebus:sprint_leggings>,
            <erebus:jump_boots>,
            <erebus:water_striders>,
            <cqrepoured:boots_cloud>
    ];
}

function isWithinLimit(player as IPlayer) as bool {
        
    var piecesWorn = 0;
    var head = player.getItemInSlot(IEntityEquipmentSlot.head());
    var body = player.getItemInSlot(IEntityEquipmentSlot.chest());
    var legs = player.getItemInSlot(IEntityEquipmentSlot.legs());
    var feet = player.getItemInSlot(IEntityEquipmentSlot.feet());

    for wildcard in getWildcards() {
        if wildcard.anyDamage().matches(head) { piecesWorn += 1; }
        if wildcard.anyDamage().matches(body) { piecesWorn += 1; }
        if wildcard.anyDamage().matches(legs) { piecesWorn += 1; }
        if wildcard.anyDamage().matches(feet) { piecesWorn += 1; }
    }

    if piecesWorn <= 2 { return true; }

    return false;
}

function wildcardCount(player as IPlayer) as int {
    var piecesWorn = 0;
    var head = player.getItemInSlot(IEntityEquipmentSlot.head());
    var body = player.getItemInSlot(IEntityEquipmentSlot.chest());
    var legs = player.getItemInSlot(IEntityEquipmentSlot.legs());
    var feet = player.getItemInSlot(IEntityEquipmentSlot.feet());

    for wildcard in getWildcards() {
        if wildcard.anyDamage().matches(head) { piecesWorn += 1; }
        if wildcard.anyDamage().matches(body) { piecesWorn += 1; }
        if wildcard.anyDamage().matches(legs) { piecesWorn += 1; }
        if wildcard.anyDamage().matches(feet) { piecesWorn += 1; }
    }

    return piecesWorn;
}

// apply different stats for armor sets with wildcards

function copperBonus(helmet as IItemStack, chestplate as IItemStack, legging as IItemStack, boot as IItemStack) as bool {

    var condition = 0;

    if (<mysticalworld:copper_helmet>.anyDamage().matches(helmet)) { condition += 1; }
    if (<mysticalworld:copper_chestplate>.anyDamage().matches(chestplate)) { condition += 1; }
    if (<mysticalworld:copper_leggings>.anyDamage().matches(legging)) { condition += 1; }
    if (<mysticalworld:copper_boots>.anyDamage().matches(boot)) { condition += 1; }

    for wildcard in getWildcards() {
        if (wildcard.anyDamage().matches(helmet)) { condition += 1; }
        if (wildcard.anyDamage().matches(chestplate)) { condition += 1; }
        if (wildcard.anyDamage().matches(legging)) { condition += 1; }
        if (wildcard.anyDamage().matches(boot)) { condition += 1; }
    }

    if condition >= 4 { return true; }

    return false;
}

function leatherBonus(helmet as IItemStack, chestplate as IItemStack, legging as IItemStack, boot as IItemStack) as bool {

    var condition = 0;

    if (<minecraft:leather_helmet>.anyDamage().matches(helmet)) { condition += 1; }
    if (<minecraft:leather_chestplate>.anyDamage().matches(chestplate)) { condition += 1; }
    if (<minecraft:leather_leggings>.anyDamage().matches(legging)) { condition += 1; }
    if (<minecraft:leather_boots>.anyDamage().matches(boot)) { condition += 1; }

    for wildcard in getWildcards() {
        if (wildcard.anyDamage().matches(helmet)) { condition += 1; }
        if (wildcard.anyDamage().matches(chestplate)) { condition += 1; }
        if (wildcard.anyDamage().matches(legging)) { condition += 1; }
        if (wildcard.anyDamage().matches(boot)) { condition += 1; }
    }

    if condition >= 4 { return true; }

    return false;
}

function chainBonus(helmet as IItemStack, chestplate as IItemStack, legging as IItemStack, boot as IItemStack) as bool {

    var condition = 0;

    if (<minecraft:chainmail_helmet>.anyDamage().matches(helmet)) { condition += 1; }
    if (<minecraft:chainmail_chestplate>.anyDamage().matches(chestplate)) { condition += 1; }
    if (<minecraft:chainmail_leggings>.anyDamage().matches(legging)) { condition += 1; }
    if (<minecraft:chainmail_boots>.anyDamage().matches(boot)) { condition += 1; }

    for wildcard in getWildcards() {
        if (wildcard.anyDamage().matches(helmet)) { condition += 1; }
        if (wildcard.anyDamage().matches(chestplate)) { condition += 1; }
        if (wildcard.anyDamage().matches(legging)) { condition += 1; }
        if (wildcard.anyDamage().matches(boot)) { condition += 1; }
    }

    if condition >= 4 { return true; }

    return false;
}

function ironBonus(helmet as IItemStack, chestplate as IItemStack, legging as IItemStack, boot as IItemStack) as bool {

    var condition = 0;

    val ironArmors = [
        <cqrepoured:helmet_iron_dyable>,
        <cqrepoured:chestplate_iron_dyable>,
        <cqrepoured:leggings_iron_dyable>,
        <cqrepoured:boots_iron_dyable>,
        <minecraft:iron_helmet>,
        <minecraft:iron_chestplate>,
        <minecraft:iron_leggings>,
        <minecraft:iron_boots>
    ] as IItemStack[];

    for ironArmor in ironArmors {
        if (ironArmor.anyDamage().matches(helmet)) { condition += 1; }
        if (ironArmor.anyDamage().matches(chestplate)) { condition += 1; }
        if (ironArmor.anyDamage().matches(legging)) { condition += 1; }
        if (ironArmor.anyDamage().matches(boot)) { condition += 1; }
    }

    for wildcard in getWildcards() {
        if (wildcard.anyDamage().matches(helmet)) { condition += 1; }
        if (wildcard.anyDamage().matches(chestplate)) { condition += 1; }
        if (wildcard.anyDamage().matches(legging)) { condition += 1; }
        if (wildcard.anyDamage().matches(boot)) { condition += 1; }
    }

    if condition >= 4 { return true; }

    return false;
}

function diamondBonus(helmet as IItemStack, chestplate as IItemStack, legging as IItemStack, boot as IItemStack) as bool {

    var condition = 0;

    val diamondArmors = [
        <cqrepoured:helmet_diamond_dyable>,
        <cqrepoured:chestplate_diamond_dyable>,
        <cqrepoured:leggings_diamond_dyable>,
        <cqrepoured:boots_diamond_dyable>,
        <minecraft:diamond_helmet>,
        <minecraft:diamond_chestplate>,
        <minecraft:diamond_leggings>,
        <minecraft:diamond_boots>
    ] as IItemStack[];

    for diamondArmor in diamondArmors {
        if (diamondArmor.anyDamage().matches(helmet)) { condition += 1; }
        if (diamondArmor.anyDamage().matches(chestplate)) { condition += 1; }
        if (diamondArmor.anyDamage().matches(legging)) { condition += 1; }
        if (diamondArmor.anyDamage().matches(boot)) { condition += 1; }
    }

    for wildcard in getWildcards() {
        if (wildcard.anyDamage().matches(helmet)) { condition += 1; }
        if (wildcard.anyDamage().matches(chestplate)) { condition += 1; }
        if (wildcard.anyDamage().matches(legging)) { condition += 1; }
        if (wildcard.anyDamage().matches(boot)) { condition += 1; }
    }

    if condition >= 4 { return true; }

    return false;
}

function goldenBonus(helmet as IItemStack, chestplate as IItemStack, legging as IItemStack, boot as IItemStack) as bool {

    var condition = 0;

    if (<minecraft:golden_helmet>.anyDamage().matches(helmet)) { condition += 1; }
    if (<minecraft:golden_chestplate>.anyDamage().matches(chestplate)) { condition += 1; }
    if (<minecraft:golden_leggings>.anyDamage().matches(legging)) { condition += 1; }
    if (<minecraft:golden_boots>.anyDamage().matches(boot)) { condition += 1; }

    for wildcard in getWildcards() {
        if (wildcard.anyDamage().matches(helmet)) { condition += 1; }
        if (wildcard.anyDamage().matches(chestplate)) { condition += 1; }
        if (wildcard.anyDamage().matches(legging)) { condition += 1; }
        if (wildcard.anyDamage().matches(boot)) { condition += 1; }
    }

    if condition >= 4 { return true; }

    return false;
}

function slimeBonus(helmet as IItemStack, chestplate as IItemStack, legging as IItemStack, boot as IItemStack) as bool {

    var condition = 0;

    if (<cqrepoured:helmet_slime>.anyDamage().matches(helmet)) { condition += 1; }
    if (<cqrepoured:chestplate_slime>.anyDamage().matches(chestplate)) { condition += 1; }
    if (<cqrepoured:leggings_slime>.anyDamage().matches(legging)) { condition += 1; }
    if (<cqrepoured:boots_slime>.anyDamage().matches(boot)) { condition += 1; }

    for wildcard in getWildcards() {
        if (wildcard.anyDamage().matches(helmet)) { condition += 1; }
        if (wildcard.anyDamage().matches(chestplate)) { condition += 1; }
        if (wildcard.anyDamage().matches(legging)) { condition += 1; }
        if (wildcard.anyDamage().matches(boot)) { condition += 1; }
    }

    if condition >= 4 { return true; }

    return false;
}

function quicksilverBonus(helmet as IItemStack, chestplate as IItemStack, legging as IItemStack, boot as IItemStack) as bool {

    var condition = 0;

    if (<metallurgy:quicksilver_helmet>.anyDamage().matches(helmet)) { condition += 1; }
    if (<metallurgy:quicksilver_chestplate>.anyDamage().matches(chestplate)) { condition += 1; }
    if (<metallurgy:quicksilver_leggings>.anyDamage().matches(legging)) { condition += 1; }
    if (<metallurgy:quicksilver_boots>.anyDamage().matches(boot)) { condition += 1; }

    for wildcard in getWildcards() {
        if (wildcard.anyDamage().matches(helmet)) { condition += 1; }
        if (wildcard.anyDamage().matches(chestplate)) { condition += 1; }
        if (wildcard.anyDamage().matches(legging)) { condition += 1; }
        if (wildcard.anyDamage().matches(boot)) { condition += 1; }
    }

    if condition >= 4 { return true; }

    return false;
}

function hepatizonBonus(helmet as IItemStack, chestplate as IItemStack, legging as IItemStack, boot as IItemStack) as bool {

    var condition = 0;

    if (<metallurgy:hepatizon_helmet>.anyDamage().matches(helmet)) { condition += 1; }
    if (<metallurgy:hepatizon_chestplate>.anyDamage().matches(chestplate)) { condition += 1; }
    if (<metallurgy:hepatizon_leggings>.anyDamage().matches(legging)) { condition += 1; }
    if (<metallurgy:hepatizon_boots>.anyDamage().matches(boot)) { condition += 1; }

    for wildcard in getWildcards() {
        if (wildcard.anyDamage().matches(helmet)) { condition += 1; }
        if (wildcard.anyDamage().matches(chestplate)) { condition += 1; }
        if (wildcard.anyDamage().matches(legging)) { condition += 1; }
        if (wildcard.anyDamage().matches(boot)) { condition += 1; }
    }

    if condition >= 4 { return true; }

    return false;
}

function oureclaseBonus(helmet as IItemStack, chestplate as IItemStack, legging as IItemStack, boot as IItemStack) as bool {

    var condition = 0;

    if (<metallurgy:oureclase_helmet>.anyDamage().matches(helmet)) { condition += 1; }
    if (<metallurgy:oureclase_chestplate>.anyDamage().matches(chestplate)) { condition += 1; }
    if (<metallurgy:oureclase_leggings>.anyDamage().matches(legging)) { condition += 1; }
    if (<metallurgy:oureclase_boots>.anyDamage().matches(boot)) { condition += 1; }

    for wildcard in getWildcards() {
        if (wildcard.anyDamage().matches(helmet)) { condition += 1; }
        if (wildcard.anyDamage().matches(chestplate)) { condition += 1; }
        if (wildcard.anyDamage().matches(legging)) { condition += 1; }
        if (wildcard.anyDamage().matches(boot)) { condition += 1; }
    }

    if condition >= 4 { return true; }

    return false;
}

function desichalkosBonus(helmet as IItemStack, chestplate as IItemStack, legging as IItemStack, boot as IItemStack) as bool {

    var condition = 0;

    if (<metallurgy:desichalkos_helmet>.anyDamage().matches(helmet)) { condition += 1; }
    if (<metallurgy:desichalkos_chestplate>.anyDamage().matches(chestplate)) { condition += 1; }
    if (<metallurgy:desichalkos_leggings>.anyDamage().matches(legging)) { condition += 1; }
    if (<metallurgy:desichalkos_boots>.anyDamage().matches(boot)) { condition += 1; }

    for wildcard in getWildcards() {
        if (wildcard.anyDamage().matches(helmet)) { condition += 1; }
        if (wildcard.anyDamage().matches(chestplate)) { condition += 1; }
        if (wildcard.anyDamage().matches(legging)) { condition += 1; }
        if (wildcard.anyDamage().matches(boot)) { condition += 1; }
    }

    if condition >= 4 { return true; }

    return false;
}

function astralSilverBonus(helmet as IItemStack, chestplate as IItemStack, legging as IItemStack, boot as IItemStack) as bool {

    var condition = 0;

    if (<metallurgy:astral_silver_helmet>.anyDamage().matches(helmet)) { condition += 1; }
    if (<metallurgy:astral_silver_chestplate>.anyDamage().matches(chestplate)) { condition += 1; }
    if (<metallurgy:astral_silver_leggings>.anyDamage().matches(legging)) { condition += 1; }
    if (<metallurgy:astral_silver_boots>.anyDamage().matches(boot)) { condition += 1; }

    for wildcard in getWildcards() {
        if (wildcard.anyDamage().matches(helmet)) { condition += 1; }
        if (wildcard.anyDamage().matches(chestplate)) { condition += 1; }
        if (wildcard.anyDamage().matches(legging)) { condition += 1; }
        if (wildcard.anyDamage().matches(boot)) { condition += 1; }
    }

    if condition >= 4 { return true; }

    return false;
}

function shadowIronBonus(helmet as IItemStack, chestplate as IItemStack, legging as IItemStack, boot as IItemStack) as bool {

    var condition = 0;

    if (<metallurgy:shadow_iron_helmet>.anyDamage().matches(helmet)) { condition += 1; }
    if (<metallurgy:shadow_iron_chestplate>.anyDamage().matches(chestplate)) { condition += 1; }
    if (<metallurgy:shadow_iron_leggings>.anyDamage().matches(legging)) { condition += 1; }
    if (<metallurgy:shadow_iron_boots>.anyDamage().matches(boot)) { condition += 1; }

    for wildcard in getWildcards() {
        if (wildcard.anyDamage().matches(helmet)) { condition += 1; }
        if (wildcard.anyDamage().matches(chestplate)) { condition += 1; }
        if (wildcard.anyDamage().matches(legging)) { condition += 1; }
        if (wildcard.anyDamage().matches(boot)) { condition += 1; }
    }

    if condition >= 4 { return true; }

    return false;
}

function eximiteBonus(helmet as IItemStack, chestplate as IItemStack, legging as IItemStack, boot as IItemStack) as bool {

    var condition = 0;

    if (<metallurgy:eximite_helmet>.anyDamage().matches(helmet)) { condition += 1; }
    if (<metallurgy:eximite_chestplate>.anyDamage().matches(chestplate)) { condition += 1; }
    if (<metallurgy:eximite_leggings>.anyDamage().matches(legging)) { condition += 1; }
    if (<metallurgy:eximite_boots>.anyDamage().matches(boot)) { condition += 1; }

    for wildcard in getWildcards() {
        if (wildcard.anyDamage().matches(helmet)) { condition += 1; }
        if (wildcard.anyDamage().matches(chestplate)) { condition += 1; }
        if (wildcard.anyDamage().matches(legging)) { condition += 1; }
        if (wildcard.anyDamage().matches(boot)) { condition += 1; }
    }

    if condition >= 4 { return true; }

    return false;
}

function mutantSkeletonBonus(helmet as IItemStack, chestplate as IItemStack, legging as IItemStack, boot as IItemStack) as bool {

    var condition = 0;

    if (<mutantbeasts:mutant_skeleton_skull>.anyDamage().matches(helmet)) { condition += 1; }
    if (<mutantbeasts:mutant_skeleton_chestplate>.anyDamage().matches(chestplate)) { condition += 1; }
    if (<mutantbeasts:mutant_skeleton_leggings>.anyDamage().matches(legging)) { condition += 1; }
    if (<mutantbeasts:mutant_skeleton_boots>.anyDamage().matches(boot)) { condition += 1; }

    for wildcard in getWildcards() {
        if (wildcard.anyDamage().matches(helmet)) { condition += 1; }
        if (wildcard.anyDamage().matches(chestplate)) { condition += 1; }
        if (wildcard.anyDamage().matches(legging)) { condition += 1; }
        if (wildcard.anyDamage().matches(boot)) { condition += 1; }
    }

    if condition >= 4 { return true; }

    return false;
}

function shadowSteelBonus(helmet as IItemStack, chestplate as IItemStack, legging as IItemStack, boot as IItemStack) as bool {

    var condition = 0;

    if (<metallurgy:shadow_steel_helmet>.anyDamage().matches(helmet)) { condition += 1; }
    if (<metallurgy:shadow_steel_chestplate>.anyDamage().matches(chestplate)) { condition += 1; }
    if (<metallurgy:shadow_steel_leggings>.anyDamage().matches(legging)) { condition += 1; }
    if (<metallurgy:shadow_steel_boots>.anyDamage().matches(boot)) { condition += 1; }

    for wildcard in getWildcards() {
        if (wildcard.anyDamage().matches(helmet)) { condition += 1; }
        if (wildcard.anyDamage().matches(chestplate)) { condition += 1; }
        if (wildcard.anyDamage().matches(legging)) { condition += 1; }
        if (wildcard.anyDamage().matches(boot)) { condition += 1; }
    }

    if condition >= 4 { return true; }

    return false;
}

function amordrineBonus(helmet as IItemStack, chestplate as IItemStack, legging as IItemStack, boot as IItemStack) as bool {

    var condition = 0;

    if (<metallurgy:amordrine_helmet>.anyDamage().matches(helmet)) { condition += 1; }
    if (<metallurgy:amordrine_chestplate>.anyDamage().matches(chestplate)) { condition += 1; }
    if (<metallurgy:amordrine_leggings>.anyDamage().matches(legging)) { condition += 1; }
    if (<metallurgy:amordrine_boots>.anyDamage().matches(boot)) { condition += 1; }

    for wildcard in getWildcards() {
        if (wildcard.anyDamage().matches(helmet)) { condition += 1; }
        if (wildcard.anyDamage().matches(chestplate)) { condition += 1; }
        if (wildcard.anyDamage().matches(legging)) { condition += 1; }
        if (wildcard.anyDamage().matches(boot)) { condition += 1; }
    }

    if condition >= 4 { return true; }

    return false;
}

function jadeBonus(helmet as IItemStack, chestplate as IItemStack, legging as IItemStack, boot as IItemStack) as bool {

    var condition = 0;

    if (<erebus:jade_helmet>.anyDamage().matches(helmet)) { condition += 1; }
    if (<erebus:jade_chestplate>.anyDamage().matches(chestplate)) { condition += 1; }
    if (<erebus:jade_leggings>.anyDamage().matches(legging)) { condition += 1; }
    if (<erebus:jade_boots>.anyDamage().matches(boot)) { condition += 1; }

    for wildcard in getWildcards() {
        if (wildcard.anyDamage().matches(helmet)) { condition += 1; }
        if (wildcard.anyDamage().matches(chestplate)) { condition += 1; }
        if (wildcard.anyDamage().matches(legging)) { condition += 1; }
        if (wildcard.anyDamage().matches(boot)) { condition += 1; }
    }

    if condition >= 4 { return true; }

    return false;
}

function bronzeBonus(helmet as IItemStack, chestplate as IItemStack, legging as IItemStack, boot as IItemStack) as bool {

    var condition = 0;

    if (<metallurgy:bronze_helmet>.anyDamage().matches(helmet)) { condition += 1; }
    if (<metallurgy:bronze_chestplate>.anyDamage().matches(chestplate)) { condition += 1; }
    if (<metallurgy:bronze_leggings>.anyDamage().matches(legging)) { condition += 1; }
    if (<metallurgy:bronze_boots>.anyDamage().matches(boot)) { condition += 1; }

    for wildcard in getWildcards() {
        if (wildcard.anyDamage().matches(helmet)) { condition += 1; }
        if (wildcard.anyDamage().matches(chestplate)) { condition += 1; }
        if (wildcard.anyDamage().matches(legging)) { condition += 1; }
        if (wildcard.anyDamage().matches(boot)) { condition += 1; }
    }

    if condition >= 4 { return true; }

    return false;
}

function steelBonus(helmet as IItemStack, chestplate as IItemStack, legging as IItemStack, boot as IItemStack) as bool {

    var condition = 0;

    if (<metallurgy:steel_helmet>.anyDamage().matches(helmet)) { condition += 1; }
    if (<metallurgy:steel_chestplate>.anyDamage().matches(chestplate)) { condition += 1; }
    if (<metallurgy:steel_leggings>.anyDamage().matches(legging)) { condition += 1; }
    if (<metallurgy:steel_boots>.anyDamage().matches(boot)) { condition += 1; }

    for wildcard in getWildcards() {
        if (wildcard.anyDamage().matches(helmet)) { condition += 1; }
        if (wildcard.anyDamage().matches(chestplate)) { condition += 1; }
        if (wildcard.anyDamage().matches(legging)) { condition += 1; }
        if (wildcard.anyDamage().matches(boot)) { condition += 1; }
    }

    if condition >= 4 { return true; }

    return false;
}

function heavyIronBonus(helmet as IItemStack, chestplate as IItemStack, legging as IItemStack, boot as IItemStack) as bool {

    var condition = 0;

    if (<cqrepoured:helmet_heavy_iron>.anyDamage().matches(helmet)) { condition += 1; }
    if (<cqrepoured:chestplate_heavy_iron>.anyDamage().matches(chestplate)) { condition += 1; }
    if (<cqrepoured:leggings_heavy_iron>.anyDamage().matches(legging)) { condition += 1; }
    if (<cqrepoured:boots_heavy_iron>.anyDamage().matches(boot)) { condition += 1; }

    for wildcard in getWildcards() {
        if (wildcard.anyDamage().matches(helmet)) { condition += 1; }
        if (wildcard.anyDamage().matches(chestplate)) { condition += 1; }
        if (wildcard.anyDamage().matches(legging)) { condition += 1; }
        if (wildcard.anyDamage().matches(boot)) { condition += 1; }
    }

    if condition >= 4 { return true; }

    return false;
}

function heavyDiamondBonus(helmet as IItemStack, chestplate as IItemStack, legging as IItemStack, boot as IItemStack) as bool {

    var condition = 0;

    if (<cqrepoured:helmet_heavy_diamond>.anyDamage().matches(helmet)) { condition += 1; }
    if (<cqrepoured:chestplate_heavy_diamond>.anyDamage().matches(chestplate)) { condition += 1; }
    if (<cqrepoured:leggings_heavy_diamond>.anyDamage().matches(legging)) { condition += 1; }
    if (<cqrepoured:boots_heavy_diamond>.anyDamage().matches(boot)) { condition += 1; }

    for wildcard in getWildcards() {
        if (wildcard.anyDamage().matches(helmet)) { condition += 1; }
        if (wildcard.anyDamage().matches(chestplate)) { condition += 1; }
        if (wildcard.anyDamage().matches(legging)) { condition += 1; }
        if (wildcard.anyDamage().matches(boot)) { condition += 1; }
    }

    if condition >= 4 { return true; }

    return false;
}

function bullBonus(helmet as IItemStack, chestplate as IItemStack, legging as IItemStack, boot as IItemStack) as bool {

    var condition = 0;

    if (<cqrepoured:helmet_bull>.anyDamage().matches(helmet)) { condition += 1; }
    if (<cqrepoured:chestplate_bull>.anyDamage().matches(chestplate)) { condition += 1; }
    if (<cqrepoured:leggings_bull>.anyDamage().matches(legging)) { condition += 1; }
    if (<cqrepoured:boots_bull>.anyDamage().matches(boot)) { condition += 1; }

    for wildcard in getWildcards() {
        if (wildcard.anyDamage().matches(helmet)) { condition += 1; }
        if (wildcard.anyDamage().matches(chestplate)) { condition += 1; }
        if (wildcard.anyDamage().matches(legging)) { condition += 1; }
        if (wildcard.anyDamage().matches(boot)) { condition += 1; }
    }

    if condition >= 4 { return true; }

    return false;
}

function turtleBonus(helmet as IItemStack, chestplate as IItemStack, legging as IItemStack, boot as IItemStack) as bool {

    var condition = 0;

    if (<cqrepoured:helmet_turtle>.anyDamage().matches(helmet)) { condition += 1; }
    if (<cqrepoured:chestplate_turtle>.anyDamage().matches(chestplate)) { condition += 1; }
    if (<cqrepoured:leggings_turtle>.anyDamage().matches(legging)) { condition += 1; }
    if (<cqrepoured:boots_turtle>.anyDamage().matches(boot)) { condition += 1; }

    for wildcard in getWildcards() {
        if (wildcard.anyDamage().matches(helmet)) { condition += 1; }
        if (wildcard.anyDamage().matches(chestplate)) { condition += 1; }
        if (wildcard.anyDamage().matches(legging)) { condition += 1; }
        if (wildcard.anyDamage().matches(boot)) { condition += 1; }
    }

    if condition >= 4 { return true; }

    return false;
}

function vulcaniteBonus(helmet as IItemStack, chestplate as IItemStack, legging as IItemStack, boot as IItemStack) as bool {

    var condition = 0;

    if (<metallurgy:vulcanite_helmet>.anyDamage().matches(helmet)) { condition += 1; }
    if (<metallurgy:vulcanite_chestplate>.anyDamage().matches(chestplate)) { condition += 1; }
    if (<metallurgy:vulcanite_leggings>.anyDamage().matches(legging)) { condition += 1; }
    if (<metallurgy:vulcanite_boots>.anyDamage().matches(boot)) { condition += 1; }

    for wildcard in getWildcards() {
        if (wildcard.anyDamage().matches(helmet)) { condition += 1; }
        if (wildcard.anyDamage().matches(chestplate)) { condition += 1; }
        if (wildcard.anyDamage().matches(legging)) { condition += 1; }
        if (wildcard.anyDamage().matches(boot)) { condition += 1; }
    }

    if condition >= 4 { return true; }

    return false;
}

function electrumBonus(helmet as IItemStack, chestplate as IItemStack, legging as IItemStack, boot as IItemStack) as bool {

    var condition = 0;

    if (<metallurgy:electrum_helmet>.anyDamage().matches(helmet)) { condition += 1; }
    if (<metallurgy:electrum_chestplate>.anyDamage().matches(chestplate)) { condition += 1; }
    if (<metallurgy:electrum_leggings>.anyDamage().matches(legging)) { condition += 1; }
    if (<metallurgy:electrum_boots>.anyDamage().matches(boot)) { condition += 1; }

    for wildcard in getWildcards() {
        if (wildcard.anyDamage().matches(helmet)) { condition += 1; }
        if (wildcard.anyDamage().matches(chestplate)) { condition += 1; }
        if (wildcard.anyDamage().matches(legging)) { condition += 1; }
        if (wildcard.anyDamage().matches(boot)) { condition += 1; }
    }

    if condition >= 4 { return true; }

    return false;
}

function osmiumBonus(helmet as IItemStack, chestplate as IItemStack, legging as IItemStack, boot as IItemStack) as bool {

    var condition = 0;

    if (<metallurgy:osmium_helmet>.anyDamage().matches(helmet)) { condition += 1; }
    if (<metallurgy:osmium_chestplate>.anyDamage().matches(chestplate)) { condition += 1; }
    if (<metallurgy:osmium_leggings>.anyDamage().matches(legging)) { condition += 1; }
    if (<metallurgy:osmium_boots>.anyDamage().matches(boot)) { condition += 1; }

    for wildcard in getWildcards() {
        if (wildcard.anyDamage().matches(helmet)) { condition += 1; }
        if (wildcard.anyDamage().matches(chestplate)) { condition += 1; }
        if (wildcard.anyDamage().matches(legging)) { condition += 1; }
        if (wildcard.anyDamage().matches(boot)) { condition += 1; }
    }

    if condition >= 4 { return true; }

    return false;
}

function orichalcumBonus(helmet as IItemStack, chestplate as IItemStack, legging as IItemStack, boot as IItemStack) as bool {

    var condition = 0;

    if (<metallurgy:orichalcum_helmet>.anyDamage().matches(helmet)) { condition += 1; }
    if (<metallurgy:orichalcum_chestplate>.anyDamage().matches(chestplate)) { condition += 1; }
    if (<metallurgy:orichalcum_leggings>.anyDamage().matches(legging)) { condition += 1; }
    if (<metallurgy:orichalcum_boots>.anyDamage().matches(boot)) { condition += 1; }

    for wildcard in getWildcards() {
        if (wildcard.anyDamage().matches(helmet)) { condition += 1; }
        if (wildcard.anyDamage().matches(chestplate)) { condition += 1; }
        if (wildcard.anyDamage().matches(legging)) { condition += 1; }
        if (wildcard.anyDamage().matches(boot)) { condition += 1; }
    }

    if condition >= 4 { return true; }

    return false;
}

function lutetiumBonus(helmet as IItemStack, chestplate as IItemStack, legging as IItemStack, boot as IItemStack) as bool {

    var condition = 0;

    if (<metallurgy:lutetium_helmet>.anyDamage().matches(helmet)) { condition += 1; }
    if (<metallurgy:lutetium_chestplate>.anyDamage().matches(chestplate)) { condition += 1; }
    if (<metallurgy:lutetium_leggings>.anyDamage().matches(legging)) { condition += 1; }
    if (<metallurgy:lutetium_boots>.anyDamage().matches(boot)) { condition += 1; }

    for wildcard in getWildcards() {
        if (wildcard.anyDamage().matches(helmet)) { condition += 1; }
        if (wildcard.anyDamage().matches(chestplate)) { condition += 1; }
        if (wildcard.anyDamage().matches(legging)) { condition += 1; }
        if (wildcard.anyDamage().matches(boot)) { condition += 1; }
    }

    if condition >= 4 { return true; }

    return false;
}

function haderothBonus(helmet as IItemStack, chestplate as IItemStack, legging as IItemStack, boot as IItemStack) as bool {

    var condition = 0;

    if (<metallurgy:haderoth_helmet>.anyDamage().matches(helmet)) { condition += 1; }
    if (<metallurgy:haderoth_chestplate>.anyDamage().matches(chestplate)) { condition += 1; }
    if (<metallurgy:haderoth_leggings>.anyDamage().matches(legging)) { condition += 1; }
    if (<metallurgy:haderoth_boots>.anyDamage().matches(boot)) { condition += 1; }

    for wildcard in getWildcards() {
        if (wildcard.anyDamage().matches(helmet)) { condition += 1; }
        if (wildcard.anyDamage().matches(chestplate)) { condition += 1; }
        if (wildcard.anyDamage().matches(legging)) { condition += 1; }
        if (wildcard.anyDamage().matches(boot)) { condition += 1; }
    }

    if condition >= 4 { return true; }

    return false;
}

function tenebrumBonus(helmet as IItemStack, chestplate as IItemStack, legging as IItemStack, boot as IItemStack) as bool {

    var condition = 0;

    if (<midnight:tenebrum_helmet>.anyDamage().matches(helmet)) { condition += 1; }
    if (<midnight:tenebrum_chestplate>.anyDamage().matches(chestplate)) { condition += 1; }
    if (<midnight:tenebrum_leggings>.anyDamage().matches(legging)) { condition += 1; }
    if (<midnight:tenebrum_boots>.anyDamage().matches(boot)) { condition += 1; }

    for wildcard in getWildcards() {
        if (wildcard.anyDamage().matches(helmet)) { condition += 1; }
        if (wildcard.anyDamage().matches(chestplate)) { condition += 1; }
        if (wildcard.anyDamage().matches(legging)) { condition += 1; }
        if (wildcard.anyDamage().matches(boot)) { condition += 1; }
    }

    if condition >= 4 { return true; }

    return false;
}

function blackSteelBonus(helmet as IItemStack, chestplate as IItemStack, legging as IItemStack, boot as IItemStack) as bool {

    var condition = 0;

    if (<metallurgy:black_steel_helmet>.anyDamage().matches(helmet)) { condition += 1; }
    if (<metallurgy:black_steel_chestplate>.anyDamage().matches(chestplate)) { condition += 1; }
    if (<metallurgy:black_steel_leggings>.anyDamage().matches(legging)) { condition += 1; }
    if (<metallurgy:black_steel_boots>.anyDamage().matches(boot)) { condition += 1; }

    for wildcard in getWildcards() {
        if (wildcard.anyDamage().matches(helmet)) { condition += 1; }
        if (wildcard.anyDamage().matches(chestplate)) { condition += 1; }
        if (wildcard.anyDamage().matches(legging)) { condition += 1; }
        if (wildcard.anyDamage().matches(boot)) { condition += 1; }
    }

    if condition >= 4 { return true; }

    return false;
}

function rhinoBonus(helmet as IItemStack, chestplate as IItemStack, legging as IItemStack, boot as IItemStack) as bool {

    var condition = 0;

    if (<erebus:rhino_exoskeleton_helmet>.anyDamage().matches(helmet)) { condition += 1; }
    if (<erebus:rhino_exoskeleton_chestplate>.anyDamage().matches(chestplate)) { condition += 1; }
    if (<erebus:rhino_exoskeleton_leggings>.anyDamage().matches(legging)) { condition += 1; }
    if (<erebus:rhino_exoskeleton_boots>.anyDamage().matches(boot)) { condition += 1; }

    for wildcard in getWildcards() {
        if (wildcard.anyDamage().matches(helmet)) { condition += 1; }
        if (wildcard.anyDamage().matches(chestplate)) { condition += 1; }
        if (wildcard.anyDamage().matches(legging)) { condition += 1; }
        if (wildcard.anyDamage().matches(boot)) { condition += 1; }
    }

    if condition >= 4 { return true; }

    return false;
}

function brassBonus(helmet as IItemStack, chestplate as IItemStack, legging as IItemStack, boot as IItemStack) as bool {

    var condition = 0;

    if (<metallurgy:brass_helmet>.anyDamage().matches(helmet)) { condition += 1; }
    if (<metallurgy:brass_chestplate>.anyDamage().matches(chestplate)) { condition += 1; }
    if (<metallurgy:brass_leggings>.anyDamage().matches(legging)) { condition += 1; }
    if (<metallurgy:brass_boots>.anyDamage().matches(boot)) { condition += 1; }

    for wildcard in getWildcards() {
        if (wildcard.anyDamage().matches(helmet)) { condition += 1; }
        if (wildcard.anyDamage().matches(chestplate)) { condition += 1; }
        if (wildcard.anyDamage().matches(legging)) { condition += 1; }
        if (wildcard.anyDamage().matches(boot)) { condition += 1; }
    }

    if condition >= 4 { return true; }

    return false;
}

function silverBonus(helmet as IItemStack, chestplate as IItemStack, legging as IItemStack, boot as IItemStack) as bool {

    var condition = 0;

    if (<mysticalworld:silver_helmet>.anyDamage().matches(helmet)) { condition += 1; }
    if (<mysticalworld:silver_chestplate>.anyDamage().matches(chestplate)) { condition += 1; }
    if (<mysticalworld:silver_leggings>.anyDamage().matches(legging)) { condition += 1; }
    if (<mysticalworld:silver_boots>.anyDamage().matches(boot)) { condition += 1; }

    for wildcard in getWildcards() {
        if (wildcard.anyDamage().matches(helmet)) { condition += 1; }
        if (wildcard.anyDamage().matches(chestplate)) { condition += 1; }
        if (wildcard.anyDamage().matches(legging)) { condition += 1; }
        if (wildcard.anyDamage().matches(boot)) { condition += 1; }
    }

    if condition >= 4 { return true; }

    return false;
}

function spiderBonus(helmet as IItemStack, chestplate as IItemStack, legging as IItemStack, boot as IItemStack) as bool {

    var condition = 0;

    if (<cqrepoured:helmet_spider>.anyDamage().matches(helmet)) { condition += 1; }
    if (<cqrepoured:chestplate_spider>.anyDamage().matches(chestplate)) { condition += 1; }
    if (<cqrepoured:leggings_spider>.anyDamage().matches(legging)) { condition += 1; }
    if (<cqrepoured:boots_spider>.anyDamage().matches(boot)) { condition += 1; }

    for wildcard in getWildcards() {
        if (wildcard.anyDamage().matches(helmet)) { condition += 1; }
        if (wildcard.anyDamage().matches(chestplate)) { condition += 1; }
        if (wildcard.anyDamage().matches(legging)) { condition += 1; }
        if (wildcard.anyDamage().matches(boot)) { condition += 1; }
    }

    if condition >= 4 { return true; }

    return false;
}

function deepIronBonus(helmet as IItemStack, chestplate as IItemStack, legging as IItemStack, boot as IItemStack) as bool {

    var condition = 0;

    if (<metallurgy:deep_iron_helmet>.anyDamage().matches(helmet)) { condition += 1; }
    if (<metallurgy:deep_iron_chestplate>.anyDamage().matches(chestplate)) { condition += 1; }
    if (<metallurgy:deep_iron_leggings>.anyDamage().matches(legging)) { condition += 1; }
    if (<metallurgy:deep_iron_boots>.anyDamage().matches(boot)) { condition += 1; }

    for wildcard in getWildcards() {
        if (wildcard.anyDamage().matches(helmet)) { condition += 1; }
        if (wildcard.anyDamage().matches(chestplate)) { condition += 1; }
        if (wildcard.anyDamage().matches(legging)) { condition += 1; }
        if (wildcard.anyDamage().matches(boot)) { condition += 1; }
    }

    if condition >= 4 { return true; }

    return false;
}

function kalendriteBonus(helmet as IItemStack, chestplate as IItemStack, legging as IItemStack, boot as IItemStack) as bool {

    var condition = 0;

    if (<metallurgy:kalendrite_helmet>.anyDamage().matches(helmet)) { condition += 1; }
    if (<metallurgy:kalendrite_chestplate>.anyDamage().matches(chestplate)) { condition += 1; }
    if (<metallurgy:kalendrite_leggings>.anyDamage().matches(legging)) { condition += 1; }
    if (<metallurgy:kalendrite_boots>.anyDamage().matches(boot)) { condition += 1; }

    for wildcard in getWildcards() {
        if (wildcard.anyDamage().matches(helmet)) { condition += 1; }
        if (wildcard.anyDamage().matches(chestplate)) { condition += 1; }
        if (wildcard.anyDamage().matches(legging)) { condition += 1; }
        if (wildcard.anyDamage().matches(boot)) { condition += 1; }
    }

    if condition >= 4 { return true; }

    return false;
}

function carmotBonus(helmet as IItemStack, chestplate as IItemStack, legging as IItemStack, boot as IItemStack) as bool {

    var condition = 0;

    if (<metallurgy:carmot_helmet>.anyDamage().matches(helmet)) { condition += 1; }
    if (<metallurgy:carmot_chestplate>.anyDamage().matches(chestplate)) { condition += 1; }
    if (<metallurgy:carmot_leggings>.anyDamage().matches(legging)) { condition += 1; }
    if (<metallurgy:carmot_boots>.anyDamage().matches(boot)) { condition += 1; }

    for wildcard in getWildcards() {
        if (wildcard.anyDamage().matches(helmet)) { condition += 1; }
        if (wildcard.anyDamage().matches(chestplate)) { condition += 1; }
        if (wildcard.anyDamage().matches(legging)) { condition += 1; }
        if (wildcard.anyDamage().matches(boot)) { condition += 1; }
    }

    if condition >= 4 { return true; }

    return false;
}

function famineBonus(helmet as IItemStack, chestplate as IItemStack, legging as IItemStack, boot as IItemStack) as bool {

    var condition = 0;

    if (<mod_lavacow:faminearmor_helmet>.anyDamage().matches(helmet)) { condition += 1; }
    if (<mod_lavacow:faminearmor_chestplate>.anyDamage().matches(chestplate)) { condition += 1; }
    if (<mod_lavacow:faminearmor_leggings>.anyDamage().matches(legging)) { condition += 1; }
    if (<mod_lavacow:faminearmor_boots>.anyDamage().matches(boot)) { condition += 1; }

    for wildcard in getWildcards() {
        if (wildcard.anyDamage().matches(helmet)) { condition += 1; }
        if (wildcard.anyDamage().matches(chestplate)) { condition += 1; }
        if (wildcard.anyDamage().matches(legging)) { condition += 1; }
        if (wildcard.anyDamage().matches(boot)) { condition += 1; }
    }

    if condition >= 4 { return true; }

    return false;
}

function celenegilBonus(helmet as IItemStack, chestplate as IItemStack, legging as IItemStack, boot as IItemStack) as bool {

    var condition = 0;

    if (<metallurgy:celenegil_helmet>.anyDamage().matches(helmet)) { condition += 1; }
    if (<metallurgy:celenegil_chestplate>.anyDamage().matches(chestplate)) { condition += 1; }
    if (<metallurgy:celenegil_leggings>.anyDamage().matches(legging)) { condition += 1; }
    if (<metallurgy:celenegil_boots>.anyDamage().matches(boot)) { condition += 1; }

    for wildcard in getWildcards() {
        if (wildcard.anyDamage().matches(helmet)) { condition += 1; }
        if (wildcard.anyDamage().matches(chestplate)) { condition += 1; }
        if (wildcard.anyDamage().matches(legging)) { condition += 1; }
        if (wildcard.anyDamage().matches(boot)) { condition += 1; }
    }

    if condition >= 4 { return true; }

    return false;
}

function tartariteBonus(helmet as IItemStack, chestplate as IItemStack, legging as IItemStack, boot as IItemStack) as bool {

    var condition = 0;

    if (<metallurgy:tartarite_helmet>.anyDamage().matches(helmet)) { condition += 1; }
    if (<metallurgy:tartarite_chestplate>.anyDamage().matches(chestplate)) { condition += 1; }
    if (<metallurgy:tartarite_leggings>.anyDamage().matches(legging)) { condition += 1; }
    if (<metallurgy:tartarite_boots>.anyDamage().matches(boot)) { condition += 1; }

    for wildcard in getWildcards() {
        if (wildcard.anyDamage().matches(helmet)) { condition += 1; }
        if (wildcard.anyDamage().matches(chestplate)) { condition += 1; }
        if (wildcard.anyDamage().matches(legging)) { condition += 1; }
        if (wildcard.anyDamage().matches(boot)) { condition += 1; }
    }

    if condition >= 4 { return true; }

    return false;
}

function meteorBonus(helmet as IItemStack, chestplate as IItemStack, legging as IItemStack, boot as IItemStack) as bool {

    var condition = 0;

    if (<nyx:meteor_helm>.anyDamage().matches(helmet)) { condition += 1; }
    if (<nyx:meteor_chest>.anyDamage().matches(chestplate)) { condition += 1; }
    if (<nyx:meteor_pants>.anyDamage().matches(legging)) { condition += 1; }
    if (<nyx:meteor_boots>.anyDamage().matches(boot)) { condition += 1; }

    for wildcard in getWildcards() {
        if (wildcard.anyDamage().matches(helmet)) { condition += 1; }
        if (wildcard.anyDamage().matches(chestplate)) { condition += 1; }
        if (wildcard.anyDamage().matches(legging)) { condition += 1; }
        if (wildcard.anyDamage().matches(boot)) { condition += 1; }
    }

    if condition >= 4 { return true; }

    return false;
}

function krikBonus(helmet as IItemStack, chestplate as IItemStack, legging as IItemStack, boot as IItemStack) as bool {

    var condition = 0;

    if (<metallurgy:krik_helmet>.anyDamage().matches(helmet)) { condition += 1; }
    if (<metallurgy:krik_chestplate>.anyDamage().matches(chestplate)) { condition += 1; }
    if (<metallurgy:krik_leggings>.anyDamage().matches(legging)) { condition += 1; }
    if (<metallurgy:krik_boots>.anyDamage().matches(boot)) { condition += 1; }

    for wildcard in getWildcards() {
        if (wildcard.anyDamage().matches(helmet)) { condition += 1; }
        if (wildcard.anyDamage().matches(chestplate)) { condition += 1; }
        if (wildcard.anyDamage().matches(legging)) { condition += 1; }
        if (wildcard.anyDamage().matches(boot)) { condition += 1; }
    }

    if condition >= 4 { return true; }

    return false;
}

function exoskeletonBonus(helmet as IItemStack, chestplate as IItemStack, legging as IItemStack, boot as IItemStack) as bool {

    var condition = 0;

    if (<erebus:rein_exoskeleton_helmet>.anyDamage().matches(helmet)) { condition += 1; }
    if (<erebus:rein_exoskeleton_chestplate>.anyDamage().matches(chestplate)) { condition += 1; }
    if (<erebus:rein_exoskeleton_leggings>.anyDamage().matches(legging)) { condition += 1; }
    if (<erebus:rein_exoskeleton_boots>.anyDamage().matches(boot)) { condition += 1; }

    for wildcard in getWildcards() {
        if (wildcard.anyDamage().matches(helmet)) { condition += 1; }
        if (wildcard.anyDamage().matches(chestplate)) { condition += 1; }
        if (wildcard.anyDamage().matches(legging)) { condition += 1; }
        if (wildcard.anyDamage().matches(boot)) { condition += 1; }
    }

    if condition >= 4 { return true; }

    return false;
}

function prometheumBonus(helmet as IItemStack, chestplate as IItemStack, legging as IItemStack, boot as IItemStack) as bool {

    var condition = 0;

    if (<metallurgy:prometheum_helmet>.anyDamage().matches(helmet)) { condition += 1; }
    if (<metallurgy:prometheum_chestplate>.anyDamage().matches(chestplate)) { condition += 1; }
    if (<metallurgy:prometheum_leggings>.anyDamage().matches(legging)) { condition += 1; }
    if (<metallurgy:prometheum_boots>.anyDamage().matches(boot)) { condition += 1; }

    for wildcard in getWildcards() {
        if (wildcard.anyDamage().matches(helmet)) { condition += 1; }
        if (wildcard.anyDamage().matches(chestplate)) { condition += 1; }
        if (wildcard.anyDamage().matches(legging)) { condition += 1; }
        if (wildcard.anyDamage().matches(boot)) { condition += 1; }
    }

    if condition >= 4 { return true; }

    return false;
}

function wetaBonus(helmet as IItemStack, chestplate as IItemStack, legging as IItemStack, boot as IItemStack) as bool {

    var condition = 0;

    if (<mod_lavacow:chitinarmor_helmet>.anyDamage().matches(helmet)) { condition += 1; }
    if (<mod_lavacow:chitinarmor_chestplate>.anyDamage().matches(chestplate)) { condition += 1; }
    if (<mod_lavacow:chitinarmor_leggings>.anyDamage().matches(legging)) { condition += 1; }
    if (<mod_lavacow:chitinarmor_boots>.anyDamage().matches(boot)) { condition += 1; }

    for wildcard in getWildcards() {
        if (wildcard.anyDamage().matches(helmet)) { condition += 1; }
        if (wildcard.anyDamage().matches(chestplate)) { condition += 1; }
        if (wildcard.anyDamage().matches(legging)) { condition += 1; }
        if (wildcard.anyDamage().matches(boot)) { condition += 1; }
    }

    if condition >= 4 { return true; }

    return false;
}

function platinumBonus(helmet as IItemStack, chestplate as IItemStack, legging as IItemStack, boot as IItemStack) as bool {

    var condition = 0;

    if (<metallurgy:platinum_helmet>.anyDamage().matches(helmet)) { condition += 1; }
    if (<metallurgy:platinum_chestplate>.anyDamage().matches(chestplate)) { condition += 1; }
    if (<metallurgy:platinum_leggings>.anyDamage().matches(legging)) { condition += 1; }
    if (<metallurgy:platinum_boots>.anyDamage().matches(boot)) { condition += 1; }

    for wildcard in getWildcards() {
        if (wildcard.anyDamage().matches(helmet)) { condition += 1; }
        if (wildcard.anyDamage().matches(chestplate)) { condition += 1; }
        if (wildcard.anyDamage().matches(legging)) { condition += 1; }
        if (wildcard.anyDamage().matches(boot)) { condition += 1; }
    }

    if condition >= 4 { return true; }

    return false;
}

function inquisitionBonus(helmet as IItemStack, chestplate as IItemStack, legging as IItemStack, boot as IItemStack) as bool {

    var condition = 0;

    if (<cqrepoured:helmet_inquisition>.anyDamage().matches(helmet)) { condition += 1; }
    if (<cqrepoured:chestplate_inquisition>.anyDamage().matches(chestplate)) { condition += 1; }
    if (<cqrepoured:leggings_inquisition>.anyDamage().matches(legging)) { condition += 1; }
    if (<cqrepoured:boots_inquisition>.anyDamage().matches(boot)) { condition += 1; }

    for wildcard in getWildcards() {
        if (wildcard.anyDamage().matches(helmet)) { condition += 1; }
        if (wildcard.anyDamage().matches(chestplate)) { condition += 1; }
        if (wildcard.anyDamage().matches(legging)) { condition += 1; }
        if (wildcard.anyDamage().matches(boot)) { condition += 1; }
    }

    if condition >= 4 { return true; }

    return false;
}

function swineBonus(helmet as IItemStack, chestplate as IItemStack, legging as IItemStack, boot as IItemStack) as bool {

    var condition = 0;

    if (<mod_lavacow:swinemask>.anyDamage().matches(helmet)) { condition += 1; }
    if (<mod_lavacow:swinearmor_chestplate>.anyDamage().matches(chestplate)) { condition += 1; }
    if (<mod_lavacow:swinearmor_leggings>.anyDamage().matches(legging)) { condition += 1; }
    if (<mod_lavacow:swinearmor_boots>.anyDamage().matches(boot)) { condition += 1; }

    for wildcard in getWildcards() {
        if (wildcard.anyDamage().matches(helmet)) { condition += 1; }
        if (wildcard.anyDamage().matches(chestplate)) { condition += 1; }
        if (wildcard.anyDamage().matches(legging)) { condition += 1; }
        if (wildcard.anyDamage().matches(boot)) { condition += 1; }
    }

    if condition >= 4 { return true; }

    return false;
}

function ignatiusBonus(helmet as IItemStack, chestplate as IItemStack, legging as IItemStack, boot as IItemStack) as bool {

    var condition = 0;

    if (<metallurgy:ignatius_helmet>.anyDamage().matches(helmet)) { condition += 1; }
    if (<metallurgy:ignatius_chestplate>.anyDamage().matches(chestplate)) { condition += 1; }
    if (<metallurgy:ignatius_leggings>.anyDamage().matches(legging)) { condition += 1; }
    if (<metallurgy:ignatius_boots>.anyDamage().matches(boot)) { condition += 1; }

    for wildcard in getWildcards() {
        if (wildcard.anyDamage().matches(helmet)) { condition += 1; }
        if (wildcard.anyDamage().matches(chestplate)) { condition += 1; }
        if (wildcard.anyDamage().matches(legging)) { condition += 1; }
        if (wildcard.anyDamage().matches(boot)) { condition += 1; }
    }

    if condition >= 4 { return true; }

    return false;
}

function midasiumBonus(helmet as IItemStack, chestplate as IItemStack, legging as IItemStack, boot as IItemStack) as bool {

    var condition = 0;

    if (<metallurgy:midasium_helmet>.anyDamage().matches(helmet)) { condition += 1; }
    if (<metallurgy:midasium_chestplate>.anyDamage().matches(chestplate)) { condition += 1; }
    if (<metallurgy:midasium_leggings>.anyDamage().matches(legging)) { condition += 1; }
    if (<metallurgy:midasium_boots>.anyDamage().matches(boot)) { condition += 1; }

    for wildcard in getWildcards() {
        if (wildcard.anyDamage().matches(helmet)) { condition += 1; }
        if (wildcard.anyDamage().matches(chestplate)) { condition += 1; }
        if (wildcard.anyDamage().matches(legging)) { condition += 1; }
        if (wildcard.anyDamage().matches(boot)) { condition += 1; }
    }

    if condition >= 4 { return true; }

    return false;
}

function damascusSteelBonus(helmet as IItemStack, chestplate as IItemStack, legging as IItemStack, boot as IItemStack) as bool {

    var condition = 0;

    if (<metallurgy:damascus_steel_helmet>.anyDamage().matches(helmet)) { condition += 1; }
    if (<metallurgy:damascus_steel_chestplate>.anyDamage().matches(chestplate)) { condition += 1; }
    if (<metallurgy:damascus_steel_leggings>.anyDamage().matches(legging)) { condition += 1; }
    if (<metallurgy:damascus_steel_boots>.anyDamage().matches(boot)) { condition += 1; }

    for wildcard in getWildcards() {
        if (wildcard.anyDamage().matches(helmet)) { condition += 1; }
        if (wildcard.anyDamage().matches(chestplate)) { condition += 1; }
        if (wildcard.anyDamage().matches(legging)) { condition += 1; }
        if (wildcard.anyDamage().matches(boot)) { condition += 1; }
    }

    if condition >= 4 { return true; }

    return false;
}

function atlarusBonus(helmet as IItemStack, chestplate as IItemStack, legging as IItemStack, boot as IItemStack) as bool {

    var condition = 0;

    if (<metallurgy:atlarus_helmet>.anyDamage().matches(helmet)) { condition += 1; }
    if (<metallurgy:atlarus_chestplate>.anyDamage().matches(chestplate)) { condition += 1; }
    if (<metallurgy:atlarus_leggings>.anyDamage().matches(legging)) { condition += 1; }
    if (<metallurgy:atlarus_boots>.anyDamage().matches(boot)) { condition += 1; }

    for wildcard in getWildcards() {
        if (wildcard.anyDamage().matches(helmet)) { condition += 1; }
        if (wildcard.anyDamage().matches(chestplate)) { condition += 1; }
        if (wildcard.anyDamage().matches(legging)) { condition += 1; }
        if (wildcard.anyDamage().matches(boot)) { condition += 1; }
    }

    if condition >= 4 { return true; }

    return false;
}

function moltenBonus(helmet as IItemStack, chestplate as IItemStack, legging as IItemStack, boot as IItemStack) as bool {

    var condition = 0;

    if (<mod_lavacow:felarmor_helmet>.anyDamage().matches(helmet)) { condition += 1; }
    if (<mod_lavacow:felarmor_chestplate>.anyDamage().matches(chestplate)) { condition += 1; }
    if (<mod_lavacow:felarmor_leggings>.anyDamage().matches(legging)) { condition += 1; }
    if (<mod_lavacow:felarmor_boots>.anyDamage().matches(boot)) { condition += 1; }

    for wildcard in getWildcards() {
        if (wildcard.anyDamage().matches(helmet)) { condition += 1; }
        if (wildcard.anyDamage().matches(chestplate)) { condition += 1; }
        if (wildcard.anyDamage().matches(legging)) { condition += 1; }
        if (wildcard.anyDamage().matches(boot)) { condition += 1; }
    }

    if condition >= 4 { return true; }

    return false;
}

function rockshroomBonus(helmet as IItemStack, chestplate as IItemStack, legging as IItemStack, boot as IItemStack) as bool {

    var condition = 0;

    if (<midnight:rockshroom_helmet>.anyDamage().matches(helmet)) { condition += 1; }
    if (<midnight:rockshroom_chestplate>.anyDamage().matches(chestplate)) { condition += 1; }
    if (<midnight:rockshroom_leggings>.anyDamage().matches(legging)) { condition += 1; }
    if (<midnight:rockshroom_boots>.anyDamage().matches(boot)) { condition += 1; }

    for wildcard in getWildcards() {
        if (wildcard.anyDamage().matches(helmet)) { condition += 1; }
        if (wildcard.anyDamage().matches(chestplate)) { condition += 1; }
        if (wildcard.anyDamage().matches(legging)) { condition += 1; }
        if (wildcard.anyDamage().matches(boot)) { condition += 1; }
    }

    if condition >= 4 { return true; }

    return false;
}

function ceruclaseBonus(helmet as IItemStack, chestplate as IItemStack, legging as IItemStack, boot as IItemStack) as bool {

    var condition = 0;

    if (<metallurgy:ceruclase_helmet>.anyDamage().matches(helmet)) { condition += 1; }
    if (<metallurgy:ceruclase_chestplate>.anyDamage().matches(chestplate)) { condition += 1; }
    if (<metallurgy:ceruclase_leggings>.anyDamage().matches(legging)) { condition += 1; }
    if (<metallurgy:ceruclase_boots>.anyDamage().matches(boot)) { condition += 1; }

    for wildcard in getWildcards() {
        if (wildcard.anyDamage().matches(helmet)) { condition += 1; }
        if (wildcard.anyDamage().matches(chestplate)) { condition += 1; }
        if (wildcard.anyDamage().matches(legging)) { condition += 1; }
        if (wildcard.anyDamage().matches(boot)) { condition += 1; }
    }

    if condition >= 4 { return true; }

    return false;
}

function inolashiteBonus(helmet as IItemStack, chestplate as IItemStack, legging as IItemStack, boot as IItemStack) as bool {

    var condition = 0;

    if (<metallurgy:inolashite_helmet>.anyDamage().matches(helmet)) { condition += 1; }
    if (<metallurgy:inolashite_chestplate>.anyDamage().matches(chestplate)) { condition += 1; }
    if (<metallurgy:inolashite_leggings>.anyDamage().matches(legging)) { condition += 1; }
    if (<metallurgy:inolashite_boots>.anyDamage().matches(boot)) { condition += 1; }

    for wildcard in getWildcards() {
        if (wildcard.anyDamage().matches(helmet)) { condition += 1; }
        if (wildcard.anyDamage().matches(chestplate)) { condition += 1; }
        if (wildcard.anyDamage().matches(legging)) { condition += 1; }
        if (wildcard.anyDamage().matches(boot)) { condition += 1; }
    }

    if condition >= 4 { return true; }

    return false;
}

function vyroxeresBonus(helmet as IItemStack, chestplate as IItemStack, legging as IItemStack, boot as IItemStack) as bool {

    var condition = 0;

    if (<metallurgy:vyroxeres_helmet>.anyDamage().matches(helmet)) { condition += 1; }
    if (<metallurgy:vyroxeres_chestplate>.anyDamage().matches(chestplate)) { condition += 1; }
    if (<metallurgy:vyroxeres_leggings>.anyDamage().matches(legging)) { condition += 1; }
    if (<metallurgy:vyroxeres_boots>.anyDamage().matches(boot)) { condition += 1; }

    for wildcard in getWildcards() {
        if (wildcard.anyDamage().matches(helmet)) { condition += 1; }
        if (wildcard.anyDamage().matches(chestplate)) { condition += 1; }
        if (wildcard.anyDamage().matches(legging)) { condition += 1; }
        if (wildcard.anyDamage().matches(boot)) { condition += 1; }
    }

    if condition >= 4 { return true; }

    return false;
}

function sentientNecromancerBonus(helmet as IItemStack, chestplate as IItemStack, legging as IItemStack, boot as IItemStack) as bool {

    var condition = 0;

    if (<srparasites:armor_helm_sentient>.withTag({necromancer: 1}).anyDamage().matches(helmet)) { condition += 1; }
    if (<srparasites:armor_chest_sentient>.withTag({necromancer: 1}).anyDamage().matches(chestplate)) { condition += 1; }
    if (<srparasites:armor_pants_sentient>.withTag({necromancer: 1}).anyDamage().matches(legging)) { condition += 1; }
    if (<srparasites:armor_boots_sentient>.withTag({necromancer: 1}).anyDamage().matches(boot)) { condition += 1; }

    for wildcard in getWildcards() {
        if (wildcard.anyDamage().matches(helmet)) { condition += 1; }
        if (wildcard.anyDamage().matches(chestplate)) { condition += 1; }
        if (wildcard.anyDamage().matches(legging)) { condition += 1; }
        if (wildcard.anyDamage().matches(boot)) { condition += 1; }
    }

    if condition >= 4 { return true; }

    return false;
}

function sentientWarlockBonus(helmet as IItemStack, chestplate as IItemStack, legging as IItemStack, boot as IItemStack) as bool {

    var condition = 0;

    if (<srparasites:armor_helm_sentient>.withTag({warlock: 1}).anyDamage().matches(helmet)) { condition += 1; }
    if (<srparasites:armor_chest_sentient>.withTag({warlock: 1}).anyDamage().matches(chestplate)) { condition += 1; }
    if (<srparasites:armor_pants_sentient>.withTag({warlock: 1}).anyDamage().matches(legging)) { condition += 1; }
    if (<srparasites:armor_boots_sentient>.withTag({warlock: 1}).anyDamage().matches(boot)) { condition += 1; }

    for wildcard in getWildcards() {
        if (wildcard.anyDamage().matches(helmet)) { condition += 1; }
        if (wildcard.anyDamage().matches(chestplate)) { condition += 1; }
        if (wildcard.anyDamage().matches(legging)) { condition += 1; }
        if (wildcard.anyDamage().matches(boot)) { condition += 1; }
    }

    if condition >= 4 { return true; }

    return false;
}

function sentientAssassinBonus(helmet as IItemStack, chestplate as IItemStack, legging as IItemStack, boot as IItemStack) as bool {

    var condition = 0;

    if (<srparasites:armor_helm_sentient>.withTag({assassin: 1}).anyDamage().matches(helmet)) { condition += 1; }
    if (<srparasites:armor_chest_sentient>.withTag({assassin: 1}).anyDamage().matches(chestplate)) { condition += 1; }
    if (<srparasites:armor_pants_sentient>.withTag({assassin: 1}).anyDamage().matches(legging)) { condition += 1; }
    if (<srparasites:armor_boots_sentient>.withTag({assassin: 1}).anyDamage().matches(boot)) { condition += 1; }

    for wildcard in getWildcards() {
        if (wildcard.anyDamage().matches(helmet)) { condition += 1; }
        if (wildcard.anyDamage().matches(chestplate)) { condition += 1; }
        if (wildcard.anyDamage().matches(legging)) { condition += 1; }
        if (wildcard.anyDamage().matches(boot)) { condition += 1; }
    }

    if condition >= 4 { return true; }

    return false;
}

function sentientFlailerBonus(helmet as IItemStack, chestplate as IItemStack, legging as IItemStack, boot as IItemStack) as bool {

    var condition = 0;

    if (<srparasites:armor_helm_sentient>.withTag({flailer: 1}).anyDamage().matches(helmet)) { condition += 1; }
    if (<srparasites:armor_chest_sentient>.withTag({flailer: 1}).anyDamage().matches(chestplate)) { condition += 1; }
    if (<srparasites:armor_pants_sentient>.withTag({flailer: 1}).anyDamage().matches(legging)) { condition += 1; }
    if (<srparasites:armor_boots_sentient>.withTag({flailer: 1}).anyDamage().matches(boot)) { condition += 1; }

    for wildcard in getWildcards() {
        if (wildcard.anyDamage().matches(helmet)) { condition += 1; }
        if (wildcard.anyDamage().matches(chestplate)) { condition += 1; }
        if (wildcard.anyDamage().matches(legging)) { condition += 1; }
        if (wildcard.anyDamage().matches(boot)) { condition += 1; }
    }

    if condition >= 4 { return true; }

    return false;
}

function sentientHordeTamerBonus(helmet as IItemStack, chestplate as IItemStack, legging as IItemStack, boot as IItemStack) as bool {

    var condition = 0;

    if (<srparasites:armor_helm_sentient>.withTag({horde_tamer: 1}).anyDamage().matches(helmet)) { condition += 1; }
    if (<srparasites:armor_chest_sentient>.withTag({horde_tamer: 1}).anyDamage().matches(chestplate)) { condition += 1; }
    if (<srparasites:armor_pants_sentient>.withTag({horde_tamer: 1}).anyDamage().matches(legging)) { condition += 1; }
    if (<srparasites:armor_boots_sentient>.withTag({horde_tamer: 1}).anyDamage().matches(boot)) { condition += 1; }

    for wildcard in getWildcards() {
        if wildcard.anyDamage().matches(helmet) { condition += 1; }
        if wildcard.anyDamage().matches(chestplate) { condition += 1; }
        if wildcard.anyDamage().matches(legging) { condition += 1; }
        if wildcard.anyDamage().matches(boot) { condition += 1; }
    }

    if condition >= 4 { return true; }

    return false;
}

function sentientIronHeartBonus(helmet as IItemStack, chestplate as IItemStack, legging as IItemStack, boot as IItemStack) as bool {

    var condition = 0;

    if (<srparasites:armor_helm_sentient>.withTag({iron_heart: 1}).anyDamage().matches(helmet)) { condition += 1; }
    if (<srparasites:armor_chest_sentient>.withTag({iron_heart: 1}).anyDamage().matches(chestplate)) { condition += 1; }
    if (<srparasites:armor_pants_sentient>.withTag({iron_heart: 1}).anyDamage().matches(legging)) { condition += 1; }
    if (<srparasites:armor_boots_sentient>.withTag({iron_heart: 1}).anyDamage().matches(boot)) { condition += 1; }

    for wildcard in getWildcards() {
        if wildcard.anyDamage().matches(helmet) { condition += 1; }
        if wildcard.anyDamage().matches(chestplate) { condition += 1; }
        if wildcard.anyDamage().matches(legging) { condition += 1; }
        if wildcard.anyDamage().matches(boot) { condition += 1; }
    }

    if condition >= 4 { return true; }

    return false;
}

function sentientQuickFingersBonus(helmet as IItemStack, chestplate as IItemStack, legging as IItemStack, boot as IItemStack) as bool {

    var condition = 0;

    if (<srparasites:armor_helm_sentient>.withTag({quick_fingers: 1}).anyDamage().matches(helmet)) { condition += 1; }
    if (<srparasites:armor_chest_sentient>.withTag({quick_fingers: 1}).anyDamage().matches(chestplate)) { condition += 1; }
    if (<srparasites:armor_pants_sentient>.withTag({quick_fingers: 1}).anyDamage().matches(legging)) { condition += 1; }
    if (<srparasites:armor_boots_sentient>.withTag({quick_fingers: 1}).anyDamage().matches(boot)) { condition += 1; }

    for wildcard in getWildcards() {
        if wildcard.anyDamage().matches(helmet) { condition += 1; }
        if wildcard.anyDamage().matches(chestplate) { condition += 1; }
        if wildcard.anyDamage().matches(legging) { condition += 1; }
        if wildcard.anyDamage().matches(boot) { condition += 1; }
    }

    if condition >= 4 { return true; }

    return false;
}

function sentientKeenEyesBonus(helmet as IItemStack, chestplate as IItemStack, legging as IItemStack, boot as IItemStack) as bool {

    var condition = 0;

    if (<srparasites:armor_helm_sentient>.withTag({keen_eyes: 1}).anyDamage().matches(helmet)) { condition += 1; }
    if (<srparasites:armor_chest_sentient>.withTag({keen_eyes: 1}).anyDamage().matches(chestplate)) { condition += 1; }
    if (<srparasites:armor_pants_sentient>.withTag({keen_eyes: 1}).anyDamage().matches(legging)) { condition += 1; }
    if (<srparasites:armor_boots_sentient>.withTag({keen_eyes: 1}).anyDamage().matches(boot)) { condition += 1; }

    for wildcard in getWildcards() {
        if wildcard.anyDamage().matches(helmet) { condition += 1; }
        if wildcard.anyDamage().matches(chestplate) { condition += 1; }
        if wildcard.anyDamage().matches(legging) { condition += 1; }
        if wildcard.anyDamage().matches(boot) { condition += 1; }
    }

    if condition >= 4 { return true; }

    return false;
}

static bonusDamageUUID as string = "5cd0d2c2-d36a-496a-87f1-95461f715f27";
static bonusAttackSpeedUUID as string = "f488640f-4951-4807-bb01-ba7e2b3ea0fc";
static bonusProjectileDamageUUID as string = "4ac8c734-39b7-4210-bbe4-e3d77548d9ec";
static bonusMagicDamageUUID as string = "897f8b12-c80d-49ee-b496-bd1f5b595cef";
static bonusArmorUUID as string = "adcfd826-2fdc-40a6-a236-cc130228e70c";
static bonusArmorToughnessUUID as string = "eb1172ee-ca76-41b4-a110-a6dc74440a85";
static bonusBlessedUUID as string = "20657b97-3622-48e6-8589-5f6c46954f63";
static bonusMovementSpeedUUID as string = "9b92987c-b684-437a-bb52-7eba38829f0c";
static bonusReachUUID as string = "cfafeb4f-effa-4f03-8835-5981b8d09325";
static bonusHealthUUID as string = "15268162-c3d5-483b-be99-34d00de4705d";
static bonusDamageResistanceUUID as string = "3315675d-dd74-484a-8edd-74ed4a383647";
static bonusKnockbackResistanceUUID as string = "03cecf0f-ed2f-44e2-a02c-2da53838f081";
static bonusMaxManaUUID as string = "458486c2-6118-407b-8bee-1d9e588991c8";
static bonusManaRegenUUID as string = "b4b1bc16-4eb7-4452-aa15-75ad119d2fea";
static bonusStepHeightUUID as string = "e9f26af3-fda4-43bd-a546-e042d857c792";

val attributeBonuses = [
    bonusDamageUUID,
    bonusAttackSpeedUUID,
    bonusProjectileDamageUUID,
    bonusMagicDamageUUID,
    bonusArmorUUID,
    bonusArmorToughnessUUID,
    bonusBlessedUUID,
    bonusMovementSpeedUUID,
    bonusReachUUID,
    bonusHealthUUID,
    bonusDamageResistanceUUID,
    bonusKnockbackResistanceUUID,
    bonusMaxManaUUID,
    bonusManaRegenUUID,
    bonusStepHeightUUID
] as string[];

val bonusAttributesUsed = [
    "generic.attackDamage",
    "generic.attackSpeed",
    "potioncore.projectileDamage",
    "potioncore.magicDamage",
    "generic.armor",
    "generic.armorToughness",
    "mysticalworld.blessed",
    "generic.movementSpeed",
    "generic.reachDistance",
    "generic.maxHealth",
    "potioncore.damageResistance",
    "generic.knockbackResistance",
    "xat.entityMagic.regen",
    "xat.entityMagic.maxMana"
] as string[];

events.register(function(event as crafttweaker.event.EntityLivingEquipmentChangeEvent){
    if event.entityLivingBase.world.isRemote() return;
    if !event.entityLivingBase instanceof IPlayer return;

    var player as IPlayer = event.entityLivingBase;
    var helmet as IItemStack = player.getItemInSlot(IEntityEquipmentSlot.head());
    var chestplate as IItemStack = player.getItemInSlot(IEntityEquipmentSlot.chest());
    var leggings as IItemStack = player.getItemInSlot(IEntityEquipmentSlot.legs());
    var boots as IItemStack = player.getItemInSlot(IEntityEquipmentSlot.feet());

    for usedAttributes in bonusAttributesUsed {
        for UUIDs in attributeBonuses {
            player.getAttribute(usedAttributes).removeModifier(UUIDs);
        }
    }

    if (!isWithinLimit(player) || wildcardCount(player) <= 0) return;

    var wildcardPenalty as double = 1.0 - (0.25 * wildcardCount(player));

    //note: always update the setBonus attributes in the config to match the attributes here

    if (copperBonus(helmet, chestplate, leggings, boots)) {
        val copperWildMHIn as AttributeInstance = player.getAttribute("generic.maxHealth");
        val copperWildASIn as AttributeInstance = player.getAttribute("generic.attackSpeed");
        val copperWildMSIn as AttributeInstance = player.getAttribute("generic.movementSpeed");
        val copperWildMDIn as AttributeInstance = player.getAttribute("potioncore.magicDamage");
        val copperWildPDIn as AttributeInstance = player.getAttribute("potioncore.projectileDamage");
    
        copperWildMHIn.applyModifier(AttributeModifier.createModifier("copperWildMH", (-8.0 * wildcardPenalty), 0, bonusHealthUUID));
        copperWildASIn.applyModifier(AttributeModifier.createModifier("copperWildAS", (0.1 * wildcardPenalty), 1, bonusAttackSpeedUUID));
        copperWildMSIn.applyModifier(AttributeModifier.createModifier("copperWildMS", (0.1 * wildcardPenalty), 1, bonusMovementSpeedUUID));
        copperWildMDIn.applyModifier(AttributeModifier.createModifier("copperWildMD", (-0.135 * wildcardPenalty), 1, bonusMagicDamageUUID));
        copperWildPDIn.applyModifier(AttributeModifier.createModifier("copperWildPD", (-0.275 * wildcardPenalty), 1, bonusProjectileDamageUUID));
    }

    if (leatherBonus(helmet, chestplate, leggings, boots)) {
        val leatherWildADIn as AttributeInstance = player.getAttribute("generic.attackDamage");
        val leatherWildMDIn as AttributeInstance = player.getAttribute("potioncore.magicDamage");
        val leatherWildPDIn as AttributeInstance = player.getAttribute("potioncore.projectileDamage");
    
        leatherWildADIn.applyModifier(AttributeModifier.createModifier("leatherWildAD", (-0.25 * wildcardPenalty), 1, bonusDamageUUID));
        leatherWildMDIn.applyModifier(AttributeModifier.createModifier("leatherWildMD", (-0.135 * wildcardPenalty), 1, bonusMagicDamageUUID));
        leatherWildPDIn.applyModifier(AttributeModifier.createModifier("leatherWildPD", (0.05 * wildcardPenalty), 1, bonusProjectileDamageUUID));
    }

    if (chainBonus(helmet, chestplate, leggings, boots)) {
        val chainWildADIn as AttributeInstance = player.getAttribute("generic.attackDamage");
        val chainWildMDIn as AttributeInstance = player.getAttribute("potioncore.magicDamage");
    
        chainWildADIn.applyModifier(AttributeModifier.createModifier("chainWildAD", (-0.25 * wildcardPenalty), 1, bonusDamageUUID));
        chainWildMDIn.applyModifier(AttributeModifier.createModifier("chainWildMD", (-0.135 * wildcardPenalty), 1, bonusMagicDamageUUID));
    }

    if (ironBonus(helmet, chestplate, leggings, boots)) {
        val ironWildMSIn as AttributeInstance = player.getAttribute("generic.movementSpeed");
        val ironWildMDIn as AttributeInstance = player.getAttribute("potioncore.magicDamage");
        val ironWildPDIn as AttributeInstance = player.getAttribute("potioncore.projectileDamage");
        val ironWildADIn as AttributeInstance = player.getAttribute("generic.attackDamage");
        val ironWildASIn as AttributeInstance = player.getAttribute("generic.attackSpeed");
        val ironWildRDIn as AttributeInstance = player.getAttribute("generic.reachDistance");
    
        ironWildMSIn.applyModifier(AttributeModifier.createModifier("ironWildMS", (0.05 * wildcardPenalty), 1, bonusMovementSpeedUUID));
        ironWildMDIn.applyModifier(AttributeModifier.createModifier("ironWildMD", (-0.13 * wildcardPenalty), 1, bonusMagicDamageUUID));
        ironWildPDIn.applyModifier(AttributeModifier.createModifier("ironWildPD", (-0.2675 * wildcardPenalty), 1, bonusProjectileDamageUUID));
        ironWildADIn.applyModifier(AttributeModifier.createModifier("ironWildAD", (0.65 * wildcardPenalty), 1, bonusDamageUUID));
        ironWildASIn.applyModifier(AttributeModifier.createModifier("ironWildAS", (-0.4 * wildcardPenalty), 1, bonusAttackSpeedUUID));
        ironWildRDIn.applyModifier(AttributeModifier.createModifier("ironWildRD", (0.5 * wildcardPenalty), 0, bonusReachUUID));
    }

    if (diamondBonus(helmet, chestplate, leggings, boots)) {
        val diamondWildMSIn as AttributeInstance = player.getAttribute("generic.movementSpeed");
        val diamondWildMDIn as AttributeInstance = player.getAttribute("potioncore.magicDamage");
        val diamondWildPDIn as AttributeInstance = player.getAttribute("potioncore.projectileDamage");
        val diamondWildASIn as AttributeInstance = player.getAttribute("generic.attackSpeed");
        val diamondWildADIn as AttributeInstance = player.getAttribute("generic.attackDamage");
    
        diamondWildMSIn.applyModifier(AttributeModifier.createModifier("diamondWildMS", (0.1 * wildcardPenalty), 1, bonusMovementSpeedUUID));
        diamondWildMDIn.applyModifier(AttributeModifier.createModifier("diamondWildMD", (-0.13 * wildcardPenalty), 1, bonusMagicDamageUUID));
        diamondWildPDIn.applyModifier(AttributeModifier.createModifier("diamondWildPD", (-0.267 * wildcardPenalty), 1, bonusProjectileDamageUUID));
        diamondWildASIn.applyModifier(AttributeModifier.createModifier("diamondWildAS", (0.06 * wildcardPenalty), 1, bonusAttackSpeedUUID));
        diamondWildADIn.applyModifier(AttributeModifier.createModifier("diamondWildAD", (-0.15 * wildcardPenalty), 1, bonusDamageUUID));
    }

    if (goldenBonus(helmet, chestplate, leggings, boots)) {
        val goldenWildADIn as AttributeInstance = player.getAttribute("generic.attackDamage");
        val goldenWildPDIn as AttributeInstance = player.getAttribute("potioncore.projectileDamage");
        val goldenWildMDIn as AttributeInstance = player.getAttribute("potioncore.magicDamage");
    
        goldenWildADIn.applyModifier(AttributeModifier.createModifier("goldenWildAD", (-0.232125 * wildcardPenalty), 1, bonusDamageUUID));
        goldenWildPDIn.applyModifier(AttributeModifier.createModifier("goldenWildPD", (-0.2475 * wildcardPenalty), 1, bonusProjectileDamageUUID));
        goldenWildMDIn.applyModifier(AttributeModifier.createModifier("goldenWildMD", (0.18 * wildcardPenalty), 1, bonusMagicDamageUUID));
    }

    if (slimeBonus(helmet, chestplate, leggings, boots)) {
        val slimeWildMHIn as AttributeInstance = player.getAttribute("generic.maxHealth");
        val slimeWildRDIn as AttributeInstance = player.getAttribute("generic.reachDistance");
        val slimeWildMSIn as AttributeInstance = player.getAttribute("generic.movementSpeed");
        val slimeWildMDIn as AttributeInstance = player.getAttribute("potioncore.magicDamage");
        val slimeWildPDIn as AttributeInstance = player.getAttribute("potioncore.projectileDamage");
    
        slimeWildMHIn.applyModifier(AttributeModifier.createModifier("slimeWildMH", (-8.0 * wildcardPenalty), 0, bonusHealthUUID));
        slimeWildRDIn.applyModifier(AttributeModifier.createModifier("slimeWildRD", (0.5 * wildcardPenalty), 0, bonusReachUUID));
        slimeWildMSIn.applyModifier(AttributeModifier.createModifier("slimeWildMS", (0.04 * wildcardPenalty), 1, bonusMovementSpeedUUID));
        slimeWildMDIn.applyModifier(AttributeModifier.createModifier("slimeWildMD", (-0.135 * wildcardPenalty), 1, bonusMagicDamageUUID));
        slimeWildPDIn.applyModifier(AttributeModifier.createModifier("slimeWildPD", (-0.275 * wildcardPenalty), 1, bonusProjectileDamageUUID));
    }

    if (quicksilverBonus(helmet, chestplate, leggings, boots)) {
        val quicksilverWildMSIn as AttributeInstance = player.getAttribute("generic.movementSpeed");
        val quicksilverWildMDIn as AttributeInstance = player.getAttribute("potioncore.magicDamage");
        val quicksilverWildPDIn as AttributeInstance = player.getAttribute("potioncore.projectileDamage");
        val quicksilverWildASIn as AttributeInstance = player.getAttribute("generic.attackSpeed");
        val quicksilverWildADIn as AttributeInstance = player.getAttribute("generic.attackDamage");
    
        quicksilverWildASIn.applyModifier(AttributeModifier.createModifier("quicksilverWildAS", (0.1 * wildcardPenalty), 1, bonusAttackSpeedUUID));
        quicksilverWildMDIn.applyModifier(AttributeModifier.createModifier("quicksilverWildMD", (-0.12 * wildcardPenalty), 1, bonusMagicDamageUUID));
        quicksilverWildPDIn.applyModifier(AttributeModifier.createModifier("quicksilverWildPD", (-0.229625 * wildcardPenalty), 1, bonusProjectileDamageUUID));
        quicksilverWildMSIn.applyModifier(AttributeModifier.createModifier("quicksilverWildMS", (-0.1525 * wildcardPenalty), 1, bonusMovementSpeedUUID));
        quicksilverWildADIn.applyModifier(AttributeModifier.createModifier("quicksilverWildAD", (-0.15 * wildcardPenalty), 1, bonusDamageUUID));
    }

    if (hepatizonBonus(helmet, chestplate, leggings, boots)) {
        val hepatizonWildMSIn as AttributeInstance = player.getAttribute("generic.movementSpeed");
        val hepatizonWildMDIn as AttributeInstance = player.getAttribute("potioncore.magicDamage");
        val hepatizonWildPDIn as AttributeInstance = player.getAttribute("potioncore.projectileDamage");
        val hepatizonWildADIn as AttributeInstance = player.getAttribute("generic.attackDamage");
        val hepatizonWildASIn as AttributeInstance = player.getAttribute("generic.attackSpeed");
        val hepatizonWildRDIn as AttributeInstance = player.getAttribute("generic.reachDistance");
    
        hepatizonWildASIn.applyModifier(AttributeModifier.createModifier("hepatizonWildAS", (-0.47 * wildcardPenalty), 1, bonusAttackSpeedUUID));
        hepatizonWildADIn.applyModifier(AttributeModifier.createModifier("hepatizonWildAD", (0.73 * wildcardPenalty), 1, bonusDamageUUID));
        hepatizonWildMSIn.applyModifier(AttributeModifier.createModifier("hepatizonWildMS", (0.05 * wildcardPenalty), 1, bonusMovementSpeedUUID));
        hepatizonWildMDIn.applyModifier(AttributeModifier.createModifier("hepatizonWildMD", (-0.12 * wildcardPenalty), 1, bonusMagicDamageUUID));
        hepatizonWildPDIn.applyModifier(AttributeModifier.createModifier("hepatizonWildPD", (-0.229625 * wildcardPenalty), 1, bonusProjectileDamageUUID));
        hepatizonWildRDIn.applyModifier(AttributeModifier.createModifier("hepatizonWildRD", (0.5 * wildcardPenalty), 0, bonusReachUUID));
    }

    if (oureclaseBonus(helmet, chestplate, leggings, boots)) {
        val oureclaseWildMSIn as AttributeInstance = player.getAttribute("generic.movementSpeed");
        val oureclaseWildMDIn as AttributeInstance = player.getAttribute("potioncore.magicDamage");
        val oureclaseWildPDIn as AttributeInstance = player.getAttribute("potioncore.projectileDamage");
        val oureclaseWildASIn as AttributeInstance = player.getAttribute("generic.attackSpeed");
        val oureclaseWildADIn as AttributeInstance = player.getAttribute("generic.attackDamage");
    
        oureclaseWildASIn.applyModifier(AttributeModifier.createModifier("oureclaseWildAS", (0.22 * wildcardPenalty), 1, bonusAttackSpeedUUID));
        oureclaseWildMSIn.applyModifier(AttributeModifier.createModifier("oureclaseWildMS", (0.12 * wildcardPenalty), 1, bonusMovementSpeedUUID));
        oureclaseWildMDIn.applyModifier(AttributeModifier.createModifier("oureclaseWildMD", (-0.11 * wildcardPenalty), 1, bonusMagicDamageUUID));
        oureclaseWildPDIn.applyModifier(AttributeModifier.createModifier("oureclaseWildPD", (-0.1845 * wildcardPenalty), 1, bonusProjectileDamageUUID));
        oureclaseWildADIn.applyModifier(AttributeModifier.createModifier("oureclaseWildAD", (-0.15 * wildcardPenalty), 1, bonusDamageUUID));
    }

    if (desichalkosBonus(helmet, chestplate, leggings, boots)) {
        val desichalkosWildMSIn as AttributeInstance = player.getAttribute("generic.movementSpeed");
        val desichalkosWildMDIn as AttributeInstance = player.getAttribute("potioncore.magicDamage");
        val desichalkosWildPDIn as AttributeInstance = player.getAttribute("potioncore.projectileDamage");
        val desichalkosWildADIn as AttributeInstance = player.getAttribute("generic.attackDamage");
        val desichalkosWildASIn as AttributeInstance = player.getAttribute("generic.attackSpeed");
        val desichalkosWildRDIn as AttributeInstance = player.getAttribute("generic.reachDistance");
    
        desichalkosWildASIn.applyModifier(AttributeModifier.createModifier("desichalkosWildAS", (-0.50 * wildcardPenalty), 1, bonusAttackSpeedUUID));
        desichalkosWildADIn.applyModifier(AttributeModifier.createModifier("desichalkosWildAD", (0.81 * wildcardPenalty), 1, bonusDamageUUID));
        desichalkosWildMSIn.applyModifier(AttributeModifier.createModifier("desichalkosWildMS", (0.06 * wildcardPenalty), 1, bonusMovementSpeedUUID));
        desichalkosWildMDIn.applyModifier(AttributeModifier.createModifier("desichalkosWildMD", (-0.11 * wildcardPenalty), 1, bonusMagicDamageUUID));
        desichalkosWildPDIn.applyModifier(AttributeModifier.createModifier("desichalkosWildPD", (-0.1845 * wildcardPenalty), 1, bonusProjectileDamageUUID));
        desichalkosWildRDIn.applyModifier(AttributeModifier.createModifier("desichalkosWildRD", (0.5 * wildcardPenalty), 0, bonusReachUUID));
    }

    if (astralSilverBonus(helmet, chestplate, leggings, boots)) {
        val astralSilverWildMSIn as AttributeInstance = player.getAttribute("generic.movementSpeed");
        val astralSilverWildMDIn as AttributeInstance = player.getAttribute("potioncore.magicDamage");
        val astralSilverWildPDIn as AttributeInstance = player.getAttribute("potioncore.projectileDamage");
        val astralSilverWildADIn as AttributeInstance = player.getAttribute("generic.attackDamage");
        val astralSilverWildASIn as AttributeInstance = player.getAttribute("generic.attackSpeed");
        val astralSilverWildRDIn as AttributeInstance = player.getAttribute("generic.reachDistance");
    
        astralSilverWildASIn.applyModifier(AttributeModifier.createModifier("astralSilverWildAS", (-0.53 * wildcardPenalty), 1, bonusAttackSpeedUUID));
        astralSilverWildADIn.applyModifier(AttributeModifier.createModifier("astralSilverWildAD", (0.89 * wildcardPenalty), 1, bonusDamageUUID));
        astralSilverWildMSIn.applyModifier(AttributeModifier.createModifier("astralSilverWildMS", (0.075 * wildcardPenalty), 1, bonusMovementSpeedUUID));
        astralSilverWildMDIn.applyModifier(AttributeModifier.createModifier("astralSilverWildMD", (-0.09 * wildcardPenalty), 1, bonusMagicDamageUUID));
        astralSilverWildPDIn.applyModifier(AttributeModifier.createModifier("astralSilverWildPD", (-0.17015 * wildcardPenalty), 1, bonusProjectileDamageUUID));
        astralSilverWildRDIn.applyModifier(AttributeModifier.createModifier("astralSilverWildRD", (0.5 * wildcardPenalty), 0, bonusReachUUID));
    }

    if (shadowIronBonus(helmet, chestplate, leggings, boots)) {
        val shadowIronWildMSIn as AttributeInstance = player.getAttribute("generic.movementSpeed");
        val shadowIronWildMDIn as AttributeInstance = player.getAttribute("potioncore.magicDamage");
        val shadowIronWildPDIn as AttributeInstance = player.getAttribute("potioncore.projectileDamage");
        val shadowIronWildASIn as AttributeInstance = player.getAttribute("generic.attackSpeed");
        val shadowIronWildADIn as AttributeInstance = player.getAttribute("generic.attackDamage");
    
        shadowIronWildASIn.applyModifier(AttributeModifier.createModifier("shadowIronWildAS", (0.24 * wildcardPenalty), 1, bonusAttackSpeedUUID));
        shadowIronWildMSIn.applyModifier(AttributeModifier.createModifier("shadowIronWildMS", (0.15 * wildcardPenalty), 1, bonusMovementSpeedUUID));
        shadowIronWildMDIn.applyModifier(AttributeModifier.createModifier("shadowIronWildMD", (-0.09 * wildcardPenalty), 1, bonusMagicDamageUUID));
        shadowIronWildPDIn.applyModifier(AttributeModifier.createModifier("shadowIronWildPD", (-0.17015 * wildcardPenalty), 1, bonusProjectileDamageUUID));
        shadowIronWildADIn.applyModifier(AttributeModifier.createModifier("shadowIronWildAD", (-0.25 * wildcardPenalty), 1, bonusDamageUUID));
    }

    if (eximiteBonus(helmet, chestplate, leggings, boots)) {
        val eximiteWildMSIn as AttributeInstance = player.getAttribute("generic.movementSpeed");
        val eximiteWildMDIn as AttributeInstance = player.getAttribute("potioncore.magicDamage");
        val eximiteWildPDIn as AttributeInstance = player.getAttribute("potioncore.projectileDamage");
        val eximiteWildASIn as AttributeInstance = player.getAttribute("generic.attackSpeed");
        val eximiteWildADIn as AttributeInstance = player.getAttribute("generic.attackDamage");
    
        eximiteWildASIn.applyModifier(AttributeModifier.createModifier("eximiteWildAS", (0.26 * wildcardPenalty), 1, bonusAttackSpeedUUID));
        eximiteWildMSIn.applyModifier(AttributeModifier.createModifier("eximiteWildMS", (0.18 * wildcardPenalty), 1, bonusMovementSpeedUUID));
        eximiteWildMDIn.applyModifier(AttributeModifier.createModifier("eximiteWildMD", (-0.085 * wildcardPenalty), 1, bonusMagicDamageUUID));
        eximiteWildPDIn.applyModifier(AttributeModifier.createModifier("eximiteWildPD", (-0.111625 * wildcardPenalty), 1, bonusProjectileDamageUUID));
        eximiteWildADIn.applyModifier(AttributeModifier.createModifier("eximiteWildAD", (-0.30 * wildcardPenalty), 1, bonusDamageUUID));
    }

    if (mutantSkeletonBonus(helmet, chestplate, leggings, boots)) {
        val mutantSkeletonWildMSIn as AttributeInstance = player.getAttribute("generic.movementSpeed");
        val mutantSkeletonWildMDIn as AttributeInstance = player.getAttribute("potioncore.magicDamage");
        val mutantSkeletonWildPDIn as AttributeInstance = player.getAttribute("potioncore.projectileDamage");
        val mutantSkeletonWildASIn as AttributeInstance = player.getAttribute("generic.attackSpeed");
        val mutantSkeletonWildADIn as AttributeInstance = player.getAttribute("generic.attackDamage");
    
        mutantSkeletonWildASIn.applyModifier(AttributeModifier.createModifier("mutantSkeletonWildAS", (0.28 * wildcardPenalty), 1, bonusAttackSpeedUUID));
        mutantSkeletonWildMSIn.applyModifier(AttributeModifier.createModifier("mutantSkeletonWildMS", (0.2 * wildcardPenalty), 1, bonusMovementSpeedUUID));
        mutantSkeletonWildMDIn.applyModifier(AttributeModifier.createModifier("mutantSkeletonWildMD", (-0.08 * wildcardPenalty), 1, bonusMagicDamageUUID));
        mutantSkeletonWildPDIn.applyModifier(AttributeModifier.createModifier("mutantSkeletonWildPD", (-0.1084 * wildcardPenalty), 1, bonusProjectileDamageUUID));
        mutantSkeletonWildADIn.applyModifier(AttributeModifier.createModifier("mutantSkeletonWildAD", (-0.35 * wildcardPenalty), 1, bonusDamageUUID));
    }

    if (shadowSteelBonus(helmet, chestplate, leggings, boots)) {
        val shadowSteelWildMSIn as AttributeInstance = player.getAttribute("generic.movementSpeed");
        val shadowSteelWildMDIn as AttributeInstance = player.getAttribute("potioncore.magicDamage");
        val shadowSteelWildPDIn as AttributeInstance = player.getAttribute("potioncore.projectileDamage");
        val shadowSteelWildADIn as AttributeInstance = player.getAttribute("generic.attackDamage");
        val shadowSteelWildASIn as AttributeInstance = player.getAttribute("generic.attackSpeed");
        val shadowSteelWildRDIn as AttributeInstance = player.getAttribute("generic.reachDistance");
    
        shadowSteelWildASIn.applyModifier(AttributeModifier.createModifier("shadowSteelWildAS", (-0.57 * wildcardPenalty), 1, bonusAttackSpeedUUID));
        shadowSteelWildADIn.applyModifier(AttributeModifier.createModifier("shadowSteelWildAD", (0.97 * wildcardPenalty), 1, bonusDamageUUID));
        shadowSteelWildMSIn.applyModifier(AttributeModifier.createModifier("shadowSteelWildMS", (0.075 * wildcardPenalty), 1, bonusMovementSpeedUUID));
        shadowSteelWildMDIn.applyModifier(AttributeModifier.createModifier("shadowSteelWildMD", (-0.08 * wildcardPenalty), 1, bonusMagicDamageUUID));
        shadowSteelWildPDIn.applyModifier(AttributeModifier.createModifier("shadowSteelWildPD", (-0.1084 * wildcardPenalty), 1, bonusProjectileDamageUUID));
        shadowSteelWildRDIn.applyModifier(AttributeModifier.createModifier("shadowSteelWildRD", (0.75 * wildcardPenalty), 0, bonusReachUUID));
    }

    if (amordrineBonus(helmet, chestplate, leggings, boots)) {
        val amordrineWildMSIn as AttributeInstance = player.getAttribute("generic.movementSpeed");
        val amordrineWildMDIn as AttributeInstance = player.getAttribute("potioncore.magicDamage");
        val amordrineWildPDIn as AttributeInstance = player.getAttribute("potioncore.projectileDamage");
        val amordrineWildADIn as AttributeInstance = player.getAttribute("generic.attackDamage");
        val amordrineWildASIn as AttributeInstance = player.getAttribute("generic.attackSpeed");
        val amordrineWildRDIn as AttributeInstance = player.getAttribute("generic.reachDistance");
    
        amordrineWildASIn.applyModifier(AttributeModifier.createModifier("amordrineWildAS", (-0.60 * wildcardPenalty), 1, bonusAttackSpeedUUID));
        amordrineWildADIn.applyModifier(AttributeModifier.createModifier("amordrineWildAD", (1.05 * wildcardPenalty), 1, bonusDamageUUID));
        amordrineWildMSIn.applyModifier(AttributeModifier.createModifier("amordrineWildMS", (0.125 * wildcardPenalty), 1, bonusMovementSpeedUUID));
        amordrineWildMDIn.applyModifier(AttributeModifier.createModifier("amordrineWildMD", (-0.07 * wildcardPenalty), 1, bonusMagicDamageUUID));
        amordrineWildPDIn.applyModifier(AttributeModifier.createModifier("amordrineWildPD", (-0.1 * wildcardPenalty), 1, bonusProjectileDamageUUID));
        amordrineWildRDIn.applyModifier(AttributeModifier.createModifier("amordrineWildRD", (0.75 * wildcardPenalty), 0, bonusReachUUID));
    }

    if (jadeBonus(helmet, chestplate, leggings, boots)) {
        val jadeWildMSIn as AttributeInstance = player.getAttribute("generic.movementSpeed");
        val jadeWildMDIn as AttributeInstance = player.getAttribute("potioncore.magicDamage");
        val jadeWildPDIn as AttributeInstance = player.getAttribute("potioncore.projectileDamage");
        val jadeWildASIn as AttributeInstance = player.getAttribute("generic.attackSpeed");
        val jadeWildADIn as AttributeInstance = player.getAttribute("generic.attackDamage");
    
        jadeWildASIn.applyModifier(AttributeModifier.createModifier("jadeWildAS", (0.3 * wildcardPenalty), 1, bonusAttackSpeedUUID));
        jadeWildMSIn.applyModifier(AttributeModifier.createModifier("jadeWildMS", (0.13 * wildcardPenalty), 1, bonusMovementSpeedUUID));
        jadeWildMDIn.applyModifier(AttributeModifier.createModifier("jadeWildMD", (-0.07 * wildcardPenalty), 1, bonusMagicDamageUUID));
        jadeWildPDIn.applyModifier(AttributeModifier.createModifier("jadeWildPD", (-0.1 * wildcardPenalty), 1, bonusProjectileDamageUUID));
        jadeWildADIn.applyModifier(AttributeModifier.createModifier("jadeWildAD", (-0.4 * wildcardPenalty), 1, bonusDamageUUID));
    }

    if (bronzeBonus(helmet, chestplate, leggings, boots)) {
        val bronzeWildMDIn as AttributeInstance = player.getAttribute("potioncore.magicDamage");
        val bronzeWildPDIn as AttributeInstance = player.getAttribute("potioncore.projectileDamage");
    
        bronzeWildMDIn.applyModifier(AttributeModifier.createModifier("bronzeWildMD", (-0.135 * wildcardPenalty), 1, bonusMagicDamageUUID));
        bronzeWildPDIn.applyModifier(AttributeModifier.createModifier("bronzeWildPD", (-0.275 * wildcardPenalty), 1, bonusProjectileDamageUUID));
    }

    if (steelBonus(helmet, chestplate, leggings, boots)) {
        val steelWildMDIn as AttributeInstance = player.getAttribute("potioncore.magicDamage");
        val steelWildPDIn as AttributeInstance = player.getAttribute("potioncore.projectileDamage");
    
        steelWildMDIn.applyModifier(AttributeModifier.createModifier("steelWildMD", (-0.135 * wildcardPenalty), 1, bonusMagicDamageUUID));
        steelWildPDIn.applyModifier(AttributeModifier.createModifier("steelWildPD", (-0.275 * wildcardPenalty), 1, bonusProjectileDamageUUID));
    }

    if (heavyIronBonus(helmet, chestplate, leggings, boots)) {
        val heavyIronWildMDIn as AttributeInstance = player.getAttribute("potioncore.magicDamage");
        val heavyIronWildPDIn as AttributeInstance = player.getAttribute("potioncore.projectileDamage");
        val heavyIronWildATIn as AttributeInstance = player.getAttribute("generic.armorToughness");

        heavyIronWildMDIn.applyModifier(AttributeModifier.createModifier("heavyIronWildMD", (-0.13 * wildcardPenalty), 1, bonusMagicDamageUUID));
        heavyIronWildPDIn.applyModifier(AttributeModifier.createModifier("heavyIronWildPD", (-0.2675 * wildcardPenalty), 1, bonusProjectileDamageUUID));
        heavyIronWildATIn.applyModifier(AttributeModifier.createModifier("heavyIronWildAT", (-0.2 * wildcardPenalty), 1, bonusArmorToughnessUUID));
    }

    if (heavyDiamondBonus(helmet, chestplate, leggings, boots)) {
        val heavyDiamondWildMDIn as AttributeInstance = player.getAttribute("potioncore.magicDamage");
        val heavyDiamondWildPDIn as AttributeInstance = player.getAttribute("potioncore.projectileDamage");
        val heavyDiamondWildATIn as AttributeInstance = player.getAttribute("generic.armorToughness");

        heavyDiamondWildMDIn.applyModifier(AttributeModifier.createModifier("heavyDiamondWildMD", (-0.13 * wildcardPenalty), 1, bonusMagicDamageUUID));
        heavyDiamondWildPDIn.applyModifier(AttributeModifier.createModifier("heavyDiamondWildPD", (-0.267 * wildcardPenalty), 1, bonusProjectileDamageUUID));
        heavyDiamondWildATIn.applyModifier(AttributeModifier.createModifier("heavyDiamondWildAT", (-0.2 * wildcardPenalty), 1, bonusArmorToughnessUUID));
    }

    if (bullBonus(helmet, chestplate, leggings, boots)) {
        val bullWildMDIn as AttributeInstance = player.getAttribute("potioncore.magicDamage");
        val bullWildPDIn as AttributeInstance = player.getAttribute("potioncore.projectileDamage");
    
        bullWildMDIn.applyModifier(AttributeModifier.createModifier("bullWildMD", (-0.12 * wildcardPenalty), 1, bonusMagicDamageUUID));
        bullWildPDIn.applyModifier(AttributeModifier.createModifier("bullWildPD", (-0.229625 * wildcardPenalty), 1, bonusProjectileDamageUUID));
    }

    if (turtleBonus(helmet, chestplate, leggings, boots)) {
        val turtleWildMDIn as AttributeInstance = player.getAttribute("potioncore.magicDamage");
        val turtleWildPDIn as AttributeInstance = player.getAttribute("potioncore.projectileDamage");
    
        turtleWildMDIn.applyModifier(AttributeModifier.createModifier("turtleWildMD", (-0.12 * wildcardPenalty), 1, bonusMagicDamageUUID));
        turtleWildPDIn.applyModifier(AttributeModifier.createModifier("turtleWildPD", (-0.229625 * wildcardPenalty), 1, bonusProjectileDamageUUID));
    }

    if (vulcaniteBonus(helmet, chestplate, leggings, boots)) {
        val vulcaniteWildMDIn as AttributeInstance = player.getAttribute("potioncore.magicDamage");
        val vulcaniteWildPDIn as AttributeInstance = player.getAttribute("potioncore.projectileDamage");
    
        vulcaniteWildMDIn.applyModifier(AttributeModifier.createModifier("vulcaniteWildMD", (-0.11 * wildcardPenalty), 1, bonusMagicDamageUUID));
        vulcaniteWildPDIn.applyModifier(AttributeModifier.createModifier("vulcaniteWildPD", (-0.1845 * wildcardPenalty), 1, bonusProjectileDamageUUID));
    }

    if (electrumBonus(helmet, chestplate, leggings, boots)) {
        val electrumWildMDIn as AttributeInstance = player.getAttribute("potioncore.magicDamage");
        val electrumWildPDIn as AttributeInstance = player.getAttribute("potioncore.projectileDamage");
    
        electrumWildMDIn.applyModifier(AttributeModifier.createModifier("electrumWildMD", (-0.11 * wildcardPenalty), 1, bonusMagicDamageUUID));
        electrumWildPDIn.applyModifier(AttributeModifier.createModifier("electrumWildPD", (-0.1845 * wildcardPenalty), 1, bonusProjectileDamageUUID));
    }

    if (osmiumBonus(helmet, chestplate, leggings, boots)) {
        val osmiumWildMDIn as AttributeInstance = player.getAttribute("potioncore.magicDamage");
        val osmiumWildPDIn as AttributeInstance = player.getAttribute("potioncore.projectileDamage");
    
        osmiumWildMDIn.applyModifier(AttributeModifier.createModifier("osmiumWildMD", (-0.09 * wildcardPenalty), 1, bonusMagicDamageUUID));
        osmiumWildPDIn.applyModifier(AttributeModifier.createModifier("osmiumWildPD", (-0.17015 * wildcardPenalty), 1, bonusProjectileDamageUUID));
    }

    if (orichalcumBonus(helmet, chestplate, leggings, boots)) {
        val orichalcumWildMDIn as AttributeInstance = player.getAttribute("potioncore.magicDamage");
        val orichalcumWildPDIn as AttributeInstance = player.getAttribute("potioncore.projectileDamage");
    
        orichalcumWildMDIn.applyModifier(AttributeModifier.createModifier("orichalcumWildMD", (-0.09 * wildcardPenalty), 1, bonusMagicDamageUUID));
        orichalcumWildPDIn.applyModifier(AttributeModifier.createModifier("orichalcumWildPD", (-0.17015 * wildcardPenalty), 1, bonusProjectileDamageUUID));
    }

    if (lutetiumBonus(helmet, chestplate, leggings, boots)) {
        val lutetiumWildMDIn as AttributeInstance = player.getAttribute("potioncore.magicDamage");
        val lutetiumWildPDIn as AttributeInstance = player.getAttribute("potioncore.projectileDamage");
    
        lutetiumWildMDIn.applyModifier(AttributeModifier.createModifier("lutetiumWildMD", (-0.085 * wildcardPenalty), 1, bonusMagicDamageUUID));
        lutetiumWildPDIn.applyModifier(AttributeModifier.createModifier("lutetiumWildPD", (-0.111625 * wildcardPenalty), 1, bonusProjectileDamageUUID));
    }

    if (haderothBonus(helmet, chestplate, leggings, boots)) {
        val haderothWildMDIn as AttributeInstance = player.getAttribute("potioncore.magicDamage");
        val haderothWildPDIn as AttributeInstance = player.getAttribute("potioncore.projectileDamage");
    
        haderothWildMDIn.applyModifier(AttributeModifier.createModifier("haderothWildMD", (-0.08 * wildcardPenalty), 1, bonusMagicDamageUUID));
        haderothWildPDIn.applyModifier(AttributeModifier.createModifier("haderothWildPD", (-0.108 * wildcardPenalty), 1, bonusProjectileDamageUUID));
    }

    if (tenebrumBonus(helmet, chestplate, leggings, boots)) {
        val tenebrumWildMDIn as AttributeInstance = player.getAttribute("potioncore.magicDamage");
        val tenebrumWildPDIn as AttributeInstance = player.getAttribute("potioncore.projectileDamage");
    
        tenebrumWildMDIn.applyModifier(AttributeModifier.createModifier("tenebrumWildMD", (-0.08 * wildcardPenalty), 1, bonusMagicDamageUUID));
        tenebrumWildPDIn.applyModifier(AttributeModifier.createModifier("tenebrumWildPD", (-0.108 * wildcardPenalty), 1, bonusProjectileDamageUUID));
    }

    if (blackSteelBonus(helmet, chestplate, leggings, boots)) {
        val blackSteelWildMDIn as AttributeInstance = player.getAttribute("potioncore.magicDamage");
        val blackSteelWildPDIn as AttributeInstance = player.getAttribute("potioncore.projectileDamage");
    
        blackSteelWildMDIn.applyModifier(AttributeModifier.createModifier("blackSteelWildMD", (-0.07 * wildcardPenalty), 1, bonusMagicDamageUUID));
        blackSteelWildPDIn.applyModifier(AttributeModifier.createModifier("blackSteelWildPD", (-0.1 * wildcardPenalty), 1, bonusProjectileDamageUUID));
    }

    if (rhinoBonus(helmet, chestplate, leggings, boots)) {
        val rhinoWildMDIn as AttributeInstance = player.getAttribute("potioncore.magicDamage");
        val rhinoWildPDIn as AttributeInstance = player.getAttribute("potioncore.projectileDamage");
    
        rhinoWildMDIn.applyModifier(AttributeModifier.createModifier("rhinoWildMD", (-0.07 * wildcardPenalty), 1, bonusMagicDamageUUID));
        rhinoWildPDIn.applyModifier(AttributeModifier.createModifier("rhinoWildPD", (-0.1 * wildcardPenalty), 1, bonusProjectileDamageUUID));
    }

    if (brassBonus(helmet, chestplate, leggings, boots)) {
        val brassWildADIn as AttributeInstance = player.getAttribute("generic.attackDamage");
        val brassWildMDIn as AttributeInstance = player.getAttribute("potioncore.magicDamage");
        val brassWildPDIn as AttributeInstance = player.getAttribute("potioncore.projectileDamage");
    
        brassWildADIn.applyModifier(AttributeModifier.createModifier("brassWildAD", (-0.244425 * wildcardPenalty), 1, bonusDamageUUID));
        brassWildMDIn.applyModifier(AttributeModifier.createModifier("brassWildMD", (-0.13 * wildcardPenalty), 1, bonusMagicDamageUUID));
        brassWildPDIn.applyModifier(AttributeModifier.createModifier("brassWildPD", (0.1 * wildcardPenalty), 1, bonusProjectileDamageUUID));
    }

    if (silverBonus(helmet, chestplate, leggings, boots)) {
        val silverWildADIn as AttributeInstance = player.getAttribute("generic.attackDamage");
        val silverWildMDIn as AttributeInstance = player.getAttribute("potioncore.magicDamage");
        val silverWildPDIn as AttributeInstance = player.getAttribute("potioncore.projectileDamage");
    
        silverWildADIn.applyModifier(AttributeModifier.createModifier("silverWildAD", (-0.234858 * wildcardPenalty), 1, bonusDamageUUID));
        silverWildMDIn.applyModifier(AttributeModifier.createModifier("silverWildMD", (-0.125 * wildcardPenalty), 1, bonusMagicDamageUUID));
        silverWildPDIn.applyModifier(AttributeModifier.createModifier("silverWildPD", (0.05 * wildcardPenalty), 1, bonusProjectileDamageUUID));
    }

    if (spiderBonus(helmet, chestplate, leggings, boots)) {
        val spiderWildADIn as AttributeInstance = player.getAttribute("generic.attackDamage");
        val spiderWildMDIn as AttributeInstance = player.getAttribute("potioncore.magicDamage");
        val spiderWildPDIn as AttributeInstance = player.getAttribute("potioncore.projectileDamage");
    
        spiderWildADIn.applyModifier(AttributeModifier.createModifier("spiderWildAD", (-0.232 * wildcardPenalty), 1, bonusDamageUUID));
        spiderWildMDIn.applyModifier(AttributeModifier.createModifier("spiderWildMD", (-0.12 * wildcardPenalty), 1, bonusMagicDamageUUID));
        spiderWildPDIn.applyModifier(AttributeModifier.createModifier("spiderWildPD", (0.07 * wildcardPenalty), 1, bonusProjectileDamageUUID));
    }

    if (deepIronBonus(helmet, chestplate, leggings, boots)) {
        val deepIronWildADIn as AttributeInstance = player.getAttribute("generic.attackDamage");
        val deepIronWildMDIn as AttributeInstance = player.getAttribute("potioncore.magicDamage");
        val deepIronWildPDIn as AttributeInstance = player.getAttribute("potioncore.projectileDamage");
    
        deepIronWildADIn.applyModifier(AttributeModifier.createModifier("deepIronWildAD", (-0.232 * wildcardPenalty), 1, bonusDamageUUID));
        deepIronWildMDIn.applyModifier(AttributeModifier.createModifier("deepIronWildMD", (-0.12 * wildcardPenalty), 1, bonusMagicDamageUUID));
        deepIronWildPDIn.applyModifier(AttributeModifier.createModifier("deepIronWildPD", (0.15 * wildcardPenalty), 1, bonusProjectileDamageUUID));
    }

    if (carmotBonus(helmet, chestplate, leggings, boots)) {
        val carmotWildADIn as AttributeInstance = player.getAttribute("generic.attackDamage");
        val carmotWildMDIn as AttributeInstance = player.getAttribute("potioncore.magicDamage");
        val carmotWildPDIn as AttributeInstance = player.getAttribute("potioncore.projectileDamage");
    
        carmotWildADIn.applyModifier(AttributeModifier.createModifier("carmotWildAD", (-0.23 * wildcardPenalty), 1, bonusDamageUUID));
        carmotWildMDIn.applyModifier(AttributeModifier.createModifier("carmotWildMD", (-0.09 * wildcardPenalty), 1, bonusMagicDamageUUID));
        carmotWildPDIn.applyModifier(AttributeModifier.createModifier("carmotWildPD", (0.1 * wildcardPenalty), 1, bonusProjectileDamageUUID));
    }

    if (kalendriteBonus(helmet, chestplate, leggings, boots)) {
        val kalendriteWildADIn as AttributeInstance = player.getAttribute("generic.attackDamage");
        val kalendriteWildMDIn as AttributeInstance = player.getAttribute("potioncore.magicDamage");
        val kalendriteWildPDIn as AttributeInstance = player.getAttribute("potioncore.projectileDamage");
    
        kalendriteWildADIn.applyModifier(AttributeModifier.createModifier("kalendriteWildAD", (-0.23 * wildcardPenalty), 1, bonusDamageUUID));
        kalendriteWildMDIn.applyModifier(AttributeModifier.createModifier("kalendriteWildMD", (-0.09 * wildcardPenalty), 1, bonusMagicDamageUUID));
        kalendriteWildPDIn.applyModifier(AttributeModifier.createModifier("kalendriteWildPD", (0.2 * wildcardPenalty), 1, bonusProjectileDamageUUID));
    }

    if (famineBonus(helmet, chestplate, leggings, boots)) {
        val famineWildADIn as AttributeInstance = player.getAttribute("generic.attackDamage");
        val famineWildMDIn as AttributeInstance = player.getAttribute("potioncore.magicDamage");
        val famineWildPDIn as AttributeInstance = player.getAttribute("potioncore.projectileDamage");
    
        famineWildADIn.applyModifier(AttributeModifier.createModifier("famineWildAD", (-0.2275 * wildcardPenalty), 1, bonusDamageUUID));
        famineWildMDIn.applyModifier(AttributeModifier.createModifier("famineWildMD", (-0.085 * wildcardPenalty), 1, bonusMagicDamageUUID));
        famineWildPDIn.applyModifier(AttributeModifier.createModifier("famineWildPD", (0.15 * wildcardPenalty), 1, bonusProjectileDamageUUID));
    }

    if (celenegilBonus(helmet, chestplate, leggings, boots)) {
        val celenegilWildADIn as AttributeInstance = player.getAttribute("generic.attackDamage");
        val celenegilWildMDIn as AttributeInstance = player.getAttribute("potioncore.magicDamage");
        val celenegilWildPDIn as AttributeInstance = player.getAttribute("potioncore.projectileDamage");
    
        celenegilWildADIn.applyModifier(AttributeModifier.createModifier("celenegilWildAD", (-0.2275 * wildcardPenalty), 1, bonusDamageUUID));
        celenegilWildMDIn.applyModifier(AttributeModifier.createModifier("celenegilWildMD", (-0.085 * wildcardPenalty), 1, bonusMagicDamageUUID));
        celenegilWildPDIn.applyModifier(AttributeModifier.createModifier("celenegilWildPD", (0.3 * wildcardPenalty), 1, bonusProjectileDamageUUID));
    }

    if (tartariteBonus(helmet, chestplate, leggings, boots)) {
        val tartariteWildADIn as AttributeInstance = player.getAttribute("generic.attackDamage");
        val tartariteWildMDIn as AttributeInstance = player.getAttribute("potioncore.magicDamage");
        val tartariteWildPDIn as AttributeInstance = player.getAttribute("potioncore.projectileDamage");
    
        tartariteWildADIn.applyModifier(AttributeModifier.createModifier("tartariteWildAD", (-0.202178 * wildcardPenalty), 1, bonusDamageUUID));
        tartariteWildMDIn.applyModifier(AttributeModifier.createModifier("tartariteWildMD", (-0.08 * wildcardPenalty), 1, bonusMagicDamageUUID));
        tartariteWildPDIn.applyModifier(AttributeModifier.createModifier("tartariteWildPD", (0.4 * wildcardPenalty), 1, bonusProjectileDamageUUID));
    }

    if (meteorBonus(helmet, chestplate, leggings, boots)) {
        val meteorWildADIn as AttributeInstance = player.getAttribute("generic.attackDamage");
        val meteorWildMDIn as AttributeInstance = player.getAttribute("potioncore.magicDamage");
        val meteorWildPDIn as AttributeInstance = player.getAttribute("potioncore.projectileDamage");
    
        meteorWildADIn.applyModifier(AttributeModifier.createModifier("meteorWildAD", (-0.19 * wildcardPenalty), 1, bonusDamageUUID));
        meteorWildMDIn.applyModifier(AttributeModifier.createModifier("meteorWildMD", (-0.07 * wildcardPenalty), 1, bonusMagicDamageUUID));
        meteorWildPDIn.applyModifier(AttributeModifier.createModifier("meteorWildPD", (0.25 * wildcardPenalty), 1, bonusProjectileDamageUUID));
    }

    if (krikBonus(helmet, chestplate, leggings, boots)) {
        val krikWildADIn as AttributeInstance = player.getAttribute("generic.attackDamage");
        val krikWildMDIn as AttributeInstance = player.getAttribute("potioncore.magicDamage");
        val krikWildPDIn as AttributeInstance = player.getAttribute("potioncore.projectileDamage");
    
        krikWildADIn.applyModifier(AttributeModifier.createModifier("krikWildAD", (-0.17 * wildcardPenalty), 1, bonusDamageUUID));
        krikWildMDIn.applyModifier(AttributeModifier.createModifier("krikWildMD", (-0.05 * wildcardPenalty), 1, bonusMagicDamageUUID));
        krikWildPDIn.applyModifier(AttributeModifier.createModifier("krikWildPD", (0.3 * wildcardPenalty), 1, bonusProjectileDamageUUID));
    }

    if (exoskeletonBonus(helmet, chestplate, leggings, boots)) {
        val exoskeletonWildADIn as AttributeInstance = player.getAttribute("generic.attackDamage");
        val exoskeletonWildMDIn as AttributeInstance = player.getAttribute("potioncore.magicDamage");
        val exoskeletonWildPDIn as AttributeInstance = player.getAttribute("potioncore.projectileDamage");
    
        exoskeletonWildADIn.applyModifier(AttributeModifier.createModifier("exoskeletonWildAD", (-0.17 * wildcardPenalty), 1, bonusDamageUUID));
        exoskeletonWildMDIn.applyModifier(AttributeModifier.createModifier("exoskeletonWildMD", (-0.05 * wildcardPenalty), 1, bonusMagicDamageUUID));
        exoskeletonWildPDIn.applyModifier(AttributeModifier.createModifier("exoskeletonWildPD", (0.6 * wildcardPenalty), 1, bonusProjectileDamageUUID));
    }

    if (prometheumBonus(helmet, chestplate, leggings, boots)) {
        val prometheumWildADIn as AttributeInstance = player.getAttribute("generic.attackDamage");
        val prometheumWildPDIn as AttributeInstance = player.getAttribute("potioncore.projectileDamage");
        val prometheumWildMDIn as AttributeInstance = player.getAttribute("potioncore.magicDamage");
    
        prometheumWildADIn.applyModifier(AttributeModifier.createModifier("prometheumWildAD", (-0.232125 * wildcardPenalty), 1, bonusDamageUUID));
        prometheumWildPDIn.applyModifier(AttributeModifier.createModifier("prometheumWildPD", (-0.2475 * wildcardPenalty), 1, bonusProjectileDamageUUID));
        prometheumWildMDIn.applyModifier(AttributeModifier.createModifier("prometheumWildMD", (0.18 * wildcardPenalty), 1, bonusMagicDamageUUID));
    }
    
    if (wetaBonus(helmet, chestplate, leggings, boots)) {
        val wetaWildADIn as AttributeInstance = player.getAttribute("generic.attackDamage");
        val wetaWildPDIn as AttributeInstance = player.getAttribute("potioncore.projectileDamage");
        val wetaWildMDIn as AttributeInstance = player.getAttribute("potioncore.magicDamage");
        val wetaWildAIn as AttributeInstance = player.getAttribute("generic.armor");
        val wetaWildMHIn as AttributeInstance = player.getAttribute("generic.maxHealth");

        wetaWildMHIn.applyModifier(AttributeModifier.createModifier("wetaWildMH", (5.0 * wildcardPenalty), 0, bonusHealthUUID));
        wetaWildAIn.applyModifier(AttributeModifier.createModifier("wetaWildA", (-5.0 * wildcardPenalty), 0, bonusArmorUUID));
        wetaWildADIn.applyModifier(AttributeModifier.createModifier("wetaWildAD", (-0.234858 * wildcardPenalty), 1, bonusDamageUUID));
        wetaWildPDIn.applyModifier(AttributeModifier.createModifier("wetaWildPD", (-0.27 * wildcardPenalty), 1, bonusProjectileDamageUUID));
        wetaWildMDIn.applyModifier(AttributeModifier.createModifier("wetaWildMD", (0.1 * wildcardPenalty), 1, bonusMagicDamageUUID));
    }

    if (platinumBonus(helmet, chestplate, leggings, boots)) {
        val platinumWildADIn as AttributeInstance = player.getAttribute("generic.attackDamage");
        val platinumWildPDIn as AttributeInstance = player.getAttribute("potioncore.projectileDamage");
        val platinumWildMDIn as AttributeInstance = player.getAttribute("potioncore.magicDamage");
        val platinumWildMHIn as AttributeInstance = player.getAttribute("generic.maxHealth");
        val platinumWildMMIn as AttributeInstance = player.getAttribute("xat.entityMagic.maxMana");

        platinumWildMHIn.applyModifier(AttributeModifier.createModifier("platinumWildMH", (-8.0 * wildcardPenalty), 0, bonusHealthUUID));
        platinumWildADIn.applyModifier(AttributeModifier.createModifier("platinumWildAD", (-0.23* wildcardPenalty), 1, bonusDamageUUID));
        platinumWildPDIn.applyModifier(AttributeModifier.createModifier("platinumWildPD", (-0.25 * wildcardPenalty), 1, bonusProjectileDamageUUID));
        platinumWildMDIn.applyModifier(AttributeModifier.createModifier("platinumWildMD", (0.25 * wildcardPenalty), 1, bonusMagicDamageUUID));
        platinumWildMMIn.applyModifier(AttributeModifier.createModifier("platinumWildMM", (100 * wildcardPenalty),0, bonusMaxManaUUID));
    }

    if (inquisitionBonus(helmet, chestplate, leggings, boots)) {
        val inquisitionWildADIn as AttributeInstance = player.getAttribute("generic.attackDamage");
        val inquisitionWildPDIn as AttributeInstance = player.getAttribute("potioncore.projectileDamage");
        val inquisitionWildMDIn as AttributeInstance = player.getAttribute("potioncore.magicDamage");
        val inquisitionWildAIn as AttributeInstance = player.getAttribute("generic.armor");
        val inquisitionWildMHIn as AttributeInstance = player.getAttribute("generic.maxHealth");

        inquisitionWildMHIn.applyModifier(AttributeModifier.createModifier("inquisitionWildMH", (6.0 * wildcardPenalty), 0, bonusHealthUUID));
        inquisitionWildAIn.applyModifier(AttributeModifier.createModifier("inquisitionWildA", (-6.0 * wildcardPenalty), 0, bonusArmorUUID));
        inquisitionWildADIn.applyModifier(AttributeModifier.createModifier("inquisitionWildAD", (-0.229 * wildcardPenalty), 1, bonusDamageUUID));
        inquisitionWildPDIn.applyModifier(AttributeModifier.createModifier("inquisitionWildPD", (-0.229625 * wildcardPenalty), 1, bonusProjectileDamageUUID));
        inquisitionWildMDIn.applyModifier(AttributeModifier.createModifier("inquisitionWildMD", (0.15 * wildcardPenalty), 1, bonusMagicDamageUUID));
    }

    if (swineBonus(helmet, chestplate, leggings, boots)) {
        val swineWildADIn as AttributeInstance = player.getAttribute("generic.attackDamage");
        val swineWildPDIn as AttributeInstance = player.getAttribute("potioncore.projectileDamage");
        val swineWildMDIn as AttributeInstance = player.getAttribute("potioncore.magicDamage");
        val swineWildMMIn as AttributeInstance = player.getAttribute("xat.entityMagic.maxMana");

        swineWildADIn.applyModifier(AttributeModifier.createModifier("swineWildAD", (-0.229 * wildcardPenalty), 1, bonusDamageUUID));
        swineWildPDIn.applyModifier(AttributeModifier.createModifier("swineWildPD", (-0.229625* wildcardPenalty), 1, bonusProjectileDamageUUID));
        swineWildMDIn.applyModifier(AttributeModifier.createModifier("swineWildMD", (0.3 * wildcardPenalty), 1, bonusMagicDamageUUID));
        swineWildMMIn.applyModifier(AttributeModifier.createModifier("swineWildMM", (100 * wildcardPenalty),0, bonusMaxManaUUID));
    }

    if (ignatiusBonus(helmet, chestplate, leggings, boots)) {
        val ignatiusWildADIn as AttributeInstance = player.getAttribute("generic.attackDamage");
        val ignatiusWildPDIn as AttributeInstance = player.getAttribute("potioncore.projectileDamage");
        val ignatiusWildMDIn as AttributeInstance = player.getAttribute("potioncore.magicDamage");
        val ignatiusWildAIn as AttributeInstance = player.getAttribute("generic.armor");
        val ignatiusWildMHIn as AttributeInstance = player.getAttribute("generic.maxHealth");

        ignatiusWildMHIn.applyModifier(AttributeModifier.createModifier("ignatiusWildMH", (8.0 * wildcardPenalty), 0, bonusHealthUUID));
        ignatiusWildAIn.applyModifier(AttributeModifier.createModifier("ignatiusWildA", (-8.0 * wildcardPenalty), 0, bonusArmorUUID));
        ignatiusWildADIn.applyModifier(AttributeModifier.createModifier("ignatiusWildAD", (-0.2275 * wildcardPenalty), 1, bonusDamageUUID));
        ignatiusWildPDIn.applyModifier(AttributeModifier.createModifier("ignatiusWildPD", (-0.1845 * wildcardPenalty), 1, bonusProjectileDamageUUID));
        ignatiusWildMDIn.applyModifier(AttributeModifier.createModifier("ignatiusWildMD", (0.225 * wildcardPenalty), 1, bonusMagicDamageUUID));
    }

    if (midasiumBonus(helmet, chestplate, leggings, boots)) {
        val midasiumWildADIn as AttributeInstance = player.getAttribute("generic.attackDamage");
        val midasiumWildPDIn as AttributeInstance = player.getAttribute("potioncore.projectileDamage");
        val midasiumWildMDIn as AttributeInstance = player.getAttribute("potioncore.magicDamage");
        val midasiumWildMMIn as AttributeInstance = player.getAttribute("xat.entityMagic.maxMana");

        midasiumWildADIn.applyModifier(AttributeModifier.createModifier("midasiumWildAD", (-0.2275 * wildcardPenalty), 1, bonusDamageUUID));
        midasiumWildPDIn.applyModifier(AttributeModifier.createModifier("midasiumWildPD", (-0.1845* wildcardPenalty), 1, bonusProjectileDamageUUID));
        midasiumWildMDIn.applyModifier(AttributeModifier.createModifier("midasiumWildMD", (0.45 * wildcardPenalty), 1, bonusMagicDamageUUID));
        midasiumWildMMIn.applyModifier(AttributeModifier.createModifier("midasiumWildMM", (100 * wildcardPenalty),0, bonusMaxManaUUID));
    }

    if (damascusSteelBonus(helmet, chestplate, leggings, boots)) {
        val damascusSteelWildADIn as AttributeInstance = player.getAttribute("generic.attackDamage");
        val damascusSteelWildPDIn as AttributeInstance = player.getAttribute("potioncore.projectileDamage");
        val damascusSteelWildMDIn as AttributeInstance = player.getAttribute("potioncore.magicDamage");
        val damascusSteelWildAIn as AttributeInstance = player.getAttribute("generic.armor");
        val damascusSteelWildMHIn as AttributeInstance = player.getAttribute("generic.maxHealth");

        damascusSteelWildMHIn.applyModifier(AttributeModifier.createModifier("damascusSteelWildMH", (12.0 * wildcardPenalty), 0, bonusHealthUUID));
        damascusSteelWildAIn.applyModifier(AttributeModifier.createModifier("damascusSteelWildA", (-12.0 * wildcardPenalty), 0, bonusArmorUUID));
        damascusSteelWildADIn.applyModifier(AttributeModifier.createModifier("damascusSteelWildAD", (-0.212178 * wildcardPenalty), 1, bonusDamageUUID));
        damascusSteelWildPDIn.applyModifier(AttributeModifier.createModifier("damascusSteelWildPD", (-0.17015 * wildcardPenalty), 1, bonusProjectileDamageUUID));
        damascusSteelWildMDIn.applyModifier(AttributeModifier.createModifier("damascusSteelWildMD", (0.3 * wildcardPenalty), 1, bonusMagicDamageUUID));
    }

    if (atlarusBonus(helmet, chestplate, leggings, boots)) {
        val atlarusWildADIn as AttributeInstance = player.getAttribute("generic.attackDamage");
        val atlarusWildPDIn as AttributeInstance = player.getAttribute("potioncore.projectileDamage");
        val atlarusWildMDIn as AttributeInstance = player.getAttribute("potioncore.magicDamage");
        val atlarusWildMMIn as AttributeInstance = player.getAttribute("xat.entityMagic.maxMana");

        atlarusWildADIn.applyModifier(AttributeModifier.createModifier("atlarusWildAD", (-0.212178 * wildcardPenalty), 1, bonusDamageUUID));
        atlarusWildPDIn.applyModifier(AttributeModifier.createModifier("atlarusWildPD", (-0.17015* wildcardPenalty), 1, bonusProjectileDamageUUID));
        atlarusWildMDIn.applyModifier(AttributeModifier.createModifier("atlarusWildMD", (0.6 * wildcardPenalty), 1, bonusMagicDamageUUID));
        atlarusWildMMIn.applyModifier(AttributeModifier.createModifier("atlarusWildMM", (100 * wildcardPenalty),0, bonusMaxManaUUID));
    }

    if (moltenBonus(helmet, chestplate, leggings, boots)) {
        val moltenWildADIn as AttributeInstance = player.getAttribute("generic.attackDamage");
        val moltenWildPDIn as AttributeInstance = player.getAttribute("potioncore.projectileDamage");
        val moltenWildMDIn as AttributeInstance = player.getAttribute("potioncore.magicDamage");
        val moltenWildAIn as AttributeInstance = player.getAttribute("generic.armor");
        val moltenWildMHIn as AttributeInstance = player.getAttribute("generic.maxHealth");

        moltenWildMHIn.applyModifier(AttributeModifier.createModifier("moltenWildMH", (17.0 * wildcardPenalty), 0, bonusHealthUUID));
        moltenWildAIn.applyModifier(AttributeModifier.createModifier("moltenWildA", (-17.0 * wildcardPenalty), 0, bonusArmorUUID));
        moltenWildADIn.applyModifier(AttributeModifier.createModifier("moltenWildAD", (-0.202178 * wildcardPenalty), 1, bonusDamageUUID));
        moltenWildPDIn.applyModifier(AttributeModifier.createModifier("moltenWildPD", (-0.111625 * wildcardPenalty), 1, bonusProjectileDamageUUID));
        moltenWildMDIn.applyModifier(AttributeModifier.createModifier("moltenWildMD", (0.35 * wildcardPenalty), 1, bonusMagicDamageUUID));
    }

    if (rockshroomBonus(helmet, chestplate, leggings, boots)) {
        val rockshroomWildADIn as AttributeInstance = player.getAttribute("generic.attackDamage");
        val rockshroomWildPDIn as AttributeInstance = player.getAttribute("potioncore.projectileDamage");
        val rockshroomWildMDIn as AttributeInstance = player.getAttribute("potioncore.magicDamage");
        val rockshroomWildAIn as AttributeInstance = player.getAttribute("generic.armor");
        val rockshroomWildMHIn as AttributeInstance = player.getAttribute("generic.maxHealth");

        rockshroomWildMHIn.applyModifier(AttributeModifier.createModifier("rockshroomWildMH", (26.0 * wildcardPenalty), 0, bonusHealthUUID));
        rockshroomWildAIn.applyModifier(AttributeModifier.createModifier("rockshroomWildA", (-26.0 * wildcardPenalty), 0, bonusArmorUUID));
        rockshroomWildADIn.applyModifier(AttributeModifier.createModifier("rockshroomWildAD", (-0.190194 * wildcardPenalty), 1, bonusDamageUUID));
        rockshroomWildPDIn.applyModifier(AttributeModifier.createModifier("rockshroomWildPD", (-0.108 * wildcardPenalty), 1, bonusProjectileDamageUUID));
        rockshroomWildMDIn.applyModifier(AttributeModifier.createModifier("rockshroomWildMD", (0.4 * wildcardPenalty), 1, bonusMagicDamageUUID));
    }

    if (ceruclaseBonus(helmet, chestplate, leggings, boots)) {
        val ceruclaseWildADIn as AttributeInstance = player.getAttribute("generic.attackDamage");
        val ceruclaseWildPDIn as AttributeInstance = player.getAttribute("potioncore.projectileDamage");
        val ceruclaseWildMDIn as AttributeInstance = player.getAttribute("potioncore.magicDamage");
        val ceruclaseWildMMIn as AttributeInstance = player.getAttribute("xat.entityMagic.maxMana");

        ceruclaseWildADIn.applyModifier(AttributeModifier.createModifier("ceruclaseWildAD", (-0.190194 * wildcardPenalty), 1, bonusDamageUUID));
        ceruclaseWildPDIn.applyModifier(AttributeModifier.createModifier("ceruclaseWildPD", (-0.108* wildcardPenalty), 1, bonusProjectileDamageUUID));
        ceruclaseWildMDIn.applyModifier(AttributeModifier.createModifier("ceruclaseWildMD", (0.8 * wildcardPenalty), 1, bonusMagicDamageUUID));
        ceruclaseWildMMIn.applyModifier(AttributeModifier.createModifier("ceruclaseWildMM", (100 * wildcardPenalty),0, bonusMaxManaUUID));
    }

    if (inolashiteBonus(helmet, chestplate, leggings, boots)) {
        val inolashiteWildADIn as AttributeInstance = player.getAttribute("generic.attackDamage");
        val inolashiteWildPDIn as AttributeInstance = player.getAttribute("potioncore.projectileDamage");
        val inolashiteWildMDIn as AttributeInstance = player.getAttribute("potioncore.magicDamage");
        val inolashiteWildAIn as AttributeInstance = player.getAttribute("generic.armor");
        val inolashiteWildMHIn as AttributeInstance = player.getAttribute("generic.maxHealth");

        inolashiteWildMHIn.applyModifier(AttributeModifier.createModifier("inolashiteWildMH", (42.0 * wildcardPenalty), 0, bonusHealthUUID));
        inolashiteWildAIn.applyModifier(AttributeModifier.createModifier("inolashiteWildA", (-42.0 * wildcardPenalty), 0, bonusArmorUUID));
        inolashiteWildADIn.applyModifier(AttributeModifier.createModifier("inolashiteWildAD", (-0.180194 * wildcardPenalty), 1, bonusDamageUUID));
        inolashiteWildPDIn.applyModifier(AttributeModifier.createModifier("inolashiteWildPD", (-0.1 * wildcardPenalty), 1, bonusProjectileDamageUUID));
        inolashiteWildMDIn.applyModifier(AttributeModifier.createModifier("inolashiteWildMD", (0.45 * wildcardPenalty), 1, bonusMagicDamageUUID));
    }

    if (vyroxeresBonus(helmet, chestplate, leggings, boots)) {
        val vyroxeresWildADIn as AttributeInstance = player.getAttribute("generic.attackDamage");
        val vyroxeresWildPDIn as AttributeInstance = player.getAttribute("potioncore.projectileDamage");
        val vyroxeresWildMDIn as AttributeInstance = player.getAttribute("potioncore.magicDamage");
        val vyroxeresWildMMIn as AttributeInstance = player.getAttribute("xat.entityMagic.maxMana");

        vyroxeresWildADIn.applyModifier(AttributeModifier.createModifier("vyroxeresWildAD", (-0.180194 * wildcardPenalty), 1, bonusDamageUUID));
        vyroxeresWildPDIn.applyModifier(AttributeModifier.createModifier("vyroxeresWildPD", (-0.1 * wildcardPenalty), 1, bonusProjectileDamageUUID));
        vyroxeresWildMDIn.applyModifier(AttributeModifier.createModifier("vyroxeresWildMD", (0.9 * wildcardPenalty), 1, bonusMagicDamageUUID));
        vyroxeresWildMMIn.applyModifier(AttributeModifier.createModifier("vyroxeresWildMM", (100 * wildcardPenalty),0, bonusMaxManaUUID));
    }

    if (sentientNecromancerBonus(helmet, chestplate, leggings, boots)) {
        val sentientNecromancerWildMDIn as AttributeInstance = player.getAttribute("potioncore.magicDamage");
        val sentientNecromancerWildMHIn as AttributeInstance = player.getAttribute("generic.maxHealth");
        val sentientNecromancerWildMSIn as AttributeInstance = player.getAttribute("generic.movementSpeed");
        val sentientNecromancerWildMRIn as AttributeInstance = player.getAttribute("xat.entityMagic.regen");

        sentientNecromancerWildMHIn.applyModifier(AttributeModifier.createModifier("sentientNecromancerWildMH", (73.0 * wildcardPenalty), 0, bonusHealthUUID));
        sentientNecromancerWildMDIn.applyModifier(AttributeModifier.createModifier("sentientNecromancerWildMD", (0.70 * wildcardPenalty), 1, bonusMagicDamageUUID));
        sentientNecromancerWildMSIn.applyModifier(AttributeModifier.createModifier("sentientNecromancerWildMS", (0.15), 1, bonusMovementSpeedUUID));
        sentientNecromancerWildMRIn.applyModifier(AttributeModifier.createModifier("sentientNecromancerWildMR", (0.5 * wildcardPenalty), 1, bonusManaRegenUUID));
    }

    if (sentientWarlockBonus(helmet, chestplate, leggings, boots)) {
        val sentientWarlockWildMHIn as AttributeInstance = player.getAttribute("generic.maxHealth");
        val sentientWarlockWildMDIn as AttributeInstance = player.getAttribute("potioncore.magicDamage");
        val sentientWarlockWildMMIn as AttributeInstance = player.getAttribute("xat.entityMagic.maxMana");
        val sentientWarlockWildMSIn as AttributeInstance = player.getAttribute("generic.movementSpeed");
        val sentientWarlockWildAIn as AttributeInstance = player.getAttribute("generic.armor");
        val sentientWarlockWildMRIn as AttributeInstance = player.getAttribute("xat.entityMagic.regen");

        sentientWarlockWildMHIn.applyModifier(AttributeModifier.createModifier("sentientWarlockWildMH", (0.4), 1, bonusHealthUUID));
        sentientWarlockWildMSIn.applyModifier(AttributeModifier.createModifier("sentientWarlockWildMS", (0.15), 1, bonusMovementSpeedUUID));
        sentientWarlockWildMDIn.applyModifier(AttributeModifier.createModifier("sentientWarlockWildMD", (1.1 * wildcardPenalty), 1, bonusMagicDamageUUID));
        sentientWarlockWildMMIn.applyModifier(AttributeModifier.createModifier("sentientWarlockWildMM", (100 * wildcardPenalty), 0, bonusMaxManaUUID));
        sentientWarlockWildAIn.applyModifier(AttributeModifier.createModifier("sentientWarlockWildA", (50.0 * wildcardPenalty), 0, bonusArmorUUID));
        sentientWarlockWildMRIn.applyModifier(AttributeModifier.createModifier("sentientWarlockWildMR", (0.5 * wildcardPenalty), 1, bonusManaRegenUUID));
    }

    if (sentientAssassinBonus(helmet, chestplate, leggings, boots)) {
        val sentientAssassinWildMHIn as AttributeInstance = player.getAttribute("generic.maxHealth");
        val sentientAssassinWildSHIn as AttributeInstance = player.getAttribute("potioncore.stepHeight");
        val sentientAssassinWildASIn as AttributeInstance = player.getAttribute("generic.attackSpeed");
        val sentientAssassinWildRDIn as AttributeInstance = player.getAttribute("generic.reachDistance");
        val sentientAssassinWildADIn as AttributeInstance = player.getAttribute("generic.attackDamage");
        val sentientAssassinWildMSIn as AttributeInstance = player.getAttribute("generic.movementSpeed");
        val sentientAssassinWildAIn as AttributeInstance = player.getAttribute("generic.armor");
    
        sentientAssassinWildMHIn.applyModifier(AttributeModifier.createModifier("sentientAssassinWildMH", (0.1), 1, bonusHealthUUID));
        sentientAssassinWildSHIn.applyModifier(AttributeModifier.createModifier("sentientAssassinWildSH", (0.5), 0, bonusStepHeightUUID));
        sentientAssassinWildASIn.applyModifier(AttributeModifier.createModifier("sentientAssassinWildAS", (-0.65 * wildcardPenalty), 1, bonusAttackSpeedUUID));
        sentientAssassinWildRDIn.applyModifier(AttributeModifier.createModifier("sentientAssassinWildRD", (1.0 * wildcardPenalty), 0, bonusReachUUID));
        sentientAssassinWildADIn.applyModifier(AttributeModifier.createModifier("sentientAssassinWildAD", (1.13 * wildcardPenalty), 1, bonusDamageUUID));
        sentientAssassinWildMSIn.applyModifier(AttributeModifier.createModifier("sentientAssassinWildMS", (0.4 * wildcardPenalty), 1, bonusMovementSpeedUUID));
        sentientAssassinWildAIn.applyModifier(AttributeModifier.createModifier("sentientAssassinWildA", (70.0 * wildcardPenalty), 0, bonusArmorUUID));
    }

    if (sentientFlailerBonus(helmet, chestplate, leggings, boots)) {
        val sentientFlailerWildMHIn as AttributeInstance = player.getAttribute("generic.maxHealth");
        val sentientFlailerWildSHIn as AttributeInstance = player.getAttribute("potioncore.stepHeight");
        val sentientFlailerWildRDIn as AttributeInstance = player.getAttribute("generic.reachDistance");
        val sentientFlailerWildMSIn as AttributeInstance = player.getAttribute("generic.movementSpeed");
        val sentientFlailerWildASIn as AttributeInstance = player.getAttribute("generic.attackSpeed");
        val sentientFlailerWildADIn as AttributeInstance = player.getAttribute("generic.attackDamage");
        val sentientFlailerWildAIn as AttributeInstance = player.getAttribute("generic.armor");
    
        sentientFlailerWildMHIn.applyModifier(AttributeModifier.createModifier("sentientFlailerWildMH", (0.1), 1, bonusHealthUUID));
        sentientFlailerWildSHIn.applyModifier(AttributeModifier.createModifier("sentientFlailerWildSH", (0.5), 0, bonusStepHeightUUID));
        sentientFlailerWildASIn.applyModifier(AttributeModifier.createModifier("sentientFlailerWildAS", (0.5 * wildcardPenalty), 1, bonusAttackSpeedUUID));
        sentientFlailerWildRDIn.applyModifier(AttributeModifier.createModifier("sentientFlailerWildRD", (0.25), 0, bonusReachUUID));
        sentientFlailerWildMSIn.applyModifier(AttributeModifier.createModifier("sentientFlailerWildMS", (0.45 * wildcardPenalty), 1, bonusMovementSpeedUUID));
        sentientFlailerWildAIn.applyModifier(AttributeModifier.createModifier("sentientFlailerWildA", (67.0 * wildcardPenalty), 0, bonusArmorUUID));
        sentientFlailerWildADIn.applyModifier(AttributeModifier.createModifier("sentientFlailerWildAD", (-0.4 * wildcardPenalty), 1, bonusDamageUUID));
    }

    if (sentientHordeTamerBonus(helmet, chestplate, leggings, boots)) {
        print("hello");
        val sentientHordeTamerWildAIn as AttributeInstance = player.getAttribute("generic.armor");
        val sentientHordeTamerWildATIn as AttributeInstance = player.getAttribute("generic.armorToughness");
        val sentientHordeTamerWildADIn as AttributeInstance = player.getAttribute("generic.attackDamage");
        val sentientHordeTamerWildDRIn as AttributeInstance = player.getAttribute("potioncore.damageResistance");
        val sentientHordeTamerWildMHIn as AttributeInstance = player.getAttribute("generic.maxHealth");
        val sentientHordeTamerWildKRIn as AttributeInstance = player.getAttribute("generic.knockbackResistance");
    
        sentientHordeTamerWildAIn.applyModifier(AttributeModifier.createModifier("sentientHordeTamerWildA", (99.0 * wildcardPenalty), 0, bonusArmorUUID));
        sentientHordeTamerWildATIn.applyModifier(AttributeModifier.createModifier("sentientHordeTamerWildAT", (80.0 * wildcardPenalty), 0, bonusArmorToughnessUUID));
        sentientHordeTamerWildADIn.applyModifier(AttributeModifier.createModifier("sentientHordeTamerWildAD", (0.1), 1, bonusDamageUUID));
        sentientHordeTamerWildDRIn.applyModifier(AttributeModifier.createModifier("sentientHordeTamerWildDR", (0.1), 1, bonusDamageResistanceUUID));
        sentientHordeTamerWildMHIn.applyModifier(AttributeModifier.createModifier("sentientHordeTamerWildMH", (0.3), 1, bonusHealthUUID));
        sentientHordeTamerWildKRIn.applyModifier(AttributeModifier.createModifier("sentientHordeTamerWildKR", (0.5), 1, bonusKnockbackResistanceUUID));
    }

    if (sentientIronHeartBonus(helmet, chestplate, leggings, boots)) {
        val sentientIronHeartWildAIn as AttributeInstance = player.getAttribute("generic.armor");
        val sentientIronHeartWildATIn as AttributeInstance = player.getAttribute("generic.armorToughness");
        val sentientIronHeartWildADIn as AttributeInstance = player.getAttribute("generic.attackDamage");
        val sentientIronHeartWildDRIn as AttributeInstance = player.getAttribute("potioncore.damageResistance");
        val sentientIronHeartWildMHIn as AttributeInstance = player.getAttribute("generic.maxHealth");
        val sentientIronHeartWildKRIn as AttributeInstance = player.getAttribute("generic.knockbackResistance");
    
        sentientIronHeartWildAIn.applyModifier(AttributeModifier.createModifier("sentientIronHeartWildA", (93.0 * wildcardPenalty), 0, bonusArmorUUID));
        sentientIronHeartWildATIn.applyModifier(AttributeModifier.createModifier("sentientIronHeartWildAT", (80.0 * wildcardPenalty), 0, bonusArmorToughnessUUID));
        sentientIronHeartWildADIn.applyModifier(AttributeModifier.createModifier("sentientIronHeartWildAD", (0.1), 1, bonusDamageUUID));
        sentientIronHeartWildDRIn.applyModifier(AttributeModifier.createModifier("sentientIronHeartWildDR", (0.1), 1, bonusDamageResistanceUUID));
        sentientIronHeartWildMHIn.applyModifier(AttributeModifier.createModifier("sentientIronHeartWildMH", (0.3), 1, bonusHealthUUID));
        sentientIronHeartWildKRIn.applyModifier(AttributeModifier.createModifier("sentientIronHeartWildKR", (0.5), 1, bonusKnockbackResistanceUUID));
    }

    if (sentientQuickFingersBonus(helmet, chestplate, leggings, boots)) {
        val sentientQuickFingersWildAIn as AttributeInstance = player.getAttribute("generic.armor");
        val sentientQuickFingersWildPDIn as AttributeInstance = player.getAttribute("potioncore.projectileDamage");
        val sentientQuickFingersWildMHIn as AttributeInstance = player.getAttribute("generic.maxHealth");
        val sentientQuickFingersWildBIn as AttributeInstance = player.getAttribute("mysticalworld.blessed");
        val sentientQuickFingersWildMSIn as AttributeInstance = player.getAttribute("generic.movementSpeed");
    
        sentientQuickFingersWildMHIn.applyModifier(AttributeModifier.createModifier("sentientQuickFingersWildMH", (0.2), 1, bonusHealthUUID));
        sentientQuickFingersWildPDIn.applyModifier(AttributeModifier.createModifier("sentientQuickFingersWildPD", (0.4 * wildcardPenalty), 1, bonusProjectileDamageUUID));
        sentientQuickFingersWildAIn.applyModifier(AttributeModifier.createModifier("sentientQuickFingersWildA", (74.0 * wildcardPenalty), 0, bonusArmorUUID));
        sentientQuickFingersWildBIn.applyModifier(AttributeModifier.createModifier("sentientQuickFingersWildB", (6.0), 0, bonusBlessedUUID));
        sentientQuickFingersWildMSIn.applyModifier(AttributeModifier.createModifier("sentientQuickFingersWildMS", (0.24), 1, bonusMovementSpeedUUID));
    }

    if (sentientKeenEyesBonus(helmet, chestplate, leggings, boots)) {
        val sentientKeenEyesWildAIn as AttributeInstance = player.getAttribute("generic.armor");
        val sentientKeenEyesWildPDIn as AttributeInstance = player.getAttribute("potioncore.projectileDamage");
        val sentientKeenEyesWildMHIn as AttributeInstance = player.getAttribute("generic.maxHealth");
        val sentientKeenEyesWildBIn as AttributeInstance = player.getAttribute("mysticalworld.blessed");
        val sentientKeenEyesWildMSIn as AttributeInstance = player.getAttribute("generic.movementSpeed");
    
        sentientKeenEyesWildMHIn.applyModifier(AttributeModifier.createModifier("sentientKeenEyesWildMH", (0.2), 1, bonusHealthUUID));
        sentientKeenEyesWildPDIn.applyModifier(AttributeModifier.createModifier("sentientKeenEyesWildPD", (0.8 * wildcardPenalty), 1, bonusProjectileDamageUUID));
        sentientKeenEyesWildAIn.applyModifier(AttributeModifier.createModifier("sentientKeenEyesWildA", (77.0 * wildcardPenalty), 0, bonusArmorUUID));
        sentientKeenEyesWildBIn.applyModifier(AttributeModifier.createModifier("sentientKeenEyesWildB", (6.0), 0, bonusBlessedUUID));
        sentientKeenEyesWildMSIn.applyModifier(AttributeModifier.createModifier("sentientKeenEyesWildMS", (0.24), 1, bonusMovementSpeedUUID));
    }
});