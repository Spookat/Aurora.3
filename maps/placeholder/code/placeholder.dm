/datum/map/placeholder
	name = "Placeholder"
	full_name = "NSS Placeholder"
	path = "placeholder"
	lobby_icons = list('icons/misc/titlescreens/placeholder/placeholder.dmi')
	lobby_transitions = FALSE

	station_levels = list(1, 2, 3)
	admin_levels = list(4)
	contact_levels = list(1, 2, 3)
	player_levels = list(1, 2, 3, 5, 6)
	restricted_levels = list()
	accessible_z_levels = list(1, 2, 3)
	base_turf_by_z = list(
		"1" = /turf/space,
		"2" = /turf/space,
		"3" = /turf/space,
		"4" = /turf/space,
		"5" = /turf/space,
		"6" = /turf/space
	)

	station_name = "NSS Placeholder"
	station_short = "Placeholder"
	dock_name = "The Shipyard"
	dock_short = "Shipyard"
	boss_name = "Placeholder"
	boss_short = "Placeholder Shortened"
	company_name = "Placeholder Inc"
	company_short = "PI"

	command_spawn_enabled = TRUE
	command_spawn_message = "Welcome to the Shipyard!"

	use_overmap = TRUE

	station_networks = list(
		NETWORK_COMMAND,
		NETWORK_ENGINE,
		NETWORK_ENGINEERING,
		NETWORK_MEDICAL,
		NETWORK_MINE,
		NETWORK_RESEARCH,
		NETWORK_ROBOTS,
		NETWORK_PRISON,
		NETWORK_SECURITY,
		NETWORK_SERVICE,
		NETWORK_SUPPLY,
		NETWORK_FIRST_DECK,
		NETWORK_SECOND_DECK,
		NETWORK_THIRD_DECK,
		NETWORK_INTREPID
	)

	shuttle_docked_message = "The scheduled crew transfer shuttle to %dock% has docked with the station. It will depart in approximately %ETA% minutes."
	shuttle_leaving_dock = "The crew transfer shuttle has left the station. Estimate %ETA% minutes until the shuttle docks at %dock%."
	shuttle_called_message = "A crew transfer to %dock% has been scheduled. The shuttle has been called. It will arrive in approximately %ETA% minutes."
	shuttle_recall_message = "The scheduled crew transfer has been cancelled."
	emergency_shuttle_docked_message = "The emergency shuttle has docked with the station. You have approximately %ETD% minutes to board the emergency shuttle."
	emergency_shuttle_leaving_dock = "The emergency shuttle has left the station. Estimate %ETA% minutes until the shuttle docks at %dock%."
	emergency_shuttle_recall_message = "The emergency shuttle has been recalled."
	emergency_shuttle_called_message = "An emergency evacuation shuttle has been called. It will arrive in approximately %ETA% minutes."

	map_shuttles = list(
		/datum/shuttle/autodock/ferry/lift/placeholder/cargo,
		/datum/shuttle/autodock/ferry/lift/placeholder/morgue
	)

	allowed_jobs = list(/datum/job/captain, /datum/job/xo, /datum/job/chief_engineer, /datum/job/cmo, /datum/job/hos, /datum/job/ai, /datum/job/cyborg,
					/datum/job/bartender, /datum/job/chef, /datum/job/hydro, /datum/job/janitor, /datum/job/journalist, /datum/job/librarian, /datum/job/chaplain,
					/datum/job/doctor, /datum/job/surgeon, /datum/job/pharmacist, /datum/job/psychiatrist, /datum/job/med_tech, /datum/job/intern_med,
					/datum/job/engineer, /datum/job/atmos, /datum/job/intern_eng, /datum/job/warden, /datum/job/investigator, /datum/job/officer, /datum/job/intern_sec,
					/datum/job/assistant)

//datum/map/aurora/generate_asteroid()
//	// Create the chasms.
//	new /datum/random_map/automata/cave_system/chasms(null,0,0,3,255,255)
//	new /datum/random_map/automata/cave_system(null,0,0,3,255,255)
//	new /datum/random_map/automata/cave_system/chasms(null,0,0,4,255,255)
//	new /datum/random_map/automata/cave_system(null,0,0,4,255,255)
//	new /datum/random_map/automata/cave_system/chasms(null,0,0,5,255,255)
//	new /datum/random_map/automata/cave_system/high_yield(null,0,0,5,255,255)
//	new /datum/random_map/automata/cave_system/chasms/surface(null,0,0,6,255,255)

//	// Create the deep mining ore distribution map.
//	new /datum/random_map/noise/ore(null, 0, 0, 5, 64, 64)
//	new /datum/random_map/noise/ore(null, 0, 0, 4, 64, 64)
//	new /datum/random_map/noise/ore(null, 0, 0, 3, 64, 64)

/datum/map/placeholder/finalize_load()
	// generate an empty space Z
	world.maxz++
