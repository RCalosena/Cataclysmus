#reloadable

import crafttweaker.player.IPlayer;
import crafttweaker.entity.IEntity;
import crafttweaker.entity.IEntityArrow;
import crafttweaker.event.PlayerTickEvent;
import crafttweaker.entity.IEntityLivingBase;
import crafttweaker.item.IItemStack;
import crafttweaker.entity.IEntityEquipmentSlot;
import crafttweaker.enchantments.IEnchantmentDefinition;
import crafttweaker.entity.AttributeModifier;
import crafttweaker.entity.AttributeInstance;
import crafttweaker.data.IData;
import crafttweaker.world.IBlockPos;
import native.com.elenai.elenaidodge2.api.DodgeEvent;
import native.com.fuzs.aquaacrobatics.entity.player.IPlayerResizeable;
import scripts.classes.wildcards;
import mods.zenutils.EventPriority;
import native.net.minecraft.entity.EntityLiving;

//Armor points rework
events.register(function(event as crafttweaker.event.EntityLivingHurtEvent){ 
if event.entityLivingBase.world.isRemote() { return; }
if !event.entityLivingBase instanceof IPlayer { return; }
if event.entityLivingBase.totalArmorValue < 20 { return; }

//above diamond protection, use this formula for damage reduction
val htarmor_f = (1.0 - ((event.entityLivingBase.totalArmorValue as float * 0.008) - 0.16) as float);

event.amount *= htarmor_f;
});
//Armor points rework

//Bronze Rage Ability
function hasBronzeArmor(helmet as IItemStack, chestplate as IItemStack, legging as IItemStack, boot as IItemStack) as bool {

    var condition = 0;

    if (<metallurgy:bronze_helmet>.anyDamage().matches(helmet)) { condition += 1; }
    if (<metallurgy:bronze_chestplate>.anyDamage().matches(chestplate)) { condition += 1; }
    if (<metallurgy:bronze_leggings>.anyDamage().matches(legging)) { condition += 1; }
    if (<metallurgy:bronze_boots>.anyDamage().matches(boot)) { condition += 1; }

    for wildcard in wildcards.getWildcards() {
        if wildcard.anyDamage().matches(helmet) { condition += 1; }
        if wildcard.anyDamage().matches(chestplate) { condition += 1; }
        if wildcard.anyDamage().matches(legging) { condition += 1; }
        if wildcard.anyDamage().matches(boot) { condition += 1; }
    }

    if condition == 4 { return true; }

    return false;

    if condition > 0 { condition = 0; }
}

events.register(function(event1 as crafttweaker.event.EntityLivingDamageEvent){
    if event1.entityLivingBase.world.isRemote() { return; }
    if !event1.entityLivingBase.isPotionActive(<potion:srparasites:rage>) { return; }
	if !event1.entityLivingBase instanceof IPlayer { return; }

    var player as IPlayer = event1.entityLivingBase;
    var helmet as IItemStack = player.getItemInSlot(IEntityEquipmentSlot.head());
    var chestplate as IItemStack = player.getItemInSlot(IEntityEquipmentSlot.chest());
    var leggings as IItemStack = player.getItemInSlot(IEntityEquipmentSlot.legs());
    var boots as IItemStack = player.getItemInSlot(IEntityEquipmentSlot.feet());

    if (!hasBronzeArmor(helmet, chestplate, leggings, boots) || !wildcards.isWithinLimit(player)) { return; }

    //cut damage by 40% when rage is active
    event1.amount *= 0.6;
});
//Bronze Rage Ability

//Critical Hits Overhaul

val dodgeForce = {} as float[string];

# Melee #

//Detect ground dodges
events.register(function(event as DodgeEvent.ServerDodgeEvent){

    //get crafttweaker player
    var player = event.player.wrapper;
    if (!player.onGround && !player.isInLava && !player.isInWater && player.isBaubleEquipped(<bountifulbaubles:trinketballoon>) == -1) return;

    //save the player's dodge force for future calculations
    dodgeForce[player.uuid] = event.getForce();

    //set vertical motion for more consistent checks later
    player.motionY = 0.7;

    //track some info using nbt
    if (isNull(player.getNBT().ForgeData.FromDodge) || player.getNBT().ForgeData.FromDodge == 0) { player.setNBT({FromDodge: 1}); }
    if (isNull(player.getNBT().ForgeData.GroundTimeCrit) || player.getNBT().ForgeData.GroundTimeCrit != 0) { player.setNBT({GroundTimeCrit: 0}); }
}, EventPriority.lowest());//Make sure ED2 logic is also considered

