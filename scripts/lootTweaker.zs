import loottweaker.LootTweaker;
import loottweaker.vanilla.loot.LootTable;
import loottweaker.vanilla.loot.LootPool;
import crafttweaker.item.IItemStack;

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
val zombie = LootTweaker.getTable("minecraft:entities/zombie");
val mujend = LootTweaker.getTable("mujmajnkraftsbettersurvival:chests/end_city_treasure_inject");
val mujnether = LootTweaker.getTable("mujmajnkraftsbettersurvival:chests/nether_bridge_inject");
val mujspawn = LootTweaker.getTable("mujmajnkraftsbettersurvival:chests/spawn_bonus_inject");
val mujstronghold = LootTweaker.getTable("mujmajnkraftsbettersurvival:chests/stronghold_corridor_inject");
val mujvillage = LootTweaker.getTable("mujmajnkraftsbettersurvival:chests/village_blacksmith_inject");
val tomes = LootTweaker.getTable("ebwizardry:subsets/arcane_tomes");

//################
//## added loot ##
//################


val stronghold = strongholdcorridor.getPool("main");
val strongholdB = strongholdcorridor.getPool("Custom Weapons");
val strongcrossing = strongholdcrossing.getPool("main");
val stronglib = strongholdlibrary.getPool("main");
val blacksmith = villageblacksmith.getPool("main");
val blacksmithS = villageblacksmith.getPool("spartanweaponry_inject_pool");
val blacksmithB = villageblacksmith.getPool("Custom Weapons");
val mineshaft = abanMineshaft.getPool("pool1");
val mineshaftmain = abanMineshaft.getPool("main");
val pyramid = desertpyramid.getPool("main");
val jungle = jungletemple.getPool("main");
val nether = netherbridge.getPool("main");
val end = endcity.getPool("main");
val zomb = zombie.getPool("pool1");

    end.addItemEntry(<behgameon:ring_104>, 5);
    end.addItemEntry(<everlastingabilities:ability_bottle>, 4);
    end.addItemEntry(<lycanitesmobs:saddle_aberration>, 5);
    end.addItemEntry(<minecraft:elytra>, 2);
    end.addItemEntry(<metallurgy:eximite_axe>, 8);
    end.addItemEntry(<metallurgy:eximite_sword>, 8);
    end.addItemEntry(<minecraft:elytra>, 2);
    end.addItemEntry(<biomesoplenty:crystal_shard>, 20, 1, [{"count": {"min": 4.0, "max": 16.0}, "function": "minecraft:set_count"}], []);
    end.addItemEntry(<minecraft:purpur_block>, 20, 1, [{"count": {"min": 4.0, "max": 16.0}, "function": "minecraft:set_count"}], []);
    end.addItemEntry(<minecraft:end_bricks>, 20, 1, [{"count": {"min": 4.0, "max": 16.0}, "function": "minecraft:set_count"}], []);
    end.addItemEntry(<minecraft:end_rod>, 10, 1, [{"count": {"min": 1.0, "max": 4.0}, "function": "minecraft:set_count"}], []);
    end.addItemEntry(<minecraft:stained_glass:2>, 10, 1, [{"count": {"min": 4.0, "max": 16.0}, "function": "minecraft:set_count"}], []);
    end.addItemEntry(<minecraft:purpur_pillar>, 15, 1, [{"count": {"min": 4.0, "max": 16.0}, "function": "minecraft:set_count"}], []);
    end.addItemEntry(<minecraft:ender_pearl>, 10, 1, [{"count": {"min": 1.0, "max": 4.0}, "function": "minecraft:set_count"}], []);

val simDungeon = simple_dungeon.getPool("main");
val simDungeon1 = simple_dungeon.getPool("pool1");

val early_armor = [
    <minecraft:leather>,
    <metallurgy:tin_dust>,
    <metallurgy:manganese_dust>,
    <metallurgy:gold_dust>,
    <metallurgy:iron_dust>,
    <metallurgy:prometheum_dust>,
    <metallurgy:copper_dust>,
    <minecraft:slime_ball>
] as IItemStack[];

for basicM in early_armor {
    simDungeon.addItemEntry(basicM, 90, 1, [{"count": {"min": 1.0, "max": 4.0}, "function": "minecraft:set_count"}], []);
    mineshaft.addItemEntry(basicM, 50, 1, [{"count": {"min": 1.0, "max": 4.0}, "function": "minecraft:set_count"}], []);
    pyramid.addItemEntry(basicM, 50, 1, [{"count": {"min": 1.0, "max": 4.0}, "function": "minecraft:set_count"}], []);
    jungle.addItemEntry(basicM, 80, 1, [{"count": {"min": 1.0, "max": 4.0}, "function": "minecraft:set_count"}], []);
}
    simDungeon.addItemEntry(<loreexpansion:lore_scrap>.withTag({"lore": { "id": "Crit", "category": "Lost"}}), 40);
    mineshaft.addItemEntry(<loreexpansion:lore_scrap>.withTag({"lore": { "id": "Crit", "category": "Lost"}}), 10);
    pyramid.addItemEntry(<loreexpansion:lore_scrap>.withTag({"lore": { "id": "Crit", "category": "Lost"}}), 10);
    jungle.addItemEntry(<loreexpansion:lore_scrap>.withTag({"lore": { "id": "Crit", "category": "Lost"}}), 40);
    simDungeon.addItemEntry(<loreexpansion:lore_scrap>.withTag({"lore": { "id": "Class", "category": "Lost"}}), 40);
    mineshaft.addItemEntry(<loreexpansion:lore_scrap>.withTag({"lore": { "id": "Class", "category": "Lost"}}), 10);
    pyramid.addItemEntry(<loreexpansion:lore_scrap>.withTag({"lore": { "id": "Class", "category": "Lost"}}), 10);
    jungle.addItemEntry(<loreexpansion:lore_scrap>.withTag({"lore": { "id": "Class", "category": "Lost"}}), 40);
    simDungeon.addItemEntry(<minecraft:glass_bottle>, 100, 1, [{"count": {"min": 1.0, "max": 8.0}, "function": "minecraft:set_count"}], []);
    mineshaft.addItemEntry(<minecraft:glass_bottle>, 60, 1, [{"count": {"min": 1.0, "max": 8.0}, "function": "minecraft:set_count"}], []);
    pyramid.addItemEntry(<minecraft:glass_bottle>, 60, 1, [{"count": {"min": 1.0, "max": 8.0}, "function": "minecraft:set_count"}], []);
    jungle.addItemEntry(<minecraft:glass_bottle>, 100, 1, [{"count": {"min": 1.0, "max": 8.0}, "function": "minecraft:set_count"}], []);
    simDungeon.addItemEntry(<rustic:wildberries>, 80, 1, [{"count": {"min": 1.0, "max": 6.0}, "function": "minecraft:set_count"}], []);
    mineshaft.addItemEntry(<rustic:wildberries>, 40, 1, [{"count": {"min": 1.0, "max": 6.0}, "function": "minecraft:set_count"}], []);
    pyramid.addItemEntry(<rustic:wildberries>, 40, 1, [{"count": {"min": 1.0, "max": 6.0}, "function": "minecraft:set_count"}], []);
    jungle.addItemEntry(<rustic:wildberries>, 80, 1, [{"count": {"min": 1.0, "max": 6.0}, "function": "minecraft:set_count"}], []);
    simDungeon.addItemEntry(<biomesoplenty:mushroom:3>, 80, 1, [{"count": {"min": 1.0, "max": 6.0}, "function": "minecraft:set_count"}], []);
    mineshaft.addItemEntry(<biomesoplenty:mushroom:3>, 40, 1, [{"count": {"min": 1.0, "max": 6.0}, "function": "minecraft:set_count"}], []);
    pyramid.addItemEntry(<biomesoplenty:mushroom:3>, 40, 1, [{"count": {"min": 1.0, "max": 6.0}, "function": "minecraft:set_count"}], []);
    jungle.addItemEntry(<biomesoplenty:mushroom:3>, 80, 1, [{"count": {"min": 1.0, "max": 6.0}, "function": "minecraft:set_count"}], []);

