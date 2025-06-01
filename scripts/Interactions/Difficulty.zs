#reloadable

import crafttweaker.player.IPlayer;
import crafttweaker.entity.IEntityLivingBase;
import mods.ctintegration.scalinghealth.DifficultyManager;

//Difficulty System Overhaul
events.register(function(event as crafttweaker.event.PlayerChangedDimensionEvent){
    //Nether
    if (event.to == -1 && !event.player.hasAnyGameStages("nightmare", "one", "two", "oatmeal")) { DifficultyManager.setDifficulty(event.player, 300.0); }
    //Nether

    //End
    if (event.to == 1 && !event.player.hasAnyGameStages("nightmare", "two", "oatmeal")) { DifficultyManager.setDifficulty(event.player, 600.0); }
    //End
    
    //Midnight
    if (event.to == -23 && !event.player.hasAnyGameStages("nightmare", "oatmeal")) { DifficultyManager.setDifficulty(event.player, 800.0); }
    //Midnight

    //Overworld
    if (event.to == 0 && !event.player.hasAnyGameStages("nightmare", "one", "two", "oatmeal")) { DifficultyManager.setDifficulty(event.player, 0.0); }
    if (event.to == 0 && event.player.hasGameStage("two")) { DifficultyManager.setDifficulty(event.player, 700.0); }
    //Overworld
});

events.onPlayerClone(function(event as crafttweaker.event.PlayerCloneEvent){
    if event.player.world.isRemote() { return; }

    //From End to Overworld (bc for some reason it has to be different)
    if (!event.wasDeath && !event.player.hasAnyGameStages("nightmare", "one", "two", "oatmeal")) { DifficultyManager.setDifficulty(event.originalPlayer, 0.0); }
    if (!event.wasDeath && event.player.hasGameStage("one")) { DifficultyManager.setDifficulty(event.originalPlayer, 400.0); }
    //From End to Overworld (bc for some reason it has to be different)
});

//Gamestage Difficulties
events.register(function(event as mods.ctintegration.gamestages.GameStageAddedEvent){
    //Rahovart
    if event.gameStage == "one" { DifficultyManager.setDifficulty(event.player, 400.0); }
    //Rahovart

    //Asmodeus
    if event.gameStage == "two" { DifficultyManager.setDifficulty(event.player, 700.0); }
    //Asmodeus

    //Insect
    if event.gameStage == "oatmeal" { DifficultyManager.setDifficulty(event.player, 1000.0); }
    //Insect

    //Amalgalich
    if event.gameStage == "nightmare" { DifficultyManager.setDifficulty(event.player, 2000.0); }
    //Amalgalich
});
//Gamestage Difficulties

//Nightmare mode day counter
events.register(function(event as crafttweaker.event.PlayerTickEvent){
        if event.side == "CLIENT" { return; }
        if (event.phase == "START") { return; }
        if !event.player.hasGameStage("nightmare") { return; }

        var world = event.player.world;

        if(world.provider.getWorldTime() == 24000)
        {
                event.player.sendStatusMessage("§6Difficulty §6increased §6by §c+50");
                DifficultyManager.addDifficulty(event.player, 16.6666666, false);
        }
});
//Nightmare mode day counter
//Difficulty System Overhaul

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
    event.amount *= 0.7; 
    }
    if event.entityLivingBase.world.getWorldInfo().difficulty == "NORMAL" {
    event.amount *= 0.85; 
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