//if performed dodge, keep track of the player
events.register(function(event as PlayerTickEvent){
    if (event.side != "SERVER" || event.phase != "START") return;
    if (isNull(event.player.getNBT().ForgeData.FromDodge) || event.player.getNBT().ForgeData.FromDodge == 0) return;
    if (isNull(event.player.getNBT().ForgeData.GroundTimeCrit)) return;
    
    var player = event.player;
    
    if player.onGround { 
        player.update({GroundTimeCrit: player.getNBT().ForgeData.GroundTimeCrit + 1}); 
        if player.getNBT().ForgeData.GroundTimeCrit >= 3 { 
            player.update({FromDodge: 0});
            player.update({GroundTimeCrit: 0});
            return;
        }
    } else {
    //tick after the player leaves the ground

        if player.getNBT().ForgeData.GroundTimeCrit > 0 {
            player.update({GroundTimeCrit: player.getNBT().ForgeData.GroundTimeCrit + 1});
        }

        //stop after the player is no longer allowed to crit
        if (player.isInWater || player.isInLava || player.isBaubleEquipped(<bountifulbaubles:trinketballoon>) != -1 || player.isPotionActive(<potion:lycanitesmobs:fear>)) { player.update({FromDodge: 0}); }
    }
});
//onCrit
events.register(function(event as crafttweaker.event.CriticalHitEvent){
    if event.player.world.isRemote() return;

    //deny crit if no data and balloon trinket
    if (isNull(event.player.getNBT().ForgeData.FromDodge) && event.player.isBaubleEquipped(<bountifulbaubles:trinketballoon>) == -1) {
        event.deny();
        return;
    }

    var player = event.player;
    var helmet as IItemStack = player.getItemInSlot(IEntityEquipmentSlot.head());
    var chestplate as IItemStack = player.getItemInSlot(IEntityEquipmentSlot.chest());
    var leggings as IItemStack = player.getItemInSlot(IEntityEquipmentSlot.legs());
    var boots as IItemStack = player.getItemInSlot(IEntityEquipmentSlot.feet());

    //Base crit modifier is now 1.2 (2.0 if you are using Bronze armor)
    if (!hasBronzeArmor(helmet, chestplate, leggings, boots) || !wildcards.isWithinLimit(player)) 
    { event.damageModifier = 1.2; } else { event.damageModifier = 2.0; }

    //track hits on player data
    if (isNull(player.getNBT().ForgeData.critCombo)) { player.setNBT({critCombo: 0}); }

    //only perform crit from dodges or balloon trinket (& only allow if falling/starting to fall)
    if ((player.isBaubleEquipped(<bountifulbaubles:trinketballoon>) != -1 || !isNull(player.getNBT().ForgeData.FromDodge) && player.getNBT().ForgeData.FromDodge == 1) && player.motionY < 0.2) {

        //If the target changes, combo resets
        var targetEntity as EntityLiving = event.target.native;
        if (player.native.lastAttackedEntity == targetEntity) {
            if (player.isBaubleEquipped(<bountifulbaubles:trinketballoon>) == -1) {
                if (player.getNBT().ForgeData.critCombo as int < 7) {
                    //Consecutive critical strikes cap at 8 (initial strike + 7)
                    player.setNBT({critCombo: player.getNBT().ForgeData.critCombo as int + 1});
                }
            } else {
                if (player.getNBT().ForgeData.critCombo as int < 3) {
                    //Consecutive critical strikes with the balloon cap at 4 (initial strike + 3)
                    player.setNBT({critCombo: player.getNBT().ForgeData.critCombo as int + 1});
                }
            }

            //Modifiers
            var combo = player.getNBT().ForgeData.critCombo as float;
            var comboDamageModifier = (1.0 + (0.3 * combo)) as float;
            var comboDamageModifierBronze = (1.0 + (0.4 * combo)) as float;

            if player.getNBT().ForgeData.critCombo > 0 {  

                //Apply modifiers based on combo count (higher modifier for bronze armor)
                if (!hasBronzeArmor(helmet, chestplate, leggings, boots) || !wildcards.isWithinLimit(player)) {
                    event.damageModifier = 1.2 * comboDamageModifier; 
                } else { 
                    player.sendPlaySoundPacket("metallurgy:crusher_impact", "player", player.position, 1.0, 1.2);
                    event.damageModifier = 2.0 * comboDamageModifierBronze; 
                }
            }

        } else { player.update({critCombo: 0}); }
        
        //require another dodge for the next crit
        if !isNull(player.getNBT().ForgeData.FromDodge) { player.update({FromDodge: 0}); }

        //Allow Crits
        if player.isBaubleEquipped(<bountifulbaubles:trinketballoon>) == -1 {
            event.allow();
        } else if (!player.onGround && !player.isInWater && !player.isInLava && !player.isPotionActive(<potion:lycanitesmobs:fear>)) { event.allow(); }

    } else { event.deny(); player.update({critCombo: 0}); }
});

