import crafttweaker.item.IItemStack;
import mods.zenutils.UUID;

         ### All recipes that are not related to any specific class ###

      ## Quality of Life Items ##

recipes.addShapeless(<cqrepoured:potion_healing>, [<rustic:wildberries>,<biomesoplenty:mushroom:3>,<minecraft:glass_bottle>]);
recipes.addShaped(<minecraft:experience_bottle> * 2, [[<mod_lavacow:ectoplasm>, <mod_lavacow:ectoplasm>, <mod_lavacow:ectoplasm>],[<mod_lavacow:ectoplasm>, <mod_lavacow:ectoplasm>, <mod_lavacow:ectoplasm>], [<mod_lavacow:ectoplasm>, <mod_lavacow:ectoplasm>, <mod_lavacow:ectoplasm>]]);
recipes.addShapeless(<loreexpansion:lore_journal>, [<minecraft:book>]);
recipes.addShapeless(<ebwizardry:crystal_shard> * 8, [<ebwizardry:crystal_flower>,<nyx:fallen_star>]);

val IArray = [
      <ebwizardry:charm_feeding>,
      <ebwizardry:charm_mount_teleporting>,
      <ebwizardry:charm_black_hole>,
      <ebwizardry:charm_transportation>,
      <ebwizardry:charm_light>,
      <ebwizardry:charm_stop_time>,
      <ebwizardry:amulet_ice_immunity>,
      <ebwizardry:amulet_fire_cloaking>,
      <ebwizardry:amulet_ice_protection>,
      <ebwizardry:amulet_wisdom>,
      <ebwizardry:amulet_frost_warding>,
      <ebwizardry:charm_sixth_sense>,
      <ebwizardry:charm_silk_touch>,
      <ebwizardry:charm_abseiling>,
      <ebwizardry:charm_growth>,
      <ebwizardry:charm_flight>,
      <ebwizardry:charm_hunger_casting>,
      <ebwizardry:charm_undead_helmets>,
      <ebwizardry:charm_minion_variants>,
      <ebwizardry:charm_minion_health>,
      <ebwizardry:charm_storm>,
      <ebwizardry:charm_lava_walking>,
      <ebwizardry:charm_auto_smelt>,
      <ebwizardry:charm_spell_discovery>,
      <ebwizardry:charm_move_speed>,
      <ebwizardry:charm_experience_tome>,
      <ebwizardry:charm_haggler>,
      <ebwizardry:amulet_absorption>,
      <ebwizardry:amulet_auto_shield>,
      <ebwizardry:amulet_resurrection>,
      <ebwizardry:amulet_transience>,
      <ebwizardry:amulet_anchoring>,
      <ebwizardry:amulet_channeling>,
      <ebwizardry:amulet_glide>,
      <ebwizardry:amulet_wither_immunity>,
      <ebwizardry:amulet_lich>,
      <ebwizardry:ring_ice_melee>,
      <ebwizardry:ring_meteor>,
      <ebwizardry:ring_disintegration>,
      <ebwizardry:ring_fire_biome>,
      <ebwizardry:ring_fire_melee>,
      <ebwizardry:ring_combustion>,
      <ebwizardry:ring_battlemage>,
      <ebwizardry:ring_siphoning>,
      <ebwizardry:ring_condensing>,
      <ebwizardry:ring_interdiction>,
      <ebwizardry:ring_paladin>,
      <ebwizardry:ring_defender>,
      <ebwizardry:ring_conjurer>,
      <ebwizardry:ring_blockwrangler>,
      <ebwizardry:ring_mana_return>,
      <ebwizardry:ring_extraction>,
      <ebwizardry:ring_evoker>,
      <ebwizardry:ring_full_moon>,
      <ebwizardry:ring_earth_biome>,
      <ebwizardry:ring_earth_melee>,
      <ebwizardry:ring_poison>,
      <ebwizardry:ring_mind_control>,
      <ebwizardry:ring_necromancy_melee>,
      <ebwizardry:ring_leeching>,
      <ebwizardry:ring_soulbinding>,
      <ebwizardry:ring_stormcloud>,
      <ebwizardry:ring_hammer>,
      <ebwizardry:ring_seeking>,
      <ebwizardry:ring_storm>,
      <ebwizardry:ring_lightning_melee>,
      <ebwizardry:ring_shattering>,
      <ebwizardry:ring_arcane_frost>,
      <ebwizardry:ring_ice_biome>,
      <behgameon:accessory_38>,
      <behgameon:accessory_36>,
      <behgameon:accessory_35>,
      <behgameon:accessory_33>,
      <baubles:ring>,
      <behgameon:accessory_3>,
      <behgameon:accessory_2>,
      <behgameon:accessory_1>,
      <xat:faelis_ring>,
      <xat:elf_ring>,
      <xat:goblin_ring>,
      <xat:titan_ring>,
      <xat:dwarf_ring>,
      <mod_lavacow:dreamcatcher>,
      <mod_lavacow:halo_necklace>,
      <bountifulbaubles:trinketbezoar>,
      <bountifulbaubles:trinketshulkerheart>,
      <bountifulbaubles:ringoverclocking>,
      <bountifulbaubles:trinketvitamins>,
      <bountifulbaubles:trinketapple>,
      <betteranimalsplus:bear_cape_kermode>,
      <betteranimalsplus:bear_cape_black>,
      <betteranimalsplus:bear_cape_brown>,
      <betteranimalsplus:wolf_cape_red>,
      <betteranimalsplus:wolf_cape_brown>,
      <betteranimalsplus:wolf_cape_arctic>,
      <betteranimalsplus:wolf_cape_black>,
      <betteranimalsplus:wolf_cape_classic>
] as IItemStack[];

for item in IArray{
    recipes.addShapeless(<bountifulbaubles:spectralsilt>,[item,<bountifulbaubles:disintegrationtablet>.reuse()]);
}

recipes.addShaped(<tombstone:book_of_magic_impregnation>, [[<tombstone:crafting_ingredient:3>, <minecraft:lapis_block>, <tombstone:crafting_ingredient:3>],[<erebus:jade_block>, <minecraft:book>, <erebus:jade_block>], [<tombstone:crafting_ingredient:3>, <minecraft:lapis_block>, <tombstone:crafting_ingredient:3>]]);
recipes.addShaped(<tombstone:book_of_disenchantment>, [[<tombstone:dust_of_vanishing>, <minecraft:lapis_block>, <tombstone:dust_of_vanishing>],[<minecraft:lapis_block>, <minecraft:book>, <minecraft:lapis_block>], [<tombstone:dust_of_vanishing>, <minecraft:lapis_block>, <tombstone:dust_of_vanishing>]]);

val RArray = [
      <quark:redstone_randomizer>,
      <minecraft:dropper>,
      <minecraft:hopper>,
      <minecraft:daylight_detector>,
      <minecraft:tripwire_hook>,
      <minecraft:redstone_lamp>,
      <minecraft:redstone_torch>,
      <minecraft:lever>,
      <quark:chute>,
      <minecraft:dispenser>,
      <minecraft:noteblock>,
      <minecraft:repeater>,
      <minecraft:observer>,
      <minecraft:comparator>,
      <minecraft:piston>,
      <minecraft:sticky_piston>,
      <quark:iron_rod>,
      <quark:rain_detector>,
      <quark:ender_watcher>,
      <quark:redstone_inductor>
] as IItemStack[];

