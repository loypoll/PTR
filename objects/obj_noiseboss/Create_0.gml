scr_initenemy()
with (obj_player1)
{
	state = states.ratmount
	brick = 1
}
elite = true
hit = 0
elitehit = 8
wastedhits = 0
state = states.walk
walkstate = states.walk
targetspot = instance_nearest(x, y, obj_noise_pogospot)
oldtargetspot = targetspot
movespeed = 0
move = 0
wallspeed = 0
bounced = 0
afterimage_buffer = 0
savedstate = states.walk
substate = states.walk
attackpool = -4
attackbuffer = 100
placedtraps = 0
jumpbuffer = 0
jumpmax = 120
grav = 0.5
hsp = 0
vsp = 0
stunned = 0
alarm[0] = 150
roaming = 1
collectdrop = 5
flying = 0
straightthrow = 0
cigar = 0
cigarcreate = 0
stomped = 0
shot = 0
reset = 0
flash = 0
landspr = spr_playerN_hurt
idlespr = spr_playerN_hurt
fallspr = spr_playerN_hurt
stunfallspr = spr_playerN_hurt
walkspr = spr_playerN_idle
turnspr = spr_playerN_hurt
recoveryspr = spr_playerN_hurt
grabbedspr = spr_playerN_hurt
scaredspr = spr_playerN_hurt
ragespr = spr_playerN_hurt
hp = 1
slapped = 0
grounded = true
birdcreated = 0
boundbox = 0
spr_dead = spr_playerN_hurt
important = 0
heavy = 0
depth = 0
paletteselect = 0
spr_palette = spr_noisepalette

with obj_player
{
	if character == "N" or (character == "P" && !ispeppino) && paletteselect == 0
		other.paletteselect = 1;
}
grabbedby = 0
stuntouchbuffer = 0
scaredbuffer = 0