# Ranged #

val TrackedArrow as int[string] = {};

events.register(function(event as crafttweaker.event.EntityJoinWorldEvent){

    if (event.world.isRemote() || !event.entity instanceof IEntityArrow) return;

    var arrow as IEntityArrow = event.entity;

    if (!arrow.isCritical || !arrow.shooter instanceof IPlayer) return;

    var player as IPlayer = arrow.shooter;

    //if the player is rising from a dodge
    if (player.motionY > 0.4 && !isNull(dodgeForce[player.uuid]) && !isNull(player.getNBT().ForgeData.FromDodge) && player.getNBT().ForgeData.FromDodge == 1) {
        
        //set tag to allow tracking and allow early returns later for performance reasons
        if isNull(TrackedArrow[arrow.getUUIDObject()]) {
            TrackedArrow[arrow.getUUIDObject()] = 1;
        }

        // slightly modify the arc of the arrows to make them feel consistent when dodging
        if (player.motionY > 0.65) {
            arrow.motionY += 0.20;
        } else {
            arrow.motionY -= 0.35;
        }

        // increase speed (based on the force of the dodges too)
        // speed also affects damage so the overall damage output will be higher
        arrow.motionZ *= 1.2 * (1.0 + (dodgeForce[player.uuid] - 0.55));
        arrow.motionX *= 1.2 * (1.0 + (dodgeForce[player.uuid] - 0.55));
        arrow.motionY *= 1.2 * (1.0 + (dodgeForce[player.uuid] - 0.55));

        // compatibility with switchbow (projectileImpact events don't work with this mod for some reason)
        if arrow.definition.id.contains("switchbow:") {
            //keep track of the arrow while it is in the air
            arrow.definition.onTick(function(entity) {
                if (isNull(TrackedArrow[arrow.getUUIDObject()]) || TrackedArrow[arrow.getUUIDObject()] == 0) { return; }
                if arrow.shake > 0 {
                    //arrows traveling through the air will always break when hitting a block
                    //arrows underwater will not break unless they are switchbow's underwater arrows
                    if ((!event.entity.isInWater && !event.entity.isInLava) || arrow.definition.id == "switchbow:arrowunderwater") {
                        arrow.setDead(); 
                        server.commandManager.executeCommandSilent(server,"particle iconcrack " ~ arrow.x ~ " " ~ arrow.y ~ " " ~ arrow.z ~ " 0.2 0.2 0.2 0 10 force @a 262");
                        server.commandManager.executeCommandSilent(server,"playsound minecraft:entity.item.break player @a " + arrow.x + " " + arrow.y + " " + arrow.z + " 2 1");
                    }
                    //stop keeping track of the arrow once it impacts something
                    TrackedArrow[arrow.getUUIDObject()] = 0;
                }
            });
        }
    }
});

