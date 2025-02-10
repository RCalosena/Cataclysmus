#reloadable

import crafttweaker.player.IPlayer;
import crafttweaker.entity.IEntityLivingBase;
import crafttweaker.entity.IEntity;
import crafttweaker.entity.IEntityDefinition;
import crafttweaker.event.PlayerTickEvent;
import crafttweaker.item.IItemStack;
import crafttweaker.enchantments.IEnchantment;
import crafttweaker.enchantments.IEnchantmentDefinition;
import crafttweaker.data.IData;
import crafttweaker.entity.IEntityEquipmentSlot;
import crafttweaker.block.IMaterial;    
import mods.zenutils.ItemHandler;
import mods.zenutils.UUID;
import crafttweaker.entity.IEntityItem;
import crafttweaker.world.IBlockPos;
import mods.ctintegration.scalinghealth.DifficultyManager;

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
//Bronze Rage Ability
events.register(function(event1 as crafttweaker.event.EntityLivingDamageEvent){
    if event1.entityLivingBase.world.isRemote() { return; }
    if !event1.entityLivingBase.isPotionActive(<potion:srparasites:rage>) { return; }
	if !event1.entityLivingBase instanceof IPlayer { return; }
    var player as IPlayer = event1.entityLivingBase;
    if !hasBronzeArmor(player.getItemInSlot(IEntityEquipmentSlot.head()), player.getItemInSlot(IEntityEquipmentSlot.chest()), player.getItemInSlot(IEntityEquipmentSlot.legs()), player.getItemInSlot(IEntityEquipmentSlot.feet())) { return; }

    event1.amount *= 0.6;
});
//Bronze Rage Ability

//Eyes attack detection
function eyeDist(player as IPlayer, mob as IEntity, dist as double) as bool{
            if (!isNull(mob.definition) && mob.definition.id == "eyesinthedarkness:eyes") {
                if (player.world.getClosestPlayerToEntity(mob, dist, false)){
                    return true;
                }
            }
    return false;
    }

//Eyes Effect Expansion
events.register(function(event1 as crafttweaker.event.PotionEffectAddedEvent){
    if event1.entityLivingBase.world.isRemote() { return; }
    if (event1.potionEffect.effectName != "effect.poison") { return; }
    if !event1.entityLivingBase instanceof IPlayer { return; }

        var player as IPlayer = event1.entityLivingBase;

    for entity in player.world.getEntities() {
        if (eyeDist(player, entity, 1.5)) { 
            player.addPotionEffect(<potion:lycanitesmobs:insomnia>.makePotionEffect(6020, 0));
            player.addPotionEffect(<potion:lycanitesmobs:plague>.makePotionEffect(120, 0));
            player.addPotionEffect(<potion:minecraft:wither>.makePotionEffect(120, 0));
            player.addPotionEffect(<potion:lycanitesmobs:bleed>.makePotionEffect(120, 0));
            player.addPotionEffect(<potion:lycanitesmobs:fear>.makePotionEffect(120, 0));
            player.addPotionEffect(<potion:lycanitesmobs:decay>.makePotionEffect(820, 0));
        }
    }
});
//Eyedruden Effect Expansion

//Mobs That Inflict Insomnia
val insomnious = [
    "quark:wraith",
    "beneath:shadow",
    "beneath:hand",
    "mod_lavacow:scarecrow",
    "mod_lavacow:ghostray",
    "mod_lavacow:banshee",
    "mod_lavacow:ghostbomb",
    "midnight:rifter",
    "midnight:hunter",
    "lycanitesmobs:wendigo",
    "lycanitesmobs:geist",
    "lycanitesmobs:spectre",
    "lycanitesmobs:jabberwock",
    "lycanitesmobs:wraith",
    "lycanitesmobs:reaper",
    "lycanitesmobs:grue",
    "lycanitesmobs:shade",
    "lycanitesmobs:banshee",
    "lycanitesmobs:darkling",
    "lycanitesmobs:necrovore",
    "lycanitesmobs:argus"
] as string[];

