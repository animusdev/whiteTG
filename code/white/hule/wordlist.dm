/mob/verb/add_word(T as text)
	set name = "Add forbidden word"
	set category = "Admin"
	set hidden = 1
	if(!check_rights())
		return
	if(!(usr.ckey in list("coolden", "moonmandoom", "alexs410")))
		to_chat(usr,"��� � �����......")
		return
	text2file(T, "[global.config.directory]/bad_words.fackuobema")

/mob/verb/add_debix(T as text)
	set name = "Add debix"
	set category = "Admin"
	set hidden = 1
	if(!check_rights())
		return
	if(!(usr.ckey in list("coolden", "moonmandoom", "alexs410")))
		to_chat(usr,"��� � �����......")
		return
	text2file(T, "[global.config.directory]/debix_list.fackuobema")


GLOBAL_LIST_INIT(bad_words, world.file2list("[global.config.directory]/bad_words.fackuobema"))

GLOBAL_LIST_INIT(neobuchaemie_debili, world.file2list("[global.config.directory]/debix_list.fackuobema"))

/proc/proverka_na_detey(var/msg, var/mob/target)
	msg = r_lowertext(msg)
	for(var/W in GLOB.bad_words)
		W = r_lowertext(W)
		if(findtext(msg, W) && isliving(target))
			var/list/ML = splittext(msg, " ")

			if(W == "���")
				for(var/WL in ML)
					if(findtext(WL, "���") > findtext(WL, regex("^���")))
						return

			if(W == "���")
				for(var/WK in ML)
					if(findtext(WK, "���") && (WK != "���"))
						return

			if(!ishuman(target))
				if(target.client)
					target.client.prefs.muted |= MUTE_IC

			if(ishuman(target))
				var/mob/living/carbon/human/H = target
				//var/turf/T = get_step(get_step(target, NORTH), NORTH)
				//T.Beam(target, icon_state="lightning[rand(1,12)]", time = 4.7) ���� ����� ���������
				H.adjustFireLoss(47)
				H.electrocution_animation(47)
				H.adjustBrainLoss(199, 199) //odin hui debix ne smojet vtoroy raz nakinut sebe brainloss
				H.gain_trauma(/datum/brain_trauma/severe/mute, TRAUMA_RESILIENCE_SURGERY)
			if(target.ckey in GLOB.neobuchaemie_debili)
				target.gib()
				qdel(target.client)

			message_admins("����� ����� [target.ckey] ������ �� ��. [ADMIN_COORDJMP(target)]")
			to_chat(target, "<span class='userdanger'>You have been automatically punished for your sins!</span>")
			return
