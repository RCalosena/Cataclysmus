#loader mixin

import mixin.CallbackInfoReturnable;

#mixin Mixin
#{targets:"vazkii.quark.world.item.ItemArchaeologistHat"}
zenClass MixinArchaeologistHat {

    #mixin Inject
    #{
    #    method: "getArmorModel",
    #    at: { 
    #          value: "RETURN"
    #    },
    #    cancellable: true
    #}

    function skipRender(cir as CallbackInfoReturnable) as void {
        cir.setReturnValue(null);
    }
}