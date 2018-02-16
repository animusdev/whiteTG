//////////////////////////////фикс параши тегешников///////////////////////////////////////
/obj/vehicle/ridden/space/doyoulike/mycar
	name = "BM Speedwagon"
	desc = "Push it to the limit, walk along the razor's edge."
	icon = 'icons/obj/car.dmi'
	icon_state = "speedwagon"
	layer = LYING_MOB_LAYER
	var/static/mutable_appearance/overlay = mutable_appearance(icon, "speedwagon_cover", ABOVE_MOB_LAYER)
	max_buckled_mobs = 4
	var/crash_all = FALSE //CHAOS
	pixel_y = -48 //to fix the offset when Initialized()
	pixel_x = -48

/obj/vehicle/ridden/space/doyoulike/mycar/Initialize()
	. = ..()
	add_overlay(overlay)
	var/datum/component/riding/D = LoadComponent(/datum/component/riding)
	D.vehicle_move_delay = 0

	D.set_vehicle_dir_offsets(NORTH, -48, -48)
	D.set_vehicle_dir_offsets(SOUTH, -48, -48)
	D.set_vehicle_dir_offsets(EAST, -48, -48)
	D.set_vehicle_dir_offsets(WEST, -48, -48)

	D.set_riding_offsets(1, list(TEXT_NORTH = list(-10, -4), TEXT_SOUTH = list(16, 3), TEXT_EAST = list(-4, 30), TEXT_WEST = list(4, -3)))
	D.set_riding_offsets(2, list(TEXT_NORTH = list(19, -5, 4), TEXT_SOUTH = list(-13, 3, 4), TEXT_EAST = list(-4, -3, 4.1), TEXT_WEST = list(4, 28, 3.9)))
	D.set_riding_offsets(3, list(TEXT_NORTH = list(-10, -18, 4.2), TEXT_SOUTH = list(16, 25, 3.9), TEXT_EAST = list(-22, 30), TEXT_WEST = list(22, -3, 4.1)))
	D.set_riding_offsets(4, list(TEXT_NORTH = list(19, -18, 4.2), TEXT_SOUTH = list(-13, 25, 3.9), TEXT_EAST = list(-22, 3, 3.9), TEXT_WEST = list(22, 28)))
	for(var/i in GLOB.cardinals)
		D.set_vehicle_dir_layer(i, BELOW_MOB_LAYER)

/obj/vehicle/ridden/space/doyoulike/mycar/Collide(atom/movable/A)
	. = ..()
	if(A.density && has_buckled_mobs())
		var/atom/throw_target = get_edge_target_turf(A, dir)
		if(crash_all)
			A.throw_at(throw_target, 4, 3)
			visible_message("<span class='danger'>[src] crashes into [A]!</span>")
			playsound(src, 'sound/effects/bang.ogg', 50, 1)
		if(ishuman(A))
			var/mob/living/carbon/human/H = A
			H.Knockdown(100)
			H.adjustStaminaLoss(30)
			H.apply_damage(rand(100,180), BRUTE)
			if(!crash_all)
				H.throw_at(throw_target, 4, 3)
				visible_message("<span class='danger'>[src] crashes into [H]!</span>")
				playsound(src, 'sound/effects/bang.ogg', 50, 1)

/obj/vehicle/ridden/space/doyoulike/mycar/Moved()
	. = ..()
	if(has_buckled_mobs())
		for(var/atom/A in range(2, src))
			if(!(A in buckled_mobs))
				Collide(A)
