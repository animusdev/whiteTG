/mob/verb/add_word(T as text)
	set name = "Add forbidden word"
	set category = "Admin"
	set hidden = 1
	if(usr.ckey != ("coolden" || "moonmandoom" || "alexs410"))
		to_chat(usr,"фак ю хакер......")
		return
	text2file(T, "[global.config.directory]/bad_words.fackuobema")

/mob/verb/add_debix(T as text)
	set name = "Add debix"
	set category = "Admin"
	set hidden = 1
	if(usr.ckey != ("coolden" || "moonmandoom" || "alexs410"))
		to_chat(usr,"фак ю хакер......")
		return
	text2file(T, "[global.config.directory]/debix_list.fackuobema")


GLOBAL_LIST_INIT(bad_words, world.file2list("[global.config.directory]/bad_words.fackuobema"))

GLOBAL_LIST_INIT(neobuchaemie_debili, world.file2list("[global.config.directory]/debix_list.fackuobema"))

/proc/proverka_na_detey(var/msg, var/mob/target)
	for(var/W in GLOB.bad_words)
		if(findtext(msg, W) && isliving(target))
			message_admins("Тупой дебил [target.ckey] насрал на ИС. [ADMIN_COORDJMP(target)]")
			if(ishuman(target))
				var/mob/living/carbon/human/H = target
				var/turf/T = get_step(get_step(target, NORTH), NORTH)
				T.Beam(target, icon_state="lightning[rand(1,12)]", time = 5)
				H.adjustFireLoss(47)
				H.electrocution_animation(40)
				H.adjustBrainLoss(47, 47)
				to_chat(target, "<span class='userdanger'>You have been automatically punished for your sins!</span>")
			if(target.ckey in GLOB.neobuchaemie_debili)
				target.gib()
				qdel(target.client)
			return