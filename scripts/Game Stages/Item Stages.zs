#reloadable

import mods.ItemStages.addItemStage;
import mods.ItemStages.stageEnchant;
import mods.ItemStages.setUnfamiliarName;
import crafttweaker.item.IIngredient;
import crafttweaker.enchantments.IEnchantmentDefinition;
    
        ## Arrays ##

val EArray = [
        <enchantment:minecraft:mending>,
        <enchantment:uniquee:all>,
        <enchantment:uniquee:undead>,
        <enchantment:uniquee:arthropods>,
        <enchantment:uniquee:swift>,
        <enchantment:uniquee:ender_mending>,
        <enchantment:uniquee:alchemistsgrace>,
        <enchantment:uniquee:endest_reap>,
        <enchantment:uniquee:grimoire>,
        <enchantment:uniqueebattle:ares_fragment>,
        <enchantment:uniquee:warriorsgrace>,
        <enchantment:uniquee:endermarksmen>,
        <enchantment:uniquee:aresblessing>,
        <enchantment:uniquee:cloudwalker>,
        <enchantment:uniquee:fastfood>,
        <enchantment:uniquee:naturesgrace>,
        <enchantment:uniquee:ecological>,
        <enchantment:uniqueebattle:deep_wounds>,
        <enchantment:uniquee:pestilences_odium>,
        <enchantment:uniquee:deaths_odium>,
        <enchantment:uniqueebattle:lunatic_despair>,
        <enchantment:uniquee:ranged>
] as IEnchantmentDefinition[];

for item in EArray{
    stageEnchant("nightmare",item);
}

val StArray = [
    <lycanitesmobs:summoningstaff>.anyDamage(),
    <lycanitesmobs:stablesummoningstaff>.anyDamage(),
    <lycanitesmobs:sturdysummoningstaff>.anyDamage(),
    <lycanitesmobs:savagesummoningstaff>.anyDamage(),
    <lycanitesmobs:bloodsummoningstaff>.anyDamage(),
    <cqrepoured:cursed_bone>.anyDamage(),
    <cqrepoured:cursed_bone>.withTag({entity_to_summon: "cqrepoured:mandril", display: {Name: "Staff of the Monking"}}).anyDamage(),
    <cqrepoured:cursed_bone>.withTag({RepairCost: 0, entity_to_summon: "cqrepoured:walker", display: {Name: "The Walker Caller"}}).anyDamage(),
            ] as IIngredient[];

            for item in StArray{
                addItemStage("Necromancer", item);
            }

val RaArray = [
    <cqrepoured:staff_thunder>,
    <cqrepoured:staff_spider>,
    <cqrepoured:staff_gun>,
    <cqrepoured:revolver>,
    <cqrepoured:captain_revolver>,
    <cqrepoured:musket>,
    <cqrepoured:musket_dagger_iron>,
    <cqrepoured:musket_dagger_diamond>,
    <cqrepoured:musket_dagger_monking>,
    <cqrepoured:bubble_pistol>,
    <cqrepoured:bubble_rifle>,
    <cqrepoured:longshot>,
    <cqrepoured:spiderhook>,
    <cqrepoured:dagger_ninja>,
    <cqrepoured:dagger_monking>,
    <cqrepoured:sword_turtle>,
    <cqrepoured:sword_spider>,
    <cqrepoured:battle_axe_bull>,
    <cqrepoured:sword_walker>,
    <cqrepoured:shield_walker_king>,
    <mod_lavacow:bonesword>,
    <mod_lavacow:moltenaxe>,
    <mod_lavacow:moltenhammer>,
    <mod_lavacow:reapers_scythe>,
    <mod_lavacow:moltenpan>,
    <mod_lavacow:tooth_dagger>,
    <mod_lavacow:vespa_dagger>,
    <mod_lavacow:frozen_dagger>,
    <mod_lavacow:spectral_dagger>,
    <mod_lavacow:vespa_shield>
            ] as IIngredient[];

            for item in RaArray{
                addItemStage("Rahovart", item);
            }

    addItemStage(" ", <cqrepoured:backpack>);