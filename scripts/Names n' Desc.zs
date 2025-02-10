

import crafttweaker.item.IIngredient;
import crafttweaker.item.IItemStack;

        ## Class Tooltips ##

val Array = [
        <minecraft:iron_helmet>,
        <metallurgy:eximite_helmet>,
        <metallurgy:eximite_chestplate>,
        <metallurgy:eximite_leggings>,
        <metallurgy:eximite_boots>,
        <metallurgy:hepatizon_helmet>,
        <minecraft:diamond_helmet>,
        <mysticalworld:copper_helmet>,
        <cqrepoured:helmet_slime>,
        <mutantbeasts:mutant_skeleton_skull>,
        <metallurgy:oureclase_helmet>,
        <metallurgy:shadow_steel_helmet>,
        <metallurgy:amordrine_helmet>,
        <metallurgy:quicksilver_helmet>,
        <metallurgy:astral_silver_helmet>,
        <metallurgy:desichalkos_helmet>,
        <metallurgy:shadow_iron_helmet>,
        <cqrepoured:helmet_iron_dyable>,
        <cqrepoured:helmet_diamond_dyable>,
        <minecraft:iron_leggings>,
        <metallurgy:hepatizon_leggings>,
        <minecraft:diamond_leggings>,
        <metallurgy:oureclase_leggings>,
        <mutantbeasts:mutant_skeleton_leggings>,
        <metallurgy:shadow_steel_leggings>,
        <metallurgy:amordrine_leggings>,
        <metallurgy:quicksilver_leggings>,
        <metallurgy:astral_silver_leggings>,
        <metallurgy:desichalkos_leggings>,
        <metallurgy:shadow_iron_leggings>,
        <mysticalworld:copper_leggings>,
        <cqrepoured:leggings_slime>,
        <cqrepoured:leggings_iron_dyable>,
        <cqrepoured:leggings_diamond_dyable>,
        <minecraft:iron_chestplate>,
        <metallurgy:hepatizon_chestplate>,
        <minecraft:diamond_chestplate>,
        <metallurgy:oureclase_chestplate>,
        <mutantbeasts:mutant_skeleton_chestplate>,
        <metallurgy:shadow_steel_chestplate>,
        <metallurgy:amordrine_chestplate>,
        <metallurgy:quicksilver_chestplate>,
        <metallurgy:astral_silver_chestplate>,
        <metallurgy:desichalkos_chestplate>,
        <metallurgy:shadow_iron_chestplate>,
        <mysticalworld:copper_chestplate>,
        <cqrepoured:chestplate_slime>,
        <cqrepoured:chestplate_iron_dyable>,
        <cqrepoured:chestplate_diamond_dyable>,
        <minecraft:iron_boots>,
        <metallurgy:hepatizon_boots>,
        <minecraft:diamond_boots>,
        <metallurgy:oureclase_boots>,
        <mutantbeasts:mutant_skeleton_boots>,
        <metallurgy:shadow_steel_boots>,
        <metallurgy:amordrine_boots>,
        <metallurgy:quicksilver_boots>,
        <metallurgy:astral_silver_boots>,
        <metallurgy:desichalkos_boots>,
        <metallurgy:shadow_iron_boots>,
        <mysticalworld:copper_boots>,
        <cqrepoured:boots_slime>,
        <cqrepoured:boots_iron_dyable>,
        <cqrepoured:boots_diamond_dyable>,
        <erebus:jade_helmet>,
        <erebus:jade_chestplate>,
        <erebus:jade_leggings>,
        <erebus:jade_boots>,
        <srparasites:armor_helm_sentient>.withTag({tremor: 1}),
        <srparasites:armor_chest_sentient>.withTag({tremor: 1}),
        <srparasites:armor_pants_sentient>.withTag({tremor: 1}),
        <srparasites:armor_boots_sentient>.withTag({tremor: 1}),
            ] as IIngredient[];

            for item in Array{
                item.addTooltip(format.green(format.bold("Tremor")));
            }