//crit handling for switchbow
events.register(function(event as crafttweaker.event.EntityLivingAttackedEvent){
    if event.entityLivingBase.world.isRemote() return;
    if (isNull(event.damageSource.trueSource) || !event.damageSource.trueSource instanceof IPlayer) return;
    var player as IPlayer = event.damageSource.trueSource;
    if (isNull(event.damageSource.immediateSource) || !event.damageSource.immediateSource instanceof IEntityArrow) return;
    if (isNull(event.damageSource.immediateSource.definition) || !event.damageSource.immediateSource.definition.id.contains("switchbow:")) return;
    if (isNull(TrackedArrow[event.damageSource.immediateSource.getUUIDObject()]) || TrackedArrow[event.damageSource.immediateSource.getUUIDObject()] == 0) { return; }

    if (event.damageSource.immediateSource.native.isOffsetPositionInLiquid(0,0,0) || event.damageSource.immediateSource.definition.id == "switchbow:arrowunderwater") {
        server.commandManager.executeCommandSilent(server,"particle crit " ~ event.damageSource.immediateSource.x ~ " " ~ event.damageSource.immediateSource.y ~ " " ~ event.damageSource.immediateSource.z ~ " 0.5 0.5 0.5 0 15 force @a");
        server.commandManager.executeCommandSilent(server,"playsound minecraft:entity.player.attack.crit player @a " + event.damageSource.immediateSource.x + " " + event.damageSource.immediateSource.y + " " + event.damageSource.immediateSource.z + " 1 1");
        var arrow as IEntityArrow = event.damageSource.immediateSource;
        arrow.knockbackStrength += 2 * (1.0 + ((dodgeForce[player.uuid] - 0.55) * 2) as int);
    }
});

// crit handling
events.register(function(event as crafttweaker.event.ProjectileImpactArrowEvent){
    if event.arrow.world.isRemote() return;
    if (isNull(event.shooter) || !event.shooter instanceof IPlayer) return;
    var player as IPlayer = event.shooter;
    if (isNull(TrackedArrow[event.arrow.getUUIDObject()]) || TrackedArrow[event.arrow.getUUIDObject()] == 0) return;

    var entity as IEntity = event.entity;

    // if the impact was on a block, break the arrow (unless the arrow is on a liquid)
    if event.rayTrace.isBlock {
        if (entity.native.isOffsetPositionInLiquid(0,0,0)) {
            event.entity.setDead(); 
            server.commandManager.executeCommandSilent(server,"particle iconcrack " ~ event.arrow.x ~ " " ~ event.arrow.y ~ " " ~ event.arrow.z ~ " 0.2 0.2 0.2 0 10 force @a 262");
            server.commandManager.executeCommandSilent(server,"playsound minecraft:entity.item.break player @a " + event.arrow.x + " " + event.arrow.y + " " + event.arrow.z + " 2 1");
        }
    } else {
        // if the impact was on an entity, deal the critical strike and increase knockback (damage is already handled by the arrow's speed)
        if (entity.native.isOffsetPositionInLiquid(0,0,0)) {
            server.commandManager.executeCommandSilent(server,"particle crit " ~ event.entity.x ~ " " ~ event.entity.y ~ " " ~ event.entity.z ~ " 0.5 0.5 0.5 0 15 force @a");
            server.commandManager.executeCommandSilent(server,"playsound minecraft:entity.player.attack.crit player @a " + event.entity.x + " " + event.entity.y + " " + event.entity.z + " 1 1");
            server.commandManager.executeCommandSilent(server,"playsound minecraft:entity.zombie.break_door_wood player @a " + event.entity.x + " " + event.entity.y + " " + event.entity.z + " 0.4 2");
            event.knockbackStrength = event.arrow.knockbackStrength + 2 * (1.0 + ((dodgeForce[player.uuid] - 0.55) * 2) as int);
        }
    }
});

# Mage #

// currently unused because main/offhand interactions and also things like continuous spells are making it difficult to implement