for item in RArray{
    recipes.addShapeless(item,[item.reuse(),<nyx:fallen_star>]);
}

recipes.addShaped(<scalinghealth:healingitem:1>, [[<minecraft:iron_ingot>, <ore:ingotIron>, <ore:ingotIron>],[<scalinghealth:healingitem>, <minecraft:golden_apple>, <scalinghealth:healingitem>], [<ore:wool>, <ore:wool>, <minecraft:wool>]]);
recipes.addShapeless(<scalinghealth:healingitem>, [<ore:wool>,<ore:string>]);
recipes.addShapedMirrored(<minecraft:feather> * 4, [[null, <ore:string>, <ore:string>],[<ore:string>, <ore:stickIron>, <ore:string>], [<ore:stickIron>, <ore:string>, null]]);

recipes.addShaped(<quark:iron_rod>, [[<minecraft:iron_ingot>],[<minecraft:iron_ingot>], [<minecraft:nether_star>]]);
recipes.addShaped(<waystones:waystone>,[[null,<minecraft:stonebrick>,null],[<minecraft:stonebrick>,<minecraft:nether_star>,<minecraft:stonebrick>],[<minecraft:obsidian>,<minecraft:obsidian>,<minecraft:obsidian>]]);
recipes.addShapeless(<antiqueatlas:empty_antique_atlas>,[<minecraft:writable_book>,<minecraft:compass>]);
recipes.addShapeless(<cqrepoured:staff>,[<minecraft:string>,<minecraft:stick>,<minecraft:string>,<minecraft:stick>]);
recipes.addShapeless(<minecraft:string> * 4, [<ore:wool>]);
recipes.addShaped(<minecraft:skull:1>, [[<quark:black_ash>, <quark:black_ash>, <quark:black_ash>],[<quark:black_ash>, <minecraft:skull>, <quark:black_ash>], [<quark:black_ash>, <quark:black_ash>, <quark:black_ash>]]);
recipes.addShapeless(<cqrepoured:magic_bell>, [<minecraft:obsidian>,<ore:stickWood>]);

      ## Class Charms and Potion Rings (and other baubles) ##

recipes.addShaped(<ebwizardry:amulet_potential>, [[null, <metallurgy:copper_ingot>, null],[<metallurgy:copper_ingot>, <bountifulbaubles:amuletsinempty>, <metallurgy:copper_ingot>], [null, <metallurgy:copper_ingot>, null]]);
recipes.addShaped(<ebwizardry:amulet_banishing>, [[null, <minecraft:gold_ingot>, null],[<minecraft:gold_ingot>, <bountifulbaubles:amuletsinempty>, <minecraft:gold_ingot>], [null, <minecraft:ender_pearl>, null]]);
recipes.addShaped(<ebwizardry:amulet_warding>, [[null, <ebwizardry:magic_crystal>, null],[<ebwizardry:magic_crystal>, <bountifulbaubles:amuletsinempty>, <ebwizardry:magic_crystal>], [null, <ebwizardry:magic_crystal>, null]]);
recipes.addShaped(<ebwizardry:amulet_fire_protection>, [[null, <minecraft:magma_cream>, null],[<minecraft:magma_cream>, <bountifulbaubles:amuletsinempty>, <minecraft:magma_cream>], [null, <minecraft:magma_cream>, null]]);

recipes.addShaped(<metallurgy:ceruclase_boots>, [[null, <biomesoplenty:gem:1>, null],[<metallurgy:ceruclase_ingot>, null, <metallurgy:ceruclase_ingot>], [<metallurgy:ceruclase_ingot>, null, <metallurgy:ceruclase_ingot>]]);
recipes.addShaped(<metallurgy:ceruclase_leggings>, [[<metallurgy:ceruclase_ingot>, <biomesoplenty:gem:1>, <metallurgy:ceruclase_ingot>],[<metallurgy:ceruclase_ingot>, null, <metallurgy:ceruclase_ingot>], [<metallurgy:ceruclase_ingot>, null, <metallurgy:ceruclase_ingot>]]);
recipes.addShaped(<metallurgy:ceruclase_chestplate>, [[<metallurgy:ceruclase_ingot>, null, <metallurgy:ceruclase_ingot>],[<metallurgy:ceruclase_ingot>, <biomesoplenty:gem:1>, <metallurgy:ceruclase_ingot>], [null, <metallurgy:ceruclase_ingot>, null]]);
recipes.addShaped(<metallurgy:ceruclase_helmet>, [[<metallurgy:ceruclase_ingot>, <biomesoplenty:gem:1>, <metallurgy:ceruclase_ingot>],[<metallurgy:ceruclase_ingot>, null, <metallurgy:ceruclase_ingot>]]);
recipes.addShaped(<nyx:meteor_boots>, [[null, <biomesoplenty:gem:1>, null],[<nyx:meteor_ingot>, null, <nyx:meteor_ingot>], [<nyx:meteor_ingot>, null, <nyx:meteor_ingot>]]);
recipes.addShaped(<nyx:meteor_pants>, [[<nyx:meteor_ingot>, <biomesoplenty:gem:1>, <nyx:meteor_ingot>],[<nyx:meteor_ingot>, null, <nyx:meteor_ingot>], [<nyx:meteor_ingot>, null, <nyx:meteor_ingot>]]);
recipes.addShaped(<nyx:meteor_chest>, [[<nyx:meteor_ingot>, null, <nyx:meteor_ingot>],[<nyx:meteor_ingot>, <biomesoplenty:gem:1>, <nyx:meteor_ingot>], [null, <nyx:meteor_ingot>, null]]);
recipes.addShaped(<nyx:meteor_helm>, [[<nyx:meteor_ingot>, <biomesoplenty:gem:1>, <nyx:meteor_ingot>],[<nyx:meteor_ingot>, null, <nyx:meteor_ingot>]]);
recipes.addShaped(<metallurgy:haderoth_boots>, [[null, <biomesoplenty:gem:1>, null],[<metallurgy:haderoth_ingot>, null, <metallurgy:haderoth_ingot>], [<metallurgy:haderoth_ingot>, null, <metallurgy:haderoth_ingot>]]);
recipes.addShaped(<metallurgy:haderoth_leggings>, [[<metallurgy:haderoth_ingot>, <biomesoplenty:gem:1>, <metallurgy:haderoth_ingot>],[<metallurgy:haderoth_ingot>, null, <metallurgy:haderoth_ingot>], [<metallurgy:haderoth_ingot>, null, <metallurgy:haderoth_ingot>]]);
recipes.addShaped(<metallurgy:haderoth_chestplate>, [[<metallurgy:haderoth_ingot>, null, <metallurgy:haderoth_ingot>],[<metallurgy:haderoth_ingot>, <biomesoplenty:gem:1>, <metallurgy:haderoth_ingot>], [null, <metallurgy:haderoth_ingot>, null]]);
recipes.addShaped(<metallurgy:haderoth_helmet>, [[<metallurgy:haderoth_ingot>, <biomesoplenty:gem:1>, <metallurgy:haderoth_ingot>],[<metallurgy:haderoth_ingot>, null, <metallurgy:haderoth_ingot>]]);
recipes.addShaped(<midnight:tenebrum_boots>, [[null, <biomesoplenty:gem:1>, null],[<midnight:tenebrum_ingot>, null, <midnight:tenebrum_ingot>], [<midnight:tenebrum_ingot>, null, <midnight:tenebrum_ingot>]]);
recipes.addShaped(<midnight:tenebrum_leggings>, [[<midnight:tenebrum_ingot>, <biomesoplenty:gem:1>, <midnight:tenebrum_ingot>],[<midnight:tenebrum_ingot>, null, <midnight:tenebrum_ingot>], [<midnight:tenebrum_ingot>, null, <midnight:tenebrum_ingot>]]);
recipes.addShaped(<midnight:tenebrum_chestplate>, [[<midnight:tenebrum_ingot>, null, <midnight:tenebrum_ingot>],[<midnight:tenebrum_ingot>, <biomesoplenty:gem:1>, <midnight:tenebrum_ingot>], [null, <midnight:tenebrum_ingot>, null]]);
recipes.addShaped(<midnight:tenebrum_helmet>, [[<midnight:tenebrum_ingot>, <biomesoplenty:gem:1>, <midnight:tenebrum_ingot>],[<midnight:tenebrum_ingot>, null, <midnight:tenebrum_ingot>]]);
recipes.addShaped(<metallurgy:shadow_steel_boots>, [[null, <biomesoplenty:gem:1>, null],[<metallurgy:shadow_steel_ingot>, null, <metallurgy:shadow_steel_ingot>], [<metallurgy:shadow_steel_ingot>, null, <metallurgy:shadow_steel_ingot>]]);
recipes.addShaped(<metallurgy:shadow_steel_leggings>, [[<metallurgy:shadow_steel_ingot>, <biomesoplenty:gem:1>, <metallurgy:shadow_steel_ingot>],[<metallurgy:shadow_steel_ingot>, null, <metallurgy:shadow_steel_ingot>], [<metallurgy:shadow_steel_ingot>, null, <metallurgy:shadow_steel_ingot>]]);
recipes.addShaped(<metallurgy:shadow_steel_chestplate>, [[<metallurgy:shadow_steel_ingot>, null, <metallurgy:shadow_steel_ingot>],[<metallurgy:shadow_steel_ingot>, <biomesoplenty:gem:1>, <metallurgy:shadow_steel_ingot>], [null, <metallurgy:shadow_steel_ingot>, null]]);
recipes.addShaped(<metallurgy:shadow_steel_helmet>, [[<metallurgy:shadow_steel_ingot>, <biomesoplenty:gem:1>, <metallurgy:shadow_steel_ingot>],[<metallurgy:shadow_steel_ingot>, null, <metallurgy:shadow_steel_ingot>]]);
recipes.addShaped(<mutantbeasts:mutant_skeleton_boots>, [[null, <biomesoplenty:gem:1>, null], [<mutantbeasts:mutant_skeleton_limb>, null, <mutantbeasts:mutant_skeleton_limb>]]);
recipes.addShaped(<mutantbeasts:mutant_skeleton_leggings>, [[null, <mutantbeasts:mutant_skeleton_pelvis>, null],[<mutantbeasts:mutant_skeleton_limb>, <biomesoplenty:gem:1>, <mutantbeasts:mutant_skeleton_limb>]]);
recipes.addShaped(<mutantbeasts:mutant_skeleton_chestplate>, [[null, <biomesoplenty:gem:1>, null],[null, <mutantbeasts:mutant_skeleton_arms>, null], [null, <mutantbeasts:mutant_skeleton_rib_cage>, null]]);

