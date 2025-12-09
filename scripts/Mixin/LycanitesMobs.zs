#loader mixin

import mixin.CallbackInfoReturnable;
import native.net.minecraft.world.World;
import native.net.minecraft.entity.player.EntityPlayer;
import native.net.minecraft.world.Explosion;

#mixin Mixin
#{targets:"com.lycanitesmobs.core.spawner.trigger.ExplosionSpawnTrigger"}
zenClass MixinExplosionSpawnTrigger {

    #mixin Inject
    #{
    #    method: "onExplosion",
    #    at: { 
    #          value: "HEAD" 
    #    },
    #    cancellable: true
    #}
    function noPlayerDetonation(world as World, player as EntityPlayer, explosion as Explosion, cir as CallbackInfoReturnable) as void {
        if (player != null || explosion.getExplosivePlacedBy() == null) {
            cir.setReturnValue(false);
        }
    }
}