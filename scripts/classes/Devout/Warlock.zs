#reloadable

import crafttweaker.player.IPlayer;
import crafttweaker.item.IItemStack;
import crafttweaker.potions.IPotion;
import crafttweaker.event.EntityLivingDamageEvent;
import crafttweaker.entity.IEntityEquipmentSlot;
import crafttweaker.entity.IEntityLivingBase;
import scripts.classes.wildcards;

function hasArmor(helmet as IItemStack, chestplate as IItemStack, legging as IItemStack, boot as IItemStack) as bool {

    var condition = 0;

    val Helmets = [
        <metallurgy:platinum_helmet>,
        <metallurgy:vyroxeres_helmet>,
        <metallurgy:ceruclase_helmet>,
        <metallurgy:atlarus_helmet>,
        <metallurgy:midasium_helmet>,
        <mod_lavacow:swinemask>,
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
        <srparasites:armor_helm_sentient>.withTag({warlock: 1})
    ] as IItemStack[];

    val Chestplates = [
        <metallurgy:platinum_chestplate>,
        <metallurgy:vyroxeres_chestplate>,
        <metallurgy:ceruclase_chestplate>,
        <metallurgy:atlarus_chestplate>,
        <metallurgy:midasium_chestplate>,
        <mod_lavacow:swinearmor_chestplate>,
        <minecraft:elytra>,
        <erebus:glider_chestplate>,
        <erebus:glider_chestplate_powered>,
        <srparasites:armor_chest_sentient>.withTag({warlock: 1})
    ] as IItemStack[];

    val Leggings = [
        <metallurgy:platinum_leggings>,
        <metallurgy:vyroxeres_leggings>,
        <metallurgy:ceruclase_leggings>,
        <metallurgy:atlarus_leggings>,
        <metallurgy:midasium_leggings>,
        <mod_lavacow:swinearmor_leggings>,
        <erebus:sprint_leggings>,
        <srparasites:armor_pants_sentient>.withTag({warlock: 1})
    ] as IItemStack[];

    val Boots = [
        <metallurgy:platinum_boots>,
        <metallurgy:vyroxeres_boots>,
        <metallurgy:ceruclase_boots>,
        <metallurgy:atlarus_boots>,
        <metallurgy:midasium_boots>,
        <mod_lavacow:swinearmor_boots>,
        <erebus:jump_boots>,
        <erebus:water_striders>,
        <cqrepoured:boots_cloud>,
        <srparasites:armor_boots_sentient>.withTag({warlock: 1})
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

    for wildcard in wildcards.getWildcards() {
        if (<srparasites:armor_helm_sentient>.withTag({warlock: 1}).anyDamage().matches(helmet)) { condition += 1; }
        if (<srparasites:armor_chest_sentient>.withTag({warlock: 1}).anyDamage().matches(chestplate)) { condition += 1; }
        if (<srparasites:armor_pants_sentient>.withTag({warlock: 1}).anyDamage().matches(legging)) { condition += 1; }
        if (<srparasites:armor_boots_sentient>.withTag({warlock: 1}).anyDamage().matches(boot)) { condition += 1; }
    }

    if condition == 4 { return true; }

    return false;
}

val spellPotions = [
    <potion:ebwizardry:frost>,
    <potion:ebwizardry:transience>,
    <potion:ebwizardry:fireskin>,
    <potion:ebwizardry:ice_shroud>,
    <potion:ebwizardry:static_aura>,
    <potion:ebwizardry:decay>,
    <potion:ebwizardry:sixth_sense>,
    <potion:ebwizardry:arcane_jammer>,
    <potion:ebwizardry:mind_trick>,
    <potion:ebwizardry:mind_control>,
    <potion:ebwizardry:font_of_mana>,
    <potion:ebwizardry:fear>,
    <potion:ebwizardry:curse_of_soulbinding>,
    <potion:ebwizardry:paralysis>,
    <potion:ebwizardry:muffle>,
    <potion:ebwizardry:ward>,
    <potion:ebwizardry:slow_time>,
    <potion:ebwizardry:empowerment>,
    <potion:ebwizardry:curse_of_enfeeblement>,
    <potion:ebwizardry:curse_of_undeath>,
    <potion:ebwizardry:containment>,
    <potion:ebwizardry:frost_step>,
    <potion:ebwizardry:mark_of_sacrifice>,
    <potion:ebwizardry:mirage>,
    <potion:ebwizardry:oakflesh>,
    <potion:ebwizardry:ironflesh>,
    <potion:ebwizardry:diamondflesh>
] as IPotion[];



events.register(function(event as EntityLivingDamageEvent){
    if event.entityLivingBase.world.isRemote() { return; }

    var player as IPlayer = event.damageSource.trueSource;
    var playerSource = event.damageSource.trueSource instanceof IPlayer;

    if (event.entityLivingBase.alive && playerSource && hasArmor(player.getItemInSlot(IEntityEquipmentSlot.head()), player.getItemInSlot(IEntityEquipmentSlot.chest()), player.getItemInSlot(IEntityEquipmentSlot.legs()), player.getItemInSlot(IEntityEquipmentSlot.feet())) && wildcards.isWithinLimit(player)) { 
        
        for iiii in spellPotions {
            if (player.isPotionActive(iiii)) {
                var count = 0;
                

                for eeee in spellPotions {
                    if player.isPotionActive(eeee) {
                        count += 1;
                    }
                }

                if (event.damageSource.magicDamage && count > 0) { 
                    var damageFormula = 1.0 + (0.022 * count) as float; 
                    event.amount *= damageFormula; 
                    player.sendPlaySoundPacket("lycanitesmobs:projectile.arcanelaser", "player", player.position, 1.0, 1.5); 
                    count = 0;
                }
            }
        }
    }

    if event.entityLivingBase instanceof IPlayer {
        
        var playerv as IPlayer = event.entityLivingBase;

        if (event.damageSource.trueSource instanceof IEntityLivingBase && isSentientArmor(playerv.getItemInSlot(IEntityEquipmentSlot.head()), playerv.getItemInSlot(IEntityEquipmentSlot.chest()), playerv.getItemInSlot(IEntityEquipmentSlot.legs()), playerv.getItemInSlot(IEntityEquipmentSlot.feet())) && wildcards.isWithinLimit(playerv)) {

            for iiii in spellPotions {
                if (player.isPotionActive(iiii)) {
                        var count = 0;
                        
                    for eeee in spellPotions {
                        if player.isPotionActive(eeee) {
                            count += 1;
                        }
                    }

                    if count > 0 { 
                        var damageFormula = 1.0 - (0.10 * count) as float; 
                        event.amount *= damageFormula; 
                        count = 0;
                    }
                }
            }
        }
    }
});

// holding different wands gives you effects

val wandpotions = [
    <potion:potioncore:iron_skin>,
    <potion:potioncore:extension>,
    <potion:scalinghealth:bandaged>,
    <potion:minecraft:luck>,
    <potion:lycanitesmobs:cleansed>,
    <potion:lycanitesmobs:repulsion>,
    <potion:potioncore:slow_fall>,
    <potion:rlmixins:lesser_fire_resistance>,
    <potion:minecraft:fire_resistance>
] as IPotion[];

events.register(function(event as crafttweaker.event.EntityLivingEquipmentChangeEvent){
    if event.entityLivingBase.world.isRemote() return;
    if !event.entityLivingBase instanceof IPlayer return;

    var player as IPlayer = event.entityLivingBase;

    if (!hasArmor(player.getItemInSlot(IEntityEquipmentSlot.head()), player.getItemInSlot(IEntityEquipmentSlot.chest()), player.getItemInSlot(IEntityEquipmentSlot.legs()), player.getItemInSlot(IEntityEquipmentSlot.feet())) || !wildcards.isWithinLimit(player)) return;

    for wandpotion in wandpotions {
        if (player.isPotionActive(wandpotion) && !event.oldItem.matches(event.newItem)) {
            player.removePotionEffect(wandpotion);
        }
    }
});

events.register(function(event as crafttweaker.event.PlayerTickEvent){
    if (event.side == "CLIENT" || event.phase == "END") return;
    if (event.player.world.time % 200 != 0) return;

    var player = event.player;

    if (!hasArmor(player.getItemInSlot(IEntityEquipmentSlot.head()), player.getItemInSlot(IEntityEquipmentSlot.chest()), player.getItemInSlot(IEntityEquipmentSlot.legs()), player.getItemInSlot(IEntityEquipmentSlot.feet())) || !wildcards.isWithinLimit(player)) return;

    // basic wand
    if (<ebwizardry:magic_wand>.anyDamage().matches(player.mainHandHeldItem) || <ebwizardry:magic_wand>.anyDamage().matches(player.offHandHeldItem)) {
        event.player.addPotionEffect(<potion:potioncore:iron_skin>.makePotionEffect(400, 0));
    }

    if (<ebwizardry:apprentice_wand>.anyDamage().matches(player.mainHandHeldItem) || <ebwizardry:apprentice_wand>.anyDamage().matches(player.offHandHeldItem)) {
        event.player.addPotionEffect(<potion:potioncore:iron_skin>.makePotionEffect(400, 1));
    }
    
    if (<ebwizardry:advanced_wand>.anyDamage().matches(player.mainHandHeldItem) || <ebwizardry:advanced_wand>.anyDamage().matches(player.offHandHeldItem)) {
        event.player.addPotionEffect(<potion:potioncore:iron_skin>.makePotionEffect(400, 2));
    }
    
    if (<ebwizardry:master_wand>.anyDamage().matches(player.mainHandHeldItem) || <ebwizardry:master_wand>.anyDamage().matches(player.offHandHeldItem)) {
        event.player.addPotionEffect(<potion:potioncore:iron_skin>.makePotionEffect(400, 3));
    }

    //sorcerer wand
    if (<ebwizardry:novice_sorcery_wand>.anyDamage().matches(player.mainHandHeldItem) || <ebwizardry:novice_sorcery_wand>.anyDamage().matches(player.offHandHeldItem)) {
        event.player.addPotionEffect(<potion:potioncore:extension>.makePotionEffect(40, 0));
    }
    
    if (<ebwizardry:apprentice_sorcery_wand>.anyDamage().matches(player.mainHandHeldItem) || <ebwizardry:apprentice_sorcery_wand>.anyDamage().matches(player.offHandHeldItem)) {
        event.player.addPotionEffect(<potion:potioncore:extension>.makePotionEffect(60, 1));
    }
    
    if (<ebwizardry:advanced_sorcery_wand>.anyDamage().matches(player.mainHandHeldItem) || <ebwizardry:advanced_sorcery_wand>.anyDamage().matches(player.offHandHeldItem)) {
        event.player.addPotionEffect(<potion:potioncore:extension>.makePotionEffect(80, 2));
    }
    
    if (<ebwizardry:master_sorcery_wand>.anyDamage().matches(player.mainHandHeldItem) || <ebwizardry:master_sorcery_wand>.anyDamage().matches(player.offHandHeldItem)) {
        event.player.addPotionEffect(<potion:potioncore:extension>.makePotionEffect(100, 3));
    }

    //healing wand
    if (<ebwizardry:novice_healing_wand>.anyDamage().matches(player.mainHandHeldItem) || <ebwizardry:novice_healing_wand>.anyDamage().matches(player.offHandHeldItem)) {
        event.player.addPotionEffect(<potion:scalinghealth:bandaged>.makePotionEffect(400, 0));
    }
    
    if (<ebwizardry:apprentice_healing_wand>.anyDamage().matches(player.mainHandHeldItem) || <ebwizardry:apprentice_healing_wand>.anyDamage().matches(player.offHandHeldItem)) {
        event.player.addPotionEffect(<potion:scalinghealth:bandaged>.makePotionEffect(400, 1));
    }
    
    if (<ebwizardry:advanced_healing_wand>.anyDamage().matches(player.mainHandHeldItem) || <ebwizardry:advanced_healing_wand>.anyDamage().matches(player.offHandHeldItem)) {
        event.player.addPotionEffect(<potion:scalinghealth:bandaged>.makePotionEffect(400, 2));
    }
    
    if (<ebwizardry:master_healing_wand>.anyDamage().matches(player.mainHandHeldItem) || <ebwizardry:master_healing_wand>.anyDamage().matches(player.offHandHeldItem)) {
        event.player.addPotionEffect(<potion:scalinghealth:bandaged>.makePotionEffect(400, 3));
    }

    //earth wand
    if (<ebwizardry:novice_earth_wand>.anyDamage().matches(player.mainHandHeldItem) || <ebwizardry:novice_earth_wand>.anyDamage().matches(player.offHandHeldItem)) {
        event.player.addPotionEffect(<potion:minecraft:luck>.makePotionEffect(400, 0));
    }
    
    if (<ebwizardry:apprentice_earth_wand>.anyDamage().matches(player.mainHandHeldItem) || <ebwizardry:apprentice_earth_wand>.anyDamage().matches(player.offHandHeldItem)) {
        event.player.addPotionEffect(<potion:minecraft:luck>.makePotionEffect(400, 1));
    }
    
    if (<ebwizardry:advanced_earth_wand>.anyDamage().matches(player.mainHandHeldItem) || <ebwizardry:advanced_earth_wand>.anyDamage().matches(player.offHandHeldItem)) {
        event.player.addPotionEffect(<potion:minecraft:luck>.makePotionEffect(400, 2));
    }
    
    if (<ebwizardry:master_earth_wand>.anyDamage().matches(player.mainHandHeldItem) || <ebwizardry:master_earth_wand>.anyDamage().matches(player.offHandHeldItem)) {
        event.player.addPotionEffect(<potion:minecraft:luck>.makePotionEffect(400, 3));
    }

    //dark wand
    if (<ebwizardry:novice_necromancy_wand>.anyDamage().matches(player.mainHandHeldItem) || <ebwizardry:novice_necromancy_wand>.anyDamage().matches(player.offHandHeldItem)) {
        event.player.addPotionEffect(<potion:lycanitesmobs:cleansed>.makePotionEffect(50, 0));
    }
    
    if (<ebwizardry:apprentice_necromancy_wand>.anyDamage().matches(player.mainHandHeldItem) || <ebwizardry:apprentice_necromancy_wand>.anyDamage().matches(player.offHandHeldItem)) {
        event.player.addPotionEffect(<potion:lycanitesmobs:cleansed>.makePotionEffect(100, 0));
    }
    
    if (<ebwizardry:advanced_necromancy_wand>.anyDamage().matches(player.mainHandHeldItem) || <ebwizardry:advanced_necromancy_wand>.anyDamage().matches(player.offHandHeldItem)) {
        event.player.addPotionEffect(<potion:lycanitesmobs:cleansed>.makePotionEffect(150, 0));
    }
    
    if (<ebwizardry:master_necromancy_wand>.anyDamage().matches(player.mainHandHeldItem) || <ebwizardry:master_necromancy_wand>.anyDamage().matches(player.offHandHeldItem)) {
        event.player.addPotionEffect(<potion:lycanitesmobs:cleansed>.makePotionEffect(400, 0));
    }

    //lightning wand
    if (<ebwizardry:novice_lightning_wand>.anyDamage().matches(player.mainHandHeldItem) || <ebwizardry:novice_lightning_wand>.anyDamage().matches(player.offHandHeldItem)) {
        event.player.addPotionEffect(<potion:lycanitesmobs:repulsion>.makePotionEffect(400, 0));
    }
    
    if (<ebwizardry:apprentice_lightning_wand>.anyDamage().matches(player.mainHandHeldItem) || <ebwizardry:apprentice_lightning_wand>.anyDamage().matches(player.offHandHeldItem)) {
        event.player.addPotionEffect(<potion:lycanitesmobs:repulsion>.makePotionEffect(400, 1));
    }
    
    if (<ebwizardry:advanced_lightning_wand>.anyDamage().matches(player.mainHandHeldItem) || <ebwizardry:advanced_lightning_wand>.anyDamage().matches(player.offHandHeldItem)) {
        event.player.addPotionEffect(<potion:lycanitesmobs:repulsion>.makePotionEffect(400, 2));
    }
    
    if (<ebwizardry:master_lightning_wand>.anyDamage().matches(player.mainHandHeldItem) || <ebwizardry:master_lightning_wand>.anyDamage().matches(player.offHandHeldItem)) {
        event.player.addPotionEffect(<potion:lycanitesmobs:repulsion>.makePotionEffect(400, 3));
    }

    //ice wand
    if (<ebwizardry:novice_ice_wand>.anyDamage().matches(player.mainHandHeldItem) || <ebwizardry:novice_ice_wand>.anyDamage().matches(player.offHandHeldItem)) {
        event.player.addPotionEffect(<potion:potioncore:slow_fall>.makePotionEffect(400, 0));
    }
    
    if (<ebwizardry:apprentice_ice_wand>.anyDamage().matches(player.mainHandHeldItem) || <ebwizardry:apprentice_ice_wand>.anyDamage().matches(player.offHandHeldItem)) {
        event.player.addPotionEffect(<potion:potioncore:slow_fall>.makePotionEffect(400, 1));
    }
    
    if (<ebwizardry:advanced_ice_wand>.anyDamage().matches(player.mainHandHeldItem) || <ebwizardry:advanced_ice_wand>.anyDamage().matches(player.offHandHeldItem)) {
        event.player.addPotionEffect(<potion:potioncore:slow_fall>.makePotionEffect(400, 2));
    }
    
    if (<ebwizardry:master_ice_wand>.anyDamage().matches(player.mainHandHeldItem) || <ebwizardry:master_ice_wand>.anyDamage().matches(player.offHandHeldItem)) {
        event.player.addPotionEffect(<potion:potioncore:slow_fall>.makePotionEffect(400, 3));
    }

    //fire wand
    if (<ebwizardry:novice_fire_wand>.anyDamage().matches(player.mainHandHeldItem) || <ebwizardry:novice_fire_wand>.anyDamage().matches(player.offHandHeldItem)) {
        event.player.addPotionEffect(<potion:rlmixins:lesser_fire_resistance>.makePotionEffect(400, 0));
    }
    
    if (<ebwizardry:apprentice_fire_wand>.anyDamage().matches(player.mainHandHeldItem) || <ebwizardry:apprentice_fire_wand>.anyDamage().matches(player.offHandHeldItem)) {
        event.player.addPotionEffect(<potion:rlmixins:lesser_fire_resistance>.makePotionEffect(400, 1));
    }
    
    if (<ebwizardry:advanced_fire_wand>.anyDamage().matches(player.mainHandHeldItem) || <ebwizardry:advanced_fire_wand>.anyDamage().matches(player.offHandHeldItem)) {
        event.player.addPotionEffect(<potion:rlmixins:lesser_fire_resistance>.makePotionEffect(400, 2));
    }
    
    if (<ebwizardry:master_fire_wand>.anyDamage().matches(player.mainHandHeldItem) || <ebwizardry:master_fire_wand>.anyDamage().matches(player.offHandHeldItem)) {
        event.player.addPotionEffect(<potion:minecraft:fire_resistance>.makePotionEffect(400, 0));
    }
});