recipes.addShaped(<behgameon:accessory_56>, [[null, <lycanitesmobs:wraithsigil>, null],[<minecraft:feather>, <behgameon:accessory_55>, <minecraft:feather>], [null, <forge:bucketfilled>.withTag({FluidName: "endacid", Amount: 1000}).onlyWithTag({FluidName: "endacid", Amount: 1000}), null]]);
recipes.addShaped(<behgameon:accessory_55>, [[<xat:glowing_gem>, <tombstone:impregnated_diamond>, <xat:glowing_gem>],[<tombstone:impregnated_diamond>, <mod_lavacow:ectoplasm_ingot>, <tombstone:impregnated_diamond>], [<xat:glowing_gem>, <tombstone:impregnated_diamond>, <xat:glowing_gem>]]);
recipes.addShaped(<behgameon:accessory_46>, [[null, <minecraft:gold_block>, null],[<minecraft:gold_block>, <behgameon:accessory_48>, <minecraft:gold_block>], [null, <forge:bucketfilled>.withTag({FluidName: "endacid", Amount: 1000}).onlyWithTag({FluidName: "endacid", Amount: 1000}), null]]);
recipes.addShaped(<behgameon:accessory_48>, [[<xat:glowing_gem>, <quark:crystal>, <xat:glowing_gem>],[<quark:crystal>, <mod_lavacow:ectoplasm_ingot>, <quark:crystal>], [<xat:glowing_gem>, <quark:crystal>, <xat:glowing_gem>]]);
recipes.addShaped(<behgameon:accessory_45>, [[null, <mysticalworld:pearl>, null],[<mysticalworld:pearl>, <behgameon:accessory_47>, <mysticalworld:pearl>], [null, <forge:bucketfilled>.withTag({FluidName: "endacid", Amount: 1000}).onlyWithTag({FluidName: "endacid", Amount: 1000}), null]]);
recipes.addShaped(<behgameon:accessory_47>, [[<xat:glowing_gem>, <nyx:fallen_star>, <xat:glowing_gem>],[<nyx:fallen_star>, <mod_lavacow:ectoplasm_ingot>, <nyx:fallen_star>], [<xat:glowing_gem>, <nyx:fallen_star>, <xat:glowing_gem>]]);

