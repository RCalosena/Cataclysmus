#reloadable

import crafttweaker.entity.IEntityLivingBase;
import crafttweaker.item.IItemStack;
import crafttweaker.potions.IPotion;
import crafttweaker.player.IPlayer;
import crafttweaker.entity.IEntityEquipmentSlot;

//Early Armor Sets
function hasEarlyArmor(helmet as IItemStack, chestplate as IItemStack, legging as IItemStack, boot as IItemStack) as bool {

    var condition = 0;

val Helmets = [
	<mysticalworld:copper_helmet>,
	<cqrepoured:helmet_slime>,
	<minecraft:golden_helmet>,
	<metallurgy:prometheum_helmet>,
	<minecraft:leather_helmet>,
	<minecraft:chainmail_helmet>,
	<metallurgy:steel_helmet>,
	<metallurgy:bronze_helmet>
] as IItemStack[];

val Chestplates = [
	<mysticalworld:copper_chestplate>,
	<cqrepoured:chestplate_slime>,
	<minecraft:golden_chestplate>,
	<metallurgy:prometheum_chestplate>,
	<minecraft:leather_chestplate>,
	<minecraft:chainmail_chestplate>,
	<metallurgy:steel_chestplate>,
	<metallurgy:bronze_chestplate>
] as IItemStack[];

val Leggings = [
	<mysticalworld:copper_leggings>,
	<cqrepoured:leggings_slime>,
	<minecraft:golden_leggings>,
	<metallurgy:prometheum_leggings>,
	<minecraft:leather_leggings>,
	<minecraft:chainmail_leggings>,
	<metallurgy:steel_leggings>,
	<metallurgy:bronze_leggings>
] as IItemStack[];

val Boots = [
	<mysticalworld:copper_boots>,
	<cqrepoured:boots_slime>,
	<minecraft:golden_boots>,
	<metallurgy:prometheum_boots>,
	<minecraft:leather_boots>,
	<minecraft:chainmail_boots>,
	<metallurgy:steel_boots>,
	<metallurgy:bronze_boots>
] as IItemStack[];

	for helmut in Helmets {
        if (helmut.anyDamage().matches(helmet)) { condition += 1; }
	}
	for chestplut in Chestplates {	
		if (chestplut.anyDamage().matches(chestplate)) { condition += 1; }
	}
	for leggus in Leggings {
		if (leggus.anyDamage().matches(legging)) { condition += 1; }
	}
	for buuts in Boots {
		if (buuts.anyDamage().matches(boot)) { condition += 1; }
	}

    if condition == 4 { return true; }

    return false;

    if condition > 0 { condition = 0; }
}

events.register(function(event as crafttweaker.event.EntityLivingEquipmentChangeEvent){
	if event.entityLivingBase.world.isRemote() { return; }
	if !event.entityLivingBase instanceof IPlayer { return; }
	
	var player as IPlayer = event.entityLivingBase;

	if !hasEarlyArmor(player.getItemInSlot(IEntityEquipmentSlot.head()), player.getItemInSlot(IEntityEquipmentSlot.chest()), player.getItemInSlot(IEntityEquipmentSlot.legs()), player.getItemInSlot(IEntityEquipmentSlot.feet())) { return; }
		
		server.commandManager.executeCommandSilent(server, "advancement grant " ~ player.name ~ " only triumph:thecataclysm/earmor");
});
//Early Armor Sets

