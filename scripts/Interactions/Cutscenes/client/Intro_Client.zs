#sideonly client
#reloadable

import native.net.minecraft.client.Minecraft;
import native.net.darkhax.gamestages.GameStageHelper;
import native.net.minecraftforge.client.event.InputUpdateEvent;
import native.net.minecraftforge.client.event.MouseEvent;
import native.com.fuzs.aquaacrobatics.entity.player.IPlayerResizeable;
import native.com.fuzs.aquaacrobatics.network.NetworkHandler;
import native.com.fuzs.aquaacrobatics.network.message.PacketSendKey;
import native.net.minecraftforge.fml.common.gameevent.TickEvent;
import native.net.minecraft.client.gui.Gui;
import native.net.minecraft.client.gui.ScaledResolution;
import native.net.minecraft.client.gui.FontRenderer;
import native.net.minecraftforge.client.event.RenderHandEvent;

//CutsceneJoin//

// Global Variables (list variables allow the global values to be "mutable")

// For the black screen
global fadeTicks as int[]  = [0];
global fading as bool[] = [false];
global hasFaded as bool[] = [false]; // prevent multiple triggers

// Wait/fade Black Screen
global waitTicks as int = 200;
global fadeDuration as int = 200;

// Wait/fade text
global textDrawDelay as int = 500;
global sceneTicks as int[] = [0];

// mainly updates the fading variable to allow the increase of the fadeTick timer
function triggerFade() {
    fading[0] = true;
    fadeTicks[0] = 0;
}

global crawled as bool[] = [false];

//Disable inputs & guis
events.register(function(event as InputUpdateEvent) {
    var M = Minecraft.getMinecraft();
    var settings = M.gameSettings;

    if (M.player != null && GameStageHelper.hasStage(M.player, "cutscene")) {
        event.getMovementInput().moveForward = 0;
        event.getMovementInput().moveStrafe = 0;
        event.getMovementInput().jump = false;
        event.getMovementInput().sneak = false;
        
        // if the player hasn't been forced to crawl, make them crawl and update the bool
        if !crawled[0] {
            NetworkHandler.INSTANCE.sendToServer(PacketSendKey(PacketSendKey.KeybindPacket.TOGGLE_CRAWLING));
            crawled[0] = true;
        }

        // disable opening guis like the pause menu
        M.displayGuiScreen(null);

        // dissable changing inventory hand
        M.player.inventory.currentItem = 8;
    }
});

//Disable mouse inputs
events.register(function(event as MouseEvent) {
    var M = Minecraft.getMinecraft();

    if (M.player != null && GameStageHelper.hasStage(M.player, "cutscene")) {
        event.setCanceled(true);
    }
});

//Fading Black Screen

// reset all variables if the player created a new world
events.onPlayerLoggedIn(function(event as crafttweaker.event.PlayerLoggedInEvent){
    if (event.player.hasGameStage("seenCutscene") || event.player.hasGameStage("cutscene")) return;
        fading[0] = false;
        hasFaded[0] = false;
        crawled[0] = false;
        fadeTicks[0] = 0;
        sceneTicks[0] = 0;
});

// Handles fading
events.register(function(event as TickEvent.ClientTickEvent) {
    if (event.phase == "END" || Minecraft.getMinecraft().player == null) return;

    var M = Minecraft.getMinecraft();

    // trigger fade
    if (GameStageHelper.hasStage(M.player, "cutscene") && !hasFaded[0]) {
        triggerFade();
        hasFaded[0] = true;
    }

    // increase fade counter
    if (fading[0]) {
        fadeTicks[0] = fadeTicks[0] + 1;
        if (fadeTicks[0] >= waitTicks + fadeDuration) {
            fading[0] = false;
        }
    }

    // similar logic for the popup text (increase timer before the text appears)
    if GameStageHelper.hasStage(M.player, "cutscene") {
        sceneTicks[0] = sceneTicks[0] + 1;
    } else { sceneTicks[0] = 0; }
});

// RenderGameOverlayEvent (responsible for drawing the popup text)
events.register(function(event as native.net.minecraftforge.client.event.RenderGameOverlayEvent) {
    var M = Minecraft.getMinecraft();

    if (M.player == null) return;
    if (!GameStageHelper.hasStage(M.player, "cutscene") && !fading[0]) return;

    // Skip rendering UI except TEXT and VIGNETTE
    if (event.getType().toString() != "TEXT") { event.setCanceled(true); }
    if (event.getType().toString() != "VIGNETTE") { event.setCanceled(true); }

    // make sure the wait time from before is equal or greater then the static delay value
    if (sceneTicks[0] >= textDrawDelay) {

        var sr as ScaledResolution = ScaledResolution(M);
        var font as FontRenderer = M.fontRenderer;
        var screenWidth as int = sr.getScaledWidth();
        var screenHeight as int = sr.getScaledHeight();
        var textWidth as int = font.getStringWidth("Press Ctrl + CapsLock to Stand Up");

        // 0xAAAAAA = grey-ish tint (visible against dark and light pixels)
        // Align to the center of the screen (shift down by 50 pixels)
        font.renderString("Press Ctrl + CapsLock to Stand Up", (screenWidth / 2 - textWidth / 2) as int, (screenHeight / 2 + 50) as int, 0xAAAAAA as int, false);
    }
});

// Skip hand rendering
events.register(function(event as RenderHandEvent){
    var M = Minecraft.getMinecraft();
    
    if (M.player == null || M.world == null) return;
    if (!GameStageHelper.hasStage(M.player, "cutscene") && !fading[0]) return;

    event.setCanceled(true);
});

// Render Tick (responsible for drawing the black screen)
events.register(function(event as TickEvent.RenderTickEvent) {
    if event.phase == "END" { return; }

    var M = Minecraft.getMinecraft();
    if (M.player == null || M.world == null) return;
    if (!GameStageHelper.hasStage(M.player, "cutscene") && !fading[0]) return;

    var alpha = 0;

    // if the fading is happening
    if (fading[0]) {
        if (fadeTicks[0] <= waitTicks) {
            // if lower than the desired time , make the screen fully black
            alpha = 255;
        } else {
            // if greater, start fading by constantly updating the alpha value
            // set complete transparency after the fading is done
            var fadeProgress = fadeTicks[0] - waitTicks;
            if (fadeProgress >= fadeDuration) {
                alpha = 0; // fade finished
            } else {
                // update alpha value
                alpha = (255 * (fadeDuration - fadeProgress) / fadeDuration) as int;
            }
        }
    }

    if (alpha > 0) {
        var color as int = (alpha * 16777216); // ARGB black
        // Using accurate screen width and height messes up the scale of the black screen when restarting the game for some reason. So instead, draw a really large rectangle. 
        Gui.drawRect(0 as int, 0 as int, 10000 as int, 10000 as int, color);
    }
});