val weapon10 = [
    <spartanweaponry:katana_wood>,
    <spartanweaponry:longsword_wood>,
    <spartanweaponry:club_wood>,
    <spartanweaponry:hammer_wood>,
    <spartanweaponry:warhammer_wood>,
    <spartanweaponry:rapier_wood>,
    <spartanweaponry:saber_wood>,
    <spartanweaponry:dagger_wood>,
    <spartanweaponry:greatsword_wood>,
    <spartanweaponry:battleaxe_wood>,
    <spartanweaponry:mace_wood>,
    <spartanweaponry:glaive_wood>,
    <spartanweaponry:staff>,
    <spartanweaponry:spear_wood>,
    <spartanweaponry:halberd_wood>,
    <spartanweaponry:pike_wood>,
    <spartanweaponry:lance_wood>,
    <spartanweaponry:throwing_knife_wood>,
    <spartanweaponry:longbow_wood>,
    <spartanweaponry:throwing_axe_wood>,
    <spartanweaponry:javelin_wood>,
    <spartanweaponry:boomerang_wood>,
    <spartanweaponry:caestus>
    ] as IItemStack[];

for weapons10 in weapon10 {
    simDungeon.addItemEntry(weapons10, 10);
}

val weapon5 = [
    <spartanweaponry:caestus_studded>,
    <spartanweaponry:arrow_explosive>,
    <spartanweaponry:arrow_diamond>,
    <spartanweaponry:bolt_diamond>,
    <spartanweaponry:katana_stone>,
    <spartanweaponry:longsword_stone>,
    <spartanweaponry:club_studded>,
    <spartanweaponry:hammer_stone>,
    <spartanweaponry:warhammer_stone>,
    <spartanweaponry:rapier_stone>,
    <spartanweaponry:saber_stone>,
    <spartanweaponry:dagger_stone>,
    <spartanweaponry:greatsword_stone>,
    <spartanweaponry:battleaxe_stone>,
    <spartanweaponry:mace_stone>,
    <spartanweaponry:glaive_stone>,
    <spartanweaponry:spear_stone>,
    <spartanweaponry:halberd_stone>,
    <spartanweaponry:pike_stone>,
    <spartanweaponry:lance_stone>,
    <spartanweaponry:throwing_knife_stone>,
    <spartanweaponry:throwing_axe_stone>,
    <spartanweaponry:javelin_stone>,
    <spartanweaponry:boomerang_stone>,
] as IItemStack[];

for weapons5 in weapon5 {
    simDungeon.addItemEntry(weapons5, 5, 1);
    blacksmith.addItemEntry(weapons5, 5, 1);
    stronghold.addItemEntry(weapons5, 5, 1);
    zomb.addItemEntry(weapons5, 2, 1);
}

val weapon60 = [
    <minecraft:arrow>,
    <spartanweaponry:arrow_iron>,
    <spartanweaponry:bolt>,
    <switchbow:arrowfire>,
    <switchbow:arrowair>,
    <switchbow:arrowfrost>,
    <switchbow:arrowbouncy>
] as IItemStack[];

for weapons60 in weapon60 {
    simDungeon.addItemEntry(weapons60, 60, 1, [{"count": {"min": 5.0, "max": 12.0}, "function": "minecraft:set_count"}], []);
}

val weapon50 = [
    <switchbow:arrowofthesearcher>,
    <switchbow:arrowunderwater>,
    <switchbow:arrowvampier>,
    <switchbow:arrowwither>,
    <switchbow:arrowsplit>,
    <switchbow:arrowknockback>,
    <switchbow:arrowprotector>,
    <switchbow:arrowredstone>
] as IItemStack[];

for weapons50 in weapon50 {
    simDungeon.addItemEntry(weapons50, 50, 1, [{"count": {"min": 5.0, "max": 12.0}, "function": "minecraft:set_count"}], []);
}

    simDungeon.addItemEntry(<spartanweaponry:arrow_wood>, 70, 1, [{"count": {"min": 5.0, "max": 32.0}, "function": "minecraft:set_count"}], []);

val weapon40 = [
    <switchbow:arrowtriple>,
    <switchbow:arrowburial>,
    <switchbow:arrowpiercing>,
    <switchbow:arrowbone>
] as IItemStack[];

for weapons40 in weapon40 {
    simDungeon.addItemEntry(weapons40, 40, 1, [{"count": {"min": 2.0, "max": 6.0}, "function": "minecraft:set_count"}], []);
}


//== midnight ==

val mid = midnight.getPool("midnight_treasure");
val midight = midnightJunk.getPool("midnight_junk");

val midlet = [
    <xat:dwarf_ring>,
    <xat:titan_ring>,
    <xat:goblin_ring>,
    <xat:elf_ring>,
    <xat:faelis_ring>
] as IItemStack[];

for midRing in midlet {
    mid.addItemEntry(midRing, 1);
}

val midLoot = [
    <srparasites:weapon_bow>,
    <srparasites:weapon_scythe>,
    <srparasites:weapon_axe>,
    <srparasites:weapon_sword>,
    <srparasites:weapon_cleaver>
] as IItemStack[];

for midTreasure in midLoot {
    midight.addItemEntry(midTreasure, 1);
}


//##################
//## Removed Loot ##
//##################

//== mod_lavacow ==

val skelingtonKing = LootTweaker.getTable("mod_lavacow:entities/bosses/skeleton_king");
val skelington = skelingtonKing.getPool("rare");
val tomb = LootTweaker.getTable("mod_lavacow:chests/desert_tomb_chest");
val deserttomb = tomb.getPool("main");
val cementery = LootTweaker.getTable("mod_lavacow:chests/cemetery_chest");
val cemeteryMain = cementery.getPool("main");
val mend = mujend.getPool("weapons");
val mnether = mujnether.getPool("weapons");
val mspawn = mujspawn.getPool("weapons");
val mstronghold = mujstronghold.getPool("weapons");
val mvillage = mujvillage.getPool("weapons");


    skelington.removeEntry("mod_lavacow:faminearmor_helmet");   
    skelington.removeEntry("mod_lavacow:faminearmor_chestplate"); 
    deserttomb.removeEntry("mod_lavacow:ectoplasm"); 
    cemeteryMain.removeEntry("mod_lavacow:ectoplasm"); 

//== vanilla ==

val noiron = [
    "minecraft:iron_chestplate",
    "minecraft:iron_leggings",
    "minecraft:iron_boots",
    "minecraft:iron_helmet"
] as string[];

val nodiamond = [
    "minecraft:diamond_chestplate",
    "minecraft:diamond_leggings",
    "minecraft:diamond_boots",
    "minecraft:diamond_helmet",
    "minecraft:diamond_sword",
    "minecraft:diamond_pickaxe",
    "minecraft:diamond_shovel"
] as string[];