events.register(function(event3 as crafttweaker.event.EntityLivingDamageEvent){
if event3.entityLivingBase.world.isRemote() { return; }
if isNull(event3.damageSource.trueSource) { return; }
if event3.damageSource.trueSource instanceof IPlayer { return; }

    var victim = event3.entityLivingBase;

for infInsomnia in insomnious {
    if (victim instanceof IEntityLivingBase && event3.damageSource.trueSource.definition.id == infInsomnia) {
        victim.addPotionEffect(<potion:lycanitesmobs:insomnia>.makePotionEffect(6020, 0));
    }
}});
//Mobs That Inflict Insomnia

//Critical Hits Overhaul

events.register(function(event6 as crafttweaker.event.EntityLivingJumpEvent){
    if event6.entityLivingBase.world.isRemote() { return; }
    if !event6.entityLivingBase instanceof IPlayer { return; }

        var player as IPlayer = event6.entityLivingBase;

    if (isNull(player.getNBT().ForgeData.groundcoords)) { player.setNBT({groundcoords: 0}); }

    //Register Y coordinate of the spot where the player jumped
    if player.getNBT().ForgeData.groundcoords == 0 { player.setNBT({groundcoords: player.y as double}); }
    if !isNull(player.getNBT().ForgeData.aircoords) { player.update({aircoords: 0}); }
    if !isNull(player.getNBT().ForgeData.jumpCrit) { player.update({jumpCrit: 1}); }
});

events.register(function(event7 as PlayerTickEvent){
    if event7.side == "CLIENT" { return; }
    if (event7.phase == "START") { return; }
    if event7.player.motionY > 0.2 { return; }
    if event7.player.motionY < -0.08 { return; }
    
    var player = event7.player;
    
    if isNull(player.getNBT().ForgeData.groundcoords) { return; }
    if player.getNBT().ForgeData.groundcoords == 0 { return; }


    if (isNull(player.getNBT().ForgeData.jumpCrit)) { player.setNBT({jumpCrit: 1}); }
    if (isNull(player.getNBT().ForgeData.aircoords)) { player.setNBT({aircoords: 0}); }

    var aircoords = player.getNBT().ForgeData.aircoords as double;
    var groundcoords = player.getNBT().ForgeData.groundcoords as double;

    //Register three instances of the player's Y coordinate changing while in the air
    if (!player.onGround) { player.setNBT({aircoords: player.y as double}); } else { player.update({groundcoords: 0}); player.update({aircoords: 0}); player.update({jumpCrit: 1}); }

    //Height difference used to detect if the player is dodging or jumping. Technically it is still possible to crit while jumping, but only with ceilings to bump into.
    if (player.isBaubleEquipped(<bountifulbaubles:trinketballoon>) == -1) {
        if aircoords != 0 {
            if ((aircoords - groundcoords) < 1.0 && (aircoords - groundcoords) != 0.0) { player.update({jumpCrit: 0}); } else { player.update({jumpCrit: 1}); }
        }
    } else { player.update({jumpCrit: 0}); }
});