/*
static potencyDodgeUUID as string = "eb0c4f2f-5164-443a-8211-be99d97f013d";

events.register(function(event as DodgeEvent.ServerDodgeEvent){

    //get crafttweaker player
    var player = event.player.wrapper;

    if (!isNull(player.getNBT().ForgeData.UsingWand) && player.getNBT().ForgeData.UsingWand == 1) {
        event.setForce(0.0);

        if !isNull(player.getNBT().ForgeData.FromDodge) {
            player.update({FromDodge: 1});
        }
    }
}, EventPriority.low());

events.onEntityLivingUseItemTick(function(event as crafttweaker.event.EntityLivingUseItemEvent.Tick){
    if event.entityLivingBase.world.isRemote() return;
    if (!event.item.definition.id.contains("wand") || !event.item.definition.id.contains("ebwizardry:")) return;
    if !event.isPlayer return;

    var player = event.player;

    player.setNBT({UsingWand: 1});
    
    if isNull(event.item.tag.DodgeChargedTicks) {
        event.item.mutable().updateTag({DodgeChargedTicks: 0});
    }

    if (!isNull(player.getNBT().ForgeData.FromDodge) && player.getNBT().ForgeData.FromDodge == 1){

        event.item.mutable().updateTag({DodgeChargedTicks: event.item.tag.DodgeChargedTicks + 20});
        print(event.item.tag.DodgeChargedTicks);

        player.update({FromDodge: 0});
    }

    
});

events.register(function(event as PlayerTickEvent){
    if (event.player.world.isRemote()) return;

    var player = event.player;
    var mainhand = player.mainHandHeldItem;
    var offhand = player.offHandHeldItem;

    if (!isNull(mainhand) && (!isNull(mainhand.tag.DodgeChargedTicks) && mainhand.tag.DodgeChargedTicks > 0)) { 


        var DodgeModifier as AttributeModifier = AttributeModifier.createModifier("absorbedDodges", (0.05 * (mainhand.tag.DodgeChargedTicks / 20)), 1, potencyDodgeUUID);

        player.getAttribute("wizardryutils.SpellPotency").removeModifier(potencyDodgeUUID);
        print(player.getAttribute("wizardryutils.SpellPotency").getAttributeValue());
        player.getAttribute("wizardryutils.SpellPotency").applyModifier(DodgeModifier);
        print(player.getAttribute("wizardryutils.SpellPotency").getAttributeValue());

        mainhand.updateTag({DodgeChargedTicks: mainhand.tag.DodgeChargedTicks - 1});
        print(mainhand.tag.DodgeChargedTicks);

    }

    if (!isNull(offhand) && (!isNull(offhand.tag.DodgeChargedTicks) && offhand.tag.DodgeChargedTicks > 0)) { 


        var DodgeModifier as AttributeModifier = AttributeModifier.createModifier("absorbedDodges", (0.05 * (offhand.tag.DodgeChargedTicks / 20)), 1, potencyDodgeUUID);

        player.getAttribute("wizardryutils.SpellPotency").removeModifier(potencyDodgeUUID);
        print(player.getAttribute("wizardryutils.SpellPotency").getAttributeValue());
        player.getAttribute("wizardryutils.SpellPotency").applyModifier(DodgeModifier);
        print(player.getAttribute("wizardryutils.SpellPotency").getAttributeValue());

        offhand.updateTag({DodgeChargedTicks: offhand.tag.DodgeChargedTicks - 1});
        print(offhand.tag.DodgeChargedTicks);

    }
});

events.onEntityLivingUseItemStop(function(event as crafttweaker.event.EntityLivingUseItemEvent.Stop){
    if event.entityLivingBase.world.isRemote() return;
    if (!event.item.definition.id.contains("wand") || !event.item.definition.id.contains("ebwizardry:")) return;
    if !event.isPlayer return;

    var player = event.player;

    if !isNull(player.getNBT().ForgeData.UsingWand) {
        player.update({UsingWand: 0});
    }

    if (!isNull(event.item.tag.DodgeChargedTicks)){
        event.item.updateTag({DodgeChargedTicks: 0});
    }
});
*/

//Critical Hits Overhaul

