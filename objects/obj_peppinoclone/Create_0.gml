scr_initenemy()
cooldown = 0
hitboxID = -4
grav = 0.5
hsp = 0
vsp = 0
state = states.walk
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
landspr = spr_player_land
idlespr = spr_player_idle
fallspr = spr_player_fall
stunfallspr = spr_pepclone_stun
walkspr = spr_player_move
turnspr = spr_player_move
recoveryspr = spr_player_land
grabbedspr = spr_pepclone_stun
scaredspr = spr_player_hurt
image_xscale = -1
hp = 1
slapped = 0
grounded = true
birdcreated = 0
boundbox = 0
spr_dead = spr_pepclone_death
important = 0
heavy = 0
depth = 0
paletteselect = 1
spr_palette = spr_peppalette
with obj_player
{
	if character == "P" && ispeppino
		other.paletteselect = paletteselect;
}
grabbedby = 0
stuntouchbuffer = 0
scaredbuffer = 0
