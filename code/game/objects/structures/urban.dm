/obj/structure/automobile
	name = "generic automotive"
	desc = "A newer model of automotive."
	icon = 'icons/obj/structure/urban/cars.dmi'
	icon_state = "car"
	anchored = TRUE
	density = TRUE
	layer = ABOVE_ALL_MOB_LAYER

/obj/structure/automobile/random/Initialize(mapload)
	. = ..()
	cut_overlays()
	name = "[pick("deluxe Shibata Sport automotive","beat-up Poplar Auto Group automotive","weathered Shibata Sport automotive","beat-up Langenfeld automotive","deluxe Langenfeld automotive","weathered Langenfeld automotive")]"
	desc = "A [name] vehicle of working condition."
	icon_state = "car[rand(1, 10)]"
	return

/obj/structure/automobile/police
	name = "police cruiser"
	desc = "A police vehicle with all the bells and whistles you'd expect from a decently-funded agency."
	icon_state = "copcar"

/obj/structure/automobile_filler
	name = "vehicle"
	desc = "A piece of a larger vehicle."
	icon = 'icons/obj/structure/urban/cars.dmi'
	icon_state = "blank"
	anchored = TRUE
	density = TRUE

// Street Signs

/obj/structure/street_sign
	name = "stop sign"
	desc = "A stop sign to direct traffic. Sometimes a demand."
	icon = 'icons/obj/structure/urban/street_signs.dmi'
	icon_state = "stop"
	layer = ABOVE_ALL_MOB_LAYER
	anchored = TRUE

/obj/structure/street_sign/stop_konyang
	icon_state = "stop_konyang"
	desc = "A stop sign. You can't be really sure unless you speak Konyang."

/obj/structure/street_sign/yield
	name = "yield sign"
	desc = "A yield sign which tells you to slow down, rather politely. Let's hope you listen."
	icon_state = "yield"

/obj/structure/street_sign/warnings
	name = "warning sign"
	desc = "A sign. You think it's trying to warn you of something."
	icon_state = "warnings"

/obj/structure/street_sign/directional
	name = "turn ahead sign"
	desc = "A directional sign. How the turntables..."
	icon_state = "directional"

/obj/structure/street_sign/directional/yellow
	icon_state = "directional_yellow"

/obj/structure/street_sign/street
	name = "street sign"
	desc = "A street sign. As common as they are, sometimes people still get lost."
	icon_state = "street"

	var/street_name = null

/obj/structure/street_sign/street/Initialize(mapload)
	. = ..()
	name = "[street_name]"
	desc = "A street sign for [street_name]. As common as they are, sometimes people still get lost."

/obj/structure/street_sign/street/both
	dir = NORTH

/obj/structure/street_sign/street/right
	dir = WEST

/obj/structure/street_sign/street/left
	dir = EAST

/obj/structure/ms13/street_sign/turning
	desc = "A stop sign. Looks like you've passed the point of no return."
	icon_state = "noturn"

/obj/structure/street_sign/parking
	desc = "A sign. No parking allowed."
	icon_state = "noparking"

/obj/structure/street_sign/one_way
	desc = "A sign. Apparently you can only go one direction..."
	icon_state = "direction"

/obj/structure/street_sign/bus
	desc = "A bus sign. If you had to guess, you have to wait for a bus here."
	icon_state = "busstop"

/obj/structure/street_sign/railroad
	desc = "A sign. This one is a big white X. Wonder what that entails?"
	icon_state = "railcrossing"

/obj/structure/street_sign/only_direction
	desc = "A sign. It's telling you to only go this way."
	icon_state = "onlydir"

/obj/structure/street_sign/speed
	desc = "A sign. Always trying to slow you down."
	icon_state = "speed"

/obj/structure/street_sign/turn
	desc = "A sign. It's pointing a direction with arrows on it. Cool."
	icon_state = "turn"

/obj/structure/street_sign/exit
	desc = "A sign. It's showing you to an exit."
	icon_state = "exit"

/obj/structure/street_sign/nopedestrian
	desc = "A sign. Only operators of heavy machinery allowed!"
	icon_state = "nopedestrian"

/obj/structure/street_sign/drive_thru
	name = "drive thru sign"
	desc = "A drive-thru sign."
	icon_state = "drivethru"

// infrastructure