//Regen Below 30% Health
events.register(function(event8 as PlayerTickEvent){
    if event8.side == "CLIENT" { return; }
    if event8.phase == "END" { return; }
    if event8.player.world.time %100 != 0 { return; }

        var player = event8.player;

        //by how much the healing amount will be divided
        var divider = 12.0 as float;

        if (!isNull(player.getItemInSlot(IEntityEquipmentSlot.chest())) && EnchantCheck(player.getItemInSlot(IEntityEquipmentSlot.chest()).tag.ench, [<enchantment:mujmajnkraftsbettersurvival:vitality>])) { 
            //cut divider in half if the player has vitality
            divider *= 0.5 as float;
        }

        if (!isNull(player.getItemInSlot(IEntityEquipmentSlot.head())) && <mysticalworld:antler_hat>.anyDamage().matches(player.getItemInSlot(IEntityEquipmentSlot.head()))) { 
            var helmet = player.getItemInSlot(IEntityEquipmentSlot.head());
            //cut divider in half again if the player has the antler hat
            divider *= 0.5 as float;
        }

    //if player at 30% health, heal them by: maxhealth/divider (excluding the antler hat)
    if (player.health < player.maxHealth * 0.3 && !<mysticalworld:antler_hat>.anyDamage().matches(player.getItemInSlot(IEntityEquipmentSlot.head()))) {
        player.heal((player.maxHealth / divider) as float);
    }

    //Glowing Mushrooms Regen until 50%
    if (player.health < player.maxHealth * 0.5 && player.world.getBlockState(player.position as IBlockPos) == <blockstate:biomesoplenty:mushroom:variant=glowshroom>) {
        server.commandManager.executeCommandSilent(server,"particle happyVillager " ~ player.x ~ " " ~ (player.y + 1) ~ " " ~ player.z ~ " 0.5 0.5 0.5 0 10 force @a");
        player.heal((player.maxHealth / divider) as float);

        if (!isNull(player.getItemInSlot(IEntityEquipmentSlot.head())) && <mysticalworld:antler_hat>.anyDamage().matches(player.getItemInSlot(IEntityEquipmentSlot.head()))) { player.getItemInSlot(IEntityEquipmentSlot.head()).mutable().damageItem(1, player as IEntity); }

        return;
    }

    //Glowing Mushrooms DC Regen until 75%
    if (player.health < player.maxHealth * 0.75 && player.world.getBlockState(player.position as IBlockPos) == <blockstate:mod_lavacow:glowshroom:age=0>) {
        player.heal((player.maxHealth / divider) as float);

        if (!isNull(player.getItemInSlot(IEntityEquipmentSlot.head())) && <mysticalworld:antler_hat>.anyDamage().matches(player.getItemInSlot(IEntityEquipmentSlot.head()))) { player.getItemInSlot(IEntityEquipmentSlot.head()).mutable().damageItem(1, player as IEntity); }

        return;
    }

    //always heal the player if they have the antler hat
    if (player.health < player.maxHealth && !isNull(player.getItemInSlot(IEntityEquipmentSlot.head())) && <mysticalworld:antler_hat>.anyDamage().matches(player.getItemInSlot(IEntityEquipmentSlot.head()))) {
        divider /= 0.5 as float;
        player.heal((player.maxHealth / divider) as float);

        //damage the hat when healed
        player.getItemInSlot(IEntityEquipmentSlot.head()).mutable().damageItem(2, player as IEntity);
    }
});
//Regen Below 30% Health

//Crown on Helmet
events.register(function(event9 as crafttweaker.event.EntityLivingEquipmentChangeEvent){
if event9.entityLivingBase.world.isRemote() { return; }
if event9.slot != crafttweaker.entity.IEntityEquipmentSlot.head() { return; }
if !event9.entityLivingBase instanceof IPlayer { return; }

var player as IPlayer = event9.entityLivingBase;
var newItem = event9.newItem;

    //adds armor toughness to armor that has the crown in them (currently unobtainable item)
    if (!isNull(newItem)) {
        if player.getItemInSlot(crafttweaker.entity.IEntityEquipmentSlot.head()).withTag({"CQR Crown": {ForgeCaps: {Parent: {}}, id: "cqrepoured:king_crown"}}).matches(newItem) {
            player.getAttribute("generic.armorToughness").baseValue = 5.0;
        } else { player.getAttribute("generic.armorToughness").baseValue = 0.0; }
    } else { player.getAttribute("generic.armorToughness").baseValue = 0.0; }
});
//Crown on Helmet

//Vitalberry healing
events.onEntityLivingUseItemFinish(function(event5 as crafttweaker.event.EntityLivingUseItemEvent.Finish){
var player = event5.player;

	if (<rustic:wildberries>.matches(event5.item) && event5.isPlayer) {
		player.heal(1.0);
	}
});
//Vitalberry healing

function EnchantCheck(enchants as IData, targets as [IEnchantmentDefinition]) as bool {
    if (!isNull(enchants)) {
        for target in targets {
            for enchant in enchants.asList() {
                if (enchant.id == target.id) {
                    return true;
                }
            }
        }
    }
    else {
        return false;
    }
}