for noirons in noiron {
    stronghold.removeEntry(noirons);
    blacksmith.removeEntry(noirons);
    end.removeEntry(noirons);
}

for nodiamonds in nodiamond {
    end.removeEntry(nodiamonds);
}

simDungeon1.removeEntry("minecraft:iron_ingot");
simDungeon.removeEntry("quark:rune");
simDungeon.removeEntry("quark:ancient_tome");

mineshaft.removeEntry("minecraft:diamond");
mineshaftmain.removeEntry("minecraft:iron_pickaxe");

pyramid.removeEntry("minecraft:diamond");
pyramid.removeEntry("minecraft:iron_ingot");
pyramid.removeEntry("quark:rune");

end.removeEntry("minecraft:diamond");
end.removeEntry("minecraft:iron_pickaxe");
end.removeEntry("minecraft:iron_sword");
end.removeEntry("minecraft:iron_shovel");
end.removeEntry("minecraft:iron_ingot");
end.removeEntry("minecraft:emerald");
end.removeEntry("minecraft:gold_ingot");
end.removeEntry("minecraft:beetroot_seeds");
end.removeEntry("minecraft:saddle");
end.removeEntry("minecraft:golden_horse_armor");

jungle.removeEntry("minecraft:diamond");
jungle.removeEntry("minecraft:iron_ingot");
jungle.removeEntry("quark:rune");

nether.removeEntry("minecraft:diamond");
nether.removeEntry("minecraft:iron_ingot");
nether.removeEntry("quark:rune");

stronghold.removeEntry("minecraft:diamond");
stronghold.removeEntry("minecraft:iron_ingot");
stronghold.removeEntry("minecraft:iron_pickaxe");
stronghold.removeEntry("minecraft:iron_sword");
strongholdB.removeEntry("Custom Weapons");

strongcrossing.removeEntry("minecraft:iron_ingot");
strongcrossing.removeEntry("minecraft:iron_pickaxe");

stronglib.removeEntry("quark:ancient_tome");

blacksmith.removeEntry("minecraft:diamond");
blacksmith.removeEntry("minecraft:iron_pickaxe");
blacksmith.removeEntry("minecraft:iron_sword");
blacksmithS.removeEntry("spartanweaponry_inject_entry");
blacksmithB.removeEntry("Custom Weapons");

val endweapons = [
    "mujmajnkraftsbettersurvival:itemdiamonddagger",
    "mujmajnkraftsbettersurvival:itemdiamondnunchaku",
    "mujmajnkraftsbettersurvival:itemdiamondhammer",
    "mujmajnkraftsbettersurvival:itemdiamondbattleaxe",
    "mujmajnkraftsbettersurvival:itemdiamondspear",
    "mujmajnkraftsbettersurvival:itemirondagger",
    "mujmajnkraftsbettersurvival:itemironnunchaku",
    "mujmajnkraftsbettersurvival:itemironhammer",
    "mujmajnkraftsbettersurvival:itemironbattleaxe",
    "mujmajnkraftsbettersurvival:itemironspear"
] as string[];

for eweapons in endweapons {
    mend.removeEntry(eweapons);
}

val netherweapons = [
    "mujmajnkraftsbettersurvival:itemgolddagger",
    "mujmajnkraftsbettersurvival:itemgoldhammer",
    "mujmajnkraftsbettersurvival:itemgoldbattleaxe",
    "mujmajnkraftsbettersurvival:itemgoldspear"
] as string[];

for nweapons in netherweapons {
    mnether.removeEntry(nweapons);
}

val spawnweapons = [
    "mujmajnkraftsbettersurvival:itemwoodspear",
    "mujmajnkraftsbettersurvival:itemstonespear",
    "mujmajnkraftsbettersurvival:itemwooddagger",
    "mujmajnkraftsbettersurvival:itemstonedagger"
] as string[];

for sweapons in spawnweapons {
    mspawn.removeEntry(sweapons);
}

val strongholdweapons = [
    "mujmajnkraftsbettersurvival:itemirondagger",
    "mujmajnkraftsbettersurvival:itemironnunchaku",
    "mujmajnkraftsbettersurvival:itemironhammer",
    "mujmajnkraftsbettersurvival:itemironbattleaxe",
    "mujmajnkraftsbettersurvival:itemironspear"
] as string[];

for stweapons in strongholdweapons {
    mstronghold.removeEntry(stweapons);
}

val villageweapons = [
    "mujmajnkraftsbettersurvival:itemirondagger",
    "mujmajnkraftsbettersurvival:itemironnunchaku",
    "mujmajnkraftsbettersurvival:itemironhammer",
    "mujmajnkraftsbettersurvival:itemironbattleaxe",
    "mujmajnkraftsbettersurvival:itemironspear"
] as string[];

for vweapons in villageweapons {
    mvillage.removeEntry(vweapons);
}

//== ebwizardry ==

val ebuartifact = LootTweaker.getTable("ebwizardry:subsets/uncommon_artefacts");
val ebrartifact = LootTweaker.getTable("ebwizardry:subsets/rare_artefacts");
val ebeartifact = LootTweaker.getTable("ebwizardry:subsets/epic_artefacts");

val uArtifact = ebuartifact.getPool("uncommon_artefacts");
val rArtifact = ebrartifact.getPool("rare_artefacts");
val eArtifact = ebeartifact.getPool("epic_artefacts");

val tome = tomes.getPool("tomes");

val ebdungeon = LootTweaker.getTable("ebwizardry:chests/dungeon_additions");

val ebRemove = ebdungeon.getPool("wizardry");

    ebRemove.removeEntry("ebwizardry:subsets/wizard_armour");

val uArt = [
    "ebwizardry:amulet_recovery",
    "ebwizardry:charm_minion_variants",
    "ebwizardry:charm_minion_health",
    "ebwizardry:ring_fire_melee",
    "ebwizardry:ring_fire_biome"
] as string[];

for uArts in uArt {
    uArtifact.removeEntry(uArts);
}

val rArt = [
    "ebwizardry:amulet_arcane_defence",
    "ebwizardry:ring_disintegration",
    "ebwizardry:charm_hunger_casting",
    "ebwizardry:amulet_fire_cloaking"
] as string[];

for rArts in rArt {
    rArtifact.removeEntry(rArts);
}

val eArt = [
    "ebwizardry:amulet_wither_immunity",
    "ebwizardry:ring_combustion",
    "ebwizardry:charm_lava_walking"
] as string[];

for eArts in eArt {
    eArtifact.removeEntry(eArts);
}

    tome.removeEntry("apprentice_tome");
    tome.removeEntry("advanced_tome");
    tome.removeEntry("master_tome");

//== behgameon ==

val dungeonTable = LootTweaker.getTable("behgameon:inject/main_loot");

val dungeon = dungeonTable.getPool("main");

