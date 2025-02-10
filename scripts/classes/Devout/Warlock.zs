#reloadable

import crafttweaker.player.IPlayer;
import crafttweaker.item.IItemStack;
import crafttweaker.potions.IPotion;
import crafttweaker.event.EntityLivingDamageEvent;
import crafttweaker.entity.IEntityEquipmentSlot;
import crafttweaker.entity.IEntityLivingBase;

function hasArmor(helmet as IItemStack, chestplate as IItemStack, legging as IItemStack, boot as IItemStack) as bool {

    var condition = 0;

val Helmets = [
    <metallurgy:platinum_helmet>,
    <metallurgy:vyroxeres_helmet>,
    <metallurgy:ceruclase_helmet>,
    <metallurgy:atlarus_helmet>,
    <metallurgy:midasium_helmet>,
    <mod_lavacow:swinemask>,
    <srparasites:armor_helm_sentient>.withTag({warlock: 1})
] as IItemStack[];

val Chestplates = [
    <metallurgy:platinum_chestplate>,
    <metallurgy:vyroxeres_chestplate>,
    <metallurgy:ceruclase_chestplate>,
    <metallurgy:atlarus_chestplate>,
    <metallurgy:midasium_chestplate>,
    <mod_lavacow:swinearmor_chestplate>,
    <srparasites:armor_chest_sentient>.withTag({warlock: 1})
] as IItemStack[];

val Leggings = [
    <metallurgy:platinum_leggings>,
    <metallurgy:vyroxeres_leggings>,
    <metallurgy:ceruclase_leggings>,
    <metallurgy:atlarus_leggings>,
    <metallurgy:midasium_leggings>,
    <mod_lavacow:swinearmor_leggings>,
    <srparasites:armor_pants_sentient>.withTag({warlock: 1})
] as IItemStack[];

val Boots = [
    <metallurgy:platinum_boots>,
    <metallurgy:vyroxeres_boots>,
    <metallurgy:ceruclase_boots>,
    <metallurgy:atlarus_boots>,
    <metallurgy:midasium_boots>,
    <mod_lavacow:swinearmor_boots>,
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

    if condition > 0 { condition = 0; }
}

function isSentientArmor(helmet as IItemStack, chestplate as IItemStack, legging as IItemStack, boot as IItemStack) as bool {

    var condition = 0;

        if (<srparasites:armor_helm_sentient>.withTag({warlock: 1}).anyDamage().matches(helmet)) { condition += 1; }
        if (<srparasites:armor_chest_sentient>.withTag({warlock: 1}).anyDamage().matches(chestplate)) { condition += 1; }
        if (<srparasites:armor_pants_sentient>.withTag({warlock: 1}).anyDamage().matches(legging)) { condition += 1; }
        if (<srparasites:armor_boots_sentient>.withTag({warlock: 1}).anyDamage().matches(boot)) { condition += 1; }

    if condition == 4 { return true; }

    return false;

    if condition > 0 { condition = 0; }
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

if (event.entityLivingBase.alive && playerSource && hasArmor(player.getItemInSlot(IEntityEquipmentSlot.head()), player.getItemInSlot(IEntityEquipmentSlot.chest()), player.getItemInSlot(IEntityEquipmentSlot.legs()), player.getItemInSlot(IEntityEquipmentSlot.feet()))) { 
    
    for iiii in spellPotions {
            if (player.isPotionActive(iiii)) {
                var count = 0;
                

for eeee in spellPotions {
    if player.isPotionActive(eeee) {
        count += 1;
    }
}

        if count > 0 { if (playerSource && event.damageSource.magicDamage) { player.sendPlaySoundPacket("lycanitesmobs:projectile.arcanelaser", "player", player.position, 1.0, 1.5); var damageFormula = 1.0 + (0.022 * count) as float; event.amount *= damageFormula; } }

            if count > 0 { count = 0; }

            }
        }
}

if (event.entityLivingBase instanceof IPlayer && event.damageSource.trueSource instanceof IEntityLivingBase && isSentientArmor(player.getItemInSlot(IEntityEquipmentSlot.head()), player.getItemInSlot(IEntityEquipmentSlot.chest()), player.getItemInSlot(IEntityEquipmentSlot.legs()), player.getItemInSlot(IEntityEquipmentSlot.feet()))) { 
    
    for iiii in spellPotions {
            if (player.isPotionActive(iiii)) {
                var count = 0;
                

for eeee in spellPotions {
    if player.isPotionActive(eeee) {
        count += 1;
    }
}

        if count > 0 { var damageFormula = 1.0 - (0.10 * count) as float; event.amount *= damageFormula; }

            if count > 0 { count = 0; }

            }
        }
}});