/obj/structure/stairs/urban
	icon = 'icons/obj/structure/urban/ledges.dmi'
	icon_state = "stairs-single"
	layer = 2.01
	opacity = 1

/obj/structure/stairs/urban/road_ramp
	name = "inclined asphalt ramp"
	desc = "A solid asphalt ramp to allow your vehicle to traverse inclines with ease."
	icon_state = "road-ramp-center"
	layer = 2.02

/obj/structure/stairs/urban/road_ramp/right
	icon_state = "road-ramp-right"

/obj/structure/stairs/urban/road_ramp/left
	icon_state = "road-ramp-left"

/obj/structure/closet/crate/bin/urban
	name = "tall garbage can"
	desc = "Garbage day!"
	icon = 'icons/obj/structure/urban/infrastructure.dmi'
	icon_state = "bin"

/obj/structure/closet/crate/bin/urban/compact
	name = "discrete garbage can"
	icon_state = "city-bin"
	anchored = TRUE

/obj/structure/closet/crate/bin/urban/dumpster
	name = "extra-wide hefty dumpster"
	desc = "This trunk carries a lot of junk."
	icon_state = "dumpster"
	anchored = TRUE

/obj/structure/structural_support
	name = "support structure"
	desc = "A big, sturdy support beam to hold up a huge mass above your head."
	icon = 'icons/obj/structure/industrial/infrastructure.dmi'
	icon_state = "truss"
	density = TRUE
	anchored = TRUE

/obj/structure/structural_support/side
	icon_state = "truss_side"

/obj/structure/manhole
	name = "sewer access manhole"
	desc = "Probably a bad idea to open this."
	icon = 'icons/obj/structure/urban/infrastructure.dmi'
	icon_state = "manhole_closed"
	anchored = TRUE
	var/open = 0

/obj/structure/manhole/attackby(obj/item/attacking_item, mob/user)
	if(attacking_item.iscrowbar())
		playsound(src.loc, 'sound/effects/stonedoor_openclose.ogg', 50, 1)
		to_chat(user, "You forcibly relocate the manhole, hopefully in the right way.")
	if(!open)
		visible_message("<span class='warning'>A horrid smell erupts from the abyss of the manhole, not one any soul should inhale. Some mistakes were made.</span>")
		icon_state = "manhole_open"
		desc = "This looks pretty dangerous, stinks horribly, and doesn't have a ladder inside. Watch out!"
		open = 1
		var/turf/turf = loc
		turf.is_hole = TRUE
		return
	if(open)
		visible_message("<span class='warning'>The manhole clunks and seals back into place, safely burying our problems underground for someone else later.</span>")
		icon_state = "manhole_closed"
		desc = "It looks recently opened and sloppily closed."
		open = 0
		var/turf/turf = loc
		turf.is_hole = FALSE
		return

/obj/structure/hydrant
	name = "water line hydrant"
	desc = "An emergency water hydrant for emergency watering of things."
	icon = 'icons/obj/structure/urban/infrastructure.dmi'
	icon_state = "hydrant"
	layer = ABOVE_ALL_MOB_LAYER
	anchored = TRUE

/obj/structure/urban_grate
	name = "water drain grate"
	desc = "A grate which funnels water into underground passageways."
	icon = 'icons/obj/structure/urban/infrastructure.dmi'
	icon_state = "grate"
	layer = 2.01
	anchored = TRUE

/obj/structure/parking_meter
	name = "parking meter"
	desc = "A parking meter that seems to be turned off."
	icon = 'icons/obj/structure/urban/infrastructure.dmi'
	icon_state = "parking"
	layer = ABOVE_ALL_MOB_LAYER
	anchored = TRUE

/obj/structure/dressing_divider
	name = "wardrobe dressing divider"
	desc = "A divider for an environment where you're probably swapping clothes, made with your privacy in mind."
	icon = 'icons/obj/structure/urban/tailoring.dmi'
	icon_state = "divider1"
	layer = ABOVE_ALL_MOB_LAYER
	anchored = TRUE

/obj/structure/neon_sign
	name = "large neon sign"
	desc = "A bright neon sign, an advertisement of some dystopian sort."
	icon = 'icons/obj/structure/urban/konyang_neon.dmi'
	icon_state = "sign1"
	anchored = TRUE
	layer = ABOVE_ALL_MOB_LAYER

