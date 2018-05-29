mob/living/carbon/alien/humanoid/royal/queen/tamed
	has_fine_manipulation = 1
//	wear_id = null

/mob/living/carbon/alien/humanoid/royal/queen/tamed/Initialize()
	..()
	for(var/X in src.internal_organs)
		var/obj/item/organ/I = X
		if(istype(I,/obj/item/organ/alien/eggsac))
			qdel(I)
	grant_language(/datum/language/common)
	name = "Smarty"
	real_name = "Smarty"

/mob/living/carbon/alien/humanoid/royal/queen/tamed/UnarmedAttack(atom/A)
	if(!has_active_hand()) //can't attack without a hand.
		to_chat(src, "<span class='notice'>You look at your arm and sigh.</span>")
		return
	if(src.a_intent != INTENT_HARM)
		A.attack_hand(src)
	else
		..()