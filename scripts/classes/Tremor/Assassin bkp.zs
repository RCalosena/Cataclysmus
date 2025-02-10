#reloadable

import crafttweaker.player.IPlayer;
import crafttweaker.event.EntityLivingDamageEvent;
import crafttweaker.event.EntityLivingAttackedEvent;
import crafttweaker.entity.IEntityEquipmentSlot;
import crafttweaker.item.IItemStack;
import crafttweaker.entity.IEntityLivingBase;
import crafttweaker.block.IMaterial;

function mobDist(tick as EntityLivingAttackedEvent, dist as double) as bool{
    var player as IPlayer = tick.entityLivingBase;
    val mobs = player.world.getEntities();

    for mob in mobs{
        if mob instanceof IEntityLivingBase {
        if !mob instanceof IPlayer {
            if player.world.getClosestPlayerToEntity(mob, dist, false){
                return true;
            }
        }}
    }
    return false;
}

function mobDist2(tick as EntityLivingDamageEvent, dist as double) as bool{
    var player as IPlayer = tick.entityLivingBase;
    val mobs = player.world.getEntities();

    for mob in mobs{
        if mob instanceof IEntityLivingBase {
        if !mob instanceof IPlayer {
            if player.world.getClosestPlayerToEntity(mob, dist, false){
                return true;
            }
        }}
    }
    return false;
}

function hasGlow(item as IItemStack) as bool {

    val Lights = [
        <minecraft:torch>,
        <minecraft:glowstone>,
        <minecraft:glowstone_dust>,
        <minecraft:lit_pumpkin>,
        <minecraft:lava_bucket>,
        <minecraft:redstone_torch>,
        <minecraft:redstone>,
        <minecraft:golden_horse_armor>,
    ] as IItemStack[];

        for Light in Lights {
            if (Light.anyDamage().matches(item)) {
                return true;
            }
        }

    return false;

}