val DArray = [
    "behgameon:accessory_1",
    "behgameon:accessory_2",
    "behgameon:accessory_3",
    "behgameon:accessory_4",
    "behgameon:accessory_5",
    "behgameon:accessory_6",
    "behgameon:accessory_7",
    "behgameon:accessory_8",
    "behgameon:accessory_9",
    "behgameon:accessory_10",
    "behgameon:accessory_11",
    "behgameon:accessory_12",
    "behgameon:accessory_13",
    "behgameon:accessory_14",
    "behgameon:accessory_15",
    "behgameon:accessory_16",
    "behgameon:accessory_17",
    "behgameon:accessory_18",
    "behgameon:accessory_19",
    "behgameon:accessory_20",
    "behgameon:accessory_21",
    "behgameon:accessory_22",
    "behgameon:accessory_23",
    "behgameon:accessory_24",
    "behgameon:accessory_25",
    "behgameon:accessory_26",
    "behgameon:accessory_27",
    "behgameon:accessory_28",
    "behgameon:accessory_29",
    "behgameon:accessory_30",
    "behgameon:accessory_31",
    "behgameon:accessory_32",
    "behgameon:accessory_33",
    "behgameon:accessory_34",
    "behgameon:accessory_35",
    "behgameon:accessory_36",
    "behgameon:accessory_37",
    "behgameon:accessory_38",
    "behgameon:accessory_39",
    "behgameon:accessory_40",
    "behgameon:accessory_41",
    "behgameon:accessory_42",
    "behgameon:accessory_43",
    "behgameon:accessory_44",
    "behgameon:accessory_45",
    "behgameon:accessory_46",
    "behgameon:accessory_47",
    "behgameon:accessory_48",
    "behgameon:accessory_49",
    "behgameon:accessory_50",
    "behgameon:accessory_51",
    "behgameon:accessory_52",
    "behgameon:accessory_53",
    "behgameon:accessory_54",
    "behgameon:accessory_55",
    "behgameon:accessory_56",
    "behgameon:ring_1",
    "behgameon:ring_2",
    "behgameon:ring_3",
    "behgameon:ring_4",
    "behgameon:ring_5",
    "behgameon:ring_6",
    "behgameon:ring_7",
    "behgameon:ring_8",
    "behgameon:ring_9",
    "behgameon:ring_10",
    "behgameon:ring_11",
    "behgameon:ring_12",
    "behgameon:ring_13",
    "behgameon:ring_14",
    "behgameon:ring_15",
    "behgameon:ring_16",
    "behgameon:ring_17",
    "behgameon:ring_18",
    "behgameon:ring_19",
    "behgameon:ring_20",
    "behgameon:ring_21",
    "behgameon:ring_22",
    "behgameon:ring_23",
    "behgameon:ring_24",
    "behgameon:ring_25",
    "behgameon:ring_26",
    "behgameon:ring_27",
    "behgameon:ring_28",
    "behgameon:ring_29",
    "behgameon:ring_30",
    "behgameon:ring_31",
    "behgameon:ring_32",
    "behgameon:ring_33",
    "behgameon:ring_34",
    "behgameon:ring_35",
    "behgameon:ring_36",
    "behgameon:ring_37",
    "behgameon:ring_38",
    "behgameon:ring_39",
    "behgameon:ring_40",
    "behgameon:ring_41",
    "behgameon:ring_42",
    "behgameon:ring_43",
    "behgameon:ring_44",
    "behgameon:ring_45",
    "behgameon:ring_46",
    "behgameon:ring_47",
    "behgameon:ring_48",
    "behgameon:ring_49",
    "behgameon:ring_50",
    "behgameon:ring_51",
    "behgameon:ring_52",
    "behgameon:ring_53",
    "behgameon:ring_54",
    "behgameon:ring_55",
    "behgameon:ring_56",
    "behgameon:ring_57",
    "behgameon:ring_58",
    "behgameon:ring_59",
    "behgameon:ring_60",
    "behgameon:ring_61",
    "behgameon:ring_62",
    "behgameon:ring_63",
    "behgameon:ring_64",
    "behgameon:ring_65",
    "behgameon:ring_66",
    "behgameon:ring_67",
    "behgameon:ring_68",
    "behgameon:ring_69",
    "behgameon:ring_70",
    "behgameon:ring_71",
    "behgameon:ring_72",
    "behgameon:ring_73",
    "behgameon:ring_74",
    "behgameon:ring_75",
    "behgameon:ring_76",
    "behgameon:ring_77",
    "behgameon:ring_78",
    "behgameon:ring_79",
    "behgameon:ring_80",
    "behgameon:ring_81",
    "behgameon:ring_82",
    "behgameon:ring_83",
    "behgameon:ring_84",
    "behgameon:ring_85",
    "behgameon:ring_86",
    "behgameon:ring_87",
    "behgameon:ring_88",
    "behgameon:ring_89",
    "behgameon:ring_90",
    "behgameon:ring_91",
    "behgameon:ring_92",
    "behgameon:ring_93",
    "behgameon:ring_94",
    "behgameon:ring_95",
    "behgameon:ring_96",
    "behgameon:ring_97",
    "behgameon:ring_98",
    "behgameon:ring_99",
    "behgameon:ring_100",
    "behgameon:ring_101",
    "behgameon:ring_102",
    "behgameon:ring_103",
    "behgameon:ring_104",
    "behgameon:ring_105",
    "behgameon:ring_106"  
] as string[];

for item in DArray{
     dungeon.removeEntry(item);
}

//Custom Tables

val deep_caverns = LootTweaker.newTable("cataclysmus:deep_caverns");
val dc_main = deep_caverns.addPool("main", 6, 8, 1, 2);

dc_main.addItemEntry(<quark:rune>, 4, 1, [{"data": {"min": 0.0, "max": 15.0}, "function": "minecraft:set_data"}], []);
dc_main.addItemEntry(<quark:ancient_tome>, 4, 1, [{"function": "quark:enchant_tome"}], []);
dc_main.addItemEntry(<minecraft:rotten_flesh>, 3, 1, [{"count": {"min": 3.0, "max": 64.0}, "function": "minecraft:set_count"}], []);
dc_main.addItemEntry(<minecraft:web>, 5, 1, [{"count": {"min": 1.0, "max": 32.0}, "function": "minecraft:set_count"}], []);
dc_main.addItemEntry(<lycanitesmobs:quickweb>, 4, 1, [{"count": {"min": 1.0, "max": 32.0}, "function": "minecraft:set_count"}], []);
dc_main.addItemEntry(<lycanitesmobs:frostweb>, 4, 1, [{"count": {"min": 1.0, "max": 32.0}, "function": "minecraft:set_count"}], []);
dc_main.addItemEntry(<minecraft:obsidian>, 2, 1, [{"count": {"min": 1.0, "max": 3.0}, "function": "minecraft:set_count"}], []);
dc_main.addItemEntry(<minecraft:magma>, 2, 1, [{"count": {"min": 1.0, "max": 6.0}, "function": "minecraft:set_count"}], []);
dc_main.addItemEntry(<scalinghealth:crystalshard>, 2, 1, [{"count": {"min": 1.0, "max": 6.0}, "function": "minecraft:set_count"}], []);
dc_main.addItemEntry(<ebwizardry:crystal_shard>, 4, 1, [{"count": {"min": 3.0, "max": 9.0}, "function": "minecraft:set_count"}], []);
dc_main.addItemEntry(<ebwizardry:magic_crystal>, 3, 1, [{"count": {"min": 1.0, "max": 12.0}, "function": "minecraft:set_count"}], []);
dc_main.addItemEntry(<ebwizardry:grand_crystal>, 2);
dc_main.addItemEntry(<quark:crystal>, 3, 1, [{"count": {"min": 1.0, "max": 6.0}, "function": "minecraft:set_count"}, {"data": {"min": 0.0, "max": 8.0}, "function": "minecraft:set_data"}], []);
dc_main.addItemEntry(<lycanitesmobs:summoningstaff>, 2);
dc_main.addItemEntry(<tombstone:book_of_repairing>, 2);
dc_main.addItemEntry(<tombstone:book_of_disenchantment>, 2);
dc_main.addItemEntry(<cqrepoured:hookshot>.withTag({isShooting: 0 as byte}), 1);

