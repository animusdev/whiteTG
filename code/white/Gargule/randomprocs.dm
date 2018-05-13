/mob/living/proc/compoundDamage(var/mob/living/A)
	adjustBruteLoss(A.bruteloss)
	adjustOxyLoss(A.oxyloss)
	adjustToxLoss(A.toxloss)
	adjustFireLoss(A.fireloss)
	adjustCloneLoss(A.cloneloss)
	adjustStaminaLoss(A.staminaloss)

/mob/living/simple_animal/hostile/alien/drone/death(per1,per2)
	var/mob/living/carbon/alien/humanoid/drone/M = new(loc)
	M.compoundDamage(src)
	qdel(src)

/mob/living/simple_animal/hostile/alien/sentinel/death(per1,per2)
	var/mob/living/carbon/alien/humanoid/sentinel/M = new(loc)
	M.compoundDamage(src)
	qdel(src)

/mob/living/simple_animal/hostile/alien/queen/death(per1,per2)
	var/mob/living/carbon/alien/humanoid/royal/praetorian/M = new(loc)
	M.compoundDamage(src)
	qdel(src)

/mob/living/simple_animal/hostile/alien/queen/large/death(per1,per2)
	var/mob/living/carbon/alien/humanoid/royal/queen/M = new(loc)
	M.compoundDamage(src)
	qdel(src)

mob/living/carbon/human/species/lizard/Initialize()
	..()
	if(src.dna.features["tail_lizard"] == "Alien")
		src.dna.features["tail_lizard"] = "Smooth"