val Array2 = [
        <cqrepoured:helmet_heavy_iron>,
        <cqrepoured:helmet_heavy_diamond>,
        <metallurgy:lutetium_helmet>,
        <metallurgy:lutetium_chestplate>,
        <metallurgy:lutetium_leggings>,
        <metallurgy:lutetium_boots>,
        <metallurgy:steel_helmet>,
        <cqrepoured:helmet_turtle>,
        <cqrepoured:helmet_bull>,
        <midnight:tenebrum_helmet>,
        <metallurgy:haderoth_helmet>,
        <metallurgy:vulcanite_helmet>,
        <metallurgy:bronze_helmet>,
        <metallurgy:electrum_helmet>,
        <metallurgy:black_steel_helmet>,
        <metallurgy:osmium_helmet>,
        <metallurgy:orichalcum_helmet>,
        <cqrepoured:chestplate_heavy_iron>,
        <cqrepoured:chestplate_heavy_diamond>,
        <metallurgy:steel_chestplate>,
        <cqrepoured:chestplate_turtle>,
        <cqrepoured:chestplate_bull>,
        <midnight:tenebrum_chestplate>,
        <metallurgy:haderoth_chestplate>,
        <metallurgy:vulcanite_chestplate>,
        <metallurgy:bronze_chestplate>,
        <metallurgy:electrum_chestplate>,
        <metallurgy:black_steel_chestplate>,
        <metallurgy:osmium_chestplate>,
        <metallurgy:orichalcum_chestplate>,
        <cqrepoured:leggings_heavy_iron>,
        <cqrepoured:leggings_heavy_diamond>,
        <metallurgy:steel_leggings>,
        <cqrepoured:leggings_turtle>,
        <cqrepoured:leggings_bull>,
        <midnight:tenebrum_leggings>,
        <metallurgy:haderoth_leggings>,
        <metallurgy:vulcanite_leggings>,
        <metallurgy:bronze_leggings>,
        <metallurgy:electrum_leggings>,
        <metallurgy:black_steel_leggings>,
        <metallurgy:osmium_leggings>,
        <metallurgy:orichalcum_leggings>,
        <cqrepoured:boots_heavy_iron>,
        <cqrepoured:boots_heavy_diamond>,
        <metallurgy:steel_boots>,
        <cqrepoured:boots_turtle>,
        <cqrepoured:boots_bull>,
        <midnight:tenebrum_boots>,
        <metallurgy:haderoth_boots>,
        <metallurgy:vulcanite_boots>,
        <metallurgy:bronze_boots>,
        <metallurgy:electrum_boots>,
        <metallurgy:black_steel_boots>,
        <metallurgy:osmium_boots>,
        <metallurgy:orichalcum_boots>,
        <erebus:rhino_exoskeleton_helmet>,
        <erebus:rhino_exoskeleton_chestplate>,
        <erebus:rhino_exoskeleton_leggings>,
        <erebus:rhino_exoskeleton_boots>,
        <srparasites:armor_helm_sentient>.withTag({furor: 1}),
        <srparasites:armor_chest_sentient>.withTag({furor: 1}),
        <srparasites:armor_pants_sentient>.withTag({furor: 1}),
        <srparasites:armor_boots_sentient>.withTag({furor: 1}),
            ] as IIngredient[];

            for item in Array2{
                item.addTooltip(format.darkRed(format.bold("Furor")));
            }

val Array3 = [
        <minecraft:leather_helmet>,
        <minecraft:chainmail_helmet>,
        <mysticalworld:silver_helmet>,
        <metallurgy:tartarite_helmet>,
        <metallurgy:tartarite_chestplate>,
        <metallurgy:tartarite_leggings>,
        <metallurgy:tartarite_boots>,
        <metallurgy:brass_helmet>,
        <metallurgy:deep_iron_helmet>,
        <metallurgy:krik_helmet>,
        <metallurgy:carmot_helmet>,
        <metallurgy:kalendrite_helmet>,
        <metallurgy:celenegil_helmet>,
        <cqrepoured:helmet_spider>,
        <mod_lavacow:faminearmor_helmet>,
        <nyx:meteor_helm>,
        <minecraft:leather_chestplate>,
        <minecraft:chainmail_chestplate>,
        <mysticalworld:silver_chestplate>,
        <metallurgy:brass_chestplate>,
        <metallurgy:deep_iron_chestplate>,
        <metallurgy:krik_chestplate>,
        <metallurgy:carmot_chestplate>,
        <metallurgy:kalendrite_chestplate>,
        <metallurgy:celenegil_chestplate>,
        <cqrepoured:chestplate_spider>,
        <mod_lavacow:faminearmor_chestplate>,
        <nyx:meteor_chest>,
        <minecraft:leather_leggings>,
        <minecraft:chainmail_leggings>,
        <mysticalworld:silver_leggings>,
        <metallurgy:brass_leggings>,
        <metallurgy:deep_iron_leggings>,
        <metallurgy:krik_leggings>,
        <metallurgy:carmot_leggings>,
        <metallurgy:kalendrite_leggings>,
        <metallurgy:celenegil_leggings>,
        <cqrepoured:leggings_spider>,
        <mod_lavacow:faminearmor_leggings>,
        <nyx:meteor_pants>,
        <minecraft:leather_boots>,
        <minecraft:chainmail_boots>,
        <mysticalworld:silver_boots>,
        <metallurgy:brass_boots>,
        <metallurgy:deep_iron_boots>,
        <metallurgy:krik_boots>,
        <metallurgy:carmot_boots>,
        <metallurgy:kalendrite_boots>,
        <metallurgy:celenegil_boots>,
        <cqrepoured:boots_spider>,
        <mod_lavacow:faminearmor_boots>,
        <nyx:meteor_boots>,
        <erebus:glider_chestplate_powered>,
        <erebus:rein_compound_goggles>,
        <erebus:sprint_leggings>,
        <erebus:rein_exoskeleton_boots>,
        <srparasites:armor_helm_sentient>.withTag({arcum: 1}),
        <srparasites:armor_chest_sentient>.withTag({arcum: 1}),
        <srparasites:armor_pants_sentient>.withTag({arcum: 1}),
        <srparasites:armor_boots_sentient>.withTag({arcum: 1}),
            ] as IIngredient[];

            for item in Array3{
                item.addTooltip(format.aqua(format.bold("Arcum")));
            }

