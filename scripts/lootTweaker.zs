import loottweaker.LootTweaker;
import loottweaker.vanilla.loot.LootTable;
import loottweaker.vanilla.loot.LootPool;

//##############################
//## LootTweaker-related code ##
//##############################



//##########
//## Vals ##
//##########



val simple_dungeon = LootTweaker.getTable("minecraft:chests/simple_dungeon");
val abanMineshaft = LootTweaker.getTable("minecraft:chests/abandoned_mineshaft");
val desertpyramid = LootTweaker.getTable("minecraft:chests/desert_pyramid");
val endcity = LootTweaker.getTable("minecraft:chests/end_city_treasure");
val igloochest = LootTweaker.getTable("minecraft:chests/igloo_chest");
val jungletemple = LootTweaker.getTable("minecraft:chests/jungle_temple");
val jungletemple_dispenser = LootTweaker.getTable("minecraft:chests/jungle_temple_dispenser");
val netherbridge = LootTweaker.getTable("minecraft:chests/nether_bridge");
val strongholdcorridor = LootTweaker.getTable("minecraft:chests/stronghold_corridor");
val strongholdcrossing = LootTweaker.getTable("minecraft:chests/stronghold_crossing");
val strongholdlibrary = LootTweaker.getTable("minecraft:chests/stronghold_library");
val villageblacksmith = LootTweaker.getTable("minecraft:chests/village_blacksmith");
val woodlandmansion = LootTweaker.getTable("minecraft:chests/woodland_mansion");
val midnight = LootTweaker.getTable("midnight:fishing/midnight_treasure");
val midnightJunk = LootTweaker.getTable("midnight:fishing/midnight_junk");



//################
//## added loot ##
//################



val end = endcity.getPool("main");

    end.addItemEntry(<behgameon:ring_104>, 5);


//== midnight ==

val mid = midnight.getPool("midnight_treasure");
val midight = midnightJunk.getPool("midnight_junk");

    mid.addItemEntry(<xat:dwarf_ring>, 1);
    mid.addItemEntry(<xat:titan_ring>, 1);
    mid.addItemEntry(<xat:goblin_ring>, 1);
    mid.addItemEntry(<xat:elf_ring>, 1);
    mid.addItemEntry(<xat:faelis_ring>, 1);

    midight.addItemEntry(<srparasites:weapon_bow>, 1);
    midight.addItemEntry(<srparasites:weapon_scythe>, 1);
    midight.addItemEntry(<srparasites:weapon_axe>, 1);   
    midight.addItemEntry(<srparasites:weapon_sword>, 1);   
    midight.addItemEntry(<srparasites:weapon_cleaver>, 1);  



//##################
//## Removed Loot ##
//##################



//== mod_lavacow ==

val skelingtonKing = LootTweaker.getTable("mod_lavacow:skeleton_king");
val skelington = skelingtonKing.getPool("mod_lavacow:skeleton_king_equipment");

    skelington.removeEntry("mod_lavacow:faminearmor_helmet");   
    skelington.removeEntry("mod_lavacow:faminearmor_chestplate");  

//== vanilla ==

val stronghold = strongholdcorridor.getPool("main");

    stronghold.removeEntry("minecraft:iron_chestplate");
    stronghold.removeEntry("minecraft:iron_leggings");
    stronghold.removeEntry("minecraft:iron_boots");
    stronghold.removeEntry("minecraft:iron_helmet");
    

//== ebwizardry ==

val ebuartifact = LootTweaker.getTable("ebwizardry:subsets/uncommon_artefacts");
val ebrartifact = LootTweaker.getTable("ebwizardry:subsets/rare_artefacts");
val ebeartifact = LootTweaker.getTable("ebwizardry:subsets/epic_artefacts");

val uArtifact = ebuartifact.getPool("uncommon_artefacts");
val rArtifact = ebrartifact.getPool("rare_artefacts");
val eArtifact = ebeartifact.getPool("epic_artefacts");

val ebdungeon = LootTweaker.getTable("ebwizardry:chests/dungeon_additions");

val ebRemove = ebdungeon.getPool("wizardry");

    ebRemove.removeEntry("ebwizardry:subsets/wizard_armour");

    uArtifact.removeEntry("ebwizardry:amulet_recovery");
    uArtifact.removeEntry("ebwizardry:charm_minion_variants");
    uArtifact.removeEntry("ebwizardry:charm_minion_health");
    uArtifact.removeEntry("ebwizardry:ring_fire_melee");
    uArtifact.removeEntry("ebwizardry:ring_fire_biome");

    rArtifact.removeEntry("ebwizardry:amulet_arcane_defence");
    rArtifact.removeEntry("ebwizardry:ring_disintegration");
    rArtifact.removeEntry("ebwizardry:charm_hunger_casting");
    rArtifact.removeEntry("ebwizardry:amulet_fire_cloaking");

    eArtifact.removeEntry("ebwizardry:amulet_wither_immunity");
    eArtifact.removeEntry("ebwizardry:ring_combustion");
    eArtifact.removeEntry("ebwizardry:charm_lava_walking");