recipes.addShaped(<behgameon:ring_40>, [[<lycanitesmobs:blizzardcharge>, <lycanitesmobs:blizzardcharge>, <lycanitesmobs:blizzardcharge>],[<mod_lavacow:shattered_ice>, <behgameon:ring_60>, <mod_lavacow:shattered_ice>], [<mod_lavacow:shattered_ice>, <mod_lavacow:shattered_ice>, <mod_lavacow:shattered_ice>]]);
recipes.addShaped(<behgameon:ring_39>, [[<rustic:ironberries>, <rustic:ironberries>, <rustic:ironberries>],[<metallurgy:steel_ingot>, <behgameon:ring_60>, <metallurgy:steel_ingot>], [<metallurgy:steel_ingot>, <metallurgy:steel_ingot>, <metallurgy:steel_ingot>]]);
recipes.addShaped(<behgameon:ring_38>, [[<ebwizardry:crystal_silver_plating>, <ebwizardry:crystal_silver_plating>, <ebwizardry:crystal_silver_plating>],[<ebwizardry:magic_crystal>, <behgameon:ring_60>, <ebwizardry:magic_crystal>], [<ebwizardry:magic_crystal>, <ebwizardry:magic_crystal>, <ebwizardry:magic_crystal>]]);
recipes.addShaped(<behgameon:ring_37>, [[<ore:spartanweaponry:arrows>, <ore:spartanweaponry:arrows>, <ore:spartanweaponry:arrows>],[<minecraft:blaze_powder>, <behgameon:ring_60>, <minecraft:blaze_powder>], [<minecraft:blaze_powder>, <minecraft:blaze_powder>, <minecraft:blaze_powder>]]);
recipes.addShaped(<behgameon:ring_36>, [[<ebwizardry:crystal_block>, <ebwizardry:crystal_block>, <ebwizardry:crystal_block>],[<ebwizardry:magic_crystal>, <behgameon:ring_60>, <ebwizardry:magic_crystal>], [<ebwizardry:magic_crystal>, <ebwizardry:magic_crystal>, <ebwizardry:magic_crystal>]]);
recipes.addShaped(<behgameon:ring_35>, [[<minecraft:lapis_block>, <minecraft:lapis_block>, <minecraft:lapis_block>],[<minecraft:experience_bottle>, <behgameon:ring_60>, <minecraft:experience_bottle>], [<minecraft:experience_bottle>, <minecraft:experience_bottle>, <minecraft:experience_bottle>]]);
recipes.addShaped(<behgameon:ring_34>, [[<rustic:wind_thistle>, <rustic:wind_thistle>, <rustic:wind_thistle>],[<minecraft:sugar>, <behgameon:ring_60>, <minecraft:sugar>], [<minecraft:sugar>, <minecraft:sugar>, <minecraft:sugar>]]);
recipes.addShaped(<behgameon:ring_33>, [[<quark:golden_frog_leg>, <quark:golden_frog_leg>, <quark:golden_frog_leg>],[<minecraft:rabbit_foot>, <behgameon:ring_60>, <minecraft:rabbit_foot>], [<minecraft:rabbit_foot>, <minecraft:rabbit_foot>, <minecraft:rabbit_foot>]]);
recipes.addShaped(<behgameon:ring_32>, [[<lycanitesmobs:raw_aspid_meat>, <lycanitesmobs:raw_aspid_meat>, <lycanitesmobs:raw_aspid_meat>],[<minecraft:slime_ball>, <behgameon:ring_60>, <minecraft:slime_ball>], [<minecraft:slime_ball>, <minecraft:slime_ball>, <minecraft:slime_ball>]]);
recipes.addShaped(<behgameon:ring_31>, [[<metallurgy:gold_dust>, <metallurgy:gold_dust>, <metallurgy:gold_dust>],[<minecraft:emerald>, <behgameon:ring_60>, <minecraft:emerald>], [<minecraft:emerald>, <minecraft:emerald>, <minecraft:emerald>]]);
recipes.addShaped(<behgameon:ring_29>, [[<minecraft:redstone_block>, <minecraft:redstone_block>, <minecraft:redstone_block>],[<minecraft:blaze_powder>, <behgameon:ring_60>, <minecraft:blaze_powder>], [<minecraft:blaze_powder>, <minecraft:blaze_powder>, <minecraft:blaze_powder>]]);

recipes.addShaped(<behgameon:ring_42>, [[<minecraft:magma>, <lycanitesmobs:embercharge>, <minecraft:magma>],[<minecraft:magma>, <behgameon:ring_58>, <minecraft:magma>], [<minecraft:magma>, <minecraft:magma>, <minecraft:magma>]]);
recipes.addShaped(<behgameon:ring_30>, [[<lycanitesmobs:embercharge>, <lycanitesmobs:embercharge>, <lycanitesmobs:embercharge>],[<minecraft:magma>, <behgameon:ring_60>, <minecraft:magma>], [<minecraft:magma>, <minecraft:magma>, <minecraft:magma>]]);
recipes.addShapedMirrored(<behgameon:ring_18>, [[null, <minecraft:magma>, null],[<minecraft:magma>, <behgameon:ring_59>, <minecraft:magma>], [<lycanitesmobs:embercharge>, <minecraft:magma>, null]]);

recipes.addShaped(<behgameon:ring_52>, [[<mod_lavacow:shattered_ice>, <lycanitesmobs:blizzardcharge>, <mod_lavacow:shattered_ice>],[<mod_lavacow:shattered_ice>, <behgameon:ring_58>, <mod_lavacow:shattered_ice>], [<mod_lavacow:shattered_ice>, <mod_lavacow:shattered_ice>, <mod_lavacow:shattered_ice>]]);
recipes.addShaped(<behgameon:ring_51>, [[<metallurgy:steel_ingot>, <rustic:ironberries>, <metallurgy:steel_ingot>],[<metallurgy:steel_ingot>, <behgameon:ring_58>, <metallurgy:steel_ingot>], [<metallurgy:steel_ingot>, <metallurgy:steel_ingot>, <metallurgy:steel_ingot>]]);
recipes.addShaped(<behgameon:ring_50>, [[<ebwizardry:magic_crystal>, <ebwizardry:crystal_silver_plating>, <ebwizardry:magic_crystal>],[<ebwizardry:magic_crystal>, <behgameon:ring_58>, <ebwizardry:magic_crystal>], [<ebwizardry:magic_crystal>, <ebwizardry:magic_crystal>, <ebwizardry:magic_crystal>]]);
recipes.addShaped(<behgameon:ring_49>, [[<minecraft:blaze_powder>, <ore:spartanweaponry:arrows>, <minecraft:blaze_powder>],[<minecraft:blaze_powder>, <behgameon:ring_58>, <minecraft:blaze_powder>], [<minecraft:blaze_powder>, <minecraft:blaze_powder>, <minecraft:blaze_powder>]]);
recipes.addShaped(<behgameon:ring_48>, [[<ebwizardry:magic_crystal>, <ebwizardry:crystal_block>, <ebwizardry:magic_crystal>],[<ebwizardry:magic_crystal>, <behgameon:ring_58>, <ebwizardry:magic_crystal>], [<ebwizardry:magic_crystal>, <ebwizardry:magic_crystal>, <ebwizardry:magic_crystal>]]);
recipes.addShaped(<behgameon:ring_47>, [[<minecraft:experience_bottle>, <minecraft:lapis_block>, <minecraft:experience_bottle>],[<minecraft:experience_bottle>, <behgameon:ring_58>, <minecraft:experience_bottle>], [<minecraft:experience_bottle>, <minecraft:experience_bottle>, <minecraft:experience_bottle>]]);
recipes.addShaped(<behgameon:ring_46>, [[<minecraft:sugar>, <rustic:wind_thistle>, <minecraft:sugar>],[<minecraft:sugar>, <behgameon:ring_58>, <minecraft:sugar>], [<minecraft:sugar>, <minecraft:sugar>, <minecraft:sugar>]]);
recipes.addShaped(<behgameon:ring_45>, [[<minecraft:rabbit_foot>, <quark:golden_frog_leg>, <minecraft:rabbit_foot>],[<minecraft:rabbit_foot>, <behgameon:ring_58>, <minecraft:rabbit_foot>], [<minecraft:rabbit_foot>, <minecraft:rabbit_foot>, <minecraft:rabbit_foot>]]);
recipes.addShaped(<behgameon:ring_44>, [[<minecraft:slime_ball>, <lycanitesmobs:raw_aspid_meat>, <minecraft:slime_ball>],[<minecraft:slime_ball>, <behgameon:ring_58>, <minecraft:slime_ball>], [<minecraft:slime_ball>, <minecraft:slime_ball>, <minecraft:slime_ball>]]);
recipes.addShaped(<behgameon:ring_43>, [[<minecraft:emerald>, <metallurgy:gold_dust>, <minecraft:emerald>],[<minecraft:emerald>, <behgameon:ring_58>, <minecraft:emerald>], [<minecraft:emerald>, <minecraft:emerald>, <minecraft:emerald>]]);
recipes.addShaped(<behgameon:ring_41>, [[<minecraft:blaze_powder>, <minecraft:redstone_block>, <minecraft:blaze_powder>],[<minecraft:blaze_powder>, <behgameon:ring_58>, <minecraft:blaze_powder>], [<minecraft:blaze_powder>, <minecraft:blaze_powder>, <minecraft:blaze_powder>]]);