val Array4 = [
        <minecraft:golden_helmet>,
        <cqrepoured:helmet_inquisition>,
        <mod_lavacow:swinemask>,
        <metallurgy:platinum_helmet>,
        <metallurgy:ceruclase_helmet>,
        <metallurgy:damascus_steel_helmet>,
        <metallurgy:ignatius_helmet>,
        <metallurgy:atlarus_helmet>,
        <metallurgy:vyroxeres_helmet>,
        <metallurgy:prometheum_helmet>,
        <metallurgy:prometheum_chestplate>,
        <metallurgy:prometheum_leggings>,
        <metallurgy:prometheum_boots>,
        <mod_lavacow:felarmor_helmet>,
        <mod_lavacow:felarmor_chestplate>,
        <mod_lavacow:felarmor_leggings>,
        <mod_lavacow:felarmor_boots>,
        <midnight:rockshroom_helmet>,
        <metallurgy:midasium_helmet>,
        <metallurgy:inolashite_helmet>,
        <minecraft:golden_chestplate>,
        <cqrepoured:chestplate_inquisition>,
        <mod_lavacow:swinearmor_chestplate>,
        <metallurgy:platinum_chestplate>,
        <metallurgy:ceruclase_chestplate>,
        <metallurgy:damascus_steel_chestplate>,
        <metallurgy:ignatius_chestplate>,
        <metallurgy:atlarus_chestplate>,
        <metallurgy:vyroxeres_chestplate>,
        <midnight:rockshroom_chestplate>,
        <metallurgy:midasium_chestplate>,
        <metallurgy:inolashite_chestplate>,
        <minecraft:golden_leggings>,
        <cqrepoured:leggings_inquisition>,
        <mod_lavacow:swinearmor_leggings>,
        <metallurgy:platinum_leggings>,
        <metallurgy:ceruclase_leggings>,
        <metallurgy:damascus_steel_leggings>,
        <metallurgy:ignatius_leggings>,
        <metallurgy:atlarus_leggings>,
        <metallurgy:vyroxeres_leggings>,
        <midnight:rockshroom_leggings>,
        <metallurgy:midasium_leggings>,
        <metallurgy:inolashite_leggings>,
        <mod_lavacow:chitinarmor_helmet>,
        <mod_lavacow:chitinarmor_chestplate>,
        <mod_lavacow:chitinarmor_leggings>,
        <mod_lavacow:chitinarmor_boots>,
        <minecraft:golden_boots>,
        <cqrepoured:boots_inquisition>,
        <mod_lavacow:swinearmor_boots>,
        <metallurgy:platinum_boots>,
        <metallurgy:ceruclase_boots>,
        <metallurgy:damascus_steel_boots>,
        <metallurgy:ignatius_boots>,
        <metallurgy:atlarus_boots>,
        <metallurgy:vyroxeres_boots>,
        <midnight:rockshroom_boots>,
        <metallurgy:midasium_boots>,
        <metallurgy:inolashite_boots>,
        <srparasites:armor_helm_sentient>.withTag({devout: 1}),
        <srparasites:armor_chest_sentient>.withTag({devout: 1}),
        <srparasites:armor_pants_sentient>.withTag({devout: 1}),
        <srparasites:armor_boots_sentient>.withTag({devout: 1}),
            ] as IIngredient[];

            for item in Array4{
                item.addTooltip(format.gold(format.bold("Devout")));
            }

        ## Necromancer Tooltips ##

val Array5 = [
        <lycanitesmobs:summoningstaff>,
        <lycanitesmobs:stablesummoningstaff>,
        <lycanitesmobs:sturdysummoningstaff>,
        <lycanitesmobs:savagesummoningstaff>,
        <lycanitesmobs:bloodsummoningstaff>,
        <cqrepoured:cursed_bone>,
            ] as IIngredient[];

            for item in Array5{
                item.addTooltip(format.lightPurple("Can only be used by the Necromancer subclass"));
            }

// Behgameon

val MArray = [
    <behgameon:ring_59>,
    <behgameon:ring_58>,
    <behgameon:ring_60>,
    <behgameon:ring_104>,
    <behgameon:ring_105>,
    <behgameon:ring_103>
            ] as IIngredient[];

            for item in MArray{
                item.addTooltip("Crafting material");
            }

val T1Array = [
    <behgameon:ring_18>,
    <behgameon:ring_28>,
    <behgameon:ring_20>,
    <behgameon:ring_21>,
    <behgameon:ring_22>,
    <behgameon:ring_17>,
    <behgameon:ring_19>,
    <behgameon:ring_27>,
    <behgameon:ring_23>,
    <behgameon:ring_24>,
    <behgameon:ring_26>,
    <behgameon:ring_25>
            ] as IIngredient[];

            for item in T1Array{
                item.addTooltip(format.green("Common: §eTier §eI"));
            }

val T2Array = [
    <behgameon:ring_41>,
    <behgameon:ring_42>,
    <behgameon:ring_43>,
    <behgameon:ring_44>,
    <behgameon:ring_45>,
    <behgameon:ring_46>,
    <behgameon:ring_47>,
    <behgameon:ring_48>,
    <behgameon:ring_49>,
    <behgameon:ring_50>,
    <behgameon:ring_51>,
    <behgameon:ring_52>
            ] as IIngredient[];

            for item in T2Array{
                item.addTooltip(format.green("Common: §eTier §eII"));
            }

