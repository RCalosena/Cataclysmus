#sideonly client
#reloadable

//Since the minecraft client package doesn't exist on dedicated servers and 
//common zenscript files from the server override the client's scripts, a 
//separate file is needed for purely client side code

import crafttweaker.event.PlayerTickEvent;
import crafttweaker.item.IItemStack;
import native.net.minecraft.client.Minecraft;
import native.net.minecraft.entity.player.EntityPlayer;
import native.net.minecraftforge.client.event.InputUpdateEvent;
import native.com.fuzs.aquaacrobatics.entity.player.IPlayerResizeable;
import native.com.elenai.elenaidodge2.api.DodgeEvent;
import native.com.elenai.elenaidodge2.util.ClientStorage;
import mods.zenutils.EventPriority;
import native.net.minecraft.util.ResourceLocation;
import native.net.minecraft.util.SoundEvent;
import crafttweaker.entity.IEntityArrow;
import crafttweaker.player.IPlayer;
import native.electroblob.wizardry.client.audio.MovingSoundEntity;

//Holy Shield Cancels Pushing
val Shields = [
    <bountifulbaubles:shieldcobalt>,
    <bountifulbaubles:shieldobsidian>,
    <bountifulbaubles:shieldankh>,
] as IItemStack[];

//sets entityCollisionReduction to 100% when the shields are equipped
events.register(function(event as PlayerTickEvent) {
    if event.phase == "START"  return; 

    if event.player.world.time %10 != 0 { return; }

    val player = event.player.native;

    if player == null return;

for Shield in Shields {

    if (event.player.isBaubleEquipped(Shield) != -1) {
        player.entityCollisionReduction = 1.0;
        break;
    }

    if !isNull(event.player.mainHandHeldItem) {
    var mainhand = event.player.mainHandHeldItem.definition.id;

        if (mainhand == Shield.definition.id) {
            player.entityCollisionReduction = 1.0;
            break;
        }
    }

    if !isNull(event.player.offHandHeldItem) {
    var offhand = event.player.offHandHeldItem.definition.id;

        if (offhand == Shield.definition.id) {
            player.entityCollisionReduction = 1.0;
            break;
        }
    }

    player.entityCollisionReduction = 0.0;

}
});
//Holy Shield Cancels Pushing

//non-forward-Dodges have lower cooldown
events.register(function(event as DodgeEvent.RequestDodgeEvent) {
    if event.direction.toString() == "FORWARD" return;

    var player = Minecraft.getMinecraft().player as EntityPlayer;

    ClientStorage.cooldown = (ClientStorage.cooldown / 4);
}, EventPriority.lowest());
//non-forward-Dodges have lower cooldown

//Disable jumping when crawling
events.register(function(event as InputUpdateEvent) {
    var M = Minecraft.getMinecraft();
    var player as IPlayerResizeable = M.player;

    if (M.player != null && player.isForcingCrawling()) {
        event.getMovementInput().jump = false;
        event.getMovementInput().sneak = false;
    }
});
//Disable jumping when crawling

//Arrow crit whistle
events.register(function(event as crafttweaker.event.EntityJoinWorldEvent){

    if (!event.entity instanceof IEntityArrow) return;

    var arrow as IEntityArrow = event.entity;

    if (!arrow.isCritical || !arrow.shooter instanceof IPlayer) return;

    var player as IPlayer = arrow.shooter;

    if (player.motionY > 0.4 && !isNull(player.getNBT().ForgeData.FromDodge) && player.getNBT().ForgeData.FromDodge == 1) {

        val ArrowWhistleResource as ResourceLocation = ResourceLocation("customdisc:arrow_whistle");

        val ArrowWhistle as SoundEvent = SoundEvent(ArrowWhistleResource);
        
        Minecraft.getMinecraft().getSoundHandler().playSound(MovingSoundEntity(event.entity.native, ArrowWhistle, event.entity.native.getSoundCategory(), 2.0, 1.0, false));
    }
});
//Arrow crit whistle