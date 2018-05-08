
GLOBAL_LIST_INIT(bad_words, world.file2list("[global.config.directory]/bad_words.txt"))

GLOBAL_LIST_INIT(neobuchaemie_debili, world.file2list("[global.config.directory]/debix_list.txt"))

/proc/proverka_na_detey(var/msg, var/mob/target)
	for(var/W in GLOB.bad_words)
		if(findtext(msg, W) || isliving(target))
			message_admins("Тупой дебил [target.ckey] насрал на ИС. [ADMIN_COORDJMP(target)]")
			if(ishuman(target))
				var/mob/living/carbon/human/H = target
				var/turf/T = get_step(get_step(target, NORTH), NORTH)
				T.Beam(target, icon_state="lightning[rand(1,12)]", time = 5)
				H.adjustFireLoss(75)
				H.electrocution_animation(40)
				H.adjustBrainLoss(47, 47)
				to_chat(target, "<span class='userdanger'>You have been automatically punished for your sins!</span>")
			if(target.ckey in GLOB.neobuchaemie_debili)
				target.gib()
				qdel(target.client)
			return