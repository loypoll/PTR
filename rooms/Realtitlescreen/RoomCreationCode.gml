global.coop = false
global.currentsavefile = 1
global.mach_color1 = make_colour_rgb(96, 208, 72)
global.mach_color2 = make_colour_rgb(248, 0, 0)
global.afterimage_color1 = make_colour_rgb(255, 0, 0)
global.afterimage_color2 = make_colour_rgb(0, 255, 0)
global.smallnumber_color1 = make_colour_rgb(255, 255, 255)
global.smallnumber_color2 = make_colour_rgb(248, 0, 0)
global.optimize = 0
global.autotile = 1
global.pigreduction = 0
global.pigtotal = 0
global.levelcomplete = 0
global.levelcompletename = -4
global.entrancetreasure = 0
global.medievaltreasure = 0
global.ruintreasure = 0
global.dungeontreasure = 0
global.deserttreasure = 0
global.graveyardtreasure = 0
global.farmtreasure = 0
global.spacetreasure = 0
global.beachtreasure = 0
global.foresttreasure = 0
global.pinballtreasure = 0
global.golftreasure = 0
global.streettreasure = 0
global.sewertreasure = 0
global.factorytreasure = 0
global.freezertreasure = 0
global.chateautreasure = 0
global.mansiontreasure = 0
global.kidspartytreasure = 0
global.wartreasure = 0
global.entrancecutscene = -4
global.medievalcutscene = -4
global.ruincutscene = -4
global.ruincutscene2 = -4
global.ruincutscene3 = -4
global.dungeoncutscene = -4
global.peppermancutscene1 = -4
global.peppermancutscene2 = -4
global.chieftaincutscene = -4
global.chieftaincutscene2 = -4
global.desertcutscene = -4
global.graveyardcutscene = -4
global.spacecutscene = -4
global.vigilantecutscene1 = -4
global.vigilantecutscene2 = -4
global.vigilantecutscene3 = -4
global.farmcutscene = -4
global.superpinballcutscene = -4
global.pubcutscene = -4
global.pinballcutscene = -4
global.beercutscene = -4
global.exitfeecutscene = -4
global.forestcutscene = -4
global.bottlecutscene = -4
global.papercutscene = -4
global.beachboatcutscene = -4
global.beachcutscene = -4
global.sewercutscene = -4
global.burgercutscene = -4
global.golfcutscene = -4
global.anarchistcutscene1 = -4
global.anarchistcutscene2 = -4
global.factoryblock = -4
global.streetcutscene = -4
global.graffiticutscene = -4
global.factorygraffiti = -4
global.factorycutscene = -4
global.hatcutscene1 = -4
global.hatcutscene2 = -4
global.hatcutscene3 = -4
global.jetpackcutscene = -4
global.noisecutscene1 = -4
global.noisecutscene2 = -4
global.freezercutscene = -4
global.kidspartycutscene = -4
global.gasolinecutscene = -4
global.mansioncutscene = -4
global.chateaucutscene = -4
global.ghostsoldiercutscene = -4
global.mrstickcutscene1 = -4
global.mrstickcutscene2 = -4
global.mrstickcutscene3 = -4
global.chateauswap = -4
global.warcutscene = -4
pal_swap_init_system(shd_pal_swapper)
with (obj_player1)
	state = states.normal
global.loadeditor = 0
room_goto(hub_loadingscreen)
instance_destroy(obj_cutscene_handler)
gamesave_async_load()