function hasArmor(helmet as IItemStack, chestplate as IItemStack, legging as IItemStack, boot as IItemStack) as bool {

    var condition = 0;

val Helmets = [
    <metallurgy:amordrine_helmet>,
    <metallurgy:astral_silver_helmet>,
    <metallurgy:hepatizon_helmet>,
    <metallurgy:desichalkos_helmet>,
    <metallurgy:shadow_steel_helmet>,
    <minecraft:iron_helmet>,
    <srparasites:armor_helm_sentient>.withTag({assassin: 1})
] as IItemStack[];

val Chestplates = [
    <metallurgy:amordrine_chestplate>,
    <metallurgy:astral_silver_chestplate>,
    <metallurgy:hepatizon_chestplate>,
    <metallurgy:desichalkos_chestplate>,
    <metallurgy:shadow_steel_chestplate>,
    <minecraft:iron_chestplate>,
    <srparasites:armor_chest_sentient>.withTag({assassin: 1})
] as IItemStack[];

val Leggings = [
    <metallurgy:amordrine_leggings>,
    <metallurgy:astral_silver_leggings>,
    <metallurgy:hepatizon_leggings>,
    <metallurgy:desichalkos_leggings>,
    <metallurgy:shadow_steel_leggings>,
    <minecraft:iron_leggings>,
    <srparasites:armor_pants_sentient>.withTag({assassin: 1})
] as IItemStack[];

val Boots = [
    <metallurgy:amordrine_boots>,
    <metallurgy:astral_silver_boots>,
    <metallurgy:hepatizon_boots>,
    <metallurgy:desichalkos_boots>,
    <metallurgy:shadow_steel_boots>,
    <minecraft:iron_boots>,
    <srparasites:armor_boots_sentient>.withTag({assassin: 1})
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

function hasSlimeArmor(helmet as IItemStack, chestplate as IItemStack, legging as IItemStack, boot as IItemStack) as bool {

    var condition = 0;

        if (<cqrepoured:helmet_slime>.anyDamage().matches(helmet)) { condition += 1; }
        if (<cqrepoured:chestplate_slime>.anyDamage().matches(chestplate)) { condition += 1; }
        if (<cqrepoured:leggings_slime>.anyDamage().matches(legging)) { condition += 1; }
        if (<cqrepoured:boots_slime>.anyDamage().matches(boot)) { condition += 1; }

    if condition == 4 { return true; }

    return false;

    if condition > 0 { condition = 0; }
}

function isSentientArmor(helmet as IItemStack, chestplate as IItemStack, legging as IItemStack, boot as IItemStack) as bool {

    var condition = 0;

        if (<srparasites:armor_helm_sentient>.withTag({assassin: 1}).anyDamage().matches(helmet)) { condition += 1; }
        if (<srparasites:armor_chest_sentient>.withTag({assassin: 1}).anyDamage().matches(chestplate)) { condition += 1; }
        if (<srparasites:armor_pants_sentient>.withTag({assassin: 1}).anyDamage().matches(legging)) { condition += 1; }
        if (<srparasites:armor_boots_sentient>.withTag({assassin: 1}).anyDamage().matches(boot)) { condition += 1; }

    if condition == 4 { return true; }

    return false;

    if condition > 0 { condition = 0; }
}

events.register(function(event4 as EntityLivingDamageEvent){
    if event4.entityLivingBase.world.isRemote() { return; }
    if (isNull(event4.damageSource.trueSource)) { return; }
    if !event4.damageSource.trueSource instanceof IPlayer { return; }
    var player as IPlayer = event4.damageSource.trueSource;
    if (hasArmor(player.getItemInSlot(IEntityEquipmentSlot.head()), player.getItemInSlot(IEntityEquipmentSlot.chest()), player.getItemInSlot(IEntityEquipmentSlot.legs()), player.getItemInSlot(IEntityEquipmentSlot.feet())) || hasSlimeArmor(player.getItemInSlot(IEntityEquipmentSlot.head()), player.getItemInSlot(IEntityEquipmentSlot.chest()), player.getItemInSlot(IEntityEquipmentSlot.legs()), player.getItemInSlot(IEntityEquipmentSlot.feet()))) {

    if (mobDist2(event4, 1.5)) { 
        if (player.isPotionActive(<potion:elenaidodge2:weight>) && player.getActivePotionEffect(<potion:elenaidodge2:weight>).amplifier == 255) { 
            player.removePotionEffect(<potion:minecraft:slowness>); 
            player.removePotionEffect(<potion:midnight:darkness>); 
            player.removePotionEffect(<potion:elenaidodge2:weight>); 
            
            event4.amount *= 5.0;
            if isSentientArmor(player.getItemInSlot(IEntityEquipmentSlot.head()), player.getItemInSlot(IEntityEquipmentSlot.chest()), player.getItemInSlot(IEntityEquipmentSlot.legs()), player.getItemInSlot(IEntityEquipmentSlot.feet())) {
                event4.entityLivingBase.addPotionEffect(<potion:mod_lavacow:fragile>.makePotionEffect(200, 5));
            }
            player.sendPlaySoundPacket("srparasites:mob.explotion", "player", player.position, 3.0, 1.0);
        }
    }}
});

events.register(function(event5 as crafttweaker.event.EntityLivingDeathEvent){
    if event5.entityLivingBase.world.isRemote() { return; }
    if (isNull(event5.damageSource.trueSource)) { return; }
    if !event5.damageSource.trueSource instanceof IPlayer { return; }
    var player as IPlayer = event5.damageSource.trueSource;
    if (hasArmor(player.getItemInSlot(IEntityEquipmentSlot.head()), player.getItemInSlot(IEntityEquipmentSlot.chest()), player.getItemInSlot(IEntityEquipmentSlot.legs()), player.getItemInSlot(IEntityEquipmentSlot.feet())) || hasSlimeArmor(player.getItemInSlot(IEntityEquipmentSlot.head()), player.getItemInSlot(IEntityEquipmentSlot.chest()), player.getItemInSlot(IEntityEquipmentSlot.legs()), player.getItemInSlot(IEntityEquipmentSlot.feet()))) {

    if (player.isPotionActive(<potion:quark:blue>)) { player.removePotionEffect(<potion:quark:blue>); player.removePotionEffect(<potion:minecraft:invisibility>); player.removePotionEffect(<potion:tombstone:ghostly_shape>); player.removePotionEffect(<potion:minecraft:slowness>); }
    }
});

events.register(function(event as crafttweaker.event.PlayerTickEvent){

if (event.side == "CLIENT") { return; }
if (event.phase == "START") { return; }
if event.player.world.time %5 != 0 { return; }

    var player = event.player;

if (hasArmor(player.getItemInSlot(IEntityEquipmentSlot.head()), player.getItemInSlot(IEntityEquipmentSlot.chest()), player.getItemInSlot(IEntityEquipmentSlot.legs()), player.getItemInSlot(IEntityEquipmentSlot.feet())) || hasSlimeArmor(player.getItemInSlot(IEntityEquipmentSlot.head()), player.getItemInSlot(IEntityEquipmentSlot.chest()), player.getItemInSlot(IEntityEquipmentSlot.legs()), player.getItemInSlot(IEntityEquipmentSlot.feet()))) {

    var world = player.world;

    if (isNull(player.getNBT().ForgeData.sneakTime)) {
		player.setNBT({sneakTime: 0});
	}

    if (!isNull(player.getNBT().ForgeData.sneakTime) && player.getNBT().ForgeData.sneakTime >= 5 && player.isSneaking && player.isPotionActive(<potion:quark:white>) && !hasSlimeArmor(player.getItemInSlot(IEntityEquipmentSlot.head()), player.getItemInSlot(IEntityEquipmentSlot.chest()), player.getItemInSlot(IEntityEquipmentSlot.legs()), player.getItemInSlot(IEntityEquipmentSlot.feet()))) {
        player.removePotionEffect(<potion:minecraft:invisibility>);
        if player.isPotionActive(<potion:tombstone:ghostly_shape>) { player.removePotionEffect(<potion:tombstone:ghostly_shape>); }
        player.removePotionEffect(<potion:quark:white>);
        player.removePotionEffect(<potion:quark:blue>);
        player.addPotionEffect(<potion:minecraft:slowness>.makePotionEffect(120, 1));
        player.addPotionEffect(<potion:midnight:darkness>.makePotionEffect(120, 0));
        player.addPotionEffect(<potion:elenaidodge2:weight>.makePotionEffect(120, 255));

        player.sendPlaySoundPacket("ebwizardry:entity.boulder.land", "player", player.position, 1.0, 0.7);

        player.update({sneakTime: 0});
    }

    if (player.isPotionActive(<potion:quark:white>)) {

        var brightness = world.getBrightness(player.position);

        if (!hasGlow(player.currentItem) && !hasGlow(player.offHandHeldItem)) {
            if player.isInsideOfMaterial(IMaterial.leaves()) { if player.isPotionActive(<potion:quark:white>) { player.addPotionEffect(<potion:quark:white>.makePotionEffect(70, 0)); } } 

            if world.dayTime{
                if brightness <= 5 { if player.isPotionActive(<potion:quark:white>) { player.addPotionEffect(<potion:quark:white>.makePotionEffect(70, 0)); } }
            } else {
                if (world.canSeeSky(player.position) && world.dimension == 0) {
                    if player.isPotionActive(<potion:quark:white>) { player.addPotionEffect(<potion:quark:white>.makePotionEffect(70, 0)); }
                } else {
                    if brightness <= 5 { if player.isPotionActive(<potion:quark:white>) { player.addPotionEffect(<potion:quark:white>.makePotionEffect(70, 0)); } }
                }
            }
        }
    }

    if player.isInsideOfMaterial(IMaterial.leaves()) {

                if (player.isSneaking && !hasGlow(player.currentItem) && !hasGlow(player.offHandHeldItem)) {

    if world.time %50 != 0 { return; }

    if (player.getNBT().ForgeData.sneakTime as int <= 5) {

        player.setNBT({sneakTime: player.getNBT().ForgeData.sneakTime as int + 1});
 
		}

        var sneakTime = player.getNBT().ForgeData.sneakTime;

        if sneakTime == 1 { if !player.isPotionActive(<potion:quark:white>) { player.sendPlaySoundPacket("minecraft:entity.player.breath", "player", player.position, 0.5, 0.5); } }

        if sneakTime == 2 { if !player.isPotionActive(<potion:quark:white>) { server.commandManager.executeCommandSilent(server,"particle sweepAttack " ~ player.x ~ " " ~ player.y ~ " " ~ player.z ~ " 0.5 1.5 0.5 0 5 force @a"); player.sendPlaySoundPacket("ebwizardry:spell.magic_missile", "player", player.position, 1.0, 0.5); } }

        if sneakTime == 4 {  if !hasSlimeArmor(player.getItemInSlot(IEntityEquipmentSlot.head()), player.getItemInSlot(IEntityEquipmentSlot.chest()), player.getItemInSlot(IEntityEquipmentSlot.legs()), player.getItemInSlot(IEntityEquipmentSlot.feet())) { player.sendPlaySoundPacket("quark:block.monster_box.growl", "player", player.position, 0.1, 0.7); } }

        if sneakTime >= 2 {
        player.addPotionEffect(<potion:quark:white>.makePotionEffect(70, 0)); }
    
                }

        if !isNull(player.getNBT().ForgeData.sneakTime) { 
        
        var sneakTime = player.getNBT().ForgeData.sneakTime;

        if (sneakTime <= 5 && hasGlow(player.currentItem) || !player.isSneaking || hasGlow(player.offHandHeldItem)) {
            player.update({sneakTime: 0}); } 
        
        }

    }

    if (world.dayTime) {

            var brightness = world.getBrightness(player.position);

                if (player.isSneaking && !hasGlow(player.currentItem) && !hasGlow(player.offHandHeldItem) && brightness <= 5 && !player.isInsideOfMaterial(IMaterial.leaves())) {

    if world.time %50 != 0 { return; }

    if (player.getNBT().ForgeData.sneakTime as int <= 5) {

        player.setNBT({sneakTime: player.getNBT().ForgeData.sneakTime as int + 1});
 
		}

        var sneakTime = player.getNBT().ForgeData.sneakTime;

        if sneakTime == 1 { if !player.isPotionActive(<potion:quark:white>) { player.sendPlaySoundPacket("minecraft:entity.player.breath", "player", player.position, 0.5, 0.5); } }

        if sneakTime == 2 { if !player.isPotionActive(<potion:quark:white>) { server.commandManager.executeCommandSilent(server,"particle sweepAttack " ~ player.x ~ " " ~ player.y ~ " " ~ player.z ~ " 0.5 1.5 0.5 0 5 force @a"); player.sendPlaySoundPacket("ebwizardry:spell.magic_missile", "player", player.position, 1.0, 0.5); } }

        if sneakTime == 4 { if !hasSlimeArmor(player.getItemInSlot(IEntityEquipmentSlot.head()), player.getItemInSlot(IEntityEquipmentSlot.chest()), player.getItemInSlot(IEntityEquipmentSlot.legs()), player.getItemInSlot(IEntityEquipmentSlot.feet())) { player.sendPlaySoundPacket("quark:block.monster_box.growl", "player", player.position, 0.1, 0.7); } }

        if sneakTime >= 2 {
            player.addPotionEffect(<potion:quark:white>.makePotionEffect(70, 0)); }
    
            }

    if !isNull(player.getNBT().ForgeData.sneakTime) { 
        
        var sneakTime = player.getNBT().ForgeData.sneakTime;

        if player.isInsideOfMaterial(IMaterial.leaves()) { return; }

        if (sneakTime <= 5 && hasGlow(player.currentItem) || hasGlow(player.offHandHeldItem) || !player.isSneaking || brightness > 5) { player.update({sneakTime: 0}); } 
        
        }
    } else {

        var brightness = world.getBrightness(player.position);

        if (player.isSneaking && !hasGlow(player.currentItem) && !hasGlow(player.offHandHeldItem) && !player.isInsideOfMaterial(IMaterial.leaves())) {

            if (!world.canSeeSky(player.position) && world.dimension == 0) {

                if brightness <= 5 {

                if world.time %50 != 0 { return; }

                if (player.getNBT().ForgeData.sneakTime as int <= 5) {

                    player.setNBT({sneakTime: player.getNBT().ForgeData.sneakTime as int + 1});
            
                    }

                    var sneakTime = player.getNBT().ForgeData.sneakTime;

                    if sneakTime == 1 { if !player.isPotionActive(<potion:quark:white>) { player.sendPlaySoundPacket("minecraft:entity.player.breath", "player", player.position, 0.5, 0.5); } }

                    if sneakTime == 2 { if !player.isPotionActive(<potion:quark:white>) { server.commandManager.executeCommandSilent(server,"particle sweepAttack " ~ player.x ~ " " ~ player.y ~ " " ~ player.z ~ " 0.5 1.5 0.5 0 5 force @a"); player.sendPlaySoundPacket("ebwizardry:spell.magic_missile", "player", player.position, 1.0, 0.5); } }

                    if sneakTime == 4 { if !hasSlimeArmor(player.getItemInSlot(IEntityEquipmentSlot.head()), player.getItemInSlot(IEntityEquipmentSlot.chest()), player.getItemInSlot(IEntityEquipmentSlot.legs()), player.getItemInSlot(IEntityEquipmentSlot.feet())) { player.sendPlaySoundPacket("quark:block.monster_box.growl", "player", player.position, 0.1, 0.7); } }

                    if sneakTime >= 2 {
                         player.addPotionEffect(<potion:quark:white>.makePotionEffect(70, 0)); }
                
                        } else { 
                            if player.isInsideOfMaterial(IMaterial.leaves()) { return; }
                            if !isNull(player.getNBT().ForgeData.sneakTime) { player.update({sneakTime: 0}); } }
            } else {

                if world.time %50 != 0 { return; }

                if (player.getNBT().ForgeData.sneakTime as int <= 5) {

                    player.setNBT({sneakTime: player.getNBT().ForgeData.sneakTime as int + 1});
            
                    }

                    var sneakTime = player.getNBT().ForgeData.sneakTime;

                    if sneakTime == 1 { if !player.isPotionActive(<potion:quark:white>) { player.sendPlaySoundPacket("minecraft:entity.player.breath", "player", player.position, 0.4, 0.5); } }

                    if sneakTime == 2 { if !player.isPotionActive(<potion:quark:white>) { server.commandManager.executeCommandSilent(server,"particle sweepAttack " ~ player.x ~ " " ~ player.y ~ " " ~ player.z ~ " 0.5 1.5 0.5 0 5 force @a"); player.sendPlaySoundPacket("ebwizardry:spell.magic_missile", "player", player.position, 0.8, 0.5); } }

                    if sneakTime == 4 { if !hasSlimeArmor(player.getItemInSlot(IEntityEquipmentSlot.head()), player.getItemInSlot(IEntityEquipmentSlot.chest()), player.getItemInSlot(IEntityEquipmentSlot.legs()), player.getItemInSlot(IEntityEquipmentSlot.feet())) { player.sendPlaySoundPacket("quark:block.monster_box.growl", "player", player.position, 0.1, 0.7); } }

                    if (sneakTime >= 2) {
                        player.addPotionEffect(<potion:quark:white>.makePotionEffect(70, 0)); }
            }
        
        } else { if player.isInsideOfMaterial(IMaterial.leaves()) { return; }
                    if !isNull(player.getNBT().ForgeData.sneakTime) { player.update({sneakTime: 0}); } }
    }}});

events.register(function(event2 as EntityLivingAttackedEvent){
    if event2.entityLivingBase.world.isRemote() { return; }
    if !event2.entityLivingBase instanceof IPlayer { return; }

    var player as IPlayer = event2.entityLivingBase;

    if !hasArmor(player.getItemInSlot(IEntityEquipmentSlot.head()), player.getItemInSlot(IEntityEquipmentSlot.chest()), player.getItemInSlot(IEntityEquipmentSlot.legs()), player.getItemInSlot(IEntityEquipmentSlot.feet())) { return; }

    var entityS = event2.damageSource.trueSource instanceof IEntityLivingBase;

    if (player.isPotionActive(<potion:quark:blue>)) { 
        player.removePotionEffect(<potion:quark:blue>); 
        player.removePotionEffect(<potion:minecraft:invisibility>); 
        player.removePotionEffect(<potion:minecraft:slowness>); 
        player.removePotionEffect(<potion:tombstone:ghostly_shape>); 
        player.sendPlaySoundPacket("minecraft:block.fire.extinguish", "player", player.position, 1.0, 1.0); 
    }

    if (entityS && player.isPotionActive(<potion:elenaidodge2:weight>) && player.getActivePotionEffect(<potion:elenaidodge2:weight>).amplifier == 255) { 
        player.removePotionEffect(<potion:minecraft:slowness>); 
        player.removePotionEffect(<potion:midnight:darkness>); 
        player.removePotionEffect(<potion:elenaidodge2:weight>); 
        player.addPotionEffect(<potion:potioncore:vulnerable>.makePotionEffect(220, 1));
        player.sendPlaySoundPacket("ebwizardry:spell.arcane_jammer", "player", player.position, 1.0, 0.5);
    }
});

events.register(function(event3 as crafttweaker.event.EntityLivingJumpEvent){
    if event3.entityLivingBase.world.isRemote() { return; }
    if !event3.entityLivingBase instanceof IPlayer { return; }

    var player as IPlayer = event3.entityLivingBase;

    if !player.isSneaking { return; }
    
    if (hasArmor(player.getItemInSlot(IEntityEquipmentSlot.head()), player.getItemInSlot(IEntityEquipmentSlot.chest()), player.getItemInSlot(IEntityEquipmentSlot.legs()), player.getItemInSlot(IEntityEquipmentSlot.feet())) || hasSlimeArmor(player.getItemInSlot(IEntityEquipmentSlot.head()), player.getItemInSlot(IEntityEquipmentSlot.chest()), player.getItemInSlot(IEntityEquipmentSlot.legs()), player.getItemInSlot(IEntityEquipmentSlot.feet()))) {
        
        if (player.isPotionActive(<potion:quark:white>)) {
            player.removePotionEffect(<potion:quark:white>);
            player.addPotionEffect(<potion:quark:blue>.makePotionEffect(220, 0));
            player.sendPlaySoundPacket("ebwizardry:spell.arcane_lock", "player", player.position, 1.0, 1.5);
        }

        if (player.isPotionActive(<potion:quark:blue>)) {
            player.addPotionEffect(<potion:minecraft:invisibility>.makePotionEffect(220, 1));
            player.addPotionEffect(<potion:minecraft:slowness>.makePotionEffect(220, 0));
            server.commandManager.executeCommandSilent(server,"particle fireworksSpark " ~ player.x ~ " " ~ player.y ~ " " ~ player.z ~ " 0.5 1.5 0.5 0 60 force @a");
            if !isNull(player.getNBT().ForgeData.sneakTime) { player.update({sneakTime: 0}); }
        }
    }
});