//Life Steal Nerf
events.register(function(event11 as crafttweaker.event.EntityLivingHealEvent) {
if event11.entityLivingBase.world.isRemote() { return; }
if !event11.entityLivingBase instanceof IPlayer { return; }

var attacker as IPlayer = event11.entityLivingBase;

if isNull(attacker.mainHandHeldItem) { return; }
if isNull(attacker.mainHandHeldItem.tag) { return; }
if isNull(attacker.mainHandHeldItem.tag.ench) { return; }

    if (EnchantCheck(attacker.mainHandHeldItem.tag.ench, [<enchantment:mod_lavacow:lifesteal>])) {

        event11.amount = 0.0;

        if (attacker.world.random.nextInt(0, 9) == 9 && attacker.mainHandHeldItem.withTag({ench: [{lvl: 1 as short, id: 96 as short}]}).matches(attacker.mainHandHeldItem)) { event11.amount = 1.0; } 
        if (attacker.world.random.nextInt(0, 9) == 9 && attacker.mainHandHeldItem.withTag({ench: [{lvl: 2 as short, id: 96 as short}]}).matches(attacker.mainHandHeldItem)) { event11.amount = 2.0; } 
        if (attacker.world.random.nextInt(0, 9) == 9 && attacker.mainHandHeldItem.withTag({ench: [{lvl: 3 as short, id: 96 as short}]}).matches(attacker.mainHandHeldItem)) { event11.amount = 3.0; } 

        }

    if (EnchantCheck(attacker.mainHandHeldItem.tag.ench, [<enchantment:mujmajnkraftsbettersurvival:vampirism>])) {

        event11.amount = 0.0;

        if attacker.world.random.nextInt(0, 4) == 4 { event11.amount = 1.0; } }
});
//Life Steal Nerf

//Golem Soul Rework
events.register(function(event12 as crafttweaker.event.EntityLivingAttackedEvent) {
if event12.entityLivingBase.world.isRemote() { return; }
if !event12.entityLivingBase.onGround { return; }
if isNull(event12.damageSource.trueSource) { return; }
if !event12.damageSource.trueSource instanceof IEntityLivingBase { return; }

var entityA as IEntityLivingBase = event12.damageSource.trueSource;
var entityV = event12.entityLivingBase;

if isNull(entityA.getItemInSlot(IEntityEquipmentSlot.chest())) { return; }
if (!EnchantCheck(entityA.getItemInSlot(IEntityEquipmentSlot.chest()).tag.ench, [<enchantment:uniqueebattle:golem_soul>])) { return; }
        
    //levitates victims only when they are in the ground    
    if entityA.getItemInSlot(IEntityEquipmentSlot.chest()).withTag({ench: [{lvl: 1 as short, id: 23 as short}]}).matches(entityA.getItemInSlot(IEntityEquipmentSlot.chest())) {
        entityV.addPotionEffect(<potion:minecraft:levitation>.makePotionEffect(2, 50));
    }
    if entityA.getItemInSlot(IEntityEquipmentSlot.chest()).withTag({ench: [{lvl: 2 as short, id: 23 as short}]}).matches(entityA.getItemInSlot(IEntityEquipmentSlot.chest())) {
        entityV.addPotionEffect(<potion:minecraft:levitation>.makePotionEffect(2, 60));
    }
    if entityA.getItemInSlot(IEntityEquipmentSlot.chest()).withTag({ench: [{lvl: 3 as short, id: 23 as short}]}).matches(entityA.getItemInSlot(IEntityEquipmentSlot.chest())) {
        entityV.addPotionEffect(<potion:minecraft:levitation>.makePotionEffect(2, 70));
    }
    if entityA.getItemInSlot(IEntityEquipmentSlot.chest()).withTag({ench: [{lvl: 4 as short, id: 23 as short}]}).matches(entityA.getItemInSlot(IEntityEquipmentSlot.chest())) {
        entityV.addPotionEffect(<potion:minecraft:levitation>.makePotionEffect(2, 80));
    }
});
//Golem Soul Rework

