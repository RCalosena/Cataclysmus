#reloadable

import mods.vanillaanvilrepair.addRepairEntry;
import crafttweaker.item.IIngredient;
import crafttweaker.item.IItemStack;

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


//addRepairEntry(IIngredient repairedItems, IIngredient materials)

var flint = <minecraft:flint>;

val flintArray = [
    <spartanweaponry:dagger_wood>,
    <spartanweaponry:longsword_wood>,
    <spartanweaponry:katana_wood>,
    <spartanweaponry:saber_wood>,
    <spartanweaponry:rapier_wood>,
    <spartanweaponry:greatsword_wood>,
    <spartanweaponry:hammer_wood>,
    <spartanweaponry:warhammer_wood>,
    <spartanweaponry:spear_wood>,
    <spartanweaponry:staff>,
    <spartanweaponry:glaive_wood>,
    <spartanweaponry:mace_wood>,
    <spartanweaponry:battleaxe_wood>,
    <spartanweaponry:halberd_wood>,
    <spartanweaponry:pike_wood>,
    <spartanweaponry:lance_wood>,
    <spartanweaponry:longbow_wood>,
    <spartanweaponry:crossbow_wood>,
    <spartanweaponry:throwing_knife_wood>,
    <spartanweaponry:throwing_axe_wood>,
    <spartanweaponry:javelin_wood>,
    <spartanweaponry:boomerang_wood>,
    <spartanweaponry:scythe_wood>,
    <mujmajnkraftsbettersurvival:itemwoodnunchaku>,
    <minecraft:wooden_axe>,
    <minecraft:wooden_sword>,
    <minecraft:wooden_hoe>,
    <minecraft:wooden_shovel>,
    <minecraft:wooden_pickaxe>,
] as IItemStack[];

for item in flintArray{
    addRepairEntry(item, flint);
}

var jade = <ore:gemJade>;

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
    <spartanweaponry:scythe_copper>,
] as IItemStack[];

for item in jadeArray{
     addRepairEntry(item, jade);
}
addRepairEntry(<mujmajnkraftsbettersurvival:itemsilvernunchaku>, jade);

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
    <spartanweaponry:scythe_platinum>,
] as IItemStack[];

for item in vulArray{
     addRepairEntry(item, vulcanite);
}
addRepairEntry(<mujmajnkraftsbettersurvival:itemcoppernunchaku>, vulcanite);

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
    <spartanweaponry:scythe_nickel>,
] as IIngredient[];

for item in starArray{
     addRepairEntry(item, star);
}
addRepairEntry(<mujmajnkraftsbettersurvival:itemelectrumnunchaku>, star);

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
    <spartanweaponry:scythe_lead>,
] as IIngredient[];

for item in draArray{
     addRepairEntry(item, scaleDragon);
}
addRepairEntry(<mujmajnkraftsbettersurvival:itemsteelnunchaku>, scaleDragon);

// Remove recipes for previous materials
events.register(function(event as crafttweaker.event.PlayerAnvilUpdateEvent){
        var leftItem = event.leftItem;
        val ores = event.rightItem.ores;

    for ore in ores {
        for flints in flintArray {
            if (flints.anyDamage().matches(leftItem) && ore.name.contains(<ore:plankWood>.name)) {
                event.cancel();
                return;
            }
        }
        
        for jades in jadeArray {
            if (jades.anyDamage().matches(leftItem) && ore.name == <ore:ingotCopper>.name) {
                event.cancel();
                return;
            }
        }

        for vulcs in vulArray {
            if (vulcs.anyDamage().matches(leftItem) && ore.name.contains(<ore:ingotPlatinum>.name)) {
                event.cancel();
                return;
            }
        }

        if (<mujmajnkraftsbettersurvival:itemsteelnunchaku>.anyDamage().matches(leftItem) && ore.name.contains(<ore:ingotSteel>.name)) { 
            event.cancel();
            return;
        }
        if (<mujmajnkraftsbettersurvival:itemelectrumnunchaku>.anyDamage().matches(leftItem) && ore.name.contains(<ore:ingotElectrum>.name)) { 
            event.cancel();
            return;
        }
        if (<mujmajnkraftsbettersurvival:itemcoppernunchaku>.anyDamage().matches(leftItem) && ore.name.contains(<ore:ingotCopper>.name)) { 
            event.cancel();
            return;
        }
        if (<mujmajnkraftsbettersurvival:itemsilvernunchaku>.anyDamage().matches(leftItem) && ore.name.contains(<ore:ingotSilver>.name)) { 
            event.cancel();
            return;
        }
    }
});