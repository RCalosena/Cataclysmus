#loader mixin
#sideonly client

//Remove Helmet headshot protection tooltip (bc it's obvious that helmets reduce headshot damage)

import mixin.CallbackInfo;
import native.iblis_headshots.client.ItemTooltipEventHandler;
import native.net.minecraftforge.event.entity.player.ItemTooltipEvent;

#mixin Mixin
#{targets:"iblis_headshots.client.ItemTooltipEventHandler"}
zenClass MixinRemoveHeadshotTooltip {

    #mixin Inject
    #{
    #    method: "onItemTooltipEvent",
    #    at: { 
    #          value: "HEAD"
    #    },
    #    cancellable: true
    #}
    function noTooltip(event as ItemTooltipEvent, ci as CallbackInfo) as void {
        ci.cancel();
    }
}