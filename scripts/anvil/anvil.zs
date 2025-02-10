#reloadable

import mods.vanillaanvilrepair.addRepairEntry;
import crafttweaker.item.IIngredient;

            #######################
            ## All Anvil Recipes ##
            #######################

val woolArray = [
    <roughtweaks:medikit>,
    <roughtweaks:medikitenchanted>,
] as IIngredient[];

for item in woolArray{
     addRepairEntry(item, <minecraft:wool:*>);
}

var vile = <srparasites:vile_shell>;

//addRepairEntry(IIngredient repairedItems, IIngredient materials)

val vileArray = [
    <srparasites:armor_helm_sentient>,
    <srparasites:armor_chest_sentient>,
    <srparasites:armor_pants_sentient>,
    <srparasites:armor_boots_sentient>,
    <srparasites:armor_helm>,
    <srparasites:armor_chest>,
    <srparasites:armor_pants>,
    <srparasites:armor_boots>,
] as IIngredient[];

for item in vileArray{
     addRepairEntry(item, vile);
}

var plate = <erebus:materials:15>;

//addRepairEntry(IIngredient repairedItems, IIngredient materials)

val plateArray = [
    <erebus:sprint_leggings>,
    <erebus:rein_compound_goggles>,
    <erebus:glider_chestplate_powered>,
] as IIngredient[];

for item in plateArray{
     addRepairEntry(item, plate);
}

var jade = <ore:gemJade>;

//addRepairEntry(IIngredient repairedItems, IIngredient materials)

val jadeArray = [
    <spartanweaponry:dagger_copper>,
    <spartanweaponry:longsword_copper>,
    <spartanweaponry:katana_copper>,
    <spartanweaponry:saber_copper>,
    <spartanweaponry:rapier_copper>,
    <spartanweaponry:greatsword_copper>,
    <spartanweaponry:hammer_copper>,
    <spartanweaponry:warhammer_copper>,
    <spartanweaponry:spear_copper>,
    <spartanweaponry:staff_copper>,
    <spartanweaponry:glaive_copper>,
    <spartanweaponry:mace_copper>,
    <spartanweaponry:battleaxe_copper>,
    <spartanweaponry:halberd_copper>,
    <spartanweaponry:pike_copper>,
    <spartanweaponry:lance_copper>,
    <spartanweaponry:longbow_copper>,
    <spartanweaponry:crossbow_copper>,
    <spartanweaponry:throwing_knife_copper>,
    <spartanweaponry:throwing_axe_copper>,
    <spartanweaponry:javelin_copper>,
    <spartanweaponry:boomerang_copper>,
] as IIngredient[];

for item in jadeArray{
     addRepairEntry(item, jade);
}

var vulcanite = <ore:ingotVulcanite>;

//addRepairEntry(IIngredient repairedItems, IIngredient materials)

val vulArray = [
    <spartanweaponry:dagger_platinum>,
    <spartanweaponry:longsword_platinum>,
    <spartanweaponry:katana_platinum>,
    <spartanweaponry:saber_platinum>,
    <spartanweaponry:rapier_platinum>,
    <spartanweaponry:greatsword_platinum>,
    <spartanweaponry:hammer_platinum>,
    <spartanweaponry:warhammer_platinum>,
    <spartanweaponry:spear_platinum>,
    <spartanweaponry:halberd_platinum>,
    <spartanweaponry:pike_platinum>,
    <spartanweaponry:lance_platinum>,
    <spartanweaponry:longbow_platinum>,
    <spartanweaponry:crossbow_platinum>,
    <spartanweaponry:throwing_knife_platinum>,
    <spartanweaponry:throwing_axe_platinum>,
    <spartanweaponry:javelin_platinum>,
    <spartanweaponry:boomerang_platinum>,
    <spartanweaponry:battleaxe_platinum>,
    <spartanweaponry:mace_platinum>,
    <spartanweaponry:glaive_platinum>,
    <spartanweaponry:staff_platinum>,
] as IIngredient[];

for item in vulArray{
     addRepairEntry(item, vulcanite);
}

var star = <ore:netherStar>;

//addRepairEntry(IIngredient repairedItems, IIngredient materials)

val starArray = [
    <spartanweaponry:dagger_nickel>,
    <spartanweaponry:longsword_nickel>,
    <spartanweaponry:katana_nickel>,
    <spartanweaponry:saber_nickel>,
    <spartanweaponry:rapier_nickel>,
    <spartanweaponry:greatsword_nickel>,
    <spartanweaponry:hammer_nickel>,
    <spartanweaponry:warhammer_nickel>,
    <spartanweaponry:spear_nickel>,
    <spartanweaponry:battleaxe_nickel>,
    <spartanweaponry:mace_nickel>,
    <spartanweaponry:glaive_nickel>,
    <spartanweaponry:staff_nickel>,
    <spartanweaponry:halberd_nickel>,
    <spartanweaponry:pike_nickel>,
    <spartanweaponry:lance_nickel>,
    <spartanweaponry:longbow_nickel>,
    <spartanweaponry:crossbow_nickel>,
    <spartanweaponry:throwing_knife_nickel>,
    <spartanweaponry:throwing_axe_nickel>,
    <spartanweaponry:javelin_nickel>,
    <spartanweaponry:boomerang_nickel>,
] as IIngredient[];

for item in starArray{
     addRepairEntry(item, star);
}

var scaleDragon = <ore:scaleDragonEnder>;

//addRepairEntry(IIngredient repairedItems, IIngredient materials)

val draArray = [
    <spartanweaponry:dagger_lead>,
    <spartanweaponry:longsword_lead>,
    <spartanweaponry:katana_lead>,
    <spartanweaponry:saber_lead>,
    <spartanweaponry:rapier_lead>,
    <spartanweaponry:greatsword_lead>,
    <spartanweaponry:hammer_lead>,
    <spartanweaponry:warhammer_lead>,
    <spartanweaponry:spear_lead>,
    <spartanweaponry:battleaxe_lead>,
    <spartanweaponry:mace_lead>,
    <spartanweaponry:glaive_lead>,
    <spartanweaponry:staff_lead>,
    <spartanweaponry:halberd_lead>,
    <spartanweaponry:pike_lead>,
    <spartanweaponry:lance_lead>,
    <spartanweaponry:longbow_lead>,
    <spartanweaponry:crossbow_lead>,
    <spartanweaponry:throwing_knife_lead>,
    <spartanweaponry:throwing_axe_lead>,
    <spartanweaponry:javelin_lead>,
    <spartanweaponry:boomerang_lead>,
] as IIngredient[];

for item in draArray{
     addRepairEntry(item, scaleDragon);
}