recipes.addShapedMirrored(<behgameon:ring_25>, [[null, <minecraft:blaze_powder>, null],[<minecraft:blaze_powder>, <behgameon:ring_59>, <minecraft:blaze_powder>], [<ore:spartanweaponry:arrows>, <minecraft:blaze_powder>, null]]);
recipes.addShapedMirrored(<behgameon:ring_26>, [[null, <ebwizardry:magic_crystal>, null],[<ebwizardry:magic_crystal>, <behgameon:ring_59>, <ebwizardry:magic_crystal>], [<ebwizardry:crystal_silver_plating>, <ebwizardry:magic_crystal>, null]]);
recipes.addShapedMirrored(<behgameon:ring_24>, [[null, <ebwizardry:magic_crystal>, null],[<ebwizardry:magic_crystal>, <behgameon:ring_59>, <ebwizardry:magic_crystal>], [<ebwizardry:crystal_block>, <ebwizardry:magic_crystal>, null]]);
recipes.addShapedMirrored(<behgameon:ring_23>, [[null, <minecraft:experience_bottle>, null],[<minecraft:experience_bottle>, <behgameon:ring_59>, <minecraft:experience_bottle>], [<minecraft:lapis_block>, <minecraft:experience_bottle>, null]]);
recipes.addShapedMirrored(<behgameon:ring_27>, [[null, <metallurgy:steel_ingot>, null],[<metallurgy:steel_ingot>, <behgameon:ring_59>, <metallurgy:steel_ingot>], [<rustic:ironberries>, <metallurgy:steel_ingot>, null]]);
recipes.addShapedMirrored(<behgameon:ring_19>, [[null, <minecraft:emerald>, null],[<minecraft:emerald>, <behgameon:ring_59>, <minecraft:emerald>], [<metallurgy:gold_dust>, <minecraft:emerald>, null]]);
recipes.addShapedMirrored(<behgameon:ring_21>, [[null, <minecraft:rabbit_foot>, null],[<minecraft:rabbit_foot>, <behgameon:ring_59>, <minecraft:rabbit_foot>], [<quark:golden_frog_leg>, <minecraft:rabbit_foot>, null]]);
recipes.addShapedMirrored(<behgameon:ring_17>, [[null, <minecraft:blaze_powder>, null],[<minecraft:blaze_powder>, <behgameon:ring_59>, <minecraft:blaze_powder>], [<minecraft:redstone_block>, <minecraft:blaze_powder>, null]]);
recipes.addShapedMirrored(<behgameon:ring_22>, [[null, <minecraft:sugar>, null],[<minecraft:sugar>, <behgameon:ring_59>, <rustic:wind_thistle>, <minecraft:sugar>, null]]);
recipes.addShapedMirrored(<behgameon:ring_20>, [[null, <minecraft:slime_ball>, null],[<minecraft:slime_ball>, <behgameon:ring_59>, <minecraft:slime_ball>], [<lycanitesmobs:raw_aspid_meat>, <minecraft:slime_ball>, null]]);
recipes.addShapedMirrored(<behgameon:ring_28>, [[null, <mod_lavacow:shattered_ice>, null],[<mod_lavacow:shattered_ice>, <behgameon:ring_59>, <mod_lavacow:shattered_ice>], [<lycanitesmobs:blizzardcharge>, <mod_lavacow:shattered_ice>, null]]);

recipes.addShapedMirrored(<behgameon:ring_59>, [[<xat:glowing_powder>, <minecraft:iron_ingot>, null],[<minecraft:iron_ingot>, null, <minecraft:iron_ingot>], [null, <minecraft:iron_ingot>, null]]);
recipes.addShaped(<behgameon:ring_60>, [[<betternether:cincinnasite_block>, <betternether:cincinnasite_block>, <betternether:cincinnasite_block>],[<minecraft:iron_ingot>, <minecraft:nether_star>, <minecraft:iron_ingot>], [<minecraft:iron_ingot>, <minecraft:iron_ingot>, <minecraft:iron_ingot>]]);
recipes.addShapedMirrored(<behgameon:ring_58>, [[null, <minecraft:iron_ingot>, <mysticalworld:amethyst_gem>],[<minecraft:iron_ingot>, null, <minecraft:iron_ingot>], [null, <minecraft:iron_ingot>, null]]);
recipes.addShapeless(<bountifulbaubles:trinketmixeddragonscale>, [<bountifulbaubles:trinketblackdragonscale>,<bountifulbaubles:trinketbezoar>]);

recipes.addShapedMirrored(<behgameon:ring_63>, [[null, <nyx:meteor_shard>, null],[<nyx:meteor_shard>, <behgameon:ring_104>, <nyx:meteor_shard>], [<lycanitesmobs:cinderblade>, <nyx:meteor_shard>, null]]);
recipes.addShaped(<behgameon:ring_87>, [[<nyx:meteor_shard>, <lycanitesmobs:cinderblade>, <nyx:meteor_shard>],[<nyx:meteor_shard>, <behgameon:ring_103>, <nyx:meteor_shard>], [<nyx:meteor_shard>, <nyx:meteor_shard>, <nyx:meteor_shard>]]);
recipes.addShaped(<behgameon:ring_97>, [[<minecraft:packed_ice>, <lycanitesmobs:frostweaverleg>, <minecraft:packed_ice>],[<minecraft:packed_ice>, <behgameon:ring_103>, <minecraft:packed_ice>], [<minecraft:packed_ice>, <minecraft:packed_ice>, <minecraft:packed_ice>]]);
recipes.addShapedMirrored(<behgameon:ring_73>, [[null, <minecraft:packed_ice>, null],[<minecraft:packed_ice>, <behgameon:ring_104>, <minecraft:packed_ice>], [<lycanitesmobs:frostweaverleg>, <minecraft:packed_ice>, null]]);
recipes.addShapeless(<behgameon:ring_103>, [<behgameon:ring_104>,<biomesoplenty:gem:1>]);