//== behgameon ==

val dungeonTable = LootTweaker.getTable("behgameon:inject/main_loot");

val dungeon = dungeonTable.getPool("main");

    dungeon.addItemEntry(<spartanweaponry:katana_wood>, 10);
    dungeon.addItemEntry(<spartanweaponry:longsword_wood>, 10);
    dungeon.addItemEntry(<spartanweaponry:club_wood>, 10);
    dungeon.addItemEntry(<spartanweaponry:club_studded>, 5);
    dungeon.addItemEntry(<spartanweaponry:hammer_wood>, 10);
    dungeon.addItemEntry(<spartanweaponry:warhammer_wood>, 10);
    dungeon.addItemEntry(<spartanweaponry:rapier_wood>, 10);
    dungeon.addItemEntry(<spartanweaponry:saber_wood>, 10);
    dungeon.addItemEntry(<spartanweaponry:dagger_wood>, 10);
    dungeon.addItemEntry(<spartanweaponry:greatsword_wood>, 10);
    dungeon.addItemEntry(<spartanweaponry:battleaxe_wood>, 10);
    dungeon.addItemEntry(<spartanweaponry:mace_wood>, 10);
    dungeon.addItemEntry(<spartanweaponry:glaive_wood>, 10);
    dungeon.addItemEntry(<spartanweaponry:staff>, 10);
    dungeon.addItemEntry(<spartanweaponry:spear_wood>, 10);
    dungeon.addItemEntry(<spartanweaponry:halberd_wood>, 10);
    dungeon.addItemEntry(<spartanweaponry:pike_wood>, 10);
    dungeon.addItemEntry(<spartanweaponry:lance_wood>, 10);
    dungeon.addItemEntry(<spartanweaponry:throwing_knife_wood>, 10);
    dungeon.addItemEntry(<spartanweaponry:longbow_wood>, 10);
    dungeon.addItemEntry(<spartanweaponry:throwing_axe_wood>, 10);
    dungeon.addItemEntry(<spartanweaponry:javelin_wood>, 10);
    dungeon.addItemEntry(<spartanweaponry:boomerang_wood>, 10);

    dungeon.addItemEntry(<spartanweaponry:caestus>, 10);
    dungeon.addItemEntry(<spartanweaponry:caestus_studded>, 5);
    dungeon.addItemEntry(<minecraft:arrow>, 60);
    dungeon.addItemEntry(<spartanweaponry:arrow_wood>, 70);
    dungeon.addItemEntry(<spartanweaponry:arrow_iron>, 60);
    dungeon.addItemEntry(<spartanweaponry:arrow_diamond>, 50);
    dungeon.addItemEntry(<spartanweaponry:arrow_explosive>, 5);
    dungeon.addItemEntry(<spartanweaponry:bolt>, 60);
    dungeon.addItemEntry(<spartanweaponry:bolt_diamond>, 50);
    dungeon.addItemEntry(<switchbow:arrowofthesearcher>, 50);
    dungeon.addItemEntry(<switchbow:arrowunderwater>, 50);
    dungeon.addItemEntry(<switchbow:arrowfire>, 60);
    dungeon.addItemEntry(<switchbow:arrowvampier>, 50);
    dungeon.addItemEntry(<switchbow:arrowair>, 60);
    dungeon.addItemEntry(<switchbow:arrowfrost>, 60);
    dungeon.addItemEntry(<switchbow:arrowwither>, 50);
    dungeon.addItemEntry(<switchbow:arrowsplit>, 50);
    dungeon.addItemEntry(<switchbow:arrowbouncy>, 60);
    dungeon.addItemEntry(<switchbow:arrowknockback>, 50);
    dungeon.addItemEntry(<switchbow:arrowprotector>, 50);
    dungeon.addItemEntry(<switchbow:arrowtriple>, 40);
    dungeon.addItemEntry(<switchbow:arrowburial>, 40);
    dungeon.addItemEntry(<switchbow:arrowredstone>, 50);
    dungeon.addItemEntry(<switchbow:arrowpiercing>, 40);
    dungeon.addItemEntry(<switchbow:arrowbone>, 40);

    dungeon.removeEntry("behgameon:accessory_1");
    dungeon.removeEntry("behgameon:accessory_2");
    dungeon.removeEntry("behgameon:accessory_3");
    dungeon.removeEntry("behgameon:accessory_4");
    dungeon.removeEntry("behgameon:accessory_5");
    dungeon.removeEntry("behgameon:accessory_6");
    dungeon.removeEntry("behgameon:accessory_7");
    dungeon.removeEntry("behgameon:accessory_8");
    dungeon.removeEntry("behgameon:accessory_9");
    dungeon.removeEntry("behgameon:accessory_10");
    dungeon.removeEntry("behgameon:accessory_11");
    dungeon.removeEntry("behgameon:accessory_12");
    dungeon.removeEntry("behgameon:accessory_13");
    dungeon.removeEntry("behgameon:accessory_14");
    dungeon.removeEntry("behgameon:accessory_15");
    dungeon.removeEntry("behgameon:accessory_16");
    dungeon.removeEntry("behgameon:accessory_17");
    dungeon.removeEntry("behgameon:accessory_18");
    dungeon.removeEntry("behgameon:accessory_19");
    dungeon.removeEntry("behgameon:accessory_20");
    dungeon.removeEntry("behgameon:accessory_21");
    dungeon.removeEntry("behgameon:accessory_22");
    dungeon.removeEntry("behgameon:accessory_23");
    dungeon.removeEntry("behgameon:accessory_24");
    dungeon.removeEntry("behgameon:accessory_25");
    dungeon.removeEntry("behgameon:accessory_26");
    dungeon.removeEntry("behgameon:accessory_27");
    dungeon.removeEntry("behgameon:accessory_28");
    dungeon.removeEntry("behgameon:accessory_29");
    dungeon.removeEntry("behgameon:accessory_30");
    dungeon.removeEntry("behgameon:accessory_31");
    dungeon.removeEntry("behgameon:accessory_32");
    dungeon.removeEntry("behgameon:accessory_33");
    dungeon.removeEntry("behgameon:accessory_34");
    dungeon.removeEntry("behgameon:accessory_35");
    dungeon.removeEntry("behgameon:accessory_36");
    dungeon.removeEntry("behgameon:accessory_37");
    dungeon.removeEntry("behgameon:accessory_38");
    dungeon.removeEntry("behgameon:accessory_39");
    dungeon.removeEntry("behgameon:accessory_40");
    dungeon.removeEntry("behgameon:accessory_41");
    dungeon.removeEntry("behgameon:accessory_42");
    dungeon.removeEntry("behgameon:accessory_43");
    dungeon.removeEntry("behgameon:accessory_44");
    dungeon.removeEntry("behgameon:accessory_45");
    dungeon.removeEntry("behgameon:accessory_46");
    dungeon.removeEntry("behgameon:accessory_47");
    dungeon.removeEntry("behgameon:accessory_48");
    dungeon.removeEntry("behgameon:accessory_49");
    dungeon.removeEntry("behgameon:accessory_50");
    dungeon.removeEntry("behgameon:accessory_51");
    dungeon.removeEntry("behgameon:accessory_52");
    dungeon.removeEntry("behgameon:accessory_53");
    dungeon.removeEntry("behgameon:accessory_54");
    dungeon.removeEntry("behgameon:accessory_55");
    dungeon.removeEntry("behgameon:accessory_56");
    dungeon.removeEntry("behgameon:ring_1");
    dungeon.removeEntry("behgameon:ring_2");
    dungeon.removeEntry("behgameon:ring_3");
    dungeon.removeEntry("behgameon:ring_4");
    dungeon.removeEntry("behgameon:ring_5");
    dungeon.removeEntry("behgameon:ring_6");
    dungeon.removeEntry("behgameon:ring_7");
    dungeon.removeEntry("behgameon:ring_8");
    dungeon.removeEntry("behgameon:ring_9");
    dungeon.removeEntry("behgameon:ring_10");
    dungeon.removeEntry("behgameon:ring_11");
    dungeon.removeEntry("behgameon:ring_12");
    dungeon.removeEntry("behgameon:ring_13");
    dungeon.removeEntry("behgameon:ring_14");
    dungeon.removeEntry("behgameon:ring_15");
    dungeon.removeEntry("behgameon:ring_16");
    dungeon.removeEntry("behgameon:ring_17");
    dungeon.removeEntry("behgameon:ring_18");
    dungeon.removeEntry("behgameon:ring_19");
    dungeon.removeEntry("behgameon:ring_20");
    dungeon.removeEntry("behgameon:ring_21");
    dungeon.removeEntry("behgameon:ring_22");
    dungeon.removeEntry("behgameon:ring_23");
    dungeon.removeEntry("behgameon:ring_24");
    dungeon.removeEntry("behgameon:ring_25");
    dungeon.removeEntry("behgameon:ring_26");
    dungeon.removeEntry("behgameon:ring_27");
    dungeon.removeEntry("behgameon:ring_28");
    dungeon.removeEntry("behgameon:ring_29");
    dungeon.removeEntry("behgameon:ring_30");
    dungeon.removeEntry("behgameon:ring_31");
    dungeon.removeEntry("behgameon:ring_32");
    dungeon.removeEntry("behgameon:ring_33");
    dungeon.removeEntry("behgameon:ring_34");
    dungeon.removeEntry("behgameon:ring_35");
    dungeon.removeEntry("behgameon:ring_36");
    dungeon.removeEntry("behgameon:ring_37");
    dungeon.removeEntry("behgameon:ring_38");
    dungeon.removeEntry("behgameon:ring_39");
    dungeon.removeEntry("behgameon:ring_40");
    dungeon.removeEntry("behgameon:ring_41");
    dungeon.removeEntry("behgameon:ring_42");
    dungeon.removeEntry("behgameon:ring_43");
    dungeon.removeEntry("behgameon:ring_44");
    dungeon.removeEntry("behgameon:ring_45");
    dungeon.removeEntry("behgameon:ring_46");
    dungeon.removeEntry("behgameon:ring_47");
    dungeon.removeEntry("behgameon:ring_48");
    dungeon.removeEntry("behgameon:ring_49");
    dungeon.removeEntry("behgameon:ring_50");
    dungeon.removeEntry("behgameon:ring_51");
    dungeon.removeEntry("behgameon:ring_52");
    dungeon.removeEntry("behgameon:ring_53");
    dungeon.removeEntry("behgameon:ring_54");
    dungeon.removeEntry("behgameon:ring_55");
    dungeon.removeEntry("behgameon:ring_56");
    dungeon.removeEntry("behgameon:ring_57");
    dungeon.removeEntry("behgameon:ring_58");
    dungeon.removeEntry("behgameon:ring_59");
    dungeon.removeEntry("behgameon:ring_60");
    dungeon.removeEntry("behgameon:ring_61");
    dungeon.removeEntry("behgameon:ring_62");
    dungeon.removeEntry("behgameon:ring_63");
    dungeon.removeEntry("behgameon:ring_64");
    dungeon.removeEntry("behgameon:ring_65");
    dungeon.removeEntry("behgameon:ring_66");
    dungeon.removeEntry("behgameon:ring_67");
    dungeon.removeEntry("behgameon:ring_68");
    dungeon.removeEntry("behgameon:ring_69");
    dungeon.removeEntry("behgameon:ring_70");
    dungeon.removeEntry("behgameon:ring_71");
    dungeon.removeEntry("behgameon:ring_72");
    dungeon.removeEntry("behgameon:ring_73");
    dungeon.removeEntry("behgameon:ring_74");
    dungeon.removeEntry("behgameon:ring_75");
    dungeon.removeEntry("behgameon:ring_76");
    dungeon.removeEntry("behgameon:ring_77");
    dungeon.removeEntry("behgameon:ring_78");
    dungeon.removeEntry("behgameon:ring_79");
    dungeon.removeEntry("behgameon:ring_80");
    dungeon.removeEntry("behgameon:ring_81");
    dungeon.removeEntry("behgameon:ring_82");
    dungeon.removeEntry("behgameon:ring_83");
    dungeon.removeEntry("behgameon:ring_84");
    dungeon.removeEntry("behgameon:ring_85");
    dungeon.removeEntry("behgameon:ring_86");
    dungeon.removeEntry("behgameon:ring_87");
    dungeon.removeEntry("behgameon:ring_88");
    dungeon.removeEntry("behgameon:ring_89");
    dungeon.removeEntry("behgameon:ring_90");
    dungeon.removeEntry("behgameon:ring_91");
    dungeon.removeEntry("behgameon:ring_92");
    dungeon.removeEntry("behgameon:ring_93");
    dungeon.removeEntry("behgameon:ring_94");
    dungeon.removeEntry("behgameon:ring_95");
    dungeon.removeEntry("behgameon:ring_96");
    dungeon.removeEntry("behgameon:ring_97");
    dungeon.removeEntry("behgameon:ring_98");
    dungeon.removeEntry("behgameon:ring_99");
    dungeon.removeEntry("behgameon:ring_100");
    dungeon.removeEntry("behgameon:ring_101");
    dungeon.removeEntry("behgameon:ring_102");
    dungeon.removeEntry("behgameon:ring_103");
    dungeon.removeEntry("behgameon:ring_104");
    dungeon.removeEntry("behgameon:ring_105");
    dungeon.removeEntry("behgameon:ring_106");