val T3Array = [
    <behgameon:ring_29>,
    <behgameon:ring_30>,
    <behgameon:ring_31>,
    <behgameon:ring_32>,
    <behgameon:ring_33>,
    <behgameon:ring_34>,
    <behgameon:ring_35>,
    <behgameon:ring_36>,
    <behgameon:ring_37>,
    <behgameon:ring_38>,
    <behgameon:ring_39>,
    <behgameon:ring_40>
            ] as IIngredient[];

            for item in T3Array{
                item.addTooltip(format.green("Common: §eTier §eIII"));
            }

val G1Array = [
    <behgameon:ring_63>,
    <behgameon:ring_73>,
    <behgameon:ring_65>,
    <behgameon:ring_66>,
    <behgameon:ring_67>,
    <behgameon:ring_62>,
    <behgameon:ring_64>,
    <behgameon:ring_72>,
    <behgameon:ring_68>,
    <behgameon:ring_69>,
    <behgameon:ring_71>,
    <behgameon:ring_70>
            ] as IIngredient[];

            for item in G1Array{
                item.addTooltip(format.green("Greater: §eTier §eI"));
            }

val G2Array = [
    <behgameon:ring_86>,
    <behgameon:ring_87>,
    <behgameon:ring_88>,
    <behgameon:ring_89>,
    <behgameon:ring_90>,
    <behgameon:ring_91>,
    <behgameon:ring_92>,
    <behgameon:ring_93>,
    <behgameon:ring_94>,
    <behgameon:ring_95>,
    <behgameon:ring_96>,
    <behgameon:ring_97>
            ] as IIngredient[];

            for item in G2Array{
                item.addTooltip(format.green("Greater: §eTier §eII"));
            }

val FArray = [
    <behgameon:ring_18>,
    <behgameon:ring_42>,
    <behgameon:ring_30>
            ] as IItemStack[];

            for item in FArray{
                item.displayName = "Ring of Fireskin";
            }

val IArray = [
    <behgameon:ring_28>,
    <behgameon:ring_52>,
    <behgameon:ring_40>
            ] as IItemStack[];

            for item in IArray{
                item.displayName = "Ring of Ice Shroud";
            }

val RegArray = [
    <behgameon:ring_20>,
    <behgameon:ring_44>,
    <behgameon:ring_32>
            ] as IItemStack[];

            for item in RegArray{
                item.displayName = "Ring of Regeneration";
            }

val JArray = [
    <behgameon:ring_21>,
    <behgameon:ring_45>,
    <behgameon:ring_33>
            ] as IItemStack[];

            for item in JArray{
                item.displayName = "Ring of Jump Boost";
            }

val SArray = [
    <behgameon:ring_22>,
    <behgameon:ring_46>,
    <behgameon:ring_34>
            ] as IItemStack[];

            for item in SArray{
                item.displayName = "Ring of Swiftness";
            }

val StArray = [
    <behgameon:ring_17>,
    <behgameon:ring_41>,
    <behgameon:ring_29>
            ] as IItemStack[];

            for item in StArray{
                item.displayName = "Ring of Strength";
            }

val HArray = [
    <behgameon:ring_19>,
    <behgameon:ring_43>,
    <behgameon:ring_31>
            ] as IItemStack[];

            for item in HArray{
                item.displayName = "Ring of Haste";
            }

val ResArray = [
    <behgameon:ring_27>,
    <behgameon:ring_51>,
    <behgameon:ring_39>
            ] as IItemStack[];

            for item in ResArray{
                item.displayName = "Ring of Resistance";
            }

val RepArray = [
    <behgameon:ring_23>,
    <behgameon:ring_47>,
    <behgameon:ring_35>
            ] as IItemStack[];

            for item in RepArray{
                item.displayName = "Ring of Repairing";
            }

val MFArray = [
    <behgameon:ring_24>,
    <behgameon:ring_48>,
    <behgameon:ring_36>
            ] as IItemStack[];

            for item in MFArray{
                item.displayName = "Ring of Magic Focus";
            }

val MSArray = [
    <behgameon:ring_26>,
    <behgameon:ring_50>,
    <behgameon:ring_38>
            ] as IItemStack[];

            for item in MSArray{
                item.displayName = "Ring of Magic Shielding";
            }

val AArray = [
    <behgameon:ring_25>,
    <behgameon:ring_49>,
    <behgameon:ring_37>
            ] as IItemStack[];

            for item in AArray{
                item.displayName = "Ring of Archery";
            }

<behgameon:ring_59>.displayName = "Empty Ring";
<behgameon:ring_58>.displayName = "Greater Empty Ring";
<behgameon:ring_60>.displayName = "§cGodly §cEmpty §cRing";

<behgameon:ring_104>.displayName = "§5F§dorsaken §dRin§5g";
<behgameon:ring_103>.displayName = "§5I§dmproved §dForsaken §dRin§5g";
<behgameon:ring_105>.displayName = "§4R§cing §cof §cthe §cAncient§4s";

