if !pause && obj_player1.key_start
{
	var _cutscenehandler = false
	with obj_cutscene_handler
	{
		if !loop
			_cutscenehandler = true
	}
	with obj_secretportal
	{
		if touched
			_cutscenehandler = true
	}
	with obj_secretportalstart
		_cutscenehandler = true
	if room == rank_room or room = Realtitlescreen or room == timesuproom
		_cutscenehandler = true;
	
	if obj_savesystem.state == 0 && !_cutscenehandler
	{
		selected = 0
		if !instance_exists(obj_pausefadeout)
			instance_create(x, y, obj_pausefadeout)
	}
}

with obj_player1
{
	other.paletteselect = paletteselect
	other.spr_palette = spr_palette
	other.character = character
}

if pause && !instance_exists(obj_option)
{
	scr_getinput()
	application_surface_draw_enable(true)
	
	var prevselected = selected
	selected = clamp(selected + (-key_up2 + key_down2), 0, array_length(pause_menu) - 1)
	
	if prevselected != selected
	{
		scr_soundeffect(sfx_step)
		switch selected
		{
			case 0:
				peppino_sprite = spr_player_idle
				break
			case 1:
				peppino_sprite = spr_file1
				break
			case 2:
				peppino_sprite = spr_player_panic
				break
			case 3:
				peppino_sprite = spr_player_winding
				break
		}

		peppino_sprite_number = sprite_get_number(peppino_sprite)
		peppino_index = 0
	}
	
	// select
	if key_jump
	{
		switch selected
		{
			case 0:
				if !instance_exists(obj_pausefadeout)
					instance_create(x, y, obj_pausefadeout)
				break
			
			case 1:
				scr_soundeffect(sfx_enemyprojectile)
				with instance_create(x, y, obj_option)
					depth = other.depth - 1
				break
			
			case 2:
				if !global.snickchallenge
				{
					if room_exists(global.leveltorestart)
					{
						instance_activate_all()
						alarm[1] = 1
					}
					else
						scr_soundeffect(sfx_enemyprojectile)
				}
				break
			
			case 3:
				if room == hub_room1 or room == characterselect or room == cowboytask or room == Titlescreen or room == Scootertransition or room == rm_levelselect or string_copy(room_get_name(room), 1, 3) == "hub"
				{
					pause = false
					instance_activate_all()
					room = Realtitlescreen
					with obj_player1
					{
						character = "P"
						scr_characterspr()
					}
					scr_playerreset()
					with obj_player
					{
						state = states.titlescreen;
						targetDoor = "A";
					}
					global.coop = false
				}
				else
				{
					pause = 0
					instance_activate_all()
					instance_destroy(obj_fadeout)
					scr_playerreset()
					global.levelreset = true
					
					with obj_player
						targetDoor = "D"
					
					room = rm_levelselect
					alarm[0] = 1
				}
				break
		}
	}
	
	// animations
	cursor_index = (cursor_index + 0.35) % cursor_sprite_number;
	peppino_index = (peppino_index + 0.35) % peppino_sprite_number;
	for (var i = 0; i < array_length(toppin_sprite); i++)
		toppin_index[i] = (toppin_index[i] + 0.35) % toppin_number[i];
	
	// currently collected toppins
	toppin_has[0] = global.cheesefollow
	toppin_has[1] = global.pineapplefollow
	toppin_has[2] = global.sausagefollow
	toppin_has[3] = global.shroomfollow
	toppin_has[4] = global.tomatofollow
}