/obj/structure/shipping_container
	name = "freight container"
	desc = "A hulking industrial shipping container, bound for who knows where."
	icon = 'icons/obj/structure/industrial/shipping_containers.dmi'
	icon_state = "blue1"
	anchored = TRUE
	density = TRUE
	layer = ABOVE_ALL_MOB_LAYER

/obj/effect/overlay/container_logo
	name = "Hephaestus Industries emblem"
	icon = 'icons/obj/structure/industrial/shipping_containers.dmi'
	icon_state = "heph1"
	layer = 4.6

/obj/effect/overlay/container_logo/einstein
	name = "Einstein Engines emblem"
	icon_state = "ee1"

/obj/effect/overlay/container_logo/zenghu
	name = "Zeng-Hu Pharmaceuticals emblem"
	icon_state = "zeng1"

//Special railings for urban environments. These have almost no reason to be seen anywhere else so they exclude all of the complexities of normal railings
/obj/structure/rod_railing
	name = "rod railing"
	desc = "A flimsy rod railing bound together by screws and prayers."
	icon = 'icons/obj/structure/urban/blockers.dmi'
	icon_state = "rod_railing"
	density = TRUE
	throwpass = TRUE
	climbable = TRUE
	layer = ABOVE_MOB_LAYER
	anchored = TRUE

/obj/structure/rod_railing/CanPass(atom/movable/mover, turf/target, height=0, air_group=0)
	if(istype(mover,/obj/item/projectile))
		return TRUE
	if(!istype(mover) || mover.checkpass(PASSRAILING))
		return TRUE
	if(mover.throwing)
		return TRUE
	if(get_dir(loc, target) == dir)
		return !density
	return TRUE

/obj/structure/rod_railing/CheckExit(var/atom/movable/O, var/turf/target)
	if(istype(O) && CanPass(O, target))
		return TRUE
	if(get_dir(O.loc, target) == dir)
		if(!density)
			return TRUE
		return FALSE
	return TRUE

/obj/structure/dam
	name = "concrete dam"
	desc = "A hulking mass of concrete meant to hold in a large reservoir of water from passing downwards."
	icon = 'icons/obj/structure/urban/blockers.dmi'
	icon_state = "dam1"
	density = TRUE
	throwpass = TRUE
	anchored = TRUE
	layer = ABOVE_MOB_LAYER

/obj/structure/road_barrier
	name = "roadway barrier"
	desc = "A set of expendable plates meant to deflect the impact of vehicles, lest they intend to go into more dangerous areas off the road."
	icon = 'icons/obj/structure/urban/road_edges.dmi'
	icon_state = "guard"
	density = TRUE
	throwpass = TRUE
	climbable = TRUE
	anchored = TRUE
	layer = ABOVE_MOB_LAYER

//smoothing these things would suck so here you go. i have no idea why you would want these buildable. map them manually
/obj/structure/road_barrier/bot_in
	icon_state = "guard_bot_in"

/obj/structure/road_barrier/top_in
	icon_state = "guard_top_in"

/obj/structure/road_barrier/bot_end
	icon_state = "guard_bot_end"

/obj/structure/road_barrier/top_end
	icon_state = "guard_top_end"

/obj/structure/road_barrier/CanPass(atom/movable/mover, turf/target, height=0, air_group=0)
	if(istype(mover,/obj/item/projectile))
		return TRUE
	if(!istype(mover) || mover.checkpass(PASSRAILING))
		return TRUE
	if(mover.throwing)
		return TRUE
	if(get_dir(loc, target) == dir)
		return !density
	return TRUE

/obj/structure/road_barrier/CheckExit(var/atom/movable/O, var/turf/target)
	if(istype(O) && CanPass(O, target))
		return TRUE
	if(get_dir(O.loc, target) == dir)
		if(!density)
			return TRUE
		return FALSE
	return TRUE

/obj/structure/chainlink_fence
	name = "chainlink fence"
	desc = "A tall, imposing metal fence. Not to be confused with the slightly more popular Chainlink of recent years."
	icon = 'icons/obj/structure/obstacles/obstacles.dmi'
	density = TRUE
	icon_state = "normal_fence"
	color = null
	anchored = TRUE
	can_be_unanchored = FALSE
	layer = ABOVE_ALL_MOB_LAYER

