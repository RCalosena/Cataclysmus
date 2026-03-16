#reloadable

import crafttweaker.event.PlayerTickEvent;
import native.net.darkhax.gamestages.GameStageHelper;
import native.com.fuzs.aquaacrobatics.entity.player.IPlayerResizeable;
import native.com.elenai.elenaidodge2.api.DodgeEvent;

//CutsceneJoin//

//First Join
events.onPlayerLoggedIn(function(event as crafttweaker.event.PlayerLoggedInEvent){
    //if the cutscene wasn't already seen, trigger it by adding the "cutscene" game stage
    if event.player.hasGameStage("seenCutscene") return;
    
    event.player.addGameStage("cutscene");
});

//Disable dodges
events.register(function(event as DodgeEvent.ServerDodgeEvent) {
    if (event.player != null && GameStageHelper.hasStage(event.player, "cutscene")) {
        event.setCanceled(true);
    }
});

//Finish cutscene when the player stands up
events.register(function(event as PlayerTickEvent){
if event.phase == "END" return;
if event.side != "SERVER" return;
if !event.player.hasGameStage("cutscene") return;

//Make player invisible
event.player.addPotionEffect(<potion:tombstone:ghostly_shape>.makePotionEffect(100,0));

//Make player invulnerable
event.player.native.setEntityInvulnerable(true);

var player as IPlayerResizeable = event.player.native;

// handling order of things
// step 1: player joins the world standing
// step 2: player is forced to crawl in the client script
// step 3: player inputs the toggle crawling keybind
if (player.getPose().toString() == "STANDING" && event.player.hasGameStage("initCrawl")) {
     event.player.removeGameStage("initCrawl");
     event.player.removePotionEffect(<potion:tombstone:ghostly_shape>);
     event.player.native.setEntityInvulnerable(false);
     event.player.removeGameStage("cutscene");
     event.player.addGameStage("seenCutscene");
}

// initCrawl ensures the cutscene doesn't immediately end because when the player initially enters the world, they are standing
if (player.getPose().toString() != "STANDING") { event.player.addGameStage("initCrawl"); }
});