val deep_caverns_lycanites = LootTweaker.newTable("cataclysmus:deep_caverns_lycanites");
val dcl_main = deep_caverns_lycanites.addPool("main", 3, 4, 1, 2);

dcl_main.addItemEntry(<lycanitesmobs:saddle_aquatic>, 1);
dcl_main.addItemEntry(<minecraft:potion>.withTag({Potion: "potioncraft:depth_strider_strong"}), 1);
dcl_main.addItemEntry(<tombstone:fishing_rod_of_misadventure>.withTag({enchant: 1 as byte}), 1);
dcl_main.addItemEntry(<minecraft:potion>.withTag({Potion: "potioncraft:depth_strider_long"}), 2);
dcl_main.addItemEntry(<minecraft:potion>.withTag({Potion: "minecraft:water_breathing"}), 3);
dcl_main.addItemEntry(<minecraft:fish:2>, 3, 1, [{"count": {"min": 1.0, "max": 32.0}, "function": "minecraft:set_count"}], []);
dcl_main.addItemEntry(<minecraft:fish:1>, 3, 1, [{"count": {"min": 1.0, "max": 32.0}, "function": "minecraft:set_count"}], []);
dcl_main.addItemEntry(<minecraft:fish:3>, 3, 1, [{"count": {"min": 1.0, "max": 32.0}, "function": "minecraft:set_count"}], []);
dcl_main.addItemEntry(<minecraft:fish>, 3, 1, [{"count": {"min": 1.0, "max": 32.0}, "function": "minecraft:set_count"}], []);
dcl_main.addItemEntry(<switchbow:arrowunderwater>, 3, 1, [{"count": {"min": 1.0, "max": 64.0}, "function": "minecraft:set_count"}], []);
dcl_main.addItemEntry(<tombstone:scroll_buff:8>.withTag({enchant: 1 as byte}), 1);
dcl_main.addItemEntry(<biomesoplenty:coral>, 4, 1, [{"count": {"min": 1.0, "max": 32.0}, "function": "minecraft:set_count"}], []);
dcl_main.addItemEntry(<biomesoplenty:coral:2>, 4, 1, [{"count": {"min": 1.0, "max": 32.0}, "function": "minecraft:set_count"}], []);
dcl_main.addItemEntry(<biomesoplenty:coral:1>, 4, 1, [{"count": {"min": 1.0, "max": 32.0}, "function": "minecraft:set_count"}], []);
dcl_main.addItemEntry(<biomesoplenty:coral:3>, 4, 1, [{"count": {"min": 1.0, "max": 32.0}, "function": "minecraft:set_count"}], []);
dcl_main.addItemEntry(<biomesoplenty:coral:4>, 5, 1, [{"count": {"min": 1.0, "max": 32.0}, "function": "minecraft:set_count"}], []);
dcl_main.addItemEntry(<biomesoplenty:seaweed>, 6, 1, [{"count": {"min": 1.0, "max": 32.0}, "function": "minecraft:set_count"}], []);
dcl_main.addItemEntry(<minecraft:enchanted_book>.withTag({StoredEnchantments: [{lvl: 1 as short, id: 8 as short}]}), 3);
dcl_main.addItemEntry(<minecraft:enchanted_book>.withTag({StoredEnchantments: [{lvl: 1 as short, id: 5 as short}]}), 3);
dcl_main.addItemEntry(<minecraft:enchanted_book>.withTag({StoredEnchantments: [{lvl: 1 as short, id: 61 as short}]}), 3);
dcl_main.addItemEntry(<minecraft:enchanted_book>.withTag({StoredEnchantments: [{lvl: 1 as short, id: 62 as short}]}), 3);
dcl_main.addItemEntry(<minecraft:enchanted_book>.withTag({StoredEnchantments: [{lvl: 2 as short, id: 8 as short}]}), 2);
dcl_main.addItemEntry(<minecraft:enchanted_book>.withTag({StoredEnchantments: [{lvl: 1 as short, id: 6 as short}]}), 2);
dcl_main.addItemEntry(<minecraft:enchanted_book>.withTag({StoredEnchantments: [{lvl: 2 as short, id: 5 as short}]}), 2);
dcl_main.addItemEntry(<minecraft:enchanted_book>.withTag({StoredEnchantments: [{lvl: 1 as short, id: 102 as short}]}), 2);
dcl_main.addItemEntry(<minecraft:enchanted_book>.withTag({StoredEnchantments: [{lvl: 2 as short, id: 61 as short}]}), 2);
dcl_main.addItemEntry(<minecraft:enchanted_book>.withTag({StoredEnchantments: [{lvl: 2 as short, id: 62 as short}]}), 2);

val nether_dungeon = LootTweaker.newTable("cataclysmus:nether");
val nether_main = nether_dungeon.addPool("main", 3, 4, 1, 2);