recipes.addShaped(<behgameon:ring_85>, [[<ebwizardry:master_ice_wand>, <ebwizardry:master_ice_wand>, <ebwizardry:master_ice_wand>],[<erebus:materials:58>, <behgameon:ring_105>, <erebus:materials:58>], [<erebus:materials:58>, <erebus:water_striders>, <erebus:materials:58>]]);
recipes.addShapedMirrored(<behgameon:ring_84>, [[<midnight:nagrilite_ingot>, <midnight:nagrilite_ingot>, <midnight:nagrilite_ingot>],[<erebus:rein_exoskeleton_shield>, <behgameon:ring_105>, <erebus:rhino_exoskeleton_shield>], [<erebus:rein_exoskeleton_shield>, <erebus:smoothie:7>, <erebus:rhino_exoskeleton_shield>]]);
recipes.addShaped(<behgameon:ring_83>, [[<midnight:runebush>, <midnight:runebush>, <midnight:runebush>],[<ebwizardry:grand_crystal>, <behgameon:ring_105>, <ebwizardry:grand_crystal>], [<ebwizardry:grand_crystal>, <forge:bucketfilled>, <ebwizardry:grand_crystal>]]);
recipes.addShaped(<behgameon:ring_82>, [[<midnight:dragon_nest>, <midnight:dragon_nest>, <midnight:dragon_nest>],[<erebus:materials:41>, <behgameon:ring_105>, <erebus:materials:41>], [<erebus:max_speed_bow>, <spartanweaponry:longbow_copper>, <spartanweaponry:crossbow_copper>]]);
recipes.addShaped(<behgameon:ring_81>, [[<midnight:bloomcrystal>, <midnight:bloomcrystal>, <midnight:bloomcrystal>],[<ebwizardry:grand_crystal>, <behgameon:ring_105>, <ebwizardry:grand_crystal>], [<ebwizardry:grand_crystal>, <erebus:wand_of_preservation>, <ebwizardry:grand_crystal>]]);
recipes.addShaped(<behgameon:ring_80>, [[<midnight:nightshroom_powder>, <midnight:nightshroom_powder>, <midnight:nightshroom_powder>],[<erebus:materials:20>, <behgameon:ring_105>, <erebus:materials:20>], [<erebus:materials:20>, <tombstone:book_of_repairing>, <erebus:materials:20>]]);
recipes.addShaped(<behgameon:ring_79>, [[<midnight:dewshroom_powder>, <midnight:dewshroom_powder>, <midnight:dewshroom_powder>],[<erebus:materials:13>, <behgameon:ring_105>, <erebus:materials:13>], [<erebus:materials:8>, <erebus:materials:8>, <erebus:materials:8>]]);
recipes.addShaped(<behgameon:ring_78>, [[<erebus:materials:9>, <erebus:materials:9>, <erebus:materials:9>],[<erebus:erebus_food:2>, <behgameon:ring_105>, <erebus:erebus_food:2>], [<erebus:jump_boots>, <erebus:smoothie>, <erebus:jump_boots>]]);
recipes.addShaped(<behgameon:ring_77>, [[<midnight:viridshroom_powder>, <midnight:viridshroom_powder>, <midnight:viridshroom_powder>],[<erebus:heart_berries>, <behgameon:ring_105>, <erebus:heart_berries>], [<erebus:life_blood>, <rustic:elixir>.withTag({ElixirEffects: [{Effect: "minecraft:regeneration", Duration: 450, Amplifier: 1}]}).onlyWithTag({ElixirEffects: [{Effect: "minecraft:regeneration", Duration: 450, Amplifier: 1}]}), <erebus:life_blood>]]);
recipes.addShaped(<behgameon:ring_76>, [[<midnight:bogshroom_powder>, <midnight:bogshroom_powder>, <midnight:bogshroom_powder>],[<erebus:materials:37>, <behgameon:ring_105>, <erebus:materials:37>], [<erebus:materials:37>, <rustic:elixir>.withTag({ElixirEffects: [{Effect: "minecraft:haste", Duration: 1800, Amplifier: 1}]}).onlyWithTag({ElixirEffects: [{Effect: "minecraft:haste", Duration: 1800, Amplifier: 1}]}), <erebus:materials:37>]]);
recipes.addShaped(<behgameon:ring_75>, [[<erebus:materials:60>, <erebus:materials:60>, <erebus:materials:60>],[<erebus:small_plant:4>, <behgameon:ring_105>, <erebus:small_plant:4>], [<erebus:small_plant:4>, <rustic:elixir>.withTag({ElixirEffects: [{Effect: "minecraft:fire_resistance", Duration: 9600, Amplifier: 0}]}).onlyWithTag({ElixirEffects: [{Effect: "minecraft:fire_resistance", Duration: 9600, Amplifier: 0}]}), <erebus:small_plant:4>]]);
recipes.addShaped(<behgameon:ring_74>, [[<midnight:rouxe>, <midnight:rouxe>, <midnight:rouxe>],[<erebus:materials:23>, <behgameon:ring_105>, <erebus:materials:23>], [<erebus:whetstone:5>, <rustic:elixir>.withTag({ElixirEffects: [{Effect: "minecraft:strength", Duration: 1800, Amplifier: 1}]}).onlyWithTag({ElixirEffects: [{Effect: "minecraft:strength", Duration: 1800, Amplifier: 1}]}), <erebus:whetstone:5>]]);
recipes.addShaped(<behgameon:ring_95>, [[<ebwizardry:magic_crystal>, <ebwizardry:amulet_warding>, <ebwizardry:magic_crystal>],[<ebwizardry:magic_crystal>, <behgameon:ring_103>, <ebwizardry:magic_crystal>], [<ebwizardry:magic_crystal>, <ebwizardry:magic_crystal>, <ebwizardry:magic_crystal>]]);
recipes.addShaped(<behgameon:ring_96>, [[<metallurgy:steel_ingot>, <lycanitesmobs:pale_soup>, <metallurgy:steel_ingot>],[<metallurgy:steel_ingot>, <behgameon:ring_103>, <metallurgy:steel_ingot>], [<metallurgy:steel_ingot>, <metallurgy:steel_ingot>, <metallurgy:steel_ingot>]]);
recipes.addShaped(<behgameon:ring_97>, [[<mod_lavacow:shattered_ice>, <metallurgy:ceruclase_shield>, <mod_lavacow:shattered_ice>],[<mod_lavacow:shattered_ice>, <behgameon:ring_103>, <mod_lavacow:shattered_ice>], [<mod_lavacow:shattered_ice>, <mod_lavacow:shattered_ice>, <mod_lavacow:shattered_ice>]]);
recipes.addShaped(<behgameon:ring_94>, [[<minecraft:blaze_powder>, <srparasites:weapon_bow>, <minecraft:blaze_powder>],[<minecraft:blaze_powder>, <behgameon:ring_103>, <minecraft:blaze_powder>], [<minecraft:blaze_powder>, <minecraft:blaze_powder>, <minecraft:blaze_powder>]]);
recipes.addShaped(<behgameon:ring_93>, [[<ebwizardry:magic_crystal>, <ebwizardry:grand_crystal>, <ebwizardry:magic_crystal>],[<ebwizardry:magic_crystal>, <behgameon:ring_103>, <ebwizardry:magic_crystal>], [<ebwizardry:magic_crystal>, <ebwizardry:magic_crystal>, <ebwizardry:magic_crystal>]]);
recipes.addShaped(<behgameon:ring_92>, [[<minecraft:experience_bottle>, <lycanitesmobs:equipment_infuser>, <minecraft:experience_bottle>],[<minecraft:experience_bottle>, <behgameon:ring_103>, <minecraft:experience_bottle>], [<minecraft:experience_bottle>, <minecraft:experience_bottle>, <minecraft:experience_bottle>]]);
recipes.addShaped(<behgameon:ring_91>, [[<minecraft:sugar>, <lycanitesmobs:amber_cake>, <minecraft:sugar>],[<minecraft:sugar>, <behgameon:ring_103>, <minecraft:sugar>], [<minecraft:sugar>, <minecraft:sugar>, <minecraft:sugar>]]);
recipes.addShaped(<behgameon:ring_90>, [[<minecraft:rabbit_foot>, <lycanitesmobs:tropical_curry>, <minecraft:rabbit_foot>],[<minecraft:rabbit_foot>, <behgameon:ring_103>, <minecraft:rabbit_foot>], [<minecraft:rabbit_foot>, <minecraft:rabbit_foot>, <minecraft:rabbit_foot>]]);
recipes.addShaped(<behgameon:ring_89>, [[<minecraft:slime_ball>, <lycanitesmobs:moss_pie>, <minecraft:slime_ball>],[<minecraft:slime_ball>, <behgameon:ring_103>, <minecraft:slime_ball>], [<minecraft:slime_ball>, <minecraft:slime_ball>, <minecraft:slime_ball>]]);
recipes.addShaped(<behgameon:ring_88>, [[<minecraft:emerald>, <lycanitesmobs:peaks_kebab>, <minecraft:emerald>],[<minecraft:emerald>, <behgameon:ring_103>, <minecraft:emerald>], [<minecraft:emerald>, <minecraft:emerald>, <minecraft:emerald>]]);
recipes.addShaped(<behgameon:ring_86>, [[<minecraft:blaze_powder>, <lycanitesmobs:devil_lasagna>, <minecraft:blaze_powder>],[<minecraft:blaze_powder>, <behgameon:ring_103>, <minecraft:blaze_powder>], [<minecraft:blaze_powder>, <minecraft:blaze_powder>, <minecraft:blaze_powder>]]);
recipes.addShapedMirrored(<behgameon:ring_73>, [[null, <mod_lavacow:shattered_ice>, null],[<mod_lavacow:shattered_ice>, <behgameon:ring_104>, <mod_lavacow:shattered_ice>], [<metallurgy:ceruclase_shield>, <mod_lavacow:shattered_ice>, null]]);
recipes.addShapedMirrored(<behgameon:ring_72>, [[null, <metallurgy:steel_ingot>, null],[<metallurgy:steel_ingot>, <behgameon:ring_104>, <metallurgy:steel_ingot>], [<lycanitesmobs:pale_soup>, <metallurgy:steel_ingot>, null]]);
recipes.addShapedMirrored(<behgameon:ring_71>, [[null, <ebwizardry:magic_crystal>, null],[<ebwizardry:magic_crystal>, <behgameon:ring_104>, <ebwizardry:magic_crystal>], [<ebwizardry:amulet_warding>, <ebwizardry:magic_crystal>, null]]);
recipes.addShapedMirrored(<behgameon:ring_70>, [[null, <minecraft:blaze_powder>, null],[<minecraft:blaze_powder>, <behgameon:ring_104>, <minecraft:blaze_powder>], [<srparasites:weapon_bow>, <minecraft:blaze_powder>, null]]);
recipes.addShapedMirrored(<behgameon:ring_69>, [[null, <ebwizardry:magic_crystal>, null],[<ebwizardry:magic_crystal>, <behgameon:ring_104>, <ebwizardry:magic_crystal>], [<ebwizardry:grand_crystal>, <ebwizardry:magic_crystal>, null]]);
recipes.addShapedMirrored(<behgameon:ring_68>, [[null, <minecraft:experience_bottle>, null],[<minecraft:experience_bottle>, <behgameon:ring_104>, <minecraft:experience_bottle>], [<lycanitesmobs:equipment_infuser>, <minecraft:experience_bottle>, null]]);
recipes.addShapedMirrored(<behgameon:ring_67>, [[null, <minecraft:sugar>, null],[<minecraft:sugar>, <behgameon:ring_104>, <minecraft:sugar>], [<lycanitesmobs:amber_cake>, <minecraft:sugar>, null]]);
recipes.addShapedMirrored(<behgameon:ring_66>, [[null, <minecraft:rabbit_foot>, null],[<minecraft:rabbit_foot>, <behgameon:ring_104>, <minecraft:rabbit_foot>], [<lycanitesmobs:tropical_curry>, <minecraft:rabbit_foot>, null]]);
recipes.addShapedMirrored(<behgameon:ring_65>, [[null, <minecraft:slime_ball>, null],[<minecraft:slime_ball>, <behgameon:ring_104>, <minecraft:slime_ball>], [<lycanitesmobs:moss_pie>, <minecraft:slime_ball>, null]]);
recipes.addShapedMirrored(<behgameon:ring_64>, [[null, <minecraft:emerald>, null],[<minecraft:emerald>, <behgameon:ring_104>, <minecraft:emerald>], [<lycanitesmobs:peaks_kebab>, <minecraft:emerald>, null]]);
recipes.addShapedMirrored(<behgameon:ring_62>, [[null, <minecraft:blaze_powder>, null],[<minecraft:blaze_powder>, <behgameon:ring_104>, <minecraft:blaze_powder>], [<lycanitesmobs:devil_lasagna>, <minecraft:blaze_powder>, null]]);
recipes.addShapedMirrored(<behgameon:ring_105>, [[<erebus:materials:1>, <erebus:materials:1>, <erebus:materials:1>],[<erebus:materials:48>, <behgameon:ring_103>, <erebus:materials:48>], [<erebus:materials:48>, <erebus:materials:40>, <erebus:materials:48>]]);
recipes.addShaped(<bountifulbaubles:amuletsingluttony>, [[null, <lycanitesmobs:wraithskull>.withTag({equipmentLevel: 3}).onlyWithTag({equipmentLevel: 3}), null],[<minecraft:nether_star>, <bountifulbaubles:amuletsinempty>, <minecraft:nether_star>], [null, <forge:bucketfilled>.withTag({FluidName: "honey", Amount: 1000}).onlyWithTag({FluidName: "honey", Amount: 1000}), null]]);
recipes.addShaped(<bountifulbaubles:amuletsinwrath>, [[null, <lycanitesmobs:behemophethand>.withTag({equipmentLevel: 3}).onlyWithTag({equipmentLevel: 3}), null],[<minecraft:nether_star>, <bountifulbaubles:amuletsinempty>, <minecraft:nether_star>], [null, <forge:bucketfilled>.withTag({FluidName: "blood", Amount: 1000}).onlyWithTag({FluidName: "blood", Amount: 1000}), null]]);