//Mid Armor Sets
function hasMidArmor(helmet as IItemStack, chestplate as IItemStack, legging as IItemStack, boot as IItemStack) as bool {

    var condition = 0;

val Helmets = [
	<minecraft:iron_helmet>,
	<cqrepoured:helmet_heavy_iron>,
	<metallurgy:brass_helmet>,
	<mod_lavacow:chitinarmor_helmet>
] as IItemStack[];

val Chestplates = [
	<minecraft:iron_chestplate>,
	<cqrepoured:chestplate_heavy_iron>,
	<metallurgy:brass_chestplate>,
	<mod_lavacow:chitinarmor_chestplate>
] as IItemStack[];

val Leggings = [
	<minecraft:iron_leggings>,
	<cqrepoured:leggings_heavy_iron>,
	<metallurgy:brass_leggings>,
	<mod_lavacow:chitinarmor_leggings>
] as IItemStack[];

val Boots = [
	<minecraft:iron_boots>,
	<cqrepoured:boots_heavy_iron>,
	<metallurgy:brass_boots>,
	<mod_lavacow:chitinarmor_boots>
] as IItemStack[];

	for helmut in Helmets {
        if (helmut.anyDamage().matches(helmet)) { condition += 1; }
	}
	for chestplut in Chestplates {	
		if (chestplut.anyDamage().matches(chestplate)) { condition += 1; }
	}
	for leggus in Leggings {
		if (leggus.anyDamage().matches(legging)) { condition += 1; }
	}
	for buuts in Boots {
		if (buuts.anyDamage().matches(boot)) { condition += 1; }
	}

    if condition == 4 { return true; }

    return false;

    if condition > 0 { condition = 0; }
}

events.register(function(event as crafttweaker.event.EntityLivingEquipmentChangeEvent){
	if event.entityLivingBase.world.isRemote() { return; }
	if !event.entityLivingBase instanceof IPlayer { return; }
	
	var player as IPlayer = event.entityLivingBase;

	if !hasMidArmor(player.getItemInSlot(IEntityEquipmentSlot.head()), player.getItemInSlot(IEntityEquipmentSlot.chest()), player.getItemInSlot(IEntityEquipmentSlot.legs()), player.getItemInSlot(IEntityEquipmentSlot.feet())) { return; }
		
		server.commandManager.executeCommandSilent(server, "advancement grant " ~ player.name ~ " only triumph:thecataclysm/marmor");
});
//Mid Armor Sets

//Pre-Carnage Armor Sets
function hasPreCArmor(helmet as IItemStack, chestplate as IItemStack, legging as IItemStack, boot as IItemStack) as bool {

    var condition = 0;

val Helmets = [
	<minecraft:diamond_helmet>,
	<cqrepoured:helmet_heavy_diamond>,
	<mysticalworld:silver_helmet>,
	<metallurgy:platinum_helmet>
] as IItemStack[];

val Chestplates = [
	<minecraft:diamond_chestplate>,
	<cqrepoured:chestplate_heavy_diamond>,
	<mysticalworld:silver_chestplate>,
	<metallurgy:platinum_chestplate>
] as IItemStack[];

val Leggings = [
	<minecraft:diamond_leggings>,
	<cqrepoured:leggings_heavy_diamond>,
	<mysticalworld:silver_leggings>,
	<metallurgy:platinum_leggings>
] as IItemStack[];

val Boots = [
	<minecraft:diamond_boots>,
	<cqrepoured:boots_heavy_diamond>,
	<mysticalworld:silver_boots>,
	<metallurgy:platinum_boots>
] as IItemStack[];

	for helmut in Helmets {
        if (helmut.anyDamage().matches(helmet)) { condition += 1; }
	}
	for chestplut in Chestplates {	
		if (chestplut.anyDamage().matches(chestplate)) { condition += 1; }
	}
	for leggus in Leggings {
		if (leggus.anyDamage().matches(legging)) { condition += 1; }
	}
	for buuts in Boots {
		if (buuts.anyDamage().matches(boot)) { condition += 1; }
	}

    if condition == 4 { return true; }

    return false;

    if condition > 0 { condition = 0; }
}

events.register(function(event as crafttweaker.event.EntityLivingEquipmentChangeEvent){
	if event.entityLivingBase.world.isRemote() { return; }
	if !event.entityLivingBase instanceof IPlayer { return; }
	
	var player as IPlayer = event.entityLivingBase;

	if !hasPreCArmor(player.getItemInSlot(IEntityEquipmentSlot.head()), player.getItemInSlot(IEntityEquipmentSlot.chest()), player.getItemInSlot(IEntityEquipmentSlot.legs()), player.getItemInSlot(IEntityEquipmentSlot.feet())) { return; }
		
		server.commandManager.executeCommandSilent(server, "advancement grant " ~ player.name ~ " only triumph:thecataclysm/pcarmor");
});
//Pre-Carnage Armor Sets

