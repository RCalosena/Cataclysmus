#reloadable

import crafttweaker.player.IPlayer;
import crafttweaker.event.PlayerTickEvent;
import crafttweaker.entity.IEntityLivingBase;
import crafttweaker.item.IItemStack;
import crafttweaker.entity.IEntityEquipmentSlot;
import crafttweaker.enchantments.IEnchantmentDefinition;
import crafttweaker.entity.AttributeModifier;
import crafttweaker.entity.AttributeInstance;
import mods.zenutils.UUID;
import crafttweaker.data.IData;
import crafttweaker.world.IBlockPos;

//Armor points rework
events.register(function(event as crafttweaker.event.EntityLivingHurtEvent){ 
if event.entityLivingBase.world.isRemote() { return; }
if !event.entityLivingBase instanceof IPlayer { return; }
if event.entityLivingBase.totalArmorValue < 20 { return; }

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

    if condition == 4 { return true; }

    return false;

    if condition > 0 { condition = 0; }
}

events.register(function(event1 as crafttweaker.event.EntityLivingDamageEvent){
    if event1.entityLivingBase.world.isRemote() { return; }
    if !event1.entityLivingBase.isPotionActive(<potion:srparasites:rage>) { return; }
	if !event1.entityLivingBase instanceof IPlayer { return; }
    var player as IPlayer = event1.entityLivingBase;
    if !hasBronzeArmor(player.getItemInSlot(IEntityEquipmentSlot.head()), player.getItemInSlot(IEntityEquipmentSlot.chest()), player.getItemInSlot(IEntityEquipmentSlot.legs()), player.getItemInSlot(IEntityEquipmentSlot.feet())) { return; }

    event1.amount *= 0.6;
});
//Bronze Rage Ability

//Critical Hits Overhaul

events.register(function(event6 as crafttweaker.event.EntityLivingJumpEvent){
    if event6.entityLivingBase.world.isRemote() { return; }
    if !event6.entityLivingBase instanceof IPlayer { return; }

        var player as IPlayer = event6.entityLivingBase;

    if (isNull(player.getNBT().ForgeData.groundcoords)) { player.setNBT({groundcoords: 0}); }

    //Register initial Y coordinate where the jump was triggered
    if player.getNBT().ForgeData.groundcoords == 0 { player.setNBT({groundcoords: player.y as double}); }
    
    //Reset previous stored data
    if !isNull(player.getNBT().ForgeData.aircoords) { player.update({aircoords: 0}); }
    if !isNull(player.getNBT().ForgeData.jumpCrit) { player.update({jumpCrit: 1}); }
});

events.register(function(event7 as PlayerTickEvent){
    if event7.side == "CLIENT" { return; }
    if (event7.phase == "START") { return; }

    //trigger only at highest point
    if event7.player.motionY > 0.2 { return; }
    if event7.player.motionY < -0.08 { return; }
    
    var player = event7.player;
    
    if isNull(player.getNBT().ForgeData.groundcoords) { return; }
    if player.getNBT().ForgeData.groundcoords == 0 { return; }


    if (isNull(player.getNBT().ForgeData.jumpCrit)) { player.setNBT({jumpCrit: 1}); }
    if (isNull(player.getNBT().ForgeData.aircoords)) { player.setNBT({aircoords: 0}); }

    var aircoords = player.getNBT().ForgeData.aircoords as double;
    var groundcoords = player.getNBT().ForgeData.groundcoords as double;

    //Register Y coordinate (if the player hits the ground, reset all stats)
    if (!player.onGround) { player.setNBT({aircoords: player.y as double}); } else { player.update({groundcoords: 0}); player.update({aircoords: 0}); player.update({jumpCrit: 1}); }

    //Height difference (skip if the player has the balloon bauble)
    if (player.isBaubleEquipped(<bountifulbaubles:trinketballoon>) == -1) {
        if aircoords != 0 {
            if ((aircoords - groundcoords) < 1.0 && (aircoords - groundcoords) != 0.0) { player.update({jumpCrit: 0}); } else { player.update({jumpCrit: 1}); }
        }
    } else { player.update({jumpCrit: 0}); }
});

events.register(function(event5 as crafttweaker.event.CriticalHitEvent){

if event5.player.world.isRemote() { return; }

//ignore enemies with no nbt
if isNull(event5.target.nbt) { return; }
if isNull(event5.target.nbt.ForgeData) { return; }
if !isNull(event5.target.definition) {
if event5.target.definition.id == "cqrepoured:slime_part" { return; }
}

var player = event5.player;

if isNull(player.getNBT().ForgeData.jumpCrit) { return; }

//Base crit modifier is now 1.2 (2.0 if you are using Bronze armor)
    if !hasBronzeArmor(player.getItemInSlot(IEntityEquipmentSlot.head()), player.getItemInSlot(IEntityEquipmentSlot.chest()), player.getItemInSlot(IEntityEquipmentSlot.legs()), player.getItemInSlot(IEntityEquipmentSlot.feet())) 
    { event5.damageModifier = 1.2; } 
    else { 
        event5.damageModifier = 2.0; 
        if (player.getNBT().ForgeData.jumpCrit == 0 && !player.onGround && player.motionY < 0.2 && !player.isInWater && !player.isInLava && !player.isPotionActive(<potion:lycanitesmobs:fear>)) 
        { player.sendPlaySoundPacket("metallurgy:crusher_impact", "player", player.position, 1.0, 1.2); } 
    }

    if isNull(player.getNBT().ForgeData.critDistance) {
        player.setNBT({critDistance: 0});
    }


//Prevent jumps from triggering a critical strike
    if (player.getNBT().ForgeData.jumpCrit == 0) {
    
        //If the player is falling (Prevents crits from happening if the player is going up instead of falling)
        if (!player.onGround && player.motionY < 0.2 && !player.isInWater && !player.isInLava && !player.isPotionActive(<potion:lycanitesmobs:fear>)) {
            player.update({critDistance: 1});
        } else { player.update({critDistance: 0}); }
    } else { player.update({critDistance: 0}); }


if (isNull(player.getNBT().ForgeData.critCombo)) {
    player.setNBT({critCombo: 0});
}

if (isNull(event5.target.nbt.ForgeData.targetEntity)) {
    event5.target.setNBT({targetEntity: 0});
}
    //If the player's distance is considered valid
    if (!isNull(player.getNBT().ForgeData.critDistance) && player.getNBT().ForgeData.critDistance == 1) {

        //Add combo NBT to the attacked entity
        if (!isNull(event5.target.getNBT().ForgeData.targetEntity) && event5.target.getNBT().ForgeData.targetEntity == 1) {

    if (player.isBaubleEquipped(<bountifulbaubles:trinketballoon>) == -1) {
        if (player.getNBT().ForgeData.critCombo as int < 8) {

            //Consecutive critical strikes (caps at 8)
			player.setNBT({critCombo: player.getNBT().ForgeData.critCombo as int + 1});
 
		}
    } else { 
        if (player.getNBT().ForgeData.critCombo as int < 4) {

            //Consecutive critical strikes with the balloon (caps at 4)
			player.setNBT({critCombo: player.getNBT().ForgeData.critCombo as int + 1});
 
		}
     }

        var combo = player.getNBT().ForgeData.critCombo - 1.0 as float;

        //Modifier
        var comboDamageModifier = (1.0 + (0.3 * combo)) as float;
        var comboDamageModifierBronze = (1.0 + (0.4 * combo)) as float;

        if player.getNBT().ForgeData.critCombo > 0 {
            
        event5.allow();

        //Apply modifier based on combo count
        if !hasBronzeArmor(player.getItemInSlot(IEntityEquipmentSlot.head()), player.getItemInSlot(IEntityEquipmentSlot.chest()), player.getItemInSlot(IEntityEquipmentSlot.legs()), player.getItemInSlot(IEntityEquipmentSlot.feet())) 
            { event5.damageModifier = 1.2 * comboDamageModifier; } else { event5.damageModifier = 2.0 * comboDamageModifierBronze; }
        }

        } else { player.update({critCombo: 0}); }

        event5.target.update({targetEntity: 1});

    } else { player.update({critCombo: 0}); event5.deny(); }
});
//Critical Hits Overhaul

//Regen Below 30% Health
events.register(function(event8 as PlayerTickEvent){
    if event8.side == "CLIENT" { return; }
    if event8.phase == "END" { return; }
    if event8.player.world.time %100 != 0 { return; }

        var player = event8.player;

    if (player.health < player.maxHealth * 0.3 && player.world.getBlockState(player.position as IBlockPos) != <blockstate:biomesoplenty:mushroom:variant=glowshroom>) {
        if (!isNull(player.getItemInSlot(IEntityEquipmentSlot.chest())) && EnchantCheck(player.getItemInSlot(IEntityEquipmentSlot.chest()).tag.ench, [<enchantment:mujmajnkraftsbettersurvival:vitality>])) { player.heal((player.maxHealth/6)); return; } 
        player.heal((player.maxHealth/12));
    }

    //Glowing Mushrooms Regen until 50%
    if (player.health < player.maxHealth * 0.5 && player.world.getBlockState(player.position as IBlockPos) == <blockstate:biomesoplenty:mushroom:variant=glowshroom>) {
        if (!isNull(player.getItemInSlot(IEntityEquipmentSlot.chest())) && EnchantCheck(player.getItemInSlot(IEntityEquipmentSlot.chest()).tag.ench, [<enchantment:mujmajnkraftsbettersurvival:vitality>])) { player.heal((player.maxHealth/6)); return; } 
            server.commandManager.executeCommandSilent(server,"particle happyVillager " ~ player.x ~ " " ~ (player.y + 1) ~ " " ~ player.z ~ " 0.5 0.5 0.5 0 10 force @a");
        player.heal((player.maxHealth/12));
    }

    //Glowing Mushrooms DC Regen until 75%
    if (player.health < player.maxHealth * 0.75 && player.world.getBlockState(player.position as IBlockPos) == <blockstate:mod_lavacow:glowshroom:age=0>) {
        if (!isNull(player.getItemInSlot(IEntityEquipmentSlot.chest())) && EnchantCheck(player.getItemInSlot(IEntityEquipmentSlot.chest()).tag.ench, [<enchantment:mujmajnkraftsbettersurvival:vitality>])) { player.heal((player.maxHealth/6)); return; } 
        player.heal((player.maxHealth/12));
    }
});
//Regen Below 30% Health

//Crown on Helmet
events.register(function(event9 as crafttweaker.event.EntityLivingEquipmentChangeEvent){
if event9.entityLivingBase.world.isRemote() { return; }
if event9.slot != crafttweaker.entity.IEntityEquipmentSlot.head() { return; }
if event9.entityLivingBase instanceof IPlayer { return; }

var player as IPlayer = event9.entityLivingBase;
var newItem = event9.newItem;

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

function EnchantCheck(enchant as IData, IEnchID as [IEnchantmentDefinition]) as bool {
    if (!isNull(enchant)) {
        for target in IEnchID{
            for j in 0 to enchant.length {
                if (enchant[j].id == target.id) {
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
events.register(function(event as crafttweaker.event.PlayerAnvilUpdateEvent){
    if (event.leftItem.matches(<minecraft:enchanted_book>.withTag({StoredEnchantments: [{lvl: 2 as short, id: 141 as short}]})) && event.rightItem.matches(<minecraft:enchanted_book>.withTag({StoredEnchantments: [{lvl: 2 as short, id: 141 as short}]})))
    { event.cancel(); }
    if (event.leftItem.matches(<minecraft:enchanted_book>.withTag({StoredEnchantments: [{lvl: 1 as short, id: 141 as short}]})) && event.rightItem.matches(<minecraft:enchanted_book>.withTag({StoredEnchantments: [{lvl: 1 as short, id: 141 as short}]})))
    { event.cancel(); }
});
//Anvil lightweight nerf

//xp stat scaling
static statLvlUUID as string = UUID.randomUUID().asString();

var lastXP = {} as int[string];

events.register(function(event as PlayerTickEvent) {
    if event.side == "CLIENT" { return; }
    if event.phase == "START" { return; }

    val player = event.player;
    val name = player.name;

        if player.world.time %20 != 0 { return; }

    val currentXP = player.xp;

    if (!(lastXP in name)) {
        lastXP[name] = currentXP;
        return;
    }

    val oldXP = lastXP[name];


    var xpStat = (0.001 * player.xp) as float;
        val stats = [
            "generic.movementSpeed",
            "generic.attackDamage",
            "generic.maxHealth",
            "potioncore.projectileDamage",
            "potioncore.magicDamage",
            "potioncore.digSpeed",
            "forge.swimSpeed"
        ] as string[];

    if (oldXP != currentXP) {
        val diff = (currentXP as float - lastXP[name] as float) * 0.1;
        if diff < 0 {
        player.sendStatusMessage(format.red("Stats decreased by " ~ diff ~ "%"));
        } 
        else { 
        player.sendStatusMessage(format.green("Stats increased by " ~ "+" ~ diff ~ "%")); 
        server.commandManager.executeCommandSilent(server,"particle happyVillager " ~ player.x ~ " " ~ (player.y + 1) ~ " " ~ player.z ~ " 0.5 0.5 0.5 0 10 force @a");
        }

        for statChange in stats {

            player.getAttribute(statChange).removeModifier(statLvlUUID);

            var statLvl as AttributeModifier = AttributeModifier.createModifier("statLvl", xpStat, 1, statLvlUUID);
            val statIncrease as AttributeInstance = player.getAttribute(statChange);

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