/obj/structure/chainlink_fence/corner
	icon_state = "fence_corner"

/obj/structure/chainlink_fence/intersect_bottom
	icon_state = "fence_intersect_bottom"

/obj/structure/chainlink_fence/intersect_middle
	icon_state = "fence_intersect_middle"

/obj/structure/chainlink_fence/intersect_corner
	icon_state = "fence_intersect_corner"

/obj/structure/chainlink_fence/CanPass(atom/movable/mover, turf/target, height=0, air_group=0)
	if(istype(mover,/obj/item/projectile))
		return TRUE
	if(!istype(mover) || mover.checkpass(PASSRAILING))
		return TRUE
	if(mover.throwing)
		return TRUE
	if(get_dir(loc, target) == dir)
		return !density
	return TRUE

/obj/structure/chainlink_fence/CheckExit(var/atom/movable/O, var/turf/target)
	if(istype(O) && CanPass(O, target))
		return TRUE
	if(get_dir(O.loc, target) == dir)
		if(!density)
			return TRUE
		return FALSE
	return TRUE

/obj/structure/rope_railing
	name = "wooden rope"
	desc = "A simple rope tied off to protect against careless trespass."
	icon = 'icons/obj/structure/urban/wood.dmi'
	icon_state = "rope-railing"
	density = TRUE
	color = null
	anchored = TRUE
	can_be_unanchored = FALSE
	layer = 3.01

/obj/structure/rope_railing/CanPass(atom/movable/mover, turf/target, height=0, air_group=0)
	if(istype(mover,/obj/item/projectile))
		return TRUE
	if(!istype(mover) || mover.checkpass(PASSRAILING))
		return TRUE
	if(mover.throwing)
		return TRUE
	if(get_dir(loc, target) == dir)
		return !density
	return TRUE

/obj/structure/rope_railing/CheckExit(var/atom/movable/O, var/turf/target)
	if(istype(O) && CanPass(O, target))
		return TRUE
	if(get_dir(O.loc, target) == dir)
		if(!density)
			return TRUE
		return FALSE
	return TRUE

/obj/structure/rope_post
	name = "wooden rope post"
	desc = "A simple pole driven into something, for tying ropes onto."
	icon = 'icons/obj/structure/urban/wood.dmi'
	icon_state = "post"
	density = FALSE
	anchored = TRUE
	layer = 3

/obj/structure/statue
	name = "statue of Neopolymus"
	desc = "A statue of Neopolymus, an IPC brought to fame in Tau Ceti as the first to be held to trial for the murder of a Human. A heated debate continues today as to the validity and bias of the court as the positronic ultimately met a memory wipe, followed by deconstruction."
	icon = 'icons/obj/structure/urban/statues.dmi'
	icon_state = "neopolymus"
	density = TRUE
	anchored = TRUE
	layer = ABOVE_ALL_MOB_LAYER

/obj/structure/statue/buddha
	name = "buddha statue"
	desc = "A bronze statue of the Amitabha Buddha, the Buddha of Limitless Light."
	icon_state = "buddha"

/obj/structure/sign/billboard
	name = "commercial billboard"
	desc = "A large and typically roadside billboard rented out for advertisement space."
	icon = 'icons/obj/structure/urban/billboard.dmi'
	icon_state = "board-l"
	density = TRUE
	layer = ABOVE_ALL_MOB_LAYER

/obj/structure/sign/billboard/advert
	name = "billboard advertisement"
	desc = null
	icon_state = "sign"
	density = TRUE
	layer = 4.6

/obj/structure/sign/billboard/advert/random/Initialize(mapload)
	. = ..()
	cut_overlays()
	icon_state = "sign[rand(1, 14)]"
	return

/obj/structure/restaurant_menu
	name = "restaurant menu"
	desc = "A sign displaying a variety of delectable meals."
	icon = 'icons/obj/structure/urban/restaurant.dmi'
	icon_state = "menu_off"
	density = 1
	layer = ABOVE_ALL_MOB_LAYER
	light_color = LIGHT_COLOR_CYAN
	light_range = 1.8
	var/menu_text = ""

/obj/structure/restaurant_menu/attack_hand(mob/user)
	var/new_text = sanitize(input(user, "Enter new text for the hologram to display.", "Hologram Display", html2pencode(menu_text, TRUE)) as null|message)
	if(!isnull(new_text))
		menu_text = pencode2html(new_text)
		update_icon()