//Carnage Armor Sets
function hasCArmor(helmet as IItemStack, chestplate as IItemStack, legging as IItemStack, boot as IItemStack) as bool {

    var condition = 0;

val Helmets = [
	<metallurgy:vulcanite_helmet>,
	<metallurgy:ignatius_helmet>,
	<metallurgy:midasium_helmet>,
	<metallurgy:kalendrite_helmet>,
	<metallurgy:carmot_helmet>,
	<metallurgy:electrum_helmet>,
	<metallurgy:desichalkos_helmet>,
	<metallurgy:oureclase_helmet>
] as IItemStack[];

val Chestplates = [
	<metallurgy:vulcanite_chestplate>,
	<metallurgy:ignatius_chestplate>,
	<metallurgy:midasium_chestplate>,
	<metallurgy:kalendrite_chestplate>,
	<metallurgy:carmot_chestplate>,
	<metallurgy:electrum_chestplate>,
	<metallurgy:desichalkos_chestplate>,
	<metallurgy:oureclase_chestplate>
] as IItemStack[];

val Leggings = [
	<metallurgy:vulcanite_leggings>,
	<metallurgy:ignatius_leggings>,
	<metallurgy:midasium_leggings>,
	<metallurgy:kalendrite_leggings>,
	<metallurgy:carmot_leggings>,
	<metallurgy:electrum_leggings>,
	<metallurgy:desichalkos_leggings>,
	<metallurgy:oureclase_leggings>
] as IItemStack[];

val Boots = [
	<metallurgy:vulcanite_boots>,
	<metallurgy:ignatius_boots>,
	<metallurgy:midasium_boots>,
	<metallurgy:kalendrite_boots>,
	<metallurgy:carmot_boots>,
	<metallurgy:electrum_boots>,
	<metallurgy:desichalkos_boots>,
	<metallurgy:oureclase_boots>
] as IItemStack[];

	for helmut in Helmets {
        if (helmut.anyDamage().matches(helmet)) { condition += 1; }
	}
	for chestplut in Chestplates {	
		if (chestplut.anyDamage().matches(chestplate)) { condition += 1; }
	}
	for leggus in Leggings {
		if (leggus.anyDamage().matches(legging)) { condition += 1; }
	}
	for buuts in Boots {
		if (buuts.anyDamage().matches(boot)) { condition += 1; }
	}

    if condition == 4 { return true; }

    return false;

    if condition > 0 { condition = 0; }
}

events.register(function(event as crafttweaker.event.EntityLivingEquipmentChangeEvent){
	if event.entityLivingBase.world.isRemote() { return; }
	if !event.entityLivingBase instanceof IPlayer { return; }
	
	var player as IPlayer = event.entityLivingBase;

	if !hasCArmor(player.getItemInSlot(IEntityEquipmentSlot.head()), player.getItemInSlot(IEntityEquipmentSlot.chest()), player.getItemInSlot(IEntityEquipmentSlot.legs()), player.getItemInSlot(IEntityEquipmentSlot.feet())) { return; }
		
		server.commandManager.executeCommandSilent(server, "advancement grant " ~ player.name ~ " only triumph:thecataclysm/carmor");
});
//Carnage Armor Sets

//Remnant Armor Sets
function hasRArmor(helmet as IItemStack, chestplate as IItemStack, legging as IItemStack, boot as IItemStack) as bool {

    var condition = 0;

val Helmets = [
	<metallurgy:eximite_helmet>,
	<metallurgy:tartarite_helmet>,
	<metallurgy:lutetium_helmet>,
	<mod_lavacow:felarmor_helmet>
] as IItemStack[];

val Chestplates = [
	<metallurgy:eximite_chestplate>,
	<metallurgy:tartarite_chestplate>,
	<metallurgy:lutetium_chestplate>,
	<mod_lavacow:felarmor_chestplate>
] as IItemStack[];

val Leggings = [
	<metallurgy:eximite_leggings>,
	<metallurgy:tartarite_leggings>,
	<metallurgy:lutetium_leggings>,
	<mod_lavacow:felarmor_leggings>
] as IItemStack[];

val Boots = [
	<metallurgy:eximite_boots>,
	<metallurgy:tartarite_boots>,
	<metallurgy:lutetium_boots>,
	<mod_lavacow:felarmor_boots>
] as IItemStack[];

	for helmut in Helmets {
        if (helmut.anyDamage().matches(helmet)) { condition += 1; }
	}
	for chestplut in Chestplates {	
		if (chestplut.anyDamage().matches(chestplate)) { condition += 1; }
	}
	for leggus in Leggings {
		if (leggus.anyDamage().matches(legging)) { condition += 1; }
	}
	for buuts in Boots {
		if (buuts.anyDamage().matches(boot)) { condition += 1; }
	}

    if condition == 4 { return true; }

    return false;

    if condition > 0 { condition = 0; }
}