<behgameon:ring_63>.displayName = "§5F§dorsaken §dRing §dof §dFireski§5n";
<behgameon:ring_73>.displayName = "§5F§dorsaken §dRing §dof §dIce §dShrou§5d";
<behgameon:ring_65>.displayName = "§5F§dorsaken §dRing §dof §dRegeneratio§5n";
<behgameon:ring_66>.displayName = "§5F§dorsaken §dRing §dof §dJump §dBoos§5t";
<behgameon:ring_67>.displayName = "§5F§dorsaken §dRing §dof §dSwiftnes§5s";
<behgameon:ring_62>.displayName = "§5F§dorsaken §dRing §dof §dStrengt§5h";
<behgameon:ring_64>.displayName = "§5F§dorsaken §dRing §dof §dHast§5e";
<behgameon:ring_72>.displayName = "§5F§dorsaken §dRing §dof §dResistanc§5e";
<behgameon:ring_68>.displayName = "§5F§dorsaken §dRing §dof §dMendin§5g";
<behgameon:ring_69>.displayName = "§5F§dorsaken §dRing §dof §dMagic §dFocu§5s";
<behgameon:ring_71>.displayName = "§5F§dorsaken §dRing §dof §dMagic §dShieldin§5g";
<behgameon:ring_70>.displayName = "§5F§dorsaken §dRing §dof §dArcher§5y";

<behgameon:ring_86>.displayName = "§4Forsaken §cRing §4of §4Strength";
<behgameon:ring_87>.displayName = "§4Forsaken §4Ring §cof §4Fireskin";
<behgameon:ring_88>.displayName = "§4Forsaken §4Ring §4of §cHaste";
<behgameon:ring_89>.displayName = "§cForsaken §4Ring §4of §cRegeneration";
<behgameon:ring_90>.displayName = "§4Forsaken §cRing §4of §4Jump §cBoost";
<behgameon:ring_91>.displayName = "§4Forsaken §4Ring §cof §4Swiftness";
<behgameon:ring_92>.displayName = "§4Forsaken §4Ring §4of §cMending";
<behgameon:ring_93>.displayName = "§cForsaken §4Ring §4of §4Magic §cFocus";
<behgameon:ring_94>.displayName = "§4Forsaken §cRing §4of §4Archery";
<behgameon:ring_95>.displayName = "§4Forsaken §4Ring §cof §4Magic §cShielding";
<behgameon:ring_96>.displayName = "§cForsaken §4Ring §4of §cResistance";
<behgameon:ring_97>.displayName = "§4Forsaken §cRing §4of §4Ice §4Shroud";

<behgameon:ring_74>.displayName = "§6A§encient §eRing §eof §eStrengt§6h";
<behgameon:ring_75>.displayName = "§6A§encient §eRing §eof §eFireski§6n";
<behgameon:ring_75>.addTooltip(format.gold("Also gives §eFire §eResistance."));
<behgameon:ring_76>.displayName = "§6A§encient §eRing §eof §eHast§6e";
<behgameon:ring_77>.displayName = "§6A§encient §eRing §eof §eRegeneratio§6n";
<behgameon:ring_78>.displayName = "§6A§encient §eRing §eof §eJump §eBoos§6t";
<behgameon:ring_79>.displayName = "§6A§encient §eRing §eof §eSwiftnes§6s";
<behgameon:ring_80>.displayName = "§6A§encient §eRing §eof §eMendin§6g";
<behgameon:ring_81>.displayName = "§6A§encient §eRing §eof §eMagic §eFocu§6s";
<behgameon:ring_82>.displayName = "§6A§encient §eRing §eof §eArcher§6y";
<behgameon:ring_83>.displayName = "§6A§encient §eRing §eof §eMagic §eShieldin§6g";
<behgameon:ring_84>.displayName = "§6A§encient §eRing §eof §eResistanc§6e";
<behgameon:ring_85>.displayName = "§6A§encient §eRing §eof §eIce §eShrou§6d";
<behgameon:ring_85>.addTooltip(format.gold("Also makes any nearby entity"));
<behgameon:ring_85>.addTooltip(format.yellow("freeze for 3 seconds every 10 seconds."));

// =======================================================================================================================

<roughtweaks:medikit>.anyDamage().addTooltip(format.yellow("Can be repaired with wool."));
<roughtweaks:medikitenchanted>.anyDamage().addTooltip(format.yellow("Can be repaired with wool."));

<behgameon:accessory_1>.displayName = "Feathery Belt";
<behgameon:accessory_1>.addTooltip(format.green("Adds 4 extra feathers that regenerate every 9 seconds."));

<behgameon:accessory_2>.displayName = "Endurance Belt";
<behgameon:accessory_2>.addTooltip(format.green("Increases regeneration of feathers for 6 seconds, every 7 seconds."));

<behgameon:accessory_3>.displayName = "Leaper's Belt";
<behgameon:accessory_3>.addTooltip(format.green("Increases dodge force."));

<behgameon:accessory_33>.displayName = "Striker's Charm";
<behgameon:accessory_33>.addTooltip(format.yellow("+7% Attack Damage"));
<behgameon:accessory_33>.addTooltip(format.gold("Dropped from mobs in complete darkness."));

<behgameon:accessory_35>.displayName = "Hunter's Charm";
<behgameon:accessory_35>.addTooltip(format.yellow("+7% Projectile Damage"));
<behgameon:accessory_35>.addTooltip(format.gold("Dropped from mobs in complete darkness."));

<behgameon:accessory_36>.displayName = "Racer's Charm";
<behgameon:accessory_36>.addTooltip(format.yellow("+7% Attack Speed"));
<behgameon:accessory_36>.addTooltip(format.gold("Dropped from mobs in complete darkness."));

<behgameon:accessory_38>.displayName = "Caster's Charm";
<behgameon:accessory_38>.addTooltip(format.yellow("+7% Magic Damage"));
<behgameon:accessory_38>.addTooltip(format.gold("Dropped from mobs in complete darkness."));