nether_main.addItemEntry(<xat:dwarf_ring>, 1);
nether_main.addItemEntry(<xat:titan_ring>, 1);
nether_main.addItemEntry(<xat:goblin_ring>, 1);
nether_main.addItemEntry(<xat:elf_ring>, 1);
nether_main.addItemEntry(<xat:faelis_ring>, 1);
nether_main.addItemEntry(<metallurgy:flint_and_vulcanite>, 1);
nether_main.addItemEntry(<forge:bucketfilled>.withTag({FluidName: "blood", Amount: 1000}), 1);
nether_main.addItemEntry(<metallurgy:flint_and_ignatius>, 2);
nether_main.addItemEntry(<biomesoplenty:flesh>, 2, 1, [{"count": {"min": 1.0, "max": 32.0}, "function": "minecraft:set_count"}], []);
nether_main.addItemEntry(<biomesoplenty:fleshchunk>, 3, 1, [{"count": {"min": 1.0, "max": 32.0}, "function": "minecraft:set_count"}], []);
nether_main.addItemEntry(<metallurgy:ignatius_dust>, 2, 1, [{"count": {"min": 1.0, "max": 4.0}, "function": "minecraft:set_count"}], []);
nether_main.addItemEntry(<metallurgy:vulcanite_dust>, 2, 1, [{"count": {"min": 1.0, "max": 4.0}, "function": "minecraft:set_count"}], []);
nether_main.addItemEntry(<metallurgy:kalendrite_dust>, 2, 1, [{"count": {"min": 1.0, "max": 4.0}, "function": "minecraft:set_count"}], []);
nether_main.addItemEntry(<metallurgy:midasium_dust>, 2, 1, [{"count": {"min": 1.0, "max": 4.0}, "function": "minecraft:set_count"}], []);
nether_main.addItemEntry(<spartanweaponry:arrow_explosive>, 1, 1, [{"count": {"min": 1.0, "max": 64.0}, "function": "minecraft:set_count"}], []);
nether_main.addItemEntry(<switchbow:arrowfireupgrade>, 1, 1, [{"count": {"min": 1.0, "max": 64.0}, "function": "minecraft:set_count"}], []);
nether_main.addItemEntry(<spartanweaponry:bolt_spectral>, 3, 1, [{"count": {"min": 1.0, "max": 64.0}, "function": "minecraft:set_count"}], []);
nether_main.addItemEntry(<minecraft:spectral_arrow>, 3, 1, [{"count": {"min": 1.0, "max": 64.0}, "function": "minecraft:set_count"}], []);
nether_main.addItemEntry(<switchbow:arrowfire>, 4, 1, [{"count": {"min": 1.0, "max": 64.0}, "function": "minecraft:set_count"}], []);
nether_main.addItemEntry(<minecraft:enchanted_book>.withTag({StoredEnchantments: [{lvl: 1 as short, id: 1 as short}]}), 4);
nether_main.addItemEntry(<minecraft:enchanted_book>.withTag({StoredEnchantments: [{lvl: 2 as short, id: 1 as short}]}), 3);
nether_main.addItemEntry(<minecraft:enchanted_book>.withTag({StoredEnchantments: [{lvl: 3 as short, id: 1 as short}]}), 2);
nether_main.addItemEntry(<minecraft:enchanted_book>.withTag({StoredEnchantments: [{lvl: 1 as short, id: 14 as short}]}), 5);
nether_main.addItemEntry(<minecraft:enchanted_book>.withTag({StoredEnchantments: [{lvl: 2 as short, id: 14 as short}]}), 4);
nether_main.addItemEntry(<minecraft:enchanted_book>.withTag({StoredEnchantments: [{lvl: 3 as short, id: 14 as short}]}), 3);
nether_main.addItemEntry(<minecraft:enchanted_book>.withTag({StoredEnchantments: [{lvl: 4 as short, id: 14 as short}]}), 2);
nether_main.addItemEntry(<minecraft:enchanted_book>.withTag({StoredEnchantments: [{lvl: 1 as short, id: 20 as short}]}), 2);
nether_main.addItemEntry(<minecraft:enchanted_book>.withTag({StoredEnchantments: [{lvl: 1 as short, id: 69 as short}]}), 2);
nether_main.addItemEntry(<minecraft:enchanted_book>.withTag({StoredEnchantments: [{lvl: 1 as short, id: 50 as short}]}), 2);
nether_main.addItemEntry(<minecraft:enchanted_book>.withTag({StoredEnchantments: [{lvl: 1 as short, id: 130 as short}]}), 2);
nether_main.addItemEntry(<minecraft:enchanted_book>.withTag({StoredEnchantments: [{lvl: 1 as short, id: 100 as short}]}), 2);
nether_main.addItemEntry(<minecraft:enchanted_book>.withTag({StoredEnchantments: [{lvl: 1 as short, id: 73 as short}]}), 3);
nether_main.addItemEntry(<minecraft:enchanted_book>.withTag({StoredEnchantments: [{lvl: 2 as short, id: 73 as short}]}), 2);
nether_main.addItemEntry(<metallurgy:vulcanite_sword>, 3);
nether_main.addItemEntry(<metallurgy:ignatius_sword>, 3);
nether_main.addItemEntry(<metallurgy:desichalkos_sword>, 3);
nether_main.addItemEntry(<metallurgy:carmot_sword>, 3);
nether_main.addItemEntry(<metallurgy:electrum_sword>, 3);
nether_main.addItemEntry(<metallurgy:oureclase_sword>, 3);
nether_main.addItemEntry(<metallurgy:midasium_sword>, 3);
nether_main.addItemEntry(<metallurgy:sanguinite_sword>, 3);
nether_main.addItemEntry(<lycanitesmobs:saddle_demon>, 1);

val end_dungeon = LootTweaker.newTable("cataclysmus:end");
val end_main = end_dungeon.addPool("main", 6, 8, 2, 4);

end_main.addItemEntry(<everlastingabilities:ability_totem>.withTag({"everlastingabilities:abilityStoreStack": [{level: 3, name: "ability.abilities.everlastingabilities.luck.name"}]}), 1);
end_main.addItemEntry(<everlastingabilities:ability_totem>.withTag({"everlastingabilities:abilityStoreStack": [{level: 2, name: "ability.abilities.everlastingabilities.luck.name"}]}), 2);
end_main.addItemEntry(<everlastingabilities:ability_totem>.withTag({"everlastingabilities:abilityStoreStack": [{level: 1, name: "ability.abilities.everlastingabilities.luck.name"}]}), 3);
end_main.addItemEntry(<everlastingabilities:ability_totem>.withTag({"everlastingabilities:abilityStoreStack": [{level: 1, name: "ability.abilities.everlastingabilities.haste.name"}]}), 1);
end_main.addItemEntry(<everlastingabilities:ability_totem>.withTag({"everlastingabilities:abilityStoreStack": [{level: 1, name: "ability.abilities.everlastingabilities.bless.name"}]}), 1);
end_main.addItemEntry(<everlastingabilities:ability_totem>.withTag({"everlastingabilities:abilityStoreStack": [{level: 2, name: "ability.abilities.everlastingabilities.power_stare.name"}]}), 1);
end_main.addItemEntry(<everlastingabilities:ability_totem>.withTag({"everlastingabilities:abilityStoreStack": [{level: 1, name: "ability.abilities.everlastingabilities.power_stare.name"}]}), 2);
end_main.addItemEntry(<everlastingabilities:ability_totem>.withTag({"everlastingabilities:abilityStoreStack": [{level: 1, name: "ability.abilities.everlastingabilities.slowness.name"}]}), 1);
end_main.addItemEntry(<everlastingabilities:ability_totem>.withTag({"everlastingabilities:abilityStoreStack": [{level: 2, name: "ability.abilities.everlastingabilities.rust.name"}]}), 1);
end_main.addItemEntry(<everlastingabilities:ability_totem>.withTag({"everlastingabilities:abilityStoreStack": [{level: 1, name: "ability.abilities.everlastingabilities.rust.name"}]}), 2);
end_main.addItemEntry(<everlastingabilities:ability_totem>.withTag({"everlastingabilities:abilityStoreStack": [{level: 2, name: "ability.abilities.everlastingabilities.diamond_skin.name"}]}), 1);
end_main.addItemEntry(<everlastingabilities:ability_totem>.withTag({"everlastingabilities:abilityStoreStack": [{level: 1, name: "ability.abilities.everlastingabilities.diamond_skin.name"}]}), 2);
end_main.addItemEntry(<everlastingabilities:ability_totem>.withTag({"everlastingabilities:abilityStoreStack": [{level: 2, name: "ability.abilities.everlastingabilities.iron_skin.name"}]}), 1);
end_main.addItemEntry(<everlastingabilities:ability_totem>.withTag({"everlastingabilities:abilityStoreStack": [{level: 1, name: "ability.abilities.everlastingabilities.iron_skin.name"}]}), 2);
end_main.addItemEntry(<everlastingabilities:ability_totem>.withTag({"everlastingabilities:abilityStoreStack": [{level: 5, name: "ability.abilities.everlastingabilities.recoil.name"}]}), 1);
end_main.addItemEntry(<everlastingabilities:ability_totem>.withTag({"everlastingabilities:abilityStoreStack": [{level: 4, name: "ability.abilities.everlastingabilities.recoil.name"}]}), 2);
end_main.addItemEntry(<everlastingabilities:ability_totem>.withTag({"everlastingabilities:abilityStoreStack": [{level: 3, name: "ability.abilities.everlastingabilities.recoil.name"}]}), 2);
end_main.addItemEntry(<everlastingabilities:ability_totem>.withTag({"everlastingabilities:abilityStoreStack": [{level: 2, name: "ability.abilities.everlastingabilities.recoil.name"}]}), 3);
end_main.addItemEntry(<everlastingabilities:ability_totem>.withTag({"everlastingabilities:abilityStoreStack": [{level: 1, name: "ability.abilities.everlastingabilities.recoil.name"}]}), 3);
end_main.addItemEntry(<everlastingabilities:ability_totem>.withTag({"everlastingabilities:abilityStoreStack": [{level: 2, name: "ability.abilities.everlastingabilities.curse.name"}]}), 1);
end_main.addItemEntry(<everlastingabilities:ability_totem>.withTag({"everlastingabilities:abilityStoreStack": [{level: 1, name: "ability.abilities.everlastingabilities.curse.name"}]}), 2);
end_main.addItemEntry(<minecraft:chorus_fruit>, 4, 1, [{"count": {"min": 1.0, "max": 64.0}, "function": "minecraft:set_count"}], []);
end_main.addItemEntry(<minecraft:chorus_fruit_popped>, 3, 1, [{"count": {"min": 1.0, "max": 64.0}, "function": "minecraft:set_count"}], []);
end_main.addItemEntry(<stygian:endtallgrass>, 5, 1, [{"count": {"min": 1.0, "max": 64.0}, "function": "minecraft:set_count"}], []);
end_main.addItemEntry(<stygian:endvine>, 4, 1, [{"count": {"min": 1.0, "max": 64.0}, "function": "minecraft:set_count"}], []);
end_main.addItemEntry(<stygian:endleaves>, 5, 1, [{"count": {"min": 1.0, "max": 64.0}, "function": "minecraft:set_count"}], []);
end_main.addItemEntry(<minecraft:enchanted_book>.withTag({StoredEnchantments: [{lvl: 1 as short, id: 74 as short}]}), 3);
end_main.addItemEntry(<minecraft:enchanted_book>.withTag({StoredEnchantments: [{lvl: 2 as short, id: 74 as short}]}), 2);    
end_main.addItemEntry(<minecraft:enchanted_book>.withTag({StoredEnchantments: [{lvl: 1 as short, id: 26 as short}]}), 4);
end_main.addItemEntry(<minecraft:enchanted_book>.withTag({StoredEnchantments: [{lvl: 2 as short, id: 26 as short}]}), 3);
end_main.addItemEntry(<minecraft:enchanted_book>.withTag({StoredEnchantments: [{lvl: 3 as short, id: 26 as short}]}), 2);
end_main.addItemEntry(<minecraft:enchanted_book>.withTag({StoredEnchantments: [{lvl: 1 as short, id: 75 as short}]}), 2);
end_main.addItemEntry(<minecraft:enchanted_book>.withTag({StoredEnchantments: [{lvl: 1 as short, id: 43 as short}]}), 2);
end_main.addItemEntry(<metallurgy:atlarus_sword>, 2);
end_main.addItemEntry(<metallurgy:astral_silver_sword>, 2);
end_main.addItemEntry(<metallurgy:sanguinite_sword>, 2);
end_main.addItemEntry(<metallurgy:eximite_sword>, 2);
end_main.addItemEntry(<metallurgy:celenegil_sword>, 2);
end_main.addItemEntry(<metallurgy:shadow_iron_sword>, 2);
end_main.addItemEntry(<mod_lavacow:reapers_scythe>, 1);
end_main.addItemEntry(<mod_lavacow:skeletonking_mace>, 1);
end_main.addItemEntry(<mod_lavacow:beast_claw>, 2);
end_main.addItemEntry(<minecraft:end_stone>, 5, 1, [{"count": {"min": 1.0, "max": 64.0}, "function": "minecraft:set_count"}], []);
end_main.addItemEntry(<switchbow:arrowenderperle>, 3, 1, [{"count": {"min": 1.0, "max": 64.0}, "function": "minecraft:set_count"}], []);

