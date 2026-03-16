#norun
#loader mixin

import native.net.minecraft.entity.player.EntityPlayer;
import native.net.minecraft.entity.EntityLivingBase;
import native.net.minecraft.entity.Entity;
import native.com.fuzs.aquaacrobatics.entity.player.IPlayerResizeable;
import native.com.fantasticsource.dynamicstealth.config.server.senses.sight.SightConfig;
import native.com.fantasticsource.dynamicstealth.config.DynamicStealthConfig.serverSettings;

#mixin Mixin
#{targets:"com.fantasticsource.dynamicstealth.server.senses.sight.Sight"}
zenClass MixinStealthMultiplier {

    #mixin Static
    #mixin ModifyArg
    #{
    #    method: "visualStealthLevelInternal",
    #    at: { 
    #        value: "INVOKE", 
    #        target: "Lcom/fantasticsource/tools/Tools;min([Ljava/lang/String;I)V" 
    #    },
    #    index: 0
    #}
    function injectCrawlingMultiplier(array as double[], searcher as EntityLivingBase, target as Entity, yaw as double, pitch as double, offsetLR as double) as double[] {
        var sight as SightConfig = serverSettings.senses.sight;

        if (target instanceof EntityPlayer) {
            var player as EntityPlayer = target;
            var playerR as IPlayerResizeable = player;

            if (playerR.isForcingCrawling()) {
                var crawlMultiplier as double = sight.a_stealthMultipliers.crouchingMultiplier * 1.5;
                if (array.length > 1) {
                    array[1] = array[1] * crawlMultiplier;
                }
            }
        }
        return array;
    }
}