<behgameon:accessory_45>.displayName = "The Interdimensional Runner's Charm";
<behgameon:accessory_45>.addTooltip(format.green("Tremor"));
<behgameon:accessory_45>.addShiftTooltip("Increases attack speed by 20%, reach distance by 0.5 and movement speed by 25%","Hold Shift to see more details");

<behgameon:accessory_47>.displayName = "Sirius Charm";
<behgameon:accessory_47>.addTooltip(format.green("Tremor"));
<behgameon:accessory_47>.addShiftTooltip("Increases attack speed by 10%, reach distance by 0.25 and movement speed by 15%","Hold Shift to see more details");

<behgameon:accessory_48>.displayName = "Celestial Charm";
<behgameon:accessory_48>.addTooltip(format.gold("Furor"));
<behgameon:accessory_48>.addShiftTooltip("Increases attack damage by 10%, armor toughness by 4, and armor by 10","Hold Shift to see more details");

<behgameon:accessory_46>.displayName = "The Interdimensional Soldier's Charm";
<behgameon:accessory_46>.addTooltip(format.gold("Furor"));
<behgameon:accessory_46>.addShiftTooltip("Increases attack damage by 20%, armor toughness by 8, and armor by 15","Hold Shift to see more details");

<behgameon:accessory_55>.displayName = "Diamond-tipped Arrow";
<behgameon:accessory_55>.addTooltip(format.aqua("Arcum"));
<behgameon:accessory_55>.addShiftTooltip("Increases projectile damage by 12%, blessed by 4","Hold Shift to see more details");

<behgameon:accessory_56>.displayName = "The Cataclysmic Arrow";
<behgameon:accessory_56>.addTooltip(format.aqua("Arcum"));
<behgameon:accessory_56>.addShiftTooltip("Increases projectile damage by 25%, blessed by 8","Hold Shift to see more details");

<srparasites:armor_helm_sentient>.withTag({keen_eyes: 1}).anyDamage().addTooltip(format.darkPurple("Death Stare"));
<srparasites:armor_helm_sentient>.withTag({keen_eyes: 1}).anyDamage().addShiftTooltip("+50% Ranged Damage every 4s and a Damage effect every 8s. Killing mobs with the Keen Eyes ability (Soul Sight) replenishes the effect.","Hold Shift to see more details");
<srparasites:armor_chest_sentient>.withTag({keen_eyes: 1}).anyDamage().addTooltip(format.darkPurple("Death Stare"));
<srparasites:armor_chest_sentient>.withTag({keen_eyes: 1}).anyDamage().addShiftTooltip("+50% Ranged Damage every 4s and a Damage effect every 8s. Killing mobs with the Keen Eyes ability (Soul Sight) replenishes the effect.","Hold Shift to see more details");
<srparasites:armor_pants_sentient>.withTag({keen_eyes: 1}).anyDamage().addTooltip(format.darkPurple("Death Stare"));
<srparasites:armor_pants_sentient>.withTag({keen_eyes: 1}).anyDamage().addShiftTooltip("+50% Ranged Damage every 4s and a Damage effect every 8s. Killing mobs with the Keen Eyes ability (Soul Sight) replenishes the effect.","Hold Shift to see more details");
<srparasites:armor_boots_sentient>.withTag({keen_eyes: 1}).anyDamage().addTooltip(format.darkPurple("Death Stare"));
<srparasites:armor_boots_sentient>.withTag({keen_eyes: 1}).anyDamage().addShiftTooltip("+50% Ranged Damage every 4s and a Damage effect every 8s. Killing mobs with the Keen Eyes ability (Soul Sight) replenishes the effect.","Hold Shift to see more details");

<srparasites:armor_helm_sentient>.withTag({quick_fingers: 1}).anyDamage().addTooltip(format.darkPurple("Elemental Arrows"));
<srparasites:armor_helm_sentient>.withTag({quick_fingers: 1}).anyDamage().addShiftTooltip("+30% Ranged Damage. While the Quick Fingers ability is active (Use Speed), your arrows will inflict the respective debuff of your mount's element.","Hold Shift to see more details");
<srparasites:armor_chest_sentient>.withTag({quick_fingers: 1}).anyDamage().addTooltip(format.darkPurple("Elemental Arrows"));
<srparasites:armor_chest_sentient>.withTag({quick_fingers: 1}).anyDamage().addShiftTooltip("+30% Ranged Damage. While the Quick Fingers ability is active (Use Speed), your arrows will inflict the respective debuff of your mount's element.","Hold Shift to see more details");
<srparasites:armor_pants_sentient>.withTag({quick_fingers: 1}).anyDamage().addTooltip(format.darkPurple("Elemental Arrows"));
<srparasites:armor_pants_sentient>.withTag({quick_fingers: 1}).anyDamage().addShiftTooltip("+30% Ranged Damage. While the Quick Fingers ability is active (Use Speed), your arrows will inflict the respective debuff of your mount's element.","Hold Shift to see more details");
<srparasites:armor_boots_sentient>.withTag({quick_fingers: 1}).anyDamage().addTooltip(format.darkPurple("Elemental Arrows"));
<srparasites:armor_boots_sentient>.withTag({quick_fingers: 1}).anyDamage().addShiftTooltip("+30% Ranged Damage. While the Quick Fingers ability is active (Use Speed), your arrows will inflict the respective debuff of your mount's element.","Hold Shift to see more details");