events.register(function(event as crafttweaker.event.EntityLivingEquipmentChangeEvent){
	if event.entityLivingBase.world.isRemote() { return; }
	if !event.entityLivingBase instanceof IPlayer { return; }
	
	var player as IPlayer = event.entityLivingBase;

	if !hasRArmor(player.getItemInSlot(IEntityEquipmentSlot.head()), player.getItemInSlot(IEntityEquipmentSlot.chest()), player.getItemInSlot(IEntityEquipmentSlot.legs()), player.getItemInSlot(IEntityEquipmentSlot.feet())) { return; }
		
		server.commandManager.executeCommandSilent(server, "advancement grant " ~ player.name ~ " only triumph:thecataclysm/endarmor");
});
//Remnant Armor Sets

//Midnight Armor Sets
function hasMArmor(helmet as IItemStack, chestplate as IItemStack, legging as IItemStack, boot as IItemStack) as bool {

    var condition = 0;

val Helmets = [
	<metallurgy:shadow_steel_helmet>,
	<mutantbeasts:mutant_skeleton_skull>,
	<midnight:tenebrum_helmet>,
	<metallurgy:haderoth_helmet>,
	<metallurgy:ceruclase_helmet>,
	<midnight:rockshroom_helmet>,
	<nyx:meteor_helm>
] as IItemStack[];

val Chestplates = [
	<metallurgy:shadow_steel_chestplate>,
	<mutantbeasts:mutant_skeleton_chestplate>,
	<midnight:tenebrum_chestplate>,
	<metallurgy:haderoth_chestplate>,
	<metallurgy:ceruclase_chestplate>,
	<midnight:rockshroom_chestplate>,
	<nyx:meteor_chest>
] as IItemStack[];

val Leggings = [
	<metallurgy:shadow_steel_leggings>,
	<mutantbeasts:mutant_skeleton_leggings>,
	<midnight:tenebrum_leggings>,
	<metallurgy:haderoth_leggings>,
	<metallurgy:ceruclase_leggings>,
	<midnight:rockshroom_leggings>,
	<nyx:meteor_pants>
] as IItemStack[];

val Boots = [
	<metallurgy:shadow_steel_boots>,
	<mutantbeasts:mutant_skeleton_boots>,
	<midnight:tenebrum_boots>,
	<metallurgy:haderoth_boots>,
	<metallurgy:ceruclase_boots>,
	<midnight:rockshroom_boots>,
	<nyx:meteor_boots>
] as IItemStack[];

	for helmut in Helmets {
        if (helmut.anyDamage().matches(helmet)) { condition += 1; }
	}
	for chestplut in Chestplates {	
		if (chestplut.anyDamage().matches(chestplate)) { condition += 1; }
	}
	for leggus in Leggings {
		if (leggus.anyDamage().matches(legging)) { condition += 1; }
	}
	for buuts in Boots {
		if (buuts.anyDamage().matches(boot)) { condition += 1; }
	}

    if condition == 4 { return true; }

    return false;

    if condition > 0 { condition = 0; }
}

events.register(function(event as crafttweaker.event.EntityLivingEquipmentChangeEvent){
	if event.entityLivingBase.world.isRemote() { return; }
	if !event.entityLivingBase instanceof IPlayer { return; }
	
	var player as IPlayer = event.entityLivingBase;

	if !hasMArmor(player.getItemInSlot(IEntityEquipmentSlot.head()), player.getItemInSlot(IEntityEquipmentSlot.chest()), player.getItemInSlot(IEntityEquipmentSlot.legs()), player.getItemInSlot(IEntityEquipmentSlot.feet())) { return; }
		
		server.commandManager.executeCommandSilent(server, "advancement grant " ~ player.name ~ " only triumph:thecataclysm/bloodarmor");
});
//Midnight Armor Sets

