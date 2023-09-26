import mods.ItemStages.addItemStage;
import mods.ItemStages.stageEnchant;
import mods.ItemStages.setUnfamiliarName;
import crafttweaker.item.IIngredient;

    addItemStage("⠀", <nocubessrparmory:hostbomb>);
    
        ############
        ## Arrays ##
        ############

    stageEnchant("Temporarily Disabled Enchantments",<enchantment:minecraft:mending>);
    stageEnchant("Temporarily Disabled Enchantments",<enchantment:uniquee:all>);
    stageEnchant("Temporarily Disabled Enchantments",<enchantment:uniquee:undead>);
    stageEnchant("Temporarily Disabled Enchantments",<enchantment:uniquee:arthropods>);
    stageEnchant("Temporarily Disabled Enchantments",<enchantment:uniquee:swift>);
    stageEnchant("Temporarily Disabled Enchantments",<enchantment:uniquee:ender_mending>);
    stageEnchant("Temporarily Disabled Enchantments",<enchantment:uniquee:alchemistsgrace>);
    stageEnchant("Temporarily Disabled Enchantments",<enchantment:uniquee:endest_reap>);
    stageEnchant("Temporarily Disabled Enchantments",<enchantment:uniquee:grimoire>);
    stageEnchant("Temporarily Disabled Enchantments",<enchantment:uniqueebattle:ares_fragment>);
    stageEnchant("Temporarily Disabled Enchantments",<enchantment:uniquee:warriorsgrace>);
    stageEnchant("Temporarily Disabled Enchantments",<enchantment:uniquee:endermarksmen>);
    stageEnchant("Temporarily Disabled Enchantments",<enchantment:uniquee:aresblessing>);
    stageEnchant("Temporarily Disabled Enchantments",<enchantment:uniquee:cloudwalker>);
    stageEnchant("Temporarily Disabled Enchantments",<enchantment:uniquee:fastfood>);
    stageEnchant("Temporarily Disabled Enchantments",<enchantment:uniquee:naturesgrace>);
    stageEnchant("Temporarily Disabled Enchantments",<enchantment:uniquee:ecological>);
    stageEnchant("Temporarily Disabled Enchantments",<enchantment:uniqueebattle:deep_wounds>);
    stageEnchant("Temporarily Disabled Enchantments",<enchantment:uniquee:pestilences_odium>);
    stageEnchant("Temporarily Disabled Enchantments",<enchantment:uniquee:deaths_odium>);
    stageEnchant("Temporarily Disabled Enchantments",<enchantment:uniqueebattle:lunatic_despair>);
    stageEnchant("Temporarily Disabled Enchantments",<enchantment:uniquee:ranged>);



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