#loader mixin

import native.net.minecraft.world.World;
import native.net.minecraft.util.math.BlockPos;
import mixin.CallbackInfoReturnable;

#mixin Mixin
#{targets:"gigaherz.eyes.entity.EntityEyes"}
zenClass MixinEntityEyes {

    #mixin Redirect
    #{
    #    method: "func_70636_d",
    #    at: { value: "INVOKE", 
    #          target: "Lnet/minecraft/world/World;func_175721_c(Lnet/minecraft/util/math/BlockPos;Z)I" 
    #    }
    #}
    function alwaysDark(world as World, position as BlockPos, checkNeighbors as bool) as int {
        return world.getLight(position, false) * 0;
    }
}

#mixin Mixin
#{targets:"gigaherz.eyes.entity.EntityEyes$CreepTowardPlayer"}
zenClass MixinCreepTowardPlayer {
    
    #mixin Inject
    #{
    #    method: "isPlayerLookingInMyGeneralDirection",
    #    at: {
    #        value: "RETURN"
    #    },
    #    cancellable: true
    #}
    function forceFalse(cir as CallbackInfoReturnable) as void {
        cir.setReturnValue(false);
    }
}