## Backpack

val backpack = <backpack:backpack>;

recipes.addShaped("lol?1",backpack.withTag({slots: 8, leather_tier: "I", frame_tier: "I", slots_used: 0, module_slots: 1, slots_per_row: 8}), [[<backpack:tanned_leather>, <backpack:tanned_leather>, <backpack:tanned_leather>],[<backpack:tanned_leather>, <backpack:backpack_frame>, <backpack:tanned_leather>], [<backpack:tanned_leather>, <backpack:tanned_leather>, <backpack:tanned_leather>]],

function(out, ins, cInfo){ 
      return out.updateTag({"backpack-UID": UUID.randomUUID().asString()}); 
}, null);

recipes.addShapeless("lol?2",backpack.withTag({slots: 12, leather_tier: "II", frame_tier: "I", slots_used: 0, module_slots: 1, slots_per_row: 8}),[<backpack:backpack:*>.withTag({slots: 8, leather_tier: "I", frame_tier: "I", slots_used: 0, module_slots: 1, slots_per_row: 8}).marked("wow"), <cqrepoured:backpack>],

function(out, ins, cInfo){ 
      var ogmeta = ins.wow.metadata as int;

      return itemUtils.getItem(out.definition.id , ogmeta).withTag({"backpack-UID": UUID.randomUUID().asString(), slots: 12, leather_tier: "II", frame_tier: "I", slots_used: 0, module_slots: 1, slots_per_row: 8});
}, null);