//Erebus Armor Sets
function hasEArmor(helmet as IItemStack, chestplate as IItemStack, legging as IItemStack, boot as IItemStack) as bool {

    var condition = 0;

val Helmets = [
	<metallurgy:amordrine_helmet>,
	<erebus:jade_helmet>,
	<metallurgy:inolashite_helmet>,
	<metallurgy:vyroxeres_helmet>,
	<erebus:rein_compound_goggles>,
	<metallurgy:krik_helmet>,
	<erebus:rhino_exoskeleton_helmet>,
	<metallurgy:black_steel_helmet>
] as IItemStack[];

val Chestplates = [
	<metallurgy:amordrine_chestplate>,
	<erebus:jade_chestplate>,
	<metallurgy:inolashite_chestplate>,
	<metallurgy:vyroxeres_chestplate>,
	<erebus:glider_chestplate_powered>,
	<metallurgy:krik_chestplate>,
	<erebus:rhino_exoskeleton_chestplate>,
	<metallurgy:black_steel_chestplate>
] as IItemStack[];

val Leggings = [
	<metallurgy:amordrine_leggings>,
	<erebus:jade_leggings>,
	<metallurgy:inolashite_leggings>,
	<metallurgy:vyroxeres_leggings>,
	<erebus:sprint_leggings>,
	<metallurgy:krik_leggings>,
	<erebus:rhino_exoskeleton_leggings>,
	<metallurgy:black_steel_leggings>
] as IItemStack[];

val Boots = [
	<metallurgy:amordrine_boots>,
	<erebus:jade_boots>,
	<metallurgy:inolashite_boots>,
	<metallurgy:vyroxeres_boots>,
	<erebus:rein_exoskeleton_boots>,
	<metallurgy:krik_boots>,
	<erebus:rhino_exoskeleton_boots>,
	<metallurgy:black_steel_boots>
] as IItemStack[];

	for helmut in Helmets {
        if (helmut.anyDamage().matches(helmet)) { condition += 1; }
	}
	for chestplut in Chestplates {	
		if (chestplut.anyDamage().matches(chestplate)) { condition += 1; }
	}
	for leggus in Leggings {
		if (leggus.anyDamage().matches(legging)) { condition += 1; }
	}
	for buuts in Boots {
		if (buuts.anyDamage().matches(boot)) { condition += 1; }
	}

    if condition == 4 { return true; }

    return false;

    if condition > 0 { condition = 0; }
}

events.register(function(event as crafttweaker.event.EntityLivingEquipmentChangeEvent){
	if event.entityLivingBase.world.isRemote() { return; }
	if !event.entityLivingBase instanceof IPlayer { return; }
	
	var player as IPlayer = event.entityLivingBase;

	if !hasEArmor(player.getItemInSlot(IEntityEquipmentSlot.head()), player.getItemInSlot(IEntityEquipmentSlot.chest()), player.getItemInSlot(IEntityEquipmentSlot.legs()), player.getItemInSlot(IEntityEquipmentSlot.feet())) { return; }
		
		server.commandManager.executeCommandSilent(server, "advancement grant " ~ player.name ~ " only triumph:thecataclysm/erearmor");
});
//Erebus Armor Sets