val midnight_dungeon = LootTweaker.newTable("cataclysmus:midnight");
val midnight_main = midnight_dungeon.addPool("main", 6, 8, 2, 4);

midnight_main.addItemEntry(<lycanitesmobs:saddle_dragon>, 6);
midnight_main.addItemEntry(<srparasites:weapon_bow>, 1);
midnight_main.addItemEntry(<srparasites:weapon_scythe>, 1);
midnight_main.addItemEntry(<srparasites:weapon_axe>, 1);
midnight_main.addItemEntry(<srparasites:weapon_sword>, 1);
midnight_main.addItemEntry(<srparasites:weapon_cleaver>, 1);
midnight_main.addItemEntry(<srparasites:weapon_lance>, 1);
midnight_main.addItemEntry(<srparasites:weapon_maul>, 1);
midnight_main.addItemEntry(<metallurgy:shadow_steel_sword>, 6);
midnight_main.addItemEntry(<metallurgy:black_steel_sword>, 6);
midnight_main.addItemEntry(<midnight:tenebrum_sword>, 6);
midnight_main.addItemEntry(<midnight:nightstone_sword>, 6);
midnight_main.addItemEntry(<midnight:shadowroot_sword>, 6);
midnight_main.addItemEntry(<midnight:nagrilite_sword>, 6);
midnight_main.addItemEntry(<midnight:ebonys_sword>, 6);
midnight_main.addItemEntry(<midnight:raw_suavis>, 8, 1, [{"count": {"min": 1.0, "max": 64.0}, "function": "minecraft:set_count"}], []);
midnight_main.addItemEntry(<midnight:unstable_fruit_blue>, 8, 1, [{"count": {"min": 1.0, "max": 64.0}, "function": "minecraft:set_count"}], []);
midnight_main.addItemEntry(<midnight:unstable_fruit_lime>, 8, 1, [{"count": {"min": 1.0, "max": 64.0}, "function": "minecraft:set_count"}], []);
midnight_main.addItemEntry(<midnight:unstable_fruit_green>, 8, 1, [{"count": {"min": 1.0, "max": 64.0}, "function": "minecraft:set_count"}], []);
midnight_main.addItemEntry(<midnight:raw_stag_flank>, 8, 1, [{"count": {"min": 1.0, "max": 64.0}, "function": "minecraft:set_count"}], []);
midnight_main.addItemEntry(<midnight:deceitful_snapper>, 8, 1, [{"count": {"min": 1.0, "max": 64.0}, "function": "minecraft:set_count"}], []);
midnight_main.addItemEntry(<midnight:midnight_grass>, 9, 1, [{"count": {"min": 1.0, "max": 64.0}, "function": "minecraft:set_count"}], []);
midnight_main.addItemEntry(<midnight:tall_midnight_grass>, 8, 1, [{"count": {"min": 1.0, "max": 64.0}, "function": "minecraft:set_count"}], []);
midnight_main.addItemEntry(<switchbow:arrowofthesearcher>, 3, 1, [{"count": {"min": 1.0, "max": 12.0}, "function": "minecraft:set_count"}], []);
midnight_main.addItemEntry(<minecraft:enchanted_book>.withTag({StoredEnchantments: [{lvl: 1 as short, id: 76 as short}]}), 4);
midnight_main.addItemEntry(<minecraft:enchanted_book>.withTag({StoredEnchantments: [{lvl: 2 as short, id: 76 as short}]}), 3);
midnight_main.addItemEntry(<minecraft:enchanted_book>.withTag({StoredEnchantments: [{lvl: 3 as short, id: 76 as short}]}), 2);
midnight_main.addItemEntry(<minecraft:enchanted_book>.withTag({StoredEnchantments: [{lvl: 1 as short, id: 77 as short}]}), 5);
midnight_main.addItemEntry(<minecraft:enchanted_book>.withTag({StoredEnchantments: [{lvl: 2 as short, id: 77 as short}]}), 4);
midnight_main.addItemEntry(<minecraft:enchanted_book>.withTag({StoredEnchantments: [{lvl: 3 as short, id: 77 as short}]}), 3);
midnight_main.addItemEntry(<minecraft:enchanted_book>.withTag({StoredEnchantments: [{lvl: 4 as short, id: 77 as short}]}), 2);
midnight_main.addItemEntry(<minecraft:enchanted_book>.withTag({StoredEnchantments: [{lvl: 1 as short, id: 78 as short}]}), 2);
midnight_main.addItemEntry(<minecraft:enchanted_book>.withTag({StoredEnchantments: [{lvl: 1 as short, id: 79 as short}]}), 2);
midnight_main.addItemEntry(<minecraft:enchanted_book>.withTag({StoredEnchantments: [{lvl: 1 as short, id: 70 as short}]}), 1);
midnight_main.addItemEntry(<minecraft:enchanted_book>.withTag({StoredEnchantments: [{lvl: 1 as short, id: 11 as short}]}), 2);
midnight_main.addItemEntry(<minecraft:enchanted_book>.withTag({StoredEnchantments: [{lvl: 1 as short, id: 13 as short}]}), 4);
midnight_main.addItemEntry(<minecraft:enchanted_book>.withTag({StoredEnchantments: [{lvl: 2 as short, id: 13 as short}]}), 3);
midnight_main.addItemEntry(<minecraft:enchanted_book>.withTag({StoredEnchantments: [{lvl: 3 as short, id: 13 as short}]}), 2);
midnight_main.addItemEntry(<minecraft:enchanted_book>.withTag({StoredEnchantments: [{lvl: 1 as short, id: 27 as short}]}), 4);
midnight_main.addItemEntry(<minecraft:enchanted_book>.withTag({StoredEnchantments: [{lvl: 2 as short, id: 27 as short}]}), 3);
midnight_main.addItemEntry(<minecraft:enchanted_book>.withTag({StoredEnchantments: [{lvl: 3 as short, id: 27 as short}]}), 2);
midnight_main.addItemEntry(<minecraft:enchanted_book>.withTag({StoredEnchantments: [{lvl: 1 as short, id: 37 as short}]}), 4);
midnight_main.addItemEntry(<minecraft:enchanted_book>.withTag({StoredEnchantments: [{lvl: 2 as short, id: 37 as short}]}), 3);
midnight_main.addItemEntry(<minecraft:enchanted_book>.withTag({StoredEnchantments: [{lvl: 3 as short, id: 37 as short}]}), 2);
midnight_main.addItemEntry(<minecraft:enchanted_book>.withTag({StoredEnchantments: [{lvl: 4 as short, id: 37 as short}]}), 1);
midnight_main.addItemEntry(<minecraft:enchanted_book>.withTag({StoredEnchantments: [{lvl: 1 as short, id: 38 as short}]}), 4);
midnight_main.addItemEntry(<minecraft:enchanted_book>.withTag({StoredEnchantments: [{lvl: 2 as short, id: 38 as short}]}), 3);
midnight_main.addItemEntry(<minecraft:enchanted_book>.withTag({StoredEnchantments: [{lvl: 3 as short, id: 38 as short}]}), 2);
midnight_main.addItemEntry(<minecraft:enchanted_book>.withTag({StoredEnchantments: [{lvl: 4 as short, id: 38 as short}]}), 1);
midnight_main.addItemEntry(<minecraft:enchanted_book>.withTag({StoredEnchantments: [{lvl: 1 as short, id: 39 as short}]}), 4);
midnight_main.addItemEntry(<minecraft:enchanted_book>.withTag({StoredEnchantments: [{lvl: 2 as short, id: 39 as short}]}), 3);
midnight_main.addItemEntry(<minecraft:enchanted_book>.withTag({StoredEnchantments: [{lvl: 3 as short, id: 39 as short}]}), 2);
midnight_main.addItemEntry(<minecraft:enchanted_book>.withTag({StoredEnchantments: [{lvl: 4 as short, id: 39 as short}]}), 1);
midnight_main.addItemEntry(<minecraft:enchanted_book>.withTag({StoredEnchantments: [{lvl: 1 as short, id: 57 as short}]}), 2);
midnight_main.addItemEntry(<minecraft:enchanted_book>.withTag({StoredEnchantments: [{lvl: 2 as short, id: 57 as short}]}), 1);
midnight_main.addItemEntry(<minecraft:enchanted_book>.withTag({StoredEnchantments: [{lvl: 1 as short, id: 59 as short}]}), 1);
midnight_main.addItemEntry(<minecraft:enchanted_book>.withTag({StoredEnchantments: [{lvl: 1 as short, id: 60 as short}]}), 5);
midnight_main.addItemEntry(<minecraft:enchanted_book>.withTag({StoredEnchantments: [{lvl: 2 as short, id: 60 as short}]}), 4);
midnight_main.addItemEntry(<minecraft:enchanted_book>.withTag({StoredEnchantments: [{lvl: 3 as short, id: 60 as short}]}), 3);
midnight_main.addItemEntry(<minecraft:enchanted_book>.withTag({StoredEnchantments: [{lvl: 4 as short, id: 60 as short}]}), 2);
midnight_main.addItemEntry(<minecraft:enchanted_book>.withTag({StoredEnchantments: [{lvl: 1 as short, id: 63 as short}]}), 3);
midnight_main.addItemEntry(<minecraft:enchanted_book>.withTag({StoredEnchantments: [{lvl: 2 as short, id: 63 as short}]}), 2);
midnight_main.addItemEntry(<minecraft:enchanted_book>.withTag({StoredEnchantments: [{lvl: 1 as short, id: 64 as short}]}), 4);
midnight_main.addItemEntry(<minecraft:enchanted_book>.withTag({StoredEnchantments: [{lvl: 2 as short, id: 64 as short}]}), 3);
midnight_main.addItemEntry(<minecraft:enchanted_book>.withTag({StoredEnchantments: [{lvl: 3 as short, id: 64 as short}]}), 2);
midnight_main.addItemEntry(<minecraft:enchanted_book>.withTag({StoredEnchantments: [{lvl: 1 as short, id: 65 as short}]}), 2);
midnight_main.addItemEntry(<minecraft:enchanted_book>.withTag({StoredEnchantments: [{lvl: 1 as short, id: 66 as short}]}), 2);
midnight_main.addItemEntry(<minecraft:enchanted_book>.withTag({StoredEnchantments: [{lvl: 1 as short, id: 67 as short}]}), 1);
midnight_main.addItemEntry(<minecraft:enchanted_book>.withTag({StoredEnchantments: [{lvl: 1 as short, id: 68 as short}]}), 2);
midnight_main.addItemEntry(<minecraft:enchanted_book>.withTag({StoredEnchantments: [{lvl: 2 as short, id: 68 as short}]}), 1);
midnight_main.addItemEntry(<minecraft:enchanted_book>.withTag({StoredEnchantments: [{lvl: 1 as short, id: 41 as short}]}), 2);
midnight_main.addItemEntry(<minecraft:enchanted_book>.withTag({StoredEnchantments: [{lvl: 1 as short, id: 46 as short}]}), 2);