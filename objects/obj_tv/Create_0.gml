enum tvprompt
{
	normal,
	trigger,
	transfo
}

image_speed = 0.1
chose = 0
message = ""
showtext = 0
tvprompts_list = ds_list_create()
state = (0 << 0)
promptxstart = 641
promptx = promptxstart
prompt = ""
promptspd = 1
prompt_buffer = 0
prompt_max = 150
promptsurface = surface_create(290, 102)
targetgolf = -4
special_prompts = -4
hud_posx = 0
hud_posY = 0
combo_state = 0
combo_posX = 0
combo_vsp = 0
combo_posY = 0
combofill_x = 0
combofill_y = 0
combofill_index = 0
noisemax = 6
noisebuffer = noisemax
expressionsprite = -4
expressionbuffer = 0
golfsurf = -4
tvsprite = 2700
sprite_index = spr_tv_off
bubbleindex = 0
bubblespr = -4
idleanim = 180
noisesprite = 1249
xi = 500
yi = 600
imageindexstore = 0
once = 0
global.hurtcounter = 0
global.hurtmilestone = 3
alpha = 1
shownranka = 0
shownrankb = 0
shownrankc = 0
collect_shake = 0
global.srank = 0
global.arank = 0
global.brank = 0
global.crank = 0
character = "PEPPINO"
display_set_gui_size(960, 540)
chunkmax = 0
timer_xstart = 327
timer_ystart = 464
timer_x = timer_xstart
timer_y = (timer_ystart + 212)
pizzaface_sprite = 2201
pizzaface_index = 0
johnface_sprite = 2602
johnface_index = 0
hand_sprite = 1117
hand_index = 0
bar_surface = -4
barfill_x = 0
showtime_buffer = 0
