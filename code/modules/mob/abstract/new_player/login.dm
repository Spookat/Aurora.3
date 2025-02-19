/mob/abstract/new_player
	var/client/my_client // Need to keep track of this ourselves, since by the time Logout() is called the client has already been nulled

/mob/abstract/new_player/LateLogin()
	..()

	update_Login_details()	//handles setting lastKnownIP and computer_id for use by the ban systems as well as checking for multikeying

	to_chat(src, "<div class='info'>Game ID: <div class='danger'>[GLOB.round_id]</div></div>")

	if(!mind)
		mind = new /datum/mind(key)
		mind.active = 1
		mind.current = src

	loc = null

	my_client = client
	set_sight(sight|SEE_TURFS)
	GLOB.player_list |= src

	client.playtitlemusic()