/obj/structure/restaurant_menu/attackby(obj/item/attacking_item, mob/user)
	if(istype(attacking_item, /obj/item/paper))
		var/obj/item/paper/P = attacking_item
		to_chat(user, SPAN_NOTICE("You scan \the [attacking_item.name] into \the [name]."))
		menu_text = P.info
		menu_text = replacetext(menu_text, "color=black>", "color=white>")
		icon_state = "menu_active"
		update_icon()
		return TRUE
	return ..()

/obj/structure/window/urban
	icon = 'icons/obj/structure/urban/windows_tall.dmi'
	icon_state = "wood"
	basestate = "wood"
	maxhealth = 60
	alpha = 255

/obj/structure/window/urban/framed
	icon_state = "wood_framed"
	basestate = "wood_framed"

/obj/structure/window/urban/external
	icon = 'icons/obj/structure/urban/building_external.dmi'
	icon_state = "window_half"
	basestate = "window_half"

/obj/structure/window/urban/full
	icon = 'icons/obj/structure/urban/building_external.dmi'
	icon_state = "window_full"
	basestate = "window_full"

/obj/structure/window_frame/urban
	name = "window frame"
	desc = "A window frame."
	icon = 'icons/obj/structure/urban/building_external.dmi'
	icon_state = "frame_half"
	//basestate = "frame_half"
	color = COLOR_GUNMETAL
	smoothing_flags = null

/obj/structure/window_frame/urban/full
	name = "window frame"
	desc = "A window frame."
	icon = 'icons/obj/structure/urban/building_external.dmi'
	icon_state = "frame_full"
	//basestate = "frame_full"
	color = COLOR_WHITE

/obj/structure/window_frame/urban/red
	color = COLOR_PALE_RED_GRAY

/obj/structure/window_frame/urban/blue
	color = COLOR_COMMAND_BLUE

/obj/structure/blocker/exterior_wall//for planting against urban structure sprites to resemble buildings better. Should be manually mapped over wall types.
	name = "tall building wall"
	desc = "The exterior of a large building."
	color = COLOR_GUNMETAL
	icon = 'icons/obj/structure/urban/building_external.dmi'
	icon_state = "wall_half"
	//basestate = "wall_half"
	health = 200
	maxhealth = 200
	layer = ABOVE_ALL_MOB_LAYER

/obj/structure/blocker/exterior_wall/red
	color = COLOR_PALE_RED_GRAY

/obj/structure/blocker/exterior_wall/blue
	color = COLOR_COMMAND_BLUE

/obj/structure/cash_register
	name = "cash register machine"
	desc = "A retail nightmare object."
	desc_info = "Drag this onto yourself to open the cash compartment."
	icon = 'icons/obj/structure/urban/infrastructure.dmi'
	icon_state = "cashier"
	layer = 2.99
	density = 0
	anchored = 0
	var/storage_type = /obj/item/storage/toolbox/cash_register_storage
	var/obj/item/storage/storage_compartment

/obj/structure/cash_register/Initialize(mapload)
	. = ..()
	if(storage_type)
		storage_compartment = new storage_type(src)

/obj/item/storage/toolbox/cash_register_storage
	name = "cash compartment"

/obj/structure/cash_register/MouseDrop(atom/over)
	if(usr == over && ishuman(over))
		var/mob/living/carbon/human/H = over
		storage_compartment.open(H)

/**
 * # Urban doors
 *
 * Your average house door, gets locked and unlocked by a [/obj/item/key/door_key] and can optionally support IDs too
 *
 * Once unlocked with a key, it basically becomes a free access door, until locked back with a key
 *
 * Use `req_one_access` and `req_access`, like normal doors, to control which keys can unlock the door
 * Set `support_ids` to TRUE to also use the IDs logic
 *
 * If `support_ids` is TRUE and a door is opened using an ID, it will not become a public door
 */
/obj/machinery/door/urban
	name = "wooden panel door"
	desc = "A delicate wooden door with a pristine bronze knob."
	icon = 'icons/obj/structure/urban/unique_simple_doors.dmi'
	icon_state = "wood_closed"
	pixel_x = -16
	pixel_y = -16

	autoclose = FALSE

	var/base_icon = "wood"

	///Boolean, if the door also supports normal ID openings (read the ID access), or it's key only
	var/support_ids = FALSE

	///Stores the previous list of req_one_access, that gets readded when the door is locked with the key
	var/list/previous_req_one_access = list()

	///Stores the previous list of req_access, that gets readded when the door is locked with the key
	var/list/previous_req_access = list()

