#sideonly client
#reloadable

//Since the minecraft client package doesn't exist on dedicated servers and 
//common zenscript files from the server override the client's scripts, a 
//separate file is needed for purely client side code

import crafttweaker.event.PlayerTickEvent;
import crafttweaker.item.IItemStack;
import native.net.minecraft.client.Minecraft;
import native.net.minecraft.entity.player.EntityPlayer;

//Holy Shield Cancels Pushing
val Shields = [
    <bountifulbaubles:shieldcobalt>,
    <bountifulbaubles:shieldobsidian>,
    <bountifulbaubles:shieldankh>,
] as IItemStack[];

events.register(function(event as PlayerTickEvent) {
    if event.phase == "START"  return; 

    if event.player.world.time %10 != 0 { return; }

    val player = Minecraft.getMinecraft().player as EntityPlayer;

    if player == null return;

for Shield in Shields {

    if (event.player.isBaubleEquipped(Shield) != -1) {
        player.entityCollisionReduction = 1.0;
        break;
    }

    if !isNull(event.player.mainHandHeldItem) {
    var mainhand = event.player.mainHandHeldItem.definition.id;

        if (mainhand == Shield.definition.id) {
        print("a");
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