//Lore Pages
events.register(function(event as crafttweaker.event.PlayerAdvancementEvent){
	if event.player.world.isRemote() { return; }

	if event.id == "triumph:thecataclysm/eores" { 
		server.commandManager.executeCommandSilent(server, "lore give " ~ event.player.name ~ " Guidance Starter");
	}
	if event.id == "triumph:thecataclysm/earmor" { 
		server.commandManager.executeCommandSilent(server, "lore give " ~ event.player.name ~ " Guidance Prepare");
	}
	if event.id == "triumph:thecataclysm/tdk" { 
		server.commandManager.executeCommandSilent(server, "lore give " ~ event.player.name ~ " Guidance Caverns");
	}
	if event.id == "triumph:thecataclysm/marmor" { 
		server.commandManager.executeCommandSilent(server, "lore give " ~ event.player.name ~ " Guidance Upgrades");
	}
	if event.id == "triumph:thecataclysm/thebeneath" { 
		server.commandManager.executeCommandSilent(server, "lore give " ~ event.player.name ~ " Guidance Caveexplore");
	}
	if event.id == "triumph:thecataclysm/pcarmor" { 
		server.commandManager.executeCommandSilent(server, "lore give " ~ event.player.name ~ " Guidance SecondBoss");
	}
	if event.id == "triumph:thecataclysm/crown" { 
		server.commandManager.executeCommandSilent(server, "lore give " ~ event.player.name ~ " Guidance Upgrades2");
	}
	if event.id == "triumph:thecataclysm/emblem" { 
		server.commandManager.executeCommandSilent(server, "lore give " ~ event.player.name ~ " Guidance PreCarnage");
	}
	if event.id == "triumph:thecataclysm/theworldofcarnage" { 
		server.commandManager.executeCommandSilent(server, "lore give " ~ event.player.name ~ " Guidance Carnage");
	}
	if event.id == "triumph:thecataclysm/cores" { 
		server.commandManager.executeCommandSilent(server, "lore give " ~ event.player.name ~ " Guidance Upgrades3");
	}
	if event.id == "triumph:thecataclysm/netherstar" { 
		server.commandManager.executeCommandSilent(server, "lore give " ~ event.player.name ~ " Guidance DwarfStar");
	}
	if event.id == "triumph:thecataclysm/carmor" { 
		server.commandManager.executeCommandSilent(server, "lore give " ~ event.player.name ~ " Guidance Hellscape");
	}
	if event.id == "triumph:thecataclysm/demonsoulcube" { 
		server.commandManager.executeCommandSilent(server, "lore give " ~ event.player.name ~ " Guidance Rahovart");
	}
	if event.id == "triumph:thecataclysm/crimsonheart" { 
		server.commandManager.executeCommandSilent(server, "lore give " ~ event.player.name ~ " Guidance Crimson");
	}
	if event.id == "triumph:thecataclysm/eyeender" { 
		server.commandManager.executeCommandSilent(server, "lore give " ~ event.player.name ~ " Guidance Eye");
	}
	if event.id == "triumph:thecataclysm/scales" { 
		server.commandManager.executeCommandSilent(server, "lore give " ~ event.player.name ~ " Guidance RemExplore");
	}
	if event.id == "triumph:thecataclysm/amethyst" { 
		server.commandManager.executeCommandSilent(server, "lore give " ~ event.player.name ~ " Guidance Amethyst");
	}
	if event.id == "triumph:thecataclysm/endarmor" { 
		server.commandManager.executeCommandSilent(server, "lore give " ~ event.player.name ~ " Guidance Asmodeus");
	}
	if event.id == "triumph:thecataclysm/ruby" { 
		server.commandManager.executeCommandSilent(server, "lore give " ~ event.player.name ~ " Guidance Blood");
	}
	if event.id == "triumph:thecataclysm/bloodarmor" { 
		server.commandManager.executeCommandSilent(server, "lore give " ~ event.player.name ~ " Guidance Hirschgeist");
	}
	if event.id == "triumph:thecataclysm/theerebus" { 
		server.commandManager.executeCommandSilent(server, "lore give " ~ event.player.name ~ " Guidance Erebus");
	}
	if event.id == "triumph:thecataclysm/ereores" { 
		server.commandManager.executeCommandSilent(server, "lore give " ~ event.player.name ~ " Guidance Upgrades4");
	}
	if event.id == "triumph:thecataclysm/soulcrystal" { 
		server.commandManager.executeCommandSilent(server, "lore give " ~ event.player.name ~ " Guidance FinalGear");
	}
	if event.id == "triumph:thecataclysm/erearmor" { 
		server.commandManager.executeCommandSilent(server, "lore give " ~ event.player.name ~ " Guidance Amalgalich");
	}
	if event.id == "triumph:thecataclysm/nightmare" { 
		server.commandManager.executeCommandSilent(server, "lore give " ~ event.player.name ~ " Guidance Nightmare");
	}
});
//Lore Pages