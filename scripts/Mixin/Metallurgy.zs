#modloaded 
#loader mixin
#sideonly client

import native.net.minecraft.item.ItemStack;
import native.net.minecraft.world.World;
import native.net.minecraft.client.util.ITooltipFlag;
import native.java.util.List;

#mixin Mixin
#{targets:"it.hurts.metallurgy_reforged.item.ItemBlockOre"}
zenClass MixinremoveHarvestTooltip {

    #mixin Overwrite
    function func_77624_a(stack as ItemStack, worldIn as World, tooltip as [any], flagIn as ITooltipFlag) as void {
        //noop
    }
}