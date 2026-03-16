#modloaded dynamiclights
#loader mixin
#sideonly client

import native.net.minecraft.item.ItemStack;

#mixin Mixin
#{targets:"atomicstryker.dynamiclights.client.modules.PlayerSelfLightSource"}
zenClass MixinArmorLightRedirect {

    #mixin Redirect
    #{
    #   method: "onTick",
    #   at: {
    #       value: "INVOKE",
    #       target: "Latomicstryker/dynamiclights/client/modules/PlayerSelfLightSource;getLightFromItemStack(Lnet/minecraft/item/ItemStack;)I"
    #   }
    #}
    function redirectGetLightFromItemStack(self as native.atomicstryker.dynamiclights.client.modules.PlayerSelfLightSource, stack as ItemStack) as int {

        var baseLight as int = self.getLightFromItemStack(stack);

        if (stack == null) return baseLight;

        if (stack.hasTagCompound()) {
            var tag = stack.getTagCompound();

            if (tag.hasKey("lit") && tag.getInteger("lit") == 0) {
                return 0;
            }

            if (tag.hasKey("lit") && tag.getInteger("lit") == 1 && baseLight < 7) {
                return 7;
            }
        }

        return baseLight;
    }
}