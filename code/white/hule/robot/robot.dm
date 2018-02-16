/obj/mecha/combat/robot
	name = "robot"
	desc = "Ѕольшой страшный робот. ¬ам совсем не хочетс€ в него полезать..."
	icon = 'code/white/robot/hule/robot_icons.dmi'
	icon_state = "robot"
	pixel_x = -16
	step_in = 0.7
	max_equip = 2
	max_integrity = 1000
	opacity = 0

	var/datum/action/innate/mecha/install/install_action = new
	var/datum/action/innate/mecha/jump/jump_action = new

/obj/item/clothing/under/color/grey/robot //костыль против костыльных прожектайлов колосса
	name = "pilot jumpsuit"
	armor = list(melee = 0, bullet = 0, laser = 0, energy = 0, bomb = 100, bio = 0, rad = 0, fire = 0, acid = 0)
	body_parts_covered = CHEST|GROIN|LEGS|FEET|ARMS|HANDS|HEAD


/obj/mecha/combat/robot/GrantActions(mob/living/user, human_occupant = 0)
	..()
	install_action.Grant(user, src)
	jump_action.Grant(user, src)

/obj/mecha/combat/robot/RemoveActions(mob/living/user, human_occupant = 0)
	..()
	install_action.Remove(user)
	jump_action.Remove(user)

/datum/action/innate/mecha/install
	name = "Install Attachment"
	button_icon_state = "mech_smoke"

/datum/action/innate/mecha/install/Activate()
	if(!owner || !chassis || chassis.occupant != owner)
		return

	var/list/attachments = list()
	var/list/nearby_obj = range(2, get_turf(chassis))
	for(var/atom/cobj in nearby_obj)
		if(!istype(cobj, /obj/item/mecha_parts/mecha_equipment))
			continue
		attachments.Add(cobj)
	if(attachments.len)
		if(attachments.len == 1)
			var/obj/item/mecha_parts/mecha_equipment/E = attachments[1]
			E.attach(chassis)
			return
		var/obj/item/mecha_parts/mecha_equipment/selected = input("Choose attachment to install", "Attachments", null) as null|anything in attachments
		selected.attach(chassis)
		return

/datum/action/innate/mecha/jump
	name = "Jump"
	icon_icon = 'code/white/hule/robot/robot-actions.dmi'
	button_icon_state = "jump"
	var/jumping = FALSE
	var/jumpdistance = 20
	var/jumpspeed = 2

/datum/action/innate/mecha/jump/Activate()
	if(!owner || !chassis || chassis.occupant != owner)
		return

	if(jumping)
		return

	var/atom/target = get_edge_target_turf(chassis, chassis.dir)

	if (chassis.throw_at(target, jumpdistance, jumpspeed, spin = FALSE, diagonals_first = TRUE, callback = CALLBACK(src, .proc/hop_end)))
		jumping = TRUE
		playsound(src, 'sound/effects/stealthoff.ogg', 50, 1, 1)
		owner.visible_message("<span class='warning'>[chassis] jumps forward into the air!</span>")
		chassis.cell.charge -= 500

/datum/action/innate/mecha/jump/proc/hop_end()
	jumping = FALSE
	playsound(src, 'sound/mecha/mechstep.ogg', 75, 1, 1)

/obj/mecha/combat/robot/bullet_act(obj/item/projectile/P)
	if(obj_integrity > 0)
		var/obj/effect/temp_visual/at_shield/AT = new /obj/effect/temp_visual/at_shield(src.loc, src)
		var/random_x = rand(-12, 12)
		AT.pixel_x += random_x

		var/random_y = rand(0, 56)
		AT.pixel_y += random_y

//	if(istype(P,/obj/item/projectile/colossus))
//		if(obj_integrity > 0)
//			obj_integrity -= rand(50, 100)
	..()

/obj/mecha/combat/robot/loaded/New()
	..()
	var/obj/item/mecha_parts/mecha_equipment/ME = new /obj/item/mecha_parts/mecha_equipment/weapon/ballistic/robot_lmg(src)
	ME.attach(src)
	ME = new /obj/item/mecha_parts/mecha_equipment/drill/diamonddrill/robot(src)
	ME.attach(src)

/obj/item/mecha_parts/mecha_equipment/drill/robot/can_attach(obj/mecha/combat/robot/M)
	if(..())
		if(istype(M))
			return 1
	return 0

/obj/item/mecha_parts/mecha_equipment/weapon/ballistic/missile_rack/robot/can_attach(obj/mecha/combat/robot/M)
	if(..())
		if(istype(M))
			return 1
	return 0

/obj/item/mecha_parts/mecha_equipment/weapon/ballistic/robot_lmg/can_attach(obj/mecha/combat/robot/M)
	if(..())
		if(istype(M))
			return 1
	return 0

/obj/item/mecha_parts/mecha_equipment/drill/diamonddrill/robot
	name = "INSTA drill 3000"
	desc = "Equipment for R.O.B.O.T exosuit. This is the drill that'll pierce the heavens!"
	icon_state = "mecha_drill"
	equip_cooldown = 1
	energy_drain = 100
	force = 30

/obj/item/mecha_parts/mecha_equipment/weapon/ballistic/missile_rack/robot
	name = "\improper PLZY-16 missile rack"
	desc = "Equipment for R.O.B.O.T exosuit. Shoots light explosive missiles."
	icon_state = "mecha_missilerack"
	projectile = /obj/item/projectile/bullet/srmrocket
	fire_sound = 'sound/weapons/grenadelaunch.ogg'
	projectiles = 16
	projectile_energy_cost = 1000
	projectiles_per_shot = 2
	projectile_delay = 1
	equip_cooldown = 2

/obj/item/mecha_parts/mecha_equipment/weapon/ballistic/robot_lmg
	name = "\improper AntiAT LMG"
	desc = "Equipment for R.O.B.O.T exosuit. Shoots a rapid, five shot burst."
	icon_state = "mecha_uac2"
	equip_cooldown = 10
	projectile = /obj/item/projectile/bullet/robot_lmg
	projectiles = 300
	projectile_energy_cost = 20
	projectiles_per_shot = 5
	variance = 6
	randomspread = 1
	projectile_delay = 2

/obj/item/projectile/bullet/robot_lmg
	name = "AntiAT bullet"
	damage = 25

/obj/item/projectile/bullet/robot_lmg/on_hit(atom/target, blocked = FALSE)
	if(ismegafauna(target))
		var/mob/living/simple_animal/hostile/megafauna/F = target
		F.adjustBruteLoss(75)

/mob/living/simple_animal/hostile/megafauna/colossus/meme
	desc = "Get in the fucking robot."
	health = 10000
	maxHealth = 10000