/obj/item/clothing/mask/gas/anonist
	name = "suspicious mask"
	desc = "������� ����� ������� �����, ������������ � �����������������, ������ �������������� � ���������� ��������."
	icon = 'code/white/hule/clothing/masks.dmi'
	alternate_worn_icon = 'code/white/hule/clothing/onmob.dmi'
	icon_state = "fawkes"
	item_state = "fawkes"
	armor = list("melee" = 10, "bullet" = 20, "laser" = 0,"energy" = 10, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)

/obj/item/clothing/mask/gas/anonist/equipped(mob/living/carbon/human/user, slot)
	..()
	if(slot == 2)
		to_chat(user, "<span class='warning'>�� ����� ����� �������� � �� [pick("����������","�������","������","����������73","��������","�������","���������","���������","�����","�������","��������")] ����������</span>")
//		to_chat(user, "<img src=[pick("cdn.discordapp.com/attachments/389758687750782997/428556384435568640/unknown.png", "cdn.discordapp.com/attachments/389758687750782997/428556488198324224/B8ytQCR6_6w.png","cdn.discordapp.com/attachments/389758687750782997/428556551574257684/unknown.png","cdn.discordapp.com/attachments/389758687750782997/428558148400578561/unknown.png")]>")

/obj/item/clothing/mask/gas/anonist/attack_hand(mob/user)
	if(iscarbon(user))
		var/mob/living/carbon/C = user
		if(src == C.wear_mask)
			to_chat(user, "<span class='userdanger'>�� �� ���? �� ������ ���� ��� ���� ��������� �� ��-��-��� � ���������, �������? �, ����????????????</span>")
			return
	..()

/datum/design/anonist
	name = "Funny Mask"
	id = "anonist"
	build_type = AUTOLATHE
	materials = list(MAT_METAL = 1000)
	build_path = /obj/item/clothing/mask/gas/anonist
	category = list("initial", "Misc")