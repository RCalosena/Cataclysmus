#loader mixin

import native.net.minecraft.entity.projectile.EntityArrow;
import native.net.minecraft.entity.Entity;
import mixin.CallbackInfo;
import native.net.minecraft.item.ItemStack;
import native.net.minecraft.entity.EntityLivingBase;
import native.electroblob.wizardry.util.WandHelper;
import native.electroblob.wizardry.data.WizardData;
import native.net.minecraft.entity.player.EntityPlayer;
import native.electroblob.wizardry.util.SpellModifiers;

// Moving sounds extra logic for critical arrows
#mixin Mixin
#{targets:"electroblob.wizardry.client.audio.MovingSoundEntity"}
zenClass MixinCritArrowTweak {

    #mixin Inject
    #{
    #    method: "func_73660_a",
    #    at: { 
    #          value: "HEAD" 
    #    },
    #    cancellable: true
    #}
    function stopInLiquid(ci as CallbackInfo) as void {

        var entity as Entity = this0.source;

        if (entity instanceof EntityArrow && !entity.isOffsetPositionInLiquid(0,0,0)) {
            this0.donePlaying = true;
            ci.cancel();
        }
    }
}

#mixin Mixin
#{targets:"electroblob.wizardry.item.ItemWand"}
zenClass MixinCritSpellsTweak {

    #mixin Inject
    #{
    #    method: "onUsingTick",
    #    at: { value: "HEAD" },
    #    cancellable: true
    #}
    function StoredChargeup(stack as ItemStack, user as EntityLivingBase, count as int, ci as CallbackInfo) as void {
        if (user instanceof EntityPlayer && stack.hasTagCompound()) {
            var tag = stack.getTagCompound();
            var player as EntityPlayer = user as EntityPlayer;
            var chargeup = WandHelper.getCurrentSpell(stack).getChargeup() * WizardData.get(player).itemCastingModifiers.get(SpellModifiers.CHARGEUP);
            var useTicks = stack.getMaxItemUseDuration() - count;

            if (tag.hasKey("DodgeChargedTicks") && tag.getInteger("DodgeChargedTicks") > 0) {

                if chargeup > 0 {
                    this0.cast(stack, WandHelper.getCurrentSpell(stack), player, player.getActiveHand(), useTicks, WizardData.get(player).itemCastingModifiers);
                    tag.setInteger("DodgeChargedTicks", 0);
                    player.stopActiveHand();
                    player.getCooldownTracker().setCooldown(stack.item, chargeup + 20);
                }
            }
        }
    }
}