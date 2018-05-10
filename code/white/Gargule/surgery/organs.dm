/obj/item/organ/tail/lizard/alien
	name = "alien tail"
	desc = "A severed alien tail."
	icon = 'code/white/Gargule/icons.dmi'
	icon_state = "severedtail"
	tail_type = "Alien"
	color = null
//	alien_powers = list(/obj/effect/proc_holder/spell/aoe_turf/repulse/xeno(src), /obj/effect/proc_holder/alien/resin)


/obj/item/organ/tail/lizard/alien/Remove(mob/living/carbon/human/H,  special = 0)
	..()
	if(isalien(H))
		H.RemoveSpell(/obj/effect/proc_holder/spell/aoe_turf/repulse/xeno)
	else
		H.RemoveSpell(/obj/effect/proc_holder/spell/aoe_turf/repulse/xeno_weak)
	if(istype(H))
		H.dna.species.mutant_bodyparts -= "tail_lizard"
		H.dna.species.mutant_bodyparts -= "spines"
		color = "#" + H.dna.features["mcolor"]
		tail_type = H.dna.features["tail_lizard"]
		spines = H.dna.features["spines"]
		H.update_body()


/obj/item/organ/tail/lizard/alien/Insert(mob/living/carbon/human/H, special = 0, drop_if_replaced = TRUE)
	..()
	if(isalien(owner))
		owner.AddSpell(new /obj/effect/proc_holder/spell/aoe_turf/repulse/xeno(src))
	else
		owner.AddSpell(new /obj/effect/proc_holder/spell/aoe_turf/repulse/xeno_weak(src))
	if(istype(H))
		if(!("tail_lizard" in H.dna.species.mutant_bodyparts))
			H.dna.species.mutant_bodyparts |= "tail_lizard"
			H.dna.features["tail_lizard"] = tail_type

		if(!("spines" in H.dna.species.mutant_bodyparts))
			H.dna.features["spines"] = spines
			H.dna.species.mutant_bodyparts |= "spines"
			H.update_body()

/datum/sprite_accessory/tails/lizard/alien
	name = "Alien"
	icon = 'code/white/Gargule/icons.dmi'
	icon_state = "cat"
//	hasinner = 1
	color_src = 0

/datum/sprite_accessory/tails_animated/lizard/alien
	name = "Alien"
	icon = 'code/white/Gargule/icons.dmi'
	icon_state = "cat"
	color_src = 0