recipes.addShapeless("lol?3",backpack.withTag({slots: 16, leather_tier: "III", frame_tier: "I", slots_used: 0, module_slots: 1, slots_per_row: 8}),[<backpack:backpack:*>.withTag({slots: 12, leather_tier: "II", frame_tier: "I", slots_used: 0, module_slots: 1, slots_per_row: 8}).marked("wow"), <cqrepoured:backpack>],

function(out, ins, cInfo){ 
      var ogmeta = ins.wow.metadata as int;

      return itemUtils.getItem(out.definition.id , ogmeta).withTag({"backpack-UID": UUID.randomUUID().asString(), slots: 16, leather_tier: "III", frame_tier: "I", slots_used: 0, module_slots: 1, slots_per_row: 8});
}, null);


recipes.addShaped("lol?4",<backpack:backpack:100>.withTag({slots: 20, leather_tier: "I", frame_tier: "II", slots_used: 0, module_slots: 1, slots_per_row: 8}), [[<backpack:tanned_leather>, <backpack:tanned_leather>, <backpack:tanned_leather>],[<backpack:tanned_leather>, <backpack:backpack_frame:1>, <backpack:tanned_leather>], [<backpack:tanned_leather>, <backpack:tanned_leather>, <backpack:tanned_leather>]],

function(out, ins, cInfo){ 
      return out.updateTag({"backpack-UID": UUID.randomUUID().asString()}); 
}, null);

recipes.addShapeless("lol?5",<backpack:backpack:100>.withTag({"backpack-UID": UUID.randomUUID().asString(), slots: 24, leather_tier: "II", frame_tier: "II", slots_used: 0, module_slots: 1, slots_per_row: 8}),[<backpack:backpack:*>.withTag({slots: 20, leather_tier: "I", frame_tier: "II", slots_used: 0, module_slots: 1, slots_per_row: 8}).marked("wow"), <cqrepoured:backpack>],

function(out, ins, cInfo){ 
      var ogmeta = ins.wow.metadata as int;

      return itemUtils.getItem(out.definition.id , ogmeta).withTag({"backpack-UID": UUID.randomUUID().asString(), slots: 24, leather_tier: "II", frame_tier: "II", slots_used: 0, module_slots: 1, slots_per_row: 8});
}, null);

recipes.addShapeless("lol?6",<backpack:backpack:100>.withTag({"backpack-UID": UUID.randomUUID().asString(), slots: 28, leather_tier: "III", frame_tier: "II", slots_used: 0, module_slots: 1, slots_per_row: 8}),[<backpack:backpack:*>.withTag({slots: 24, leather_tier: "II", frame_tier: "II", slots_used: 0, module_slots: 1, slots_per_row: 8}).marked("wow"), <cqrepoured:backpack>],

function(out, ins, cInfo){ 
      var ogmeta = ins.wow.metadata as int;

      return itemUtils.getItem(out.definition.id , ogmeta).withTag({"backpack-UID": UUID.randomUUID().asString(), slots: 28, leather_tier: "III", frame_tier: "II", slots_used: 0, module_slots: 1, slots_per_row: 8});
}, null);


recipes.addShaped("lol?7",<backpack:backpack:200>.withTag({slots: 32, leather_tier: "I", frame_tier: "III", slots_used: 0, module_slots: 1, slots_per_row: 8}), [[<backpack:tanned_leather>, <backpack:tanned_leather>, <backpack:tanned_leather>],[<backpack:tanned_leather>, <backpack:backpack_frame:2>, <backpack:tanned_leather>], [<backpack:tanned_leather>, <backpack:tanned_leather>, <backpack:tanned_leather>]],

function(out, ins, cInfo){ 
      return out.updateTag({"backpack-UID": UUID.randomUUID().asString()}); 
}, null);

recipes.addShapeless("lol?8",<backpack:backpack:200>.withTag({"backpack-UID": UUID.randomUUID().asString(), slots: 36, leather_tier: "II", frame_tier: "III", slots_used: 0, module_slots: 1, slots_per_row: 8}),[<backpack:backpack:*>.withTag({slots: 32, leather_tier: "I", frame_tier: "III", slots_used: 0, module_slots: 1, slots_per_row: 8}).marked("wow"), <cqrepoured:backpack>],

function(out, ins, cInfo){ 
      var ogmeta = ins.wow.metadata as int;

      return itemUtils.getItem(out.definition.id , ogmeta).withTag({"backpack-UID": UUID.randomUUID().asString(), slots: 36, leather_tier: "II", frame_tier: "III", slots_used: 0, module_slots: 1, slots_per_row: 8});
}, null);

recipes.addShapeless("lol?9",<backpack:backpack:200>.withTag({"backpack-UID": UUID.randomUUID().asString(), slots: 40, leather_tier: "III", frame_tier: "III", slots_used: 0, module_slots: 1, slots_per_row: 8}),[<backpack:backpack:*>.withTag({slots: 36, leather_tier: "II", frame_tier: "III", slots_used: 0, module_slots: 1, slots_per_row: 8}).marked("wow"), <cqrepoured:backpack>],

function(out, ins, cInfo){ 
      var ogmeta = ins.wow.metadata as int;

      return itemUtils.getItem(out.definition.id , ogmeta).withTag({"backpack-UID": UUID.randomUUID().asString(), slots: 40, leather_tier: "III", frame_tier: "III", slots_used: 0, module_slots: 1, slots_per_row: 8});
}, null);

recipes.addShaped(<backpack:backpack_frame:2>, [[<erebus:small_plant:4>, <midnight:dragon_nest>, <stygian:endglow>],[<erebus:double_plant:1>, <backpack:backpack_frame:1>, <erebus:double_plant:4>], [<erebus:double_plant:2>, <midnight:runebush>, <erebus:double_plant>]]);
recipes.addShaped(<backpack:backpack_frame:1>, [[<rustic:aloe_vera>, <biomesoplenty:flower_0:5>, <biomesoplenty:plant_1:4>],[<biomesoplenty:flower_0:15>, <backpack:backpack_frame>, <biomesoplenty:flower_1:4>], [<biomesoplenty:flower_1:1>, <rustic:wind_thistle>, <biomesoplenty:coral>]]);