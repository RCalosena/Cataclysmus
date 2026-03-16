#loader mixin

import native.net.minecraftforge.event.entity.EntityJoinWorldEvent;
import native.gigaherz.eyes.entity.EntityEyes;
import mixin.CallbackInfo;

#mixin Mixin
#{targets:"com.shinoow.beneath.common.handler.BeneathEventHandler"}
zenClass MixinBoostStats {

    #mixin Inject
    #{
    #    method: "boostStats",
    #    at: { 
    #          value: "HEAD" 
    #    },
    #    cancellable: true
    #}
    function skipEyes(event as EntityJoinWorldEvent, ci as CallbackInfo) as void {
        if (event.getEntity() instanceof EntityEyes) {
            // Cancel method so The Beneath never buffs eyes
            ci.cancel();
        }
    }
}