<srparasites:armor_helm_sentient>.withTag({horde_tamer: 1}).anyDamage().addTooltip(format.darkPurple("Horde Slayer"));
<srparasites:armor_helm_sentient>.withTag({horde_tamer: 1}).anyDamage().addShiftTooltip("(Mobs will usually target you) Gain resistance based on the amount of hits per (5) seconds received. Explosions caused by the Rage ability will stun enemies for 3-9s depending on the detonation strength.","Hold Shift to see more details");
<srparasites:armor_chest_sentient>.withTag({horde_tamer: 1}).anyDamage().addTooltip(format.darkPurple("Horde Slayer"));
<srparasites:armor_chest_sentient>.withTag({horde_tamer: 1}).anyDamage().addShiftTooltip("(Mobs will usually target you) Gain resistance based on the amount of hits per (5) seconds received. Explosions caused by the Rage ability will stun enemies for 3-9s depending on the detonation strength.","Hold Shift to see more details");
<srparasites:armor_pants_sentient>.withTag({horde_tamer: 1}).anyDamage().addTooltip(format.darkPurple("Horde Slayer"));
<srparasites:armor_pants_sentient>.withTag({horde_tamer: 1}).anyDamage().addShiftTooltip("(Mobs will usually target you) Gain resistance based on the amount of hits per (5) seconds received. Explosions caused by the Rage ability will stun enemies for 3-9s depending on the detonation strength.","Hold Shift to see more details");
<srparasites:armor_boots_sentient>.withTag({horde_tamer: 1}).anyDamage().addTooltip(format.darkPurple("Horde Slayer"));
<srparasites:armor_boots_sentient>.withTag({horde_tamer: 1}).anyDamage().addShiftTooltip("(Mobs will usually target you) Gain resistance based on the amount of hits per (5) seconds received. Explosions caused by the Rage ability will stun enemies for 3-9s depending on the detonation strength.","Hold Shift to see more details");

<srparasites:armor_helm_sentient>.withTag({iron_heart: 1}).anyDamage().addTooltip(format.darkPurple("Demonic Heart"));
<srparasites:armor_helm_sentient>.withTag({iron_heart: 1}).anyDamage().addShiftTooltip("Gain resistance based on your percentage of health. Enemies are pushed back and inflicted with fear if they hit you after activating Unstable Rage. The duration of the Fear effect on the enemies depends on the amplifier of Rage.","Hold Shift to see more details");
<srparasites:armor_chest_sentient>.withTag({iron_heart: 1}).anyDamage().addTooltip(format.darkPurple("Demonic Heart"));
<srparasites:armor_chest_sentient>.withTag({iron_heart: 1}).anyDamage().addShiftTooltip("Gain resistance based on your percentage of health. Enemies are pushed back and inflicted with fear if they hit you after activating Unstable Rage. The duration of the Fear effect on the enemies depends on the amplifier of Rage.","Hold Shift to see more details");
<srparasites:armor_pants_sentient>.withTag({iron_heart: 1}).anyDamage().addTooltip(format.darkPurple("Demonic Heart"));
<srparasites:armor_pants_sentient>.withTag({iron_heart: 1}).anyDamage().addShiftTooltip("Gain resistance based on your percentage of health. Enemies are pushed back and inflicted with fear if they hit you after activating Unstable Rage. The duration of the Fear effect on the enemies depends on the amplifier of Rage.","Hold Shift to see more details");
<srparasites:armor_boots_sentient>.withTag({iron_heart: 1}).anyDamage().addTooltip(format.darkPurple("Demonic Heart"));
<srparasites:armor_boots_sentient>.withTag({iron_heart: 1}).anyDamage().addShiftTooltip("Gain resistance based on your percentage of health. Enemies are pushed back and inflicted with fear if they hit you after activating Unstable Rage. The duration of the Fear effect on the enemies depends on the amplifier of Rage.","Hold Shift to see more details");

<srparasites:armor_helm_sentient>.withTag({assassin: 1}).anyDamage().addTooltip(format.darkPurple("Death Touch"));
<srparasites:armor_helm_sentient>.withTag({assassin: 1}).anyDamage().addShiftTooltip("+100% Damage and +0.8 Range but -95% Attack Speed. Successfully landing a Madness Mode hit on an enemy will also inflict it with Death Touch (The enemy instantly dies when below 30% health)","Hold Shift to see more details");
<srparasites:armor_chest_sentient>.withTag({assassin: 1}).anyDamage().addTooltip(format.darkPurple("Death Touch"));
<srparasites:armor_chest_sentient>.withTag({assassin: 1}).anyDamage().addShiftTooltip("+100% Damage and +0.8 Range but -95% Attack Speed. Successfully landing a Madness Mode hit on an enemy will also inflict it with Death Touch (The enemy instantly dies when below 30% health)","Hold Shift to see more details");
<srparasites:armor_pants_sentient>.withTag({assassin: 1}).anyDamage().addTooltip(format.darkPurple("Death Touch"));
<srparasites:armor_pants_sentient>.withTag({assassin: 1}).anyDamage().addShiftTooltip("+100% Damage and +0.8 Range but -95% Attack Speed. Successfully landing a Madness Mode hit on an enemy will also inflict it with Death Touch (The enemy instantly dies when below 30% health)","Hold Shift to see more details");
<srparasites:armor_boots_sentient>.withTag({assassin: 1}).anyDamage().addTooltip(format.darkPurple("Death Touch"));
<srparasites:armor_boots_sentient>.withTag({assassin: 1}).anyDamage().addShiftTooltip("+100% Damage and +0.8 Range but -95% Attack Speed. Successfully landing a Madness Mode hit on an enemy will also inflict it with Death Touch (The enemy instantly dies when below 30% health)","Hold Shift to see more details");