events.register(function(event5 as crafttweaker.event.CriticalHitEvent){

if event5.player.world.isRemote() { return; }
if isNull(event5.target.nbt) { return; }
if isNull(event5.target.nbt.ForgeData) { return; }
if event5.target.definition.id == "cqrepoured:slime_part" { return; }

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
    //If the player's fall distance is considered valid
    if (!isNull(player.getNBT().ForgeData.critDistance) && player.getNBT().ForgeData.critDistance == 1) {

        //Add NBT to the attacked entity to tell the game which entity to apply the combo to
        if (!isNull(event5.target.getNBT().ForgeData.targetEntity) && event5.target.getNBT().ForgeData.targetEntity == 1) {

    if (player.isBaubleEquipped(<bountifulbaubles:trinketballoon>) == -1) {
        if (player.getNBT().ForgeData.critCombo as int < 8) {

            //Consecutive critical strikes (caps at 8)
			player.setNBT({critCombo: player.getNBT().ForgeData.critCombo as int + 1});
 
		}
    } else { 
        if (player.getNBT().ForgeData.critCombo as int < 4) {

            //Consecutive critical strikes (caps at 8)
			player.setNBT({critCombo: player.getNBT().ForgeData.critCombo as int + 1});
 
		}
     }

        var combo = player.getNBT().ForgeData.critCombo - 1.0 as float;

        //Modifier = this * combo count - 1
        var comboDamageModifier = (1.0 + (0.2 * combo)) as float;
        var comboDamageModifierBronze = (1.0 + (0.3 * combo)) as float;

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

    if player.health > player.maxHealth * 0.3 { return; }


    if (!isNull(player.getItemInSlot(IEntityEquipmentSlot.chest())) && EnchantCheck(player.getItemInSlot(IEntityEquipmentSlot.chest()).tag.ench, [<enchantment:mujmajnkraftsbettersurvival:vitality>])) { player.heal((player.maxHealth/6)); } 
    player.heal((player.maxHealth/12));
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

//Vitalberry healing
events.onEntityLivingUseItemFinish(function(event5 as crafttweaker.event.EntityLivingUseItemEvent.Finish){
var player = event5.player;

	if (<rustic:wildberries>.matches(event5.item) && event5.isPlayer) {
		player.heal(1.0);
	}
});
//Vitalberry healing

//Mob spawns after the first boss

    val mod_lavacow_entities = [
        "mod_lavacow:banshee",
        "mod_lavacow:acidjet",
        "mod_lavacow:avaton",
        "mod_lavacow:boneworm",
        "mod_lavacow:cactoid",
        "mod_lavacow:cactusthorn",
        "mod_lavacow:cactyrant",
        "mod_lavacow:deathcoil",
        "mod_lavacow:enigmoth",
        "mod_lavacow:enigmoth_larva",
        "mod_lavacow:flamejet",
        "mod_lavacow:foglet",
        "mod_lavacow:forsaken",
        "mod_lavacow:ghostbomb",
        "mod_lavacow:ghostray",
        "mod_lavacow:holygrenade",
        "mod_lavacow:ithaqua",
        "mod_lavacow:lavacow",
        "mod_lavacow:lilsludge",
        "mod_lavacow:moth_scales",
        "mod_lavacow:mummy",
        "mod_lavacow:parasite",
        "mod_lavacow:pingu",
        "mod_lavacow:piranha",
        "mod_lavacow:piranhalauncher",
        "mod_lavacow:ptera",
        "mod_lavacow:raven",
        "mod_lavacow:salamander",
        "mod_lavacow:sandburst",
        "mod_lavacow:scarecrow",
        "mod_lavacow:skeletonking",
        "mod_lavacow:sludgejet",
        "mod_lavacow:sludgelord",
        "mod_lavacow:sonicbomb",
        "mod_lavacow:unburied",
        "mod_lavacow:undeadswine",
        "mod_lavacow:undertaker",
        "mod_lavacow:vespa",
        "mod_lavacow:vespacocoon",
        "mod_lavacow:warsmallfireball",
        "mod_lavacow:weta",
        "mod_lavacow:zombiefrozen",
        "mod_lavacow:zombiemushroom",
        "mod_lavacow:zombiepiranha"
    ] as string[];

events.register(function(event as crafttweaker.event.EntityJoinWorldEvent){
    if event.entity.world.isRemote() { return; }
    if isNull(event.entity.definition) { return; }
    if isNull(event.entity.definition.id) { return; }

for ectoplasm_mobs in mod_lavacow_entities {
    if (event.entity.definition.id == ectoplasm_mobs) {
        for players in event.world.getAllPlayers() {
            if (!players.hasGameStage("BansheeSpawn")) {
                event.cancel();
            }
        }
    }
}});
//Mob spawns after the first boss

//Disc Quest
events.register(function(event as crafttweaker.event.ItemExpireEvent){
     if event.item.world.isRemote() { return; }
     if !event.item.item.matches(<customdisc:empty_disc>) { return; }
     var world = event.item.world;

     if (world.isRaining()) { world.spawnEntity(<customdisc:rcalosena_-_impending_rain>.createEntityItem(world, event.item.position3f as IBlockPos)); }
});

events.onEntityItemFall(function(event as mods.zenutils.event.EntityItemFallEvent) {
    if event.item.world.isRemote() { return; }
    if !event.item.item.matches(<customdisc:empty_disc>) { return; }

    if (event.item.world.provider.getWorldTime() == 12500 && event.item.isInWater) { event.item.world.spawnEntity(<customdisc:rcalosena_-_shining_nightfall>.createEntityItem(event.item.world, event.item.position3f as IBlockPos)); event.item.setDead(); }
});

events.onWorldTick(function(event as crafttweaker.event.WorldTickEvent) {
    if event.side == "CLIENT" { return; }
    if event.phase == "END" { return; }
    for itemEntity in event.world.getEntityItems() {
    if isNull(itemEntity.item) { return; }
    if itemEntity.item.matches(<customdisc:empty_disc>) {
    var world = itemEntity.world;

    if (world.dimension == 1 && itemEntity.y < -5) { world.spawnEntity(<customdisc:rcalosena_-_dark_space>.createEntityItem(world, itemEntity.position3f as IBlockPos)); itemEntity.setDead(); }
    }}
});

events.register(function(event as crafttweaker.event.EntityJoinWorldEvent){
    if event.entity.world.isRemote() { return; }
    if !event.entity instanceof IEntityItem { return; }
    var itemEntity as IEntityItem = event.entity;
    if !isNull(itemEntity) { return; }
    if !itemEntity.item.matches(<customdisc:rcalosena_-_dark_space>) { return; }

    if itemEntity.y < 0 {
    event.entity.hasNoGravity = true;
    event.entity.motionY = 2.5;
    }
});

events.register(function(event as crafttweaker.event.PlayerTickEvent) {
    if event.side == "CLIENT" { return; }
    if event.phase == "END" { return; }
    if !event.player.isElytraFlying { return; }
    if (isNull(event.player.currentItem)) { return; }
    if !event.player.currentItem.matches(<customdisc:empty_disc>) { return; }
    if (event.player.motionY > -3.2) { return; }

    event.player.setItemToSlot(IEntityEquipmentSlot.mainHand(), <customdisc:rcalosena_-_opdoun>);
});

events.register(function(event as crafttweaker.event.EntityLivingDamageEvent){
    if event.entityLivingBase.world.isRemote() { return; }
    if !event.entityLivingBase instanceof IPlayer { return; }
    if event.damageSource.damageType != "flyIntoWall" { return; }

    var player as IPlayer = event.entityLivingBase;

    if isNull(player.currentItem) { return; }
    if !player.currentItem.matches(<customdisc:empty_disc>) { return; }

    print(event.amount);

    if (event.amount >= (player.maxHealth/3)) { player.setItemToSlot(IEntityEquipmentSlot.mainHand(), <customdisc:rcalosena_-_stopgo>); }
});
//Disc Quest

//Difficulty Damage Scaling Nerfs/Buffs
events.register(function(event as crafttweaker.event.EntityLivingHurtEvent){
    if event.entityLivingBase.world.isRemote() { return; }
    if !event.entityLivingBase instanceof IPlayer { return; }

    var player as IPlayer = event.entityLivingBase;

    if DifficultyManager.getDifficulty(player) == 0 { return; }
    
    if (event.damageSource.damageType == "onFire" 
    || event.damageSource.damageType == "fall" 
    || event.damageSource.damageType == "magic" 
    || event.damageSource.damageType == "wither" 
    || event.damageSource.damageType == "explosion.player" 
    || event.damageSource.damageType == "explosion" 
    || event.damageSource.damageType == "thorns") {

    event.amount *= ((DifficultyManager.getDifficulty(player) * 0.001) * 0.05); 
    }
}); 
events.register(function(event as crafttweaker.event.EntityLivingHurtEvent){
    if event.entityLivingBase.world.isRemote() { return; }
    if !event.entityLivingBase instanceof IEntityLivingBase { return; }
    if isNull(event.damageSource.trueSource) { return; }
    if !event.damageSource.trueSource instanceof IPlayer { return; }

    var player as IPlayer = event.damageSource.trueSource;

    if DifficultyManager.getDifficulty(player) == 0 { return; }

    event.amount *= 1 + (DifficultyManager.getDifficulty(player) * 0.00005); 
}); 
events.register(function(event as crafttweaker.event.EntityLivingHurtEvent){
    if event.entityLivingBase.world.isRemote() { return; }
    if !event.entityLivingBase instanceof IPlayer { return; }
    if isNull(event.damageSource.trueSource) { return; }
    if !event.damageSource.trueSource instanceof IPlayer { return; }

    event.amount *= 0.1; 
}); 

events.register(function(event as crafttweaker.event.EntityLivingHurtEvent){ 
    if event.entityLivingBase.world.isRemote() { return; }
    if isNull(event.damageSource.trueSource) { return; }
    if isNull(event.damageSource.immediateSource) { return; }
    if isNull(event.entityLivingBase.world.getClosestPlayerToEntity(event.damageSource.immediateSource, 100.0, false)) { return; }
    if event.damageSource.trueSource instanceof IPlayer { return; }
    if !event.damageSource.projectile { return; }

    event.amount *= 1 + ((DifficultyManager.getDifficulty(event.entityLivingBase.world.getClosestPlayerToEntity(event.damageSource.immediateSource, 100.0, false)) * 0.04) * 0.1);
});

events.register(function(event as crafttweaker.event.EntityLivingHurtEvent){ 
    if event.entityLivingBase.world.isRemote() { return; }
    if isNull(event.damageSource.trueSource) { return; }
    if isNull(event.damageSource.immediateSource) { return; }
    if isNull(event.entityLivingBase.world.getClosestPlayerToEntity(event.damageSource.immediateSource, 100.0, false)) { return; }
    if event.damageSource.damageType != "thrown" { return; }

    if event.entityLivingBase instanceof IPlayer { event.amount *= 1 + ((DifficultyManager.getDifficulty(event.entityLivingBase.world.getClosestPlayerToEntity(event.damageSource.immediateSource, 100.0, false)) * 0.04) * 0.05); } else {

    event.amount *= 1 + ((DifficultyManager.getDifficulty(event.entityLivingBase.world.getClosestPlayerToEntity(event.damageSource.immediateSource, 100.0, false)) * 0.04) * 0.5);
    }
});

events.register(function(event as crafttweaker.event.EntityLivingHurtEvent){ 
    if event.entityLivingBase.world.isRemote() { return; }
    if event.entityLivingBase instanceof IPlayer { return; }
    if isNull(event.damageSource.trueSource) { return; }
    if event.damageSource.trueSource instanceof IPlayer { return; }

    if event.damageSource.projectile { event.amount *= 1.5; }
    event.amount *= 0.5;
});

events.register(function(event as crafttweaker.event.EntityLivingHurtEvent){
    if event.entityLivingBase.world.isRemote() { return; }
    if !event.entityLivingBase instanceof IPlayer { return; }
    if isNull(event.damageSource.trueSource) { return; }
    if event.damageSource.trueSource instanceof IPlayer { return; }

    if event.entityLivingBase.world.getWorldInfo().difficulty == "EASY" {
    event.amount *= 0.8; 
    }
    if event.entityLivingBase.world.getWorldInfo().difficulty == "NORMAL" {
    event.amount *= 0.9; 
    }
    if event.entityLivingBase.world.getWorldInfo().difficulty == "HARD" {
    event.amount *= 1.0; 
    }
}); 

events.register(function(event as crafttweaker.event.EntityLivingHurtEvent){
    if event.entityLivingBase.world.isRemote() { return; }
    if event.entityLivingBase instanceof IPlayer { return; }
    if isNull(event.damageSource.trueSource) { return; }
    if !event.damageSource.trueSource instanceof IPlayer { return; }

    if event.entityLivingBase.world.getWorldInfo().difficulty == "EASY" {
    event.amount *= 1.2; 
    }
    if event.entityLivingBase.world.getWorldInfo().difficulty == "NORMAL" {
    event.amount *= 1.1; 
    }
    if event.entityLivingBase.world.getWorldInfo().difficulty == "HARD" {
    event.amount *= 1.0; 
    }
}); 
//Difficulty Damage Scaling Nerfs/Buffs



//Armor points rework
events.register(function(event as crafttweaker.event.EntityLivingHurtEvent){ 
if event.entityLivingBase.world.isRemote() { return; }
if !event.entityLivingBase instanceof IPlayer { return; }
if event.entityLivingBase.totalArmorValue < 20 { return; }

val htarmor_f = (1.0 - ((event.entityLivingBase.totalArmorValue as float * 0.008) - 0.16) as float);

event.amount *= htarmor_f;
});
//Armor points rework