/obj/machinery/door/urban/update_icon()
	if(density)
		icon_state = "[base_icon]_closed"
	else
		icon_state = "[base_icon]_open"
	return

/obj/machinery/door/urban/do_animate(animation)
	switch(animation)
		if("opening")

			//Don't play the animation if it's already open
			if(!src.density)
				return

			if(p_open)
				flick("[base_icon]c0", src)
			else
				flick("[base_icon]c0", src)

		if("closing")

			//Don't play the animation if it's already closed
			if(src.density)
				return

			if(p_open)
				flick("[base_icon]c1", src)
			else
				flick("[base_icon]c1", src)
	return

/obj/machinery/door/urban/attackby(obj/item/attacking_item, mob/user)

	if(istype(attacking_item, /obj/item/key/door_key))

		if(check_access(attacking_item))
			if(src.density && !(length(previous_req_one_access) || length(previous_req_access)))

				//Only say that it's unlocked if there actually was an access list that did the locking
				if(length(src.req_one_access) || length(src.req_access))
					balloon_alert_to_viewers("*unlocks*")
					to_chat(user, SPAN_NOTICE("You unlock \the [src]."))

				open()

				//Save the list of accesses and empty them up
				if(length(src.req_one_access))
					previous_req_one_access = src.req_one_access.Copy()
					src.req_one_access = list()

				if(length(src.req_access))
					previous_req_access = src.req_access.Copy()
					src.req_access = list()

			else

				//Only say that it's locked if there actually is an access list that does the locking
				if(length(previous_req_one_access) || length(previous_req_access))
					balloon_alert_to_viewers("*locks*")
					to_chat(user, SPAN_NOTICE("You lock \the [src]."))

				close()

				//Readd the list of accesses, and empty up the previous access lists
				if(length(previous_req_one_access))
					src.req_one_access = previous_req_one_access.Copy()
					previous_req_one_access = list()

				if(length(previous_req_access))
					src.req_access = previous_req_access.Copy()
					previous_req_access = list()

		else
			balloon_alert_to_viewers("*rattles*")

	//Check with our parent, in case it's not a key
	else

		. = ..()

/obj/machinery/door/urban/allowed(mob/M)
	var/parent_allowed = ..()

	//If we support IDs, or we are a public door, return the result of the parent, otherwise we're locked
	if(support_ids || !(length(src.req_one_access) || length(src.req_access)))
		return parent_allowed
	else
		return FALSE //Keys only

/obj/machinery/door/urban/glass_sliding
	name = "sliding glass door"
	desc = "An electronic sliding glass door, often seen in cities."
	icon_state = "glass_sliding_closed"
	base_icon = "glass_sliding"
	autoclose = TRUE
	support_ids = TRUE
	glass = TRUE
	opacity = 0 //otherwise it is opaque until opened/closed for the first time.

/obj/machinery/door/urban/glass_sliding/double //use north state for left side and south state for right side
	icon_state = "double_glass_sliding_closed"
	base_icon = "double_glass_sliding"

/**
 * # Door keys
 *
 * A key that opens a door, you probably use this everyday
 *
 * Locks and unlocks doors of type [/obj/machinery/door/urban]
 *
 * Set in `access_list` a list of IDs that the key has, which in turn determine which doors it can open, based on
 * `req_one_access` and `req_access` logic
 */
/obj/item/key/door_key
	name = "Door key"
	desc = "A key that unlocks a door"

	///A list of IDs that the key can lock/unlock
	var/list/access_list = list()

/**
 * Initializes a door_key
 *
 * * accesses - A list with accesses that the key has, or null if defined in either the map, public access door or other means
 */
/obj/item/key/door_key/Initialize(var/mapload, var/list/accesses)
	SHOULD_CALL_PARENT(TRUE)

	. = ..()

	if(accesses)
		if(islist(access_list))
			src.access_list = accesses.Copy()

		else
			crash_with("Someone is trying to initialize a door_key without a list or null!")


/obj/item/key/door_key/GetAccess()
	return access_list
