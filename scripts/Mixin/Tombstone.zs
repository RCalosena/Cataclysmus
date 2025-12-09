#loader mixin

import native.net.minecraftforge.registries.IForgeRegistry;
import native.ovh.corail.tombstone.enchantment.TombstoneEnchantment;
import native.ovh.corail.tombstone.registry.ModEnchantments;

#mixin Mixin
#{targets:"ovh.corail.tombstone.registry.ModEnchantments"}
zenClass MixinModEnchantments {

    #mixin Redirect
    #{
    #    method: "registerEnchantments",
    #    at: {
    #        value: "INVOKE",
    #        target: "Lovh/corail/tombstone/registry/ModEnchantments;registerEnchantment(Lnet/minecraftforge/registries/IForgeRegistry;Lovh/corail/tombstone/enchantment/TombstoneEnchantment;)V"
    #    }
    #}
    #mixin Static
    function removeSoulbound(registry as IForgeRegistry, enchantment as TombstoneEnchantment) as void {
        if ("tombstone:soulbound" == enchantment.getRegistryName().toString()) {
            return;
        }
        ModEnchantments.registerEnchantment(registry, enchantment);
    }
}