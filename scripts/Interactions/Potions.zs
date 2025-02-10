#reloadable

import crafttweaker.entity.IEntityLivingBase;
import crafttweaker.item.IItemStack;
import crafttweaker.potions.IPotion;
import crafttweaker.player.IPlayer;

val milks = [
	<betteranimalsplus:goatmilk>,
	<minecraft:milk_bucket>,
	<erebus:bambucket>.withTag({Fluid: {FluidName: "milk", Amount: 1000}})
] as IItemStack[];

//Invisibility

events.register(function(event1 as crafttweaker.event.PotionEffectAddedEvent){
    if event1.entityLivingBase.world.isRemote() { return; }
	if event1.potionEffect.effectName != "effect.invisibility" { return; }
	if event1.potionEffect.amplifier != 1 { return; }

	event1.entityLivingBase.addPotionEffect(<potion:tombstone:ghostly_shape>.makePotionEffect(event1.potionEffect.duration, 0));
});

events.register(function(event as crafttweaker.event.EntityLivingAttackedEvent) { 
	if event.entityLivingBase.world.isRemote() { return; }
	if isNull(event.damageSource.trueSource) { return; }
	if !event.damageSource.trueSource instanceof IEntityLivingBase { return; }

	var victim as IEntityLivingBase = event.entityLivingBase;
	var attacker as IEntityLivingBase = event.damageSource.trueSource;
	var invis = <potion:minecraft:invisibility> as IPotion;

	if (attacker.isPotionActive(invis) && attacker.getActivePotionEffect(invis).amplifier == 0) { attacker.removePotionEffect(invis); }

	if (victim.isPotionActive(invis)) { victim.removePotionEffect(invis); }

});

events.register(function(event4 as crafttweaker.event.PlayerAttackEntityEvent){
	if event4.player.world.isRemote() { return; }
	if !event4.player.isPotionActive(<potion:minecraft:invisibility>) { return; }
	if !event4.target instanceof IEntityLivingBase { return; }
	if (event4.player.getActivePotionEffect(<potion:minecraft:invisibility>).amplifier != 1) { return; }

	var player = event4.player;
	var invis = <potion:minecraft:invisibility> as IPotion;

	if (isNull(player.getNBT().ForgeData.hitsWithInvis)) {
        player.setNBT({hitsWithInvis: 0});
    }

        if (player.getNBT().ForgeData.hitsWithInvis as int <= 1) {

        	player.setNBT({hitsWithInvis: player.getNBT().ForgeData.hitsWithInvis as int + 1});
            
        } else { player.update({hitsWithInvis: 1}); }
});

events.register(function(event2 as crafttweaker.event.EntityLivingDeathEvent){
	if event2.entityLivingBase.world.isRemote() { return; }
	if isNull(event2.damageSource.trueSource) { return; }
	if !event2.damageSource.trueSource instanceof IEntityLivingBase { return; }

	var attacker as IEntityLivingBase = event2.damageSource.trueSource;

	if !attacker.isPotionActive(<potion:minecraft:invisibility>) { return; }
	if attacker.getActivePotionEffect(<potion:minecraft:invisibility>).amplifier != 1 { return; }

	attacker.removePotionEffect(<potion:minecraft:invisibility>);
});

events.register(function(event3 as crafttweaker.event.PlayerTickEvent){
	if event3.side == "CLIENT" { return; }
	if (event3.phase == "START") { return; }
	if event3.player.world.time %25 !=0 { return; }

		var player = event3.player;
		var invis = <potion:minecraft:invisibility> as IPotion;

	if (!player.isPotionActive(invis)) { return; }
	if player.getActivePotionEffect(invis).amplifier != 1 { return; }
	if isNull(player.getNBT().ForgeData.hitsWithInvis) { return; }

		var hitsWithInvis = player.getNBT().ForgeData.hitsWithInvis;

			if hitsWithInvis == 0 { 
				player.addPotionEffect(<potion:tombstone:ghostly_shape>.makePotionEffect(player.getActivePotionEffect(invis).duration, 0));
			}

			if hitsWithInvis == 1 {

				if (isNull(player.getNBT().ForgeData.invisCooldown)) { player.setNBT({invisCooldown: 0}); }

            	if (player.getNBT().ForgeData.invisCooldown as int <= 5) {
        			player.setNBT({invisCooldown: player.getNBT().ForgeData.invisCooldown as int + 1});
				} else { player.update({invisCooldown: 0}); }

				if player.getNBT().ForgeData.invisCooldown == 4 {
					player.addPotionEffect(<potion:tombstone:ghostly_shape>.makePotionEffect(player.getActivePotionEffect(invis).duration, 0)); 
					player.update({invisCooldown: 0});
					player.update({hitsWithInvis: 0}); 
				}
			} 
});
//Invisibility

//Insomnia
events.onEntityLivingUseItemFinish(function(event5 as crafttweaker.event.EntityLivingUseItemEvent.Finish){
var player = event5.player;

for milk in milks {
	if (milk.matches(event5.item) && event5.isPlayer) {
		var insomnia = <potion:lycanitesmobs:insomnia> as IPotion;

		if player.isPotionActive(insomnia) {
			player.addPotionEffect(insomnia.makePotionEffect(player.getActivePotionEffect(insomnia).duration, 0));
		}
	}
}});
//Insomnia

//Corroded
events.register(function(event6 as crafttweaker.event.EntityLivingAttackedEvent){
	if event6.entityLivingBase.world.isRemote() { return; }
	if isNull(event6.damageSource.trueSource) { return; }
	if !event6.damageSource.trueSource instanceof IEntityLivingBase { return; }

		var attacker as IEntityLivingBase = event6.damageSource.trueSource;

	if !attacker.isPotionActive(<potion:mod_lavacow:corroded>) { return; }

	event6.entityLivingBase.addPotionEffect(<potion:mod_lavacow:corroded>.makePotionEffect(attacker.getActivePotionEffect(<potion:mod_lavacow:corroded>).duration, attacker.getActivePotionEffect(<potion:mod_lavacow:corroded>).amplifier));
});
//Corroded

//Rage
events.register(function(event1 as crafttweaker.event.PotionEffectAddedEvent){
    if event1.entityLivingBase.world.isRemote() { return; }
	if event1.potionEffect.effectName != "mob_effect.srparasites:rage" { return; }

    var player as IPlayer = event1.entityLivingBase;

	if (event1.potionEffect.amplifier == 0) { event1.entityLivingBase.heal((event1.entityLivingBase.maxHealth * 0.2)); }
	if (event1.potionEffect.amplifier == 1) { event1.entityLivingBase.heal((event1.entityLivingBase.maxHealth * 0.3)); }
	if (event1.potionEffect.amplifier == 2) { event1.entityLivingBase.heal((event1.entityLivingBase.maxHealth * 0.4)); }
	if (event1.potionEffect.amplifier == 3) { event1.entityLivingBase.heal((event1.entityLivingBase.maxHealth * 0.5)); }
	if (event1.potionEffect.amplifier == 4) { event1.entityLivingBase.heal((event1.entityLivingBase.maxHealth * 0.6)); }
	if (event1.potionEffect.amplifier == 5) { event1.entityLivingBase.heal((event1.entityLivingBase.maxHealth * 0.7)); }
});
//Rage