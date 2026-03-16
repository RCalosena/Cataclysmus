#reloadable
#sideonly client
#priority 9

import native.com.elenai.elenaidodge2.api.DodgeEvent;
import native.com.elenai.elenaidodge2.util.ClientStorage;
import native.net.minecraft.client.Minecraft;
import native.net.minecraft.entity.player.EntityPlayer;
import crafttweaker.entity.IEntityEquipmentSlot;
import mods.zenutils.EventPriority;
import native.net.minecraftforge.fml.common.gameevent.TickEvent;
import native.net.minecraft.client.gui.Gui;
import native.net.minecraft.client.renderer.GlStateManager;
import crafttweaker.player.IPlayer;
import native.net.minecraftforge.client.event.RenderTooltipEvent;
import native.com.elenai.elenaidodge2.event.TooltipEventListener;
import crafttweaker.util.Math;
import native.net.minecraft.util.ResourceLocation;


//Wildcard reworks (mostly visuals)

//Dragon Head
events.register(function(event as DodgeEvent.RequestDodgeEvent) {
    var player = Minecraft.getMinecraft().player as EntityPlayer;

    if isNull(player.wrapper.getItemInSlot(IEntityEquipmentSlot.head())) return;
    if !player.wrapper.getItemInSlot(IEntityEquipmentSlot.head()).matches(<minecraft:skull:5>) { return; }

    if (player.capabilities.isFlying || player.isElytraFlying() || <erebus:glider_chestplate>.withTag({isGliding: 1 as byte}).matches(player.wrapper.getItemInSlot(IEntityEquipmentSlot.chest())) || <erebus:glider_chestplate_powered>.withTag({isPowered: 1 as byte}).matches(player.wrapper.getItemInSlot(IEntityEquipmentSlot.chest()))) {
        //increase cooldown of dodges
        ClientStorage.cooldown = 20;
    }
}, EventPriority.lowest());

//unused. Renders weight for the dragon head. Weight wasn't being properly applied so I temporarily disabled this code

//events.register(function(event as RenderTooltipEvent.PostText){
//    if (!event.getStack().isEmpty() && event.getStack().wrapper.matches(<minecraft:skull:5>)) {
//        GlStateManager.pushMatrix();
//        GlStateManager.color(1.0, 1.0, 1.0);
//        var mc as Minecraft = Minecraft.getMinecraft();
//        mc.getTextureManager().bindTexture(ResourceLocation("elenaidodge2","textures/gui/icons.png"));
//
//        var weight = 4;
//        var count as int = (weight / 2);
//        var y as int = TooltipEventListener.shiftTextByLines(event.getLines(), event.getY() + 10);
//
//        for i in 0 .. count {
//          var x as int = event.getX() + i * 9;
//          var v as int = 9;
//          var u as int = 25; 
//            Gui.drawModalRectWithCustomSizedTexture(x as float, y as float, u as float, v as float, 9.0 as float, 9.0 as float, 256.0 as float, 256.0 as float);
//        } 
//        GlStateManager.popMatrix();
//    }
//}, EventPriority.highest());
//Dragon Head

//Golden Crown Visuals

//ticks elapsed && fading check
global yellowFadeTicks as int[] = [0];
global yellowFading as bool[] = [false];

//how much fade (ticks)
global yellowFadeDuration as int = 120;

//checks the moment the crown updates its nbt and turns on fading
events.register(function(event as crafttweaker.event.EntityLivingEquipmentChangeEvent){
    if event.entityLivingBase.world.isRemote() { return; }
    if event.slot.name != "head" return;
    if isNull(event.oldItem) return;
    if isNull(event.newItem) return;
    if isNull(event.newItem.tag.CrownSuccess) return;
    if (<bountifulbaubles:crowngold>.anyDamage().matches(event.oldItem) && <bountifulbaubles:crowngold>.anyDamage().matches(event.newItem)) {
        if event.entityLivingBase.getItemInSlot(IEntityEquipmentSlot.head()).tag.CrownSuccess != 0 { 
            yellowFading[0] = true;
            yellowFadeTicks[0] = 0;
        }
    }
}, EventPriority.highest());

//handle fading until fade time = set amount (120 ticks)
events.register(function(event as TickEvent.RenderTickEvent) {
    if event.phase == "END" return;
    if (!yellowFading[0]) return;

    yellowFadeTicks[0] = yellowFadeTicks[0] + 1;
    if (yellowFadeTicks[0] >= yellowFadeDuration) {
        yellowFading[0] = false;
    }
});

//render yellow flash
events.register(function(event as TickEvent.RenderTickEvent) {
    var M = Minecraft.getMinecraft();
    if (M.player == null || M.world == null) return;

    var player as EntityPlayer = M.player;

    if (!yellowFading[0]) return;
    if isNull(player.wrapper.getItemInSlot(IEntityEquipmentSlot.head())) return;
    if !<bountifulbaubles:crowngold>.anyDamage().matches(player.wrapper.getItemInSlot(IEntityEquipmentSlot.head())) { return; }

    var alpha as int = 0;
    var fadeProgress = yellowFadeTicks[0];

    //if fading is finished, set alpha to 0
    if (fadeProgress >= yellowFadeDuration) {
        alpha = 0;
    } else {

        //smooth (ease-out) fade of the flash
        var progress = (1.0 * fadeProgress) / yellowFadeDuration;
        var smoothFactor = Math.sin((1.0 - progress) * (3.14 / 2.0));
        alpha = (120.0 * smoothFactor) as int;

        if (alpha < 0) alpha = 0;
    }

    if (alpha <= 0) return;

    //16770890 is the color of the screen
    //multiply by alpha to keep lowering opacity
    var color as int = (alpha * 16777216) + 16770890;

    //draw large rectangle on the screen
    Gui.drawRect(0 as int, 0 as int, 10000 as int, 10000 as int, color);
});
//Golden Crown Visuals


//Antler Hat Visuals

//tried rendering corail tombstone particles but they are all hardcoded ;(
//this is what's left of code in case I attempt it again

//events.register(function(event as crafttweaker.event.EntityLivingDeathEvent) {
//    if isNull(event.damageSource.trueSource) return;
//    if !event.damageSource.trueSource instanceof IPlayer return;
//    if event.entityLivingBase instanceof IPlayer return;
//
//    val world = event.entityLivingBase.world;
//    val entity = event.damageSource.trueSource;
//
//
//    // spawn custom soul particle at the dead entity position
//});
//Antler Hat Visuals

//Wildcard reworks