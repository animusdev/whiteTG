/obj/item/gun/ballistic/automatic/m90/columbine
	name = "Space Hipoint 995"
	desc = "Brooks, I like you now. Get out of here. Go home now."
	icon = 'code/white/hule/columbine/hipoint995.dmi'
	icon_state = "icon"
	item_state = "carbine"
	lefthand_file = 'code/white/hule/columbine/hipoint995.dmi'
	righthand_file = 'code/white/hule/columbine/hipoint995_r.dmi'
	pin = /obj/item/device/firing_pin
	mag_type = /obj/item/ammo_box/magazine/pistolm9mm
	burst_size = 1
	fire_delay = 0.5

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
							, /obj/item/grenade/syndieminibomb/concussion = 3, /obj/item/grenade/plastic/c4 = 2)

/obj/effect/mob_spawn/human/desertsurvivalist
	name = "abyss"
	desc = ""
	density = 0
	mob_name = "a schoolshooter"
	icon = 'icons/mob/nest.dmi'
	icon_state = "hole"
	flavour_text = "<span class='big bold'>������ ����</b>"
	roundstart = FALSE
	death = FALSE
	random = TRUE
	mob_species = /datum/species/human

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
							, /obj/item/grenade/syndieminibomb/concussion = 3, /obj/item/grenade/plastic/c4 = 2)

	assignedrole = "Schoolshooter"