<srparasites:armor_helm_sentient>.withTag({flailer: 1}).anyDamage().addTooltip(format.darkPurple("Panic Expert"));
<srparasites:armor_helm_sentient>.withTag({flailer: 1}).anyDamage().addShiftTooltip("You receive more knockback based on your health and deal 50% less. Adversity will now also influence movement speed","Hold Shift to see more details");
<srparasites:armor_chest_sentient>.withTag({flailer: 1}).anyDamage().addTooltip(format.darkPurple("Panic Expert"));
<srparasites:armor_chest_sentient>.withTag({flailer: 1}).anyDamage().addShiftTooltip("You receive more knockback based on your health and deal 50% less. Adversity will now also influence movement speed","Hold Shift to see more details");
<srparasites:armor_pants_sentient>.withTag({flailer: 1}).anyDamage().addTooltip(format.darkPurple("Panic Expert"));
<srparasites:armor_pants_sentient>.withTag({flailer: 1}).anyDamage().addShiftTooltip("You receive more knockback based on your health and deal 50% less. Adversity will now also influence movement speed","Hold Shift to see more details");
<srparasites:armor_boots_sentient>.withTag({flailer: 1}).anyDamage().addTooltip(format.darkPurple("Panic Expert"));
<srparasites:armor_boots_sentient>.withTag({flailer: 1}).anyDamage().addShiftTooltip("You receive more knockback based on your health and deal 50% less. Adversity will now also influence movement speed","Hold Shift to see more details");

<srparasites:armor_helm_sentient>.withTag({necromancer: 1}).anyDamage().addTooltip(format.darkPurple("Weakening Essence"));
<srparasites:armor_helm_sentient>.withTag({necromancer: 1}).anyDamage().addShiftTooltip("+40% Magic Damage and summoning staffs become avaliable. If the player is already at max health, their magic damage will instead inflict the victim with Vulnerability.","Hold Shift to see more details");
<srparasites:armor_chest_sentient>.withTag({necromancer: 1}).anyDamage().addTooltip(format.darkPurple("Weakening Essence"));
<srparasites:armor_chest_sentient>.withTag({necromancer: 1}).anyDamage().addShiftTooltip("+40% Magic Damage and summoning staffs become avaliable. If the player is already at max health, their magic damage will instead inflict the victim with Vulnerability.","Hold Shift to see more details");
<srparasites:armor_pants_sentient>.withTag({necromancer: 1}).anyDamage().addTooltip(format.darkPurple("Weakening Essence"));
<srparasites:armor_pants_sentient>.withTag({necromancer: 1}).anyDamage().addShiftTooltip("+40% Magic Damage and summoning staffs become avaliable. If the player is already at max health, their magic damage will instead inflict the victim with Vulnerability.","Hold Shift to see more details");
<srparasites:armor_boots_sentient>.withTag({necromancer: 1}).anyDamage().addTooltip(format.darkPurple("Weakening Essence"));
<srparasites:armor_boots_sentient>.withTag({necromancer: 1}).anyDamage().addShiftTooltip("+40% Magic Damage and summoning staffs become avaliable. If the player is already at max health, their magic damage will instead inflict the victim with Vulnerability.","Hold Shift to see more details");

<srparasites:armor_helm_sentient>.withTag({warlock: 1}).anyDamage().addTooltip(format.darkPurple("Strengthening Essence"));
<srparasites:armor_helm_sentient>.withTag({warlock: 1}).anyDamage().addShiftTooltip("+80% Magic Damage. The more spell-casted effects you have, the more defense you also get.","Hold Shift to see more details");
<srparasites:armor_chest_sentient>.withTag({warlock: 1}).anyDamage().addTooltip(format.darkPurple("Strengthening Essence"));
<srparasites:armor_chest_sentient>.withTag({warlock: 1}).anyDamage().addShiftTooltip("+80% Magic Damage. The more spell-casted effects you have, the more defense you also get.","Hold Shift to see more details");
<srparasites:armor_pants_sentient>.withTag({warlock: 1}).anyDamage().addTooltip(format.darkPurple("Strengthening Essence"));
<srparasites:armor_pants_sentient>.withTag({warlock: 1}).anyDamage().addShiftTooltip("+80% Magic Damage. The more spell-casted effects you have, the more defense you also get.","Hold Shift to see more details");
<srparasites:armor_boots_sentient>.withTag({warlock: 1}).anyDamage().addTooltip(format.darkPurple("Strengthening Essence"));
<srparasites:armor_boots_sentient>.withTag({warlock: 1}).anyDamage().addShiftTooltip("+80% Magic Damage. The more spell-casted effects you have, the more defense you also get.","Hold Shift to see more details");