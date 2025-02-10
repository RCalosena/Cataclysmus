#reloadable

import crafttweaker.player.IPlayer;
import crafttweaker.item.IItemStack;
import crafttweaker.potions.IPotion;
import crafttweaker.event.EntityLivingHealEvent;
import crafttweaker.entity.IEntityEquipmentSlot;
import crafttweaker.entity.IEntityMob;
import crafttweaker.entity.IEntityCreature;

function hasArmor(helmet as IItemStack, chestplate as IItemStack, legging as IItemStack, boot as IItemStack) as bool {

    var condition = 0;

val Helmets = [
    <cqrepoured:helmet_inquisition>,
    <mod_lavacow:felarmor_helmet>,
    <metallurgy:ignatius_helmet>,
    <mod_lavacow:chitinarmor_helmet>,
    <metallurgy:damascus_steel_helmet>,
    <midnight:rockshroom_helmet>,
    <metallurgy:inolashite_helmet>,
    <srparasites:armor_helm_sentient>.withTag({necromancer: 1})
] as IItemStack[];

val Chestplates = [
    <cqrepoured:chestplate_inquisition>,
    <mod_lavacow:felarmor_chestplate>,
    <metallurgy:ignatius_chestplate>,
    <metallurgy:damascus_steel_chestplate>,
    <mod_lavacow:chitinarmor_chestplate>,
    <midnight:rockshroom_chestplate>,
    <metallurgy:inolashite_chestplate>,
    <srparasites:armor_chest_sentient>.withTag({necromancer: 1})
] as IItemStack[];

val Leggings = [
    <cqrepoured:leggings_inquisition>,
    <mod_lavacow:felarmor_leggings>,
    <metallurgy:ignatius_leggings>,
    <metallurgy:damascus_steel_leggings>,
    <mod_lavacow:chitinarmor_leggings>,
    <midnight:rockshroom_leggings>,
    <metallurgy:inolashite_leggings>,
    <srparasites:armor_pants_sentient>.withTag({necromancer: 1})
] as IItemStack[];

val Boots = [
    <cqrepoured:boots_inquisition>,
    <mod_lavacow:felarmor_boots>,
    <metallurgy:ignatius_boots>,
    <metallurgy:damascus_steel_boots>,
    <mod_lavacow:chitinarmor_boots>,
    <midnight:rockshroom_boots>,
    <metallurgy:inolashite_boots>,
    <srparasites:armor_boots_sentient>.withTag({necromancer: 1})
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

        if (<srparasites:armor_helm_sentient>.withTag({necromancer: 1}).anyDamage().matches(helmet)) { condition += 1; }
        if (<srparasites:armor_chest_sentient>.withTag({necromancer: 1}).anyDamage().matches(chestplate)) { condition += 1; }
        if (<srparasites:armor_pants_sentient>.withTag({necromancer: 1}).anyDamage().matches(legging)) { condition += 1; }
        if (<srparasites:armor_boots_sentient>.withTag({necromancer: 1}).anyDamage().matches(boot)) { condition += 1; }

    if condition == 4 { return true; }

    return false;

    if condition > 0 { condition = 0; }
}

//Generic class formula
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



events.register(function(event as EntityLivingHealEvent){
    if event.entityLivingBase.world.isRemote() { return; }
    if !event.entityLivingBase instanceof IPlayer { return; }

    var player as IPlayer = event.entityLivingBase;

    if !hasArmor(player.getItemInSlot(IEntityEquipmentSlot.head()), player.getItemInSlot(IEntityEquipmentSlot.chest()), player.getItemInSlot(IEntityEquipmentSlot.legs()), player.getItemInSlot(IEntityEquipmentSlot.feet())) { return; }

if (event.entityLivingBase.alive) { 

    for iiii in spellPotions {
            if (player.isPotionActive(iiii)) {
                var count = 0;
                

for eeee in spellPotions {
    if player.isPotionActive(eeee) {
        count += 1;
    }
}

        if count > 0 { player.sendPlaySoundPacket("ebwizardry:spell.agility", "player", player.position, 0.6, 1.5); var healFormula = 1.0 + (0.022 * count) as float; event.amount *= healFormula; }

            if count > 0 { count = 0; }

            }
        }
}});
//Generic class formula

//Summoning Staff allowed
events.register(function(event as crafttweaker.event.EntityLivingEquipmentChangeEvent){
if (event.entityLivingBase.world.isRemote()) { return; }
if !event.entityLivingBase instanceof IPlayer { return; }
    var player as IPlayer = event.entityLivingBase;

    if (hasArmor(player.getItemInSlot(IEntityEquipmentSlot.head()), player.getItemInSlot(IEntityEquipmentSlot.chest()), player.getItemInSlot(IEntityEquipmentSlot.legs()), player.getItemInSlot(IEntityEquipmentSlot.feet())) && !player.hasGameStage("Necromancer")) {
        player.addGameStage("Necromancer");
    } else { player.removeGameStage("Necromancer"); }
});
//Summoning Staff allowed

//Lifesteal
events.register(function(event as crafttweaker.event.EntityLivingDamageEvent){
    if event.entityLivingBase.world.isRemote() { return; }
    if !event.damageSource.magicDamage { return; }
    if isNull(event.damageSource.trueSource) { return; }
    if !event.damageSource.trueSource instanceof IPlayer { return; }

    var player as IPlayer = event.damageSource.trueSource;

    if (hasArmor(player.getItemInSlot(IEntityEquipmentSlot.head()), player.getItemInSlot(IEntityEquipmentSlot.chest()), player.getItemInSlot(IEntityEquipmentSlot.legs()), player.getItemInSlot(IEntityEquipmentSlot.feet())) && !isNull(event.entityLivingBase) && player.health != player.maxHealth) {
        player.heal(1.0);
        server.commandManager.executeCommandSilent(server,"particle heart " ~ player.x ~ " " ~ player.y ~ " " ~ player.z ~ " 0.5 2 0.5 0 2 force @a");
    }
    if (isSentientArmor(player.getItemInSlot(IEntityEquipmentSlot.head()), player.getItemInSlot(IEntityEquipmentSlot.chest()), player.getItemInSlot(IEntityEquipmentSlot.legs()), player.getItemInSlot(IEntityEquipmentSlot.feet())) && !isNull(event.entityLivingBase) && player.health == player.maxHealth) {
        event.entityLivingBase.addPotionEffect(<potion:potioncore:vulnerable>.makePotionEffect(40, 0));
    }
});
//Lifesteal