//Anvil lightweight nerf
//Removes higher levels if lightweight
events.register(function(event as crafttweaker.event.PlayerAnvilUpdateEvent){
    if (event.leftItem.matches(<minecraft:enchanted_book>.withTag({StoredEnchantments: [{lvl: 2 as short, id: 141 as short}]})) && event.rightItem.matches(<minecraft:enchanted_book>.withTag({StoredEnchantments: [{lvl: 2 as short, id: 141 as short}]})))
    { event.cancel(); }
    if (event.leftItem.matches(<minecraft:enchanted_book>.withTag({StoredEnchantments: [{lvl: 1 as short, id: 141 as short}]})) && event.rightItem.matches(<minecraft:enchanted_book>.withTag({StoredEnchantments: [{lvl: 1 as short, id: 141 as short}]})))
    { event.cancel(); }
});
//Anvil lightweight nerf

//xp stat scaling
static statLvlUUID as string = "5f4bd518-e2c3-4445-a578-0b2b55e58a4a"; // uuid for the modifiers

var lastXP = {} as int[string]; //save the last xp level of the player

events.register(function(event as PlayerTickEvent) {
    if event.side == "CLIENT" { return; }
    if event.phase == "START" { return; }

    val player = event.player;
    val name = player.name;

    if player.world.time %20 != 0 { return; }

    val currentXP = player.xp;

    //if the player's lat xp wasn't saved, save it
    if (!(lastXP in name)) {
        lastXP[name] = currentXP;
        return;
    }

    val oldXP = lastXP[name];

    //formula for increased stats
    var xpStat = (0.001 * player.xp) as float;

        //stats that will be increased
        val stats = [
            "generic.movementSpeed",
            "generic.attackDamage",
            "generic.maxHealth",
            "potioncore.projectileDamage",
            "potioncore.magicDamage",
            "potioncore.digSpeed",
            "forge.swimSpeed"
        ] as string[];

    //if there was a change in xp level, run the actual logic
    if (oldXP != currentXP) {

        //handle the status message on the player's hotbar
        val diff = (currentXP as float - lastXP[name] as float) * 0.1;
        if diff < 0 {
            player.sendStatusMessage(format.red("Stats decreased by " ~ diff ~ "%"));
        } 
        else { 
            player.sendStatusMessage(format.green("Stats increased by " ~ "+" ~ diff ~ "%")); 
            server.commandManager.executeCommandSilent(server,"particle happyVillager " ~ player.x ~ " " ~ (player.y + 1) ~ " " ~ player.z ~ " 0.5 0.5 0.5 0 10 force @a");
        }

        //apply modifiers
        for statChange in stats {

            //if the attribute already existed, remove it.
            player.getAttribute(statChange).removeModifier(statLvlUUID);

            var statLvl as AttributeModifier = AttributeModifier.createModifier("statLvl", xpStat, 1, statLvlUUID);
            val statIncrease as AttributeInstance = player.getAttribute(statChange);

            //apply
            statIncrease.applyModifier(statLvl);
        }

        lastXP[name] = currentXP;
    }
});
//xp stat scaling

//ghostly shape on midnight (to avoid getting instakilled on travel)
events.register(function(event as crafttweaker.event.PlayerChangedDimensionEvent){
    if (event.to == -23) { event.player.addPotionEffect(<potion:tombstone:ghostly_shape>.makePotionEffect(200,0)); }
});
//ghostly shape on midnight (to avoid getting instakilled on travel)

//Disable Dodging When Crawling
events.register(function(event as DodgeEvent.ServerDodgeEvent) {
    var player as IPlayerResizeable = event.player;

    if (event.player != null && player.isForcingCrawling()) {
        event.setCanceled(true);
    }
});
//Disable Dodging When Crawling

//Grave key cannot be used in the air
events.onEntityLivingUseItemTick(function(event as crafttweaker.event.EntityLivingUseItemEvent.Tick){
    if event.entity.world.isRemote() return;
    if !<tombstone:grave_key>.withTag({enchant: 1 as byte}).matches(event.item) return;
    if !event.entity instanceof IEntityLivingBase return;
    if !event.isPlayer return;

    var player = event.player;

    if player.onGround return;

    var entityL as IEntityLivingBase = event.entity;

    entityL.native.resetActiveHand();
    player.sendStatusMessage(format.darkPurple("Key must be cast on the ground"));
});
//Grave key cannot be used in the air