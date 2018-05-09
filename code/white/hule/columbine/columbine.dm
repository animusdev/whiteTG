/obj/item/gun/ballistic/automatic/m90/columbine
	name = "Space Hipoint 995"
	desc = "Brooks, I like you now. Get out of here. Go home now."
	icon = 'code/white/hule/columbine/hipoint995.dmi'
	icon_state = "icon"
	item_state = "carbine"
	lefthand_file = 'code/white/hule/columbine/hipoint995.dmi'
	righthand_file = 'code/white/hule/columbine/hipoint995_r.dmi'
	pin = /obj/item/firing_pin
	mag_type = /obj/item/ammo_box/magazine/pistolm9mm
	burst_size = 1
	fire_delay = 0.5

/datum/crafting_recipe/hipoint
	name = "Hipoint carbne"
	result = /obj/item/gun/ballistic/automatic/m90/columbine
	reqs = list(/obj/item/gun/ballistic/automatic/pistol = 1,
				/obj/item/pipe = 1,
				/obj/item/stack/sheet/metal = 20,
				/obj/item/stack/rods = 5)
	tools = list(TOOL_WELDER, TOOL_SCREWDRIVER, TOOL_WIRECUTTER, TOOL_WRENCH, TOOL_COOKBOOK)
	time = 600
	category = CAT_WEAPONRY
	subcategory = CAT_WEAPON

/datum/outfit/schoolshooter
	name = "Schoolshooter"

	belt = /obj/item/gun/ballistic/automatic/m90/columbine
	glasses = /obj/item/clothing/glasses/sunglasses
	gloves = /obj/item/clothing/gloves/fingerless
	uniform = /obj/item/clothing/under/syndicate
	suit = /obj/item/clothing/suit/armor/vest/leather
	shoes = /obj/item/clothing/shoes/combat
	head = /obj/item/clothing/head/soft/black
	l_pocket = /obj/item/switchblade
	r_pocket = /obj/item/ammo_box/magazine/pistolm9mm
	back = /obj/item/storage/backpack/satchel
	backpack_contents = list(/obj/item/ammo_box/c9mm = 1, /obj/item/ammo_box/magazine/pistolm9mm = 1,
							, /obj/item/grenade/syndieminibomb/concussion = 3, /obj/item/grenade/plastic/c4 = 2, /obj/item/wirekit = 1)


