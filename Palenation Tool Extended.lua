script_name('Palenation Tool Extended') 
script_author('Tima_Mafizik') 
script_version("02.11.2024")
script_properties('work-in-pause') 
sampev, inicfg = require 'lib.samp.events', require 'inicfg'
local status_hotkey, hotkey = pcall(require, 'mimgui_hotkeys')
local status_fa, fa = pcall(require, 'fAwesome6_solid')
local status_addons, imadd = pcall(require, 'mimgui_addons')
local encoding = require('encoding')
local memory = require("memory")
local imgui = require('mimgui')
local ffi = require('ffi')
local keys = require 'vkeys'
local squad_members = {}
local squad_onlines = 0
local squad_pos_x = 0
local help_squad = false
local color_squad = {}
local list_lib = {
	["mimgui_hotkeys"] = status_hotkey,
	["fAwesome6_solid"] = status_fa,
	["mimgui_addons"] = status_addons,
}

local helpgggg = false
local squadss = "PALERIDERS"

local cho_gang = "{$CLR}RIFA{FFFFFF}: $CNT {$CLR}GROVE{FFFFFF}: $CNT {$CLR}AZTEC{FFFFFF}: $CNT {$CLR}VAGOS{FFFFFF}: $CNT {$CLR}BALLAS{FFFFFF}: $CNT "
local cho_biker = "{$CLR}MONGOLS{FFFFFF}: $CNT {$CLR}PAGANS{FFFFFF}: $CNT {$CLR}WARLOCKS{FFFFFF}: $CNT "
local cho_maf = "{$CLR}RM{FFFFFF}: $CNT {$CLR}LCN{FFFFFF}: $CNT {$CLR}YAKUZA:{FFFFFF} $CNT"


local flood = false
local render_M4 = false
local render_AK47 = false
local render_Deagle = false
local new = imgui.new
local check_M4 = true
local check_AK47 = true
local check_Deagle = true
local netfmem = false
local helpeee = false

local check_inventory, drugs_timer, not_drugs_timer, renderText, d = 1, 0, false, {}, {}
local sleep = 0
local check_get_mats = true
local helpfordnk = false
local check_boostinfo = 0
local bonus_drugs = 1

local check_squad_members = false

local helpipi = false

local color_castom_squad = nil

local fam_check = true

local biz_check = false
local AutoCapterstart = false

local efcs_autoexit = false

local fsafes = false
local fslastd = false
local get_guns_status = false

local hidesms = false
local clear = false
local help = 0
local list2 = {}
local whitelists = {}
local givrank = false
local idd = nil
local idds = nil
local information = false
local rankk = nil
local uval = false
local prich = nil
local id_leader = nil
local help_to_rank = false
local help_to_rank2 = false
local help_to_uval = false
local help_to_uval2 = false
local help_to_nofrac = false

local warlocks = " - WARLOCKS MC"
local mongols = " - MONGOLS MC"
local pagans = " - PAGANS MC"

local u8 = encoding.CP1251;
safeNumbers = {}
safeGunsTD = {}
fsGunStatus = {}
inputFsafeCode = false
fhouseExist = false
fsClickExist = false
local var_0_8 = false
local var_0_9
local var_0_14 = 4294967295
local lines_status = imgui.new.bool(false)
local only_evolv = imgui.new.bool(true)
local time_capt = imgui.new.bool(false)
local radar_lines = imgui.new.bool(false)
local id1_status = imgui.new.bool(true)
local id2_status = imgui.new.bool(true)
local id3_status = imgui.new.bool(true)
local id4_status = imgui.new.bool(true)
local id5_status = imgui.new.bool(true)
local var_0_26 = imgui.new.bool(true)
local var_0_27 = imgui.new.int(3)
local var_0_28 = imgui.new.int(800)

local castom_color_squad = imgui.new.float[4](1, 1, 1, 1)
local color_ld = imgui.new.float[4](1, 1, 1, 1)
local help_m4_net = false
local help_deagle_net = false
local help_ak_net = false


local ev0 = imgui.new.int(255)
local ev1 = imgui.new.int(1)
local ev2 = imgui.new.float[4](1, 1, 1, 1)
local ev4 = {}
local ev5
local ev6
local var_0_29 = new.int()
local type_radar = new.int()
local combotwo = {"Статичный цвет", "Радуга"}
local combo_two = imgui.new['const char*'][#combotwo](combotwo)
local combolist = {"Круглый", "Квадратный"}
local combo_list = imgui.new['const char*'][#combolist](combolist)
cb1 = ""
cb2 = ""
cb3 = ""
cb4 = ""
cb5 = ""
cb6 = ""
cb7 = ""
cb8 = ""
cb9 = ""
cb10 = ""
cb11 = ""
cb12 = ""
cb13 = ""
cb14 = ""
cb15 = ""
cb16 = ""
cb17 = ""
cb18 = ""
cb19 = ""
cb20 = ""
cb21 = ""
cb22 = ""
cb23 = ""
cb24 = ""
cb25 = ""
cb26 = ""
cb27 = ""
cb28 = ""


local bizcombo = {
	"1. Palomino Creek 1"..cb1,
	"2. Palomino Creek 2"..cb2,
	"3. Palomino Creek 3"..cb3, 
	"4. Palomino Creek 4"..cb4,
	"5. Dillimore 1"..cb5,
	"6. Dillimore 2"..cb6,
	"7. Dillimore 3"..cb7,
	"8. Blueberry 1"..cb8,
	"9. Blueberry 2"..cb9,
	"10. Blueberry 3"..cb10,
	"11. Montgomery 1"..cb11,
	"12. Montgomery 2"..cb12,
	"13. Montgomery 3"..cb13,
	"14. Montgomery 4"..cb14,
	"15. Fort Carson 1"..cb15,
	"16. Fort Carson 2"..cb16,
	"17. Fort Carson 3"..cb17,
	"18. Fort Carson 4"..cb18,
	"19. Fort Carson 5"..cb19,
	"20. Fort Carson 6"..cb20,
	"21. El Quebrados 1"..cb21,
	"22. El Quebrados 2"..cb22,
	"23. El Quebrados 3"..cb23,
	"24. El Quebrados 4"..cb24,
	"25. Las Barrancas 1"..cb25,
	"26. Las Barrancas 2"..cb26,
	"27. Angel Pine 1"..cb27,
	"28. Angel Pine 2"..cb28,
}
local biz_combo = imgui.new['const char*'][#bizcombo](bizcombo)
ffi.cdef("\t\tstruct CVector2D { float x, y; };\n\t\tstruct CVector { float x, y, z; };    \n\t")

local ev7 = ffi.cast("void (__cdecl*)(struct CVector2D*, struct CVector2D*)", 5780784)
local ev8 = ffi.cast("void (__cdecl*)(struct CVector2D*, struct CVector2D*)", 5780608)
local ev9 = ffi.cast("bool (__cdecl*)(struct CVector2D*)", 5786944)
local clist_gang = {
	{
        4280979824, -- RIFA
		2852167424, -- GROVE
        3355573503, -- AZTEC
        4294958628, -- VAGOS        
	 	4289926119, -- BALLAS
	}
}
local clist_maf = {
	{
        4290033079, -- RM        
		4292716289, -- LCN
		2868838400, -- YAKUZA
	}
}
local clist_biker = {
	{
        4281545523, -- MONGOLS
        4281110935, -- PAGANS
		4294201344, -- WARLOCKS
	}
}
--------------------------------------------------------------------------------
------------------------------------Save-In-Ini---------------------------------
--------------------------------------------------------------------------------
--#save #ini
directIni = 'Palenation Tool Extended.ini'
 
possX, possY = convertGameScreenCoordsToWindowScreenCoords(11, 65)
posX, posY = convertGameScreenCoordsToWindowScreenCoords(88.081993103027, 322.58331298828)
PosSquadX, PosSquadY = convertGameScreenCoordsToWindowScreenCoords(4, 177)
ini = inicfg.load({
    render = {
        font = 'Segoe UI',
        size = 10,
        flag = 13,
        align = 2,
        x = posX,
        y = posY,
        height = 4
    },
    drugtimer = {
        hp = 160,
        hp_one_gram = 10, 
        max_use_gram = 15,
        seconds = 60,
        status = false,
        drugs = 0,
        mats = 0,
        server_cmd = 'usedrugs',
        inventory = true,
        boostinfo = true,
        key = "[88]",
        death = false,
    },
    lines = {
        one = '{1a9614}drugs !a!n{dedede}mats !m',
        two = '{e81526}cooldown !s!n{dedede}mats !m'
    },
    fastcarfx = {
        status = false,
        status_exit = false,
        key = "[]"
    },
    AutoCapt = {
        status = false,
        key = "[]",
        wait = 1000,
        biz = 1,
        com = "",
		flooder_com = "flood",
		flooder_status = false,
    },
    fsafe = {
        status = false,
        key = "[]",
        shotgun = 0,
        deagle = 0,
        rifle = 0,
        pin = 1111,
        drugs = 0,
        wait = 75,
        ak = 0,
        m4 = 0,
		dnk_status = false,
		dnk_key = "[]",
		dnk_shotgun = 0,
        dnk_deagle = 0,
        dnk_rifle = 0,
        dnk_pin = 1111,
        dnk_wait = 75,
		dnk_ak = 0,
        dnk_m4 = 0,
    },
    getguns = {
        status = false,
        key = "[]",
        ak = 0,
        m4 = 0,
        deagle = 0,
        rifle = 0,
        shotgun = 0,
		armor = false,
        auto_get_drink = true,
        auto_get_drugs = true,
		mafia_status = false,
		mafia_shotgun = 0,
		mafia_m4 = 0,
		mafia_rifle = 0,
		mafia_key = "[]",
		mafia_deagle = 0
    },
    LeaderManagement = {
        nick = "",
		weapon_information = true,
		warehouse_request = false,
		font = "Pricedown",
		size = 12,
		flag = 15,
		color = 4278190335,
		x = possX,
		y = possY,
    },
    eblochecker = {
        gang_status = false,
        gang_stream = false,
        x_gang = posX - 352,
        y_gang = posY - 237,
        maf_status = false,
        maf_stream = false,
        x_maf = posX - 352,
        y_maf = posY - 117,
        biker_status = false,
        biker_stream = false,
        x_biker = posX - 352,
        y_biker = posY - 37,
        style = 0,
    },
    sbiv = {
        status = false,
		int = 0,
        key = "[82]",
    },
    mafialines = {
		onlyServer = only_evolv[0],
		onlyCapture = time_capt[0],
		radarRender = radar_lines[0],
		radarMode = type_radar[0],
		width = var_0_27[0],
		distancedraw = var_0_28[0],
		color = encodeJson({
			ev2[0],
			ev2[1],
			ev2[2],
			ev2[3]
		}),
		rainbowc = var_0_26[0],
		mode = var_0_29[0],
		trailalpha = ev0[0],
		trailspeed = ev1[0],
		activated = lines_status[0],
		quarryed = id1_status[0],
		villaged = id2_status[0],
		airported = id3_status[0],
		mined = id4_status[0],
		buildinged = id5_status[0]
	},
	autogetguns = {
		status = false,
	},
	squad = {
		status = false,
		x_pos = PosSquadX,
		y_pos = PosSquadY,
        font = 'Arial',
        size = 12,
        flag = 13,
		online_status = false,
		int = 2,
		rank = 0,
		name_squad = 1,
		color = 4294967295,
		language = 0,
	}
}, directIni)
inicfg.save(ini, directIni)
font = renderCreateFont(ini.render.font, ini.render.size, ini.render.flag)
squad_font = renderCreateFont(ini.squad.font, ini.squad.size, ini.squad.flag)
fffont =  renderCreateFont("Arial", 12, 13)
fonts = renderCreateFont("Arial", 9, 4)
font_for_notification = renderCreateFont(ini.LeaderManagement.font, ini.LeaderManagement.size, ini.LeaderManagement.flag)

local armor_status = imgui.new.bool(ini.getguns.armor)
--------------------------------------------------------------------------------
-------------------------------------For-Window---------------------------------
--------------------------------------------------------------------------------
local DrugHotKey
local GetgunsHotKey
local fsafeoneHotKey
local FastCarFXHotKey
local AutoCapterHotKey
local SbivHotKey
local DNKHotKey

if status_addons then
   imgui.ToggleButton = require('mimgui_addons').ToggleButton
end

local Menu = new.bool()
local Menu2 = new.bool()

str, sizeof = ffi.string, ffi.sizeof

local AI_PAGE = {}
local page = 1

efcs = {}
efcs.list_create = {}
efcs.list_remove = {}
efcs.start = 0

local ToU32 = imgui.ColorConvertFloat4ToU32
gg_evolve = {}
local AutoCapterWait = imgui.new.char[256](u8(ini.AutoCapt.wait))
local AutoCapterBiz = imgui.new.char[4](u8(ini.AutoCapt.biz))
local AutoCaptStatus = imgui.new.bool(ini.AutoCapt.status)
local FlooderStatus = imgui.new.bool(ini.AutoCapt.flooder_status)
local AutoCapterCom = imgui.new.char[256](u8(ini.AutoCapt.com)) 
local FlooderCommand = imgui.new.char[256](u8(ini.AutoCapt.flooder_com)) 
local rankss = imgui.new.char[256]()
local rankid = imgui.new.char[256]()
local uval_id = imgui.new.char[256](u8(""))
local invite_id = imgui.new.char[256](u8(""))
local uval_prichina = imgui.new.char[256](u8(""))
local nark_lines_one = imgui.new.char[256](u8(ini.lines.one))
local nark_lines_two = imgui.new.char[256](u8(ini.lines.two))
local nark_font_font = imgui.new.char[256](u8(ini.render.font))
local nark_font_size = imgui.new.char[256](u8(ini.render.size))
local nark_font_flag = imgui.new.char[256](u8(ini.render.flag))
local nark_height = imgui.new.int(ini.render.height)

local nark_max_gramm = imgui.new.int(ini.drugtimer.max_use_gram)
local nark_max_hp = imgui.new.int(ini.drugtimer.hp)
local status_drug_timer = imgui.new.bool(ini.drugtimer.status)
local status_weapon_information = imgui.new.bool(ini.LeaderManagement.weapon_information)
local request_wlpale = imgui.new.bool(ini.LeaderManagement.warehouse_request)
local death_drug_timer = imgui.new.bool(ini.drugtimer.death)

local autogetguns_status = imgui.new.bool(ini.autogetguns.status)

local status_sm = imgui.new.bool(ini.squad.status)
local status_squad_online = imgui.new.bool(ini.squad.online_status)
local sfont_sfont = imgui.new.char[256](u8(ini.squad.font))
local sfont_ssize = imgui.new.char[256](u8(ini.squad.size))
local sfont_flag = imgui.new.char[256](u8(ini.squad.flag))


local status_fcar_fx = imgui.new.bool(ini.fastcarfx.status)
local status_fcarexit_fx = imgui.new.bool(ini.fastcarfx.status_exit)

local getguns = {}
getguns_status = imgui.new.bool(ini.getguns.status) 
getguns.ak = imgui.new.char[256](tostring(ini.getguns.ak))
getguns.m4 = imgui.new.char[256](tostring(ini.getguns.m4))
getguns.deagle = imgui.new.char[256](tostring(ini.getguns.deagle))
getguns.rifle = imgui.new.char[256](tostring(ini.getguns.rifle))
getguns.shotgun = imgui.new.char[256](tostring(ini.getguns.shotgun))
getguns.drink = imgui.new.bool(ini.getguns.auto_get_drink)
getguns.drugs = imgui.new.bool(ini.getguns.auto_get_drugs)

local ld_font = imgui.new.char[256](u8(ini.LeaderManagement.font))
local ldfont_size = imgui.new.char[256](u8(ini.LeaderManagement.size))
local ldfont_flag = imgui.new.char[256](u8(ini.LeaderManagement.flag))


local fsafe = {}
local statusfsafe = imgui.new.bool(ini.fsafe.status)
local statusfsafeforDNK = imgui.new.bool(ini.fsafe.dnk_status)
fsafe.pin = imgui.new.char[256](tostring(ini.fsafe.pin)) 
fsafe.ak = imgui.new.char[256](tostring(ini.fsafe.ak))
fsafe.m4 = imgui.new.char[256](tostring(ini.fsafe.m4))
fsafe.deagle = imgui.new.char[256](tostring(ini.fsafe.deagle))
fsafe.rifle = imgui.new.char[256](tostring(ini.fsafe.rifle))
fsafe.shotgun = imgui.new.char[256](tostring(ini.fsafe.shotgun))
fsafe.wait = imgui.new.char[256](tostring(ini.fsafe.wait))
fsafe.dnk_pin = imgui.new.char[256](tostring(ini.fsafe.dnk_pin)) 
fsafe.dnk_ak = imgui.new.char[256](tostring(ini.fsafe.dnk_ak))
fsafe.dnk_m4 = imgui.new.char[256](tostring(ini.fsafe.dnk_m4))
fsafe.dnk_deagle = imgui.new.char[256](tostring(ini.fsafe.dnk_deagle))
fsafe.dnk_rifle = imgui.new.char[256](tostring(ini.fsafe.dnk_rifle))
fsafe.dnk_shotgun = imgui.new.char[256](tostring(ini.fsafe.dnk_shotgun))
fsafe.dnk_wait = imgui.new.char[256](tostring(ini.fsafe.dnk_wait))

LMnick = imgui.new.char[256](u8(ini.LeaderManagement.nick)) 
--local combosquad = {"Синий", "Белый"}

local int_squad = new.int(ini.squad.int)
local combosquad = {"Белый", "Синий", "Цвет клиста", "Свой цвет"}
local combo_squad = imgui.new['const char*'][#combosquad](combosquad)

local int_squad2 = new.int(ini.squad.rank)
local combosquad2 = {"Показывать всех игроков", "Показывать игроков с 2 ранга", "Показывать игроков с 3 ранга", "Показывать игроков с 4 ранга"}
local combo_squad2 = imgui.new['const char*'][#combosquad2](combosquad2)

local int_sbiv = new.int(ini.sbiv.int)
local combosbiv = {"Писс", "Танец"}
local combo_sbiv = imgui.new['const char*'][#combosbiv](combosbiv)

local int_namesq = new.int(ini.squad.name_squad)
local squadcombo = {"", "SQUAD", "PALERIDERS", "PALENATION", "СКВАД", "БЛЕДНАЯ НАЦИЯ", "БЛЕДНАЯ БРАТВА", "ПАЛЕПИДОРЫ"}
local squad_combo = imgui.new['const char*'][#squadcombo](squadcombo)
--------------------------------------------------------------------------------
------------------------------------MAFIALINES----------------------------------
--------------------------------------------------------------------------------

local zone_one = {
	{
		z = 5.893,
		x = 433.5031,
		y = 743.5056
	},
	{
		z = 5.9544,
		x = 416.5483,
		y = 751.2752
	},
	{
		z = 6.2238,
		x = 385.3122,
		y = 761.4517
	},
	{
		z = 6.2248,
		x = 352.632,
		y = 764.3365
	},
	{
		z = 6.2165,
		x = 327.3391,
		y = 762.4012
	},
	{
		z = 11.58,
		x = 327.3391,
		y = 762.4012
	},
	{
		z = 11.792,
		x = 314.299,
		y = 759.73
	},
	{
		z = 15.818,
		x = 291.597,
		y = 808.923
	},
	{
		z = 20.699,
		x = 265.555,
		y = 867.004
	},
	{
		z = 25.516,
		x = 241.645,
		y = 921.632
	},
	{
		z = 27.54,
		x = 232.515,
		y = 942.289
	},
	{
		z = 28.386,
		x = 216.622,
		y = 972.796
	},
	{
		z = 28.248,
		x = 212.742,
		y = 986.785
	},
	{
		z = 28.479,
		x = 231.576,
		y = 994.004
	},
	{
		z = 29.226,
		x = 267.994,
		y = 1007.34
	},
	{
		z = 29.15,
		x = 325.38,
		y = 1020.53
	},
	{
		z = 27.208,
		x = 376.666,
		y = 1031.315
	},
	{
		z = 29.544,
		x = 384.923,
		y = 1033.306
	},
	{
		z = 28.992,
		x = 442.56,
		y = 1047.676
	},
	{
		z = 28.297,
		x = 444.722,
		y = 1038.563
	},
	{
		z = 28.297,
		x = 448.045,
		y = 1026.094
	},
	{
		z = 30.484,
		x = 449.345,
		y = 1020.358
	},
	{
		z = 31.418,
		x = 458.882,
		y = 976.888
	},
	{
		z = 31.676,
		x = 438.25,
		y = 966.981
	},
	{
		z = 31.14,
		x = 425.172,
		y = 958.159
	},
	{
		z = 28.838,
		x = 416.239,
		y = 945.913
	},
	{
		z = 25.304,
		x = 407.793,
		y = 929.212
	},
	{
		z = 21.927,
		x = 403.398,
		y = 905.136
	},
	{
		z = 20.644,
		x = 403.862,
		y = 873.648
	},
	{
		z = 19.705,
		x = 410.905,
		y = 848.031
	},
	{
		z = 14.174,
		x = 424.182,
		y = 825.561
	},
	{
		z = 9.252,
		x = 459.004,
		y = 795.036
	},
	{
		z = 6.41,
		x = 447.343,
		y = 771.852
	},
	{
		z = 5.893,
		x = 433.5031,
		y = 743.5056
	}
}

local zone_three = {
	{
		z = 16.4844,
		x = 377.8415,
		y = 2433.3201
	},
	{
		z = 16.4844,
		x = 377.8415,
		y = 2437.2761
	},
	{
		z = 16.4844,
		x = 377.8415,
		y = 2445.0186
	},
	{
		z = 16.4844,
		x = 377.8415,
		y = 2452.4487
	},
	{
		z = 16.4844,
		x = 377.8415,
		y = 2462.6277
	},
	{
		z = 16.4844,
		x = 377.8415,
		y = 2473.325
	},
	{
		z = 16.4844,
		x = 377.8415,
		y = 2488.325
	},
	{
		z = 16.4844,
		x = 377.8415,
		y = 2503.325
	},
	{
		z = 16.4844,
		x = 377.8415,
		y = 2528.425
	},
	{
		z = 16.4844,
		x = 337.8415,
		y = 2528.425
	},
	{
		z = 16.4844,
		x = 317.8415,
		y = 2528.425
	},
	{
		z = 16.4844,
		x = 297.8415,
		y = 2528.425
	},
	{
		z = 16.4844,
		x = 277.8415,
		y = 2528.425
	},
	{
		z = 16.4844,
		x = 257.8415,
		y = 2528.425
	},
	{
		z = 16.4844,
		x = 237.8415,
		y = 2528.425
	},
	{
		z = 16.4844,
		x = 217.8415,
		y = 2528.425
	},
	{
		z = 16.4844,
		x = 197.8415,
		y = 2528.425
	},
	{
		z = 16.4844,
		x = 177.8415,
		y = 2528.425
	},
	{
		z = 16.4844,
		x = 157.8415,
		y = 2528.425
	},
	{
		z = 16.4844,
		x = 137.8415,
		y = 2528.425
	},
	{
		z = 16.4844,
		x = 117.8415,
		y = 2528.425
	},
	{
		z = 16.4844,
		x = 97.8415,
		y = 2528.425
	},
	{
		z = 16.4844,
		x = 77.8415,
		y = 2528.425
	},
	{
		z = 16.4844,
		x = 57.8415,
		y = 2528.425
	},
	{
		z = 16.4844,
		x = 11.8415,
		y = 2528.425
	},
	{
		z = 16.4844,
		x = 11.8415,
		y = 2508.425
	},
	{
		z = 16.4844,
		x = 11.8415,
		y = 2488.425
	},
	{
		z = 16.4844,
		x = 11.8415,
		y = 2468.425
	},
	{
		z = 16.4844,
		x = 11.8415,
		y = 2448.425
	},
	{
		z = 16.4844,
		x = 11.8415,
		y = 2428.425
	},
	{
		z = 16.4844,
		x = 11.8415,
		y = 2408.425
	},
	{
		z = 16.4844,
		x = 11.8415,
		y = 2388.425
	},
	{
		z = 17.5429,
		x = 11.8415,
		y = 2378.425
	},
	{
		z = 22.2264,
		x = 11.8415,
		y = 2358.425
	},
	{
		z = 22.5873,
		x = 11.8415,
		y = 2338.425
	},
	{
		z = 23.5065,
		x = 11.8415,
		y = 2318.425
	},
	{
		z = 23.8172,
		x = 11.8415,
		y = 2305.125
	},
	{
		z = 22.6628,
		x = 37.1268,
		y = 2307.2221
	},
	{
		z = 21.936,
		x = 52.8899,
		y = 2308.5166
	},
	{
		z = 21.2124,
		x = 68.552,
		y = 2309.1003
	},
	{
		z = 20.5889,
		x = 83.5007,
		y = 2308.5798
	},
	{
		z = 20.1744,
		x = 96.9156,
		y = 2306.3181
	},
	{
		z = 20.1663,
		x = 116.2878,
		y = 2296.7764
	},
	{
		z = 20.5522,
		x = 129.5365,
		y = 2293.2839
	},
	{
		z = 21.1292,
		x = 146.2459,
		y = 2290.906
	},
	{
		z = 21.83,
		x = 165.5861,
		y = 2289.532
	},
	{
		z = 22.5504,
		x = 185.7999,
		y = 2288.9333
	},
	{
		z = 23.3257,
		x = 208.3525,
		y = 2288.9409
	},
	{
		z = 24.2488,
		x = 238.4428,
		y = 2289.6687
	},
	{
		z = 25.1515,
		x = 288.7077,
		y = 2291.9259
	},
	{
		z = 25.1406,
		x = 302.4064,
		y = 2294.0601
	},
	{
		z = 25.1554,
		x = 315.6089,
		y = 2299.0972
	},
	{
		z = 25.1689,
		x = 327.8423,
		y = 2306.0522
	},
	{
		z = 25.1897,
		x = 339.5322,
		y = 2315.5037
	},
	{
		z = 25.2107,
		x = 349.675,
		y = 2324.9758
	},
	{
		z = 25.2294,
		x = 357.1432,
		y = 2332.4087
	},
	{
		z = 25.269,
		x = 377.8415,
		y = 2354.5227
	},
	{
		z = 25.5711,
		x = 377.8415,
		y = 2361.3408
	},
	{
		z = 21.9927,
		x = 377.8415,
		y = 2377.9263
	},
	{
		z = 16.4844,
		x = 377.8415,
		y = 2394.6624
	},
	{
		z = 16.4844,
		x = 377.8415,
		y = 2413.3201
	},
	{
		z = 16.4844,
		x = 377.8415,
		y = 2433.3201
	}
}

local zone_fo = {
	{
		z = 36.2669,
		x = -1740.5605,
		y = -1661.7677
	},
	{
		z = 36.2714,
		x = -1748.8273,
		y = -1665.4274
	},
	{
		z = 34.7597,
		x = -1766.4485,
		y = -1675.8883
	},
	{
		z = 31.9707,
		x = -1782.1888,
		y = -1687.5377
	},
	{
		z = 29.903,
		x = -1797.2588,
		y = -1699.8524
	},
	{
		z = 29.1117,
		x = -1812.1237,
		y = -1710.4294
	},
	{
		z = 29.1779,
		x = -1856.4849,
		y = -1739.1055
	},
	{
		z = 29.2356,
		x = -1881.7136,
		y = -1754.7506
	},
	{
		z = 29.4741,
		x = -1906.2281,
		y = -1769.2833
	},
	{
		z = 30.1273,
		x = -1918.3944,
		y = -1777.9166
	},
	{
		z = 31.1691,
		x = -1931.089,
		y = -1788.0837
	},
	{
		z = 32.5334,
		x = -1943.6625,
		y = -1799.3176
	},
	{
		z = 32.8897,
		x = -1946.9335,
		y = -1795.9506
	},
	{
		z = 33.2219,
		x = -1956.3748,
		y = -1790.0321
	},
	{
		z = 24.9352,
		x = -1950.4111,
		y = -1761.2076
	},
	{
		z = 26.1741,
		x = -1948.2877,
		y = -1675.2468
	},
	{
		z = 25.8392,
		x = -1944.943,
		y = -1667.6029
	},
	{
		z = 25.9967,
		x = -1943.7323,
		y = -1632.3048
	},
	{
		z = 25.2272,
		x = -1914.0909,
		y = -1631.0404
	},
	{
		z = 25.5995,
		x = -1912.3181,
		y = -1603.8901
	},
	{
		z = 25.9002,
		x = -1913.0071,
		y = -1540.6603
	},
	{
		z = 21.5983,
		x = -1911.3258,
		y = -1494.3988
	},
	{
		z = 21.6668,
		x = -1906.7396,
		y = -1499.3909
	},
	{
		z = 21.75,
		x = -1899.5017,
		y = -1505.0645
	},
	{
		z = 21.75,
		x = -1884.1749,
		y = -1516.2777
	},
	{
		z = 21.75,
		x = -1844.3685,
		y = -1546.2926
	},
	{
		z = 21.75,
		x = -1820.9479,
		y = -1564.6523
	},
	{
		z = 21.75,
		x = -1806.3767,
		y = -1575.4534
	},
	{
		z = 21.75,
		x = -1789.2322,
		y = -1583.2456
	},
	{
		z = 21.75,
		x = -1760.6337,
		y = -1597.6904
	},
	{
		z = 21.7688,
		x = -1742.8527,
		y = -1656.7146
	},
	{
		z = 37.5811,
		x = -1742.4752,
		y = -1656.7692
	},
	{
		z = 36.6102,
		x = -1741.652,
		y = -1658.8728
	},
	{
		z = 36.2669,
		x = -1740.5605,
		y = -1661.7677
	}
}

local zone_five = {
	{
		z = 10.8203,
		x = 2517.0317,
		y = 2005.8452
	},
	{
		z = 10.8203,
		x = 2517.0623,
		y = 1782.8802
	},
	{
		z = 10.8125,
		x = 2420.3306,
		y = 1782.6305
	},
	{
		z = 17.0752,
		x = 2420.3306,
		y = 1782.6305
	},
	{
		z = 16.3222,
		x = 2420.1006,
		y = 1789.0391
	},
	{
		z = 16.3222,
		x = 2426.4834,
		y = 1787.2565
	},
	{
		z = 16.3222,
		x = 2431.6052,
		y = 1786.8507
	},
	{
		z = 16.3222,
		x = 2436.9829,
		y = 1788.5865
	},
	{
		z = 16.3222,
		x = 2441.5313,
		y = 1790.5439
	},
	{
		z = 16.3222,
		x = 2446.0808,
		y = 1794.3042
	},
	{
		z = 16.3222,
		x = 2448.3213,
		y = 1797.0657
	},
	{
		z = 16.3222,
		x = 2451.4873,
		y = 1801.1837
	},
	{
		z = 16.3222,
		x = 2452.8003,
		y = 1807.7408
	},
	{
		z = 16.3222,
		x = 2453.6428,
		y = 1811.7136
	},
	{
		z = 16.3222,
		x = 2489.9561,
		y = 1812.4904
	},
	{
		z = 16.3222,
		x = 2489.208,
		y = 1822.728
	},
	{
		z = 16.3222,
		x = 2488.0391,
		y = 1826.0487
	},
	{
		z = 16.3222,
		x = 2494.7122,
		y = 1827.7249
	},
	{
		z = 16.3222,
		x = 2492.5208,
		y = 1835.1746
	},
	{
		z = 16.3222,
		x = 2489.6157,
		y = 1841.8981
	},
	{
		z = 16.3222,
		x = 2485.9021,
		y = 1848.443
	},
	{
		z = 16.3222,
		x = 2481.5437,
		y = 1854.4652
	},
	{
		z = 16.3222,
		x = 2476.6406,
		y = 1859.8879
	},
	{
		z = 16.3222,
		x = 2470.8398,
		y = 1865.0573
	},
	{
		z = 16.3222,
		x = 2464.8005,
		y = 1869.3158
	},
	{
		z = 16.3222,
		x = 2458.3015,
		y = 1872.9109
	},
	{
		z = 16.3222,
		x = 2451.4673,
		y = 1875.7694
	},
	{
		z = 16.3222,
		x = 2443.6555,
		y = 1878.0338
	},
	{
		z = 16.3222,
		x = 2441.9431,
		y = 1871.3138
	},
	{
		z = 16.3222,
		x = 2438.2515,
		y = 1872.1841
	},
	{
		z = 16.3222,
		x = 2428.3237,
		y = 1872.9974
	},
	{
		z = 16.3222,
		x = 2428.0391,
		y = 1836.3489
	},
	{
		z = 16.3222,
		x = 2422.8826,
		y = 1835.495
	},
	{
		z = 16.3222,
		x = 2414.198,
		y = 1831.4323
	},
	{
		z = 16.3222,
		x = 2412.6902,
		y = 1831.9292
	},
	{
		z = 11.6563,
		x = 2411.9185,
		y = 1832.2354
	},
	{
		z = 11.6563,
		x = 2393.7886,
		y = 1832.5254
	},
	{
		z = 11.6563,
		x = 2372.2754,
		y = 1832.5298
	},
	{
		z = 11.6563,
		x = 2372.5291,
		y = 1883.7509
	},
	{
		z = 16.3146,
		x = 2372.6477,
		y = 1883.8417
	},
	{
		z = 16.3146,
		x = 2370.9719,
		y = 1883.8033
	},
	{
		z = 10.8203,
		x = 2370.7424,
		y = 1883.8143
	},
	{
		z = 10.8203,
		x = 2363.1182,
		y = 1883.7097
	},
	{
		z = 10.6795,
		x = 2337.4709,
		y = 1883.8223
	},
	{
		z = 10.6719,
		x = 2337.5967,
		y = 1922.543
	},
	{
		z = 10.6719,
		x = 2337.5718,
		y = 1952.6678
	},
	{
		z = 10.6719,
		x = 2337.8853,
		y = 2005.3424
	},
	{
		z = 10.8203,
		x = 2392.707,
		y = 2005.7031
	},
	{
		z = 10.8203,
		x = 2392.8972,
		y = 2001.3892
	},
	{
		z = 10.8203,
		x = 2367.7988,
		y = 2001.1239
	},
	{
		z = 10.8281,
		x = 2367.7649,
		y = 1985.7206
	},
	{
		z = 10.8203,
		x = 2370.6326,
		y = 1982.8994
	},
	{
		z = 10.8203,
		x = 2408.2842,
		y = 1982.9637
	},
	{
		z = 10.8203,
		x = 2408.4124,
		y = 2004.3645
	},
	{
		z = 11.2648,
		x = 2428.3608,
		y = 2004.3645
	},
	{
		z = 11.9381,
		x = 2433.0125,
		y = 2004.7113
	},
	{
		z = 10.8203,
		x = 2454.104,
		y = 2005.7122
	},
	{
		z = 10.8203,
		x = 2485.3347,
		y = 2005.7123
	},
	{
		z = 11.9381,
		x = 2496.6868,
		y = 2005.7123
	},
	{
		z = 10.8203,
		x = 2500.3589,
		y = 2005.7567
	},
	{
		z = 10.8203,
		x = 2512.8394,
		y = 2006.2916
	},
	{
		z = 10.8203,
		x = 2517.0317,
		y = 2005.8452
	}
}

local zone_two = {
	{
		z = 48.0969,
		x = -487.5297,
		y = 2163.1255
	},
	{
		z = 47.917,
		x = -484.3675,
		y = 2165.7024
	},
	{
		z = 47.4877,
		x = -476.8463,
		y = 2171.8357
	},
	{
		z = 46.8229,
		x = -471.303,
		y = 2177.4629
	},
	{
		z = 46.4865,
		x = -470.6429,
		y = 2184.9189
	},
	{
		z = 46.2181,
		x = -470.5349,
		y = 2194.9207
	},
	{
		z = 47.1068,
		x = -475.7249,
		y = 2201.5356
	},
	{
		z = 48.4619,
		x = -482.8195,
		y = 2208.8984
	},
	{
		z = 49.5511,
		x = -488.0079,
		y = 2217.5398
	},
	{
		z = 49.7572,
		x = -488.112,
		y = 2223.6665
	},
	{
		z = 49.9258,
		x = -488.1552,
		y = 2228.863
	},
	{
		z = 50.0021,
		x = -489.8535,
		y = 2236.1228
	},
	{
		z = 50.0074,
		x = -492.4996,
		y = 2245.3145
	},
	{
		z = 51.5313,
		x = -494.7664,
		y = 2256.3821
	},
	{
		z = 53.3101,
		x = -495.6942,
		y = 2265.6953
	},
	{
		z = 56.31,
		x = -498.0162,
		y = 2271.7842
	},
	{
		z = 59.3243,
		x = -500.8201,
		y = 2276.4836
	},
	{
		z = 62.8115,
		x = -504.1785,
		y = 2281.8787
	},
	{
		z = 64.179,
		x = -505.5282,
		y = 2283.9822
	},
	{
		z = 64.3418,
		x = -505.4239,
		y = 2285.4063
	},
	{
		z = 64.2797,
		x = -504.4581,
		y = 2286.2952
	},
	{
		z = 64.0252,
		x = -500.5304,
		y = 2290.4277
	},
	{
		z = 64.3405,
		x = -494.5858,
		y = 2298.5112
	},
	{
		z = 64.7392,
		x = -489.4023,
		y = 2305.7971
	},
	{
		z = 63.6399,
		x = -482.8528,
		y = 2312.8918
	},
	{
		z = 65.5649,
		x = -476.4283,
		y = 2318.8164
	},
	{
		z = 68.0005,
		x = -470.8137,
		y = 2323.4734
	},
	{
		z = 70.708,
		x = -466.7094,
		y = 2327.2668
	},
	{
		z = 70.9602,
		x = -465.8162,
		y = 2327.4768
	},
	{
		z = 70.0083,
		x = -460.825,
		y = 2324.3374
	},
	{
		z = 67.8298,
		x = -455.1648,
		y = 2318.7695
	},
	{
		z = 66.7524,
		x = -450.1181,
		y = 2317.1887
	},
	{
		z = 66.0162,
		x = -440.609,
		y = 2318.0371
	},
	{
		z = 65.7374,
		x = -436.5607,
		y = 2318.447
	},
	{
		z = 59.553,
		x = -426.8115,
		y = 2317.7573
	},
	{
		z = 54.4471,
		x = -423.2818,
		y = 2312.8767
	},
	{
		z = 50.0836,
		x = -417.8271,
		y = 2311.8882
	},
	{
		z = 49.7017,
		x = -414.6191,
		y = 2314.8955
	},
	{
		z = 47.4286,
		x = -404.2956,
		y = 2320.7078
	},
	{
		z = 42.9294,
		x = -397.7255,
		y = 2320.1821
	},
	{
		z = 39.0983,
		x = -391.1599,
		y = 2320.1865
	},
	{
		z = 35.3621,
		x = -384.245,
		y = 2319.6675
	},
	{
		z = 33.6878,
		x = -379.2184,
		y = 2319.1067
	},
	{
		z = 33.6915,
		x = -367.553,
		y = 2318.5793
	},
	{
		z = 36.5222,
		x = -356.0885,
		y = 2316.6218
	},
	{
		z = 40.4985,
		x = -349.5545,
		y = 2309.449
	},
	{
		z = 44.418,
		x = -343.1182,
		y = 2302.3689
	},
	{
		z = 47.8572,
		x = -341.067,
		y = 2294.8552
	},
	{
		z = 51.9972,
		x = -339.7117,
		y = 2284.7825
	},
	{
		z = 54.4416,
		x = -335.2355,
		y = 2277.1536
	},
	{
		z = 57.0218,
		x = -329.9371,
		y = 2269.043
	},
	{
		z = 58.0583,
		x = -323.7013,
		y = 2262.9683
	},
	{
		z = 58.777,
		x = -314.3908,
		y = 2255.4756
	},
	{
		z = 60.927,
		x = -302.6476,
		y = 2248.3704
	},
	{
		z = 61.8861,
		x = -295.6709,
		y = 2243.4937
	},
	{
		z = 59.7512,
		x = -294.7297,
		y = 2237.7168
	},
	{
		z = 57.3093,
		x = -293.5323,
		y = 2230.3699
	},
	{
		z = 54.8039,
		x = -291.5664,
		y = 2219.124
	},
	{
		z = 54.7589,
		x = -290.3576,
		y = 2210.8164
	},
	{
		z = 58.3442,
		x = -289.1982,
		y = 2202.8357
	},
	{
		z = 61.0377,
		x = -288.3018,
		y = 2196.6785
	},
	{
		z = 59.1221,
		x = -297.4099,
		y = 2192.0303
	},
	{
		z = 58.3105,
		x = -305.9751,
		y = 2184.7625
	},
	{
		z = 57.8909,
		x = -310.1546,
		y = 2181.3223
	},
	{
		z = 57.027,
		x = -313.8151,
		y = 2171.3884
	},
	{
		z = 56.1915,
		x = -315.9184,
		y = 2161.116
	},
	{
		z = 51.8329,
		x = -312.1996,
		y = 2141.8894
	},
	{
		z = 49.974,
		x = -346.3464,
		y = 2137.3879
	},
	{
		z = 57.727,
		x = -363.3376,
		y = 2136.1326
	},
	{
		z = 59.8518,
		x = -368.9391,
		y = 2140.6284
	},
	{
		z = 59.9288,
		x = -378.6228,
		y = 2140.6682
	},
	{
		z = 60.2335,
		x = -388.4158,
		y = 2133.6604
	},
	{
		z = 57.4081,
		x = -395.5507,
		y = 2128.7273
	},
	{
		z = 51.3497,
		x = -403.9309,
		y = 2128.9497
	},
	{
		z = 47,
		x = -414.5854,
		y = 2129.5776
	},
	{
		z = 45.9178,
		x = -426.6154,
		y = 2130.4492
	},
	{
		z = 46.2906,
		x = -437.5507,
		y = 2131.1936
	},
	{
		z = 47.3507,
		x = -444.0714,
		y = 2131.6406
	},
	{
		z = 47.575,
		x = -446.5881,
		y = 2136.7134
	},
	{
		z = 48.315,
		x = -451.392,
		y = 2143.3989
	},
	{
		z = 49.6828,
		x = -458.2214,
		y = 2149.7058
	},
	{
		z = 51.1855,
		x = -465.7596,
		y = 2156.1973
	},
	{
		z = 51.9547,
		x = -469.6096,
		y = 2159.6272
	},
	{
		z = 51.1807,
		x = -475.251,
		y = 2161.114
	},
	{
		z = 49.3001,
		x = -483.0723,
		y = 2162.1294
	},
	{
		z = 48.0969,
		x = -487.5297,
		y = 2163.1255
	}
}

local var_0_46 = {
	id1 = {
		squareStart = {
			x = 307,
			y = 852.5
		},
		squareEnd = {
			x = 402,
			y = 972.5
		}
	},
	id2 = {
		squareStart = {
			x = -473,
			y = 2181
		},
		squareEnd = {
			x = -336,
			y = 2285
		}
	},
	id3 = {
		squareStart = {
			x = 59,
			y = 2385.9
		},
		squareEnd = {
			x = 283,
			y = 2470.9
		}
	},
	id4 = {
		squareStart = {
			x = -1909.8,
			y = -1700.1
		},
		squareEnd = {
			x = -1815.8,
			y = -1574.1
		}
	},
	id5 = {
		squareStart = {
			x = 2378,
			y = 1893.8
		},
		squareEnd = {
			x = 2490,
			y = 1957.8
		}
	}
}

local var_0_47 = 4286611584
local var_0_48 = 4290522156
local var_0_49 = 4284782061

function load_ini()
	if ini == nil then
		saveINI()
	else
		only_evolv[0] = ini.mafialines.onlyServer
		time_capt[0] = ini.mafialines.onlyCapture
		radar_lines[0] = ini.mafialines.radarRender
		type_radar[0] = ini.mafialines.radarMode
		var_0_27[0] = ini.mafialines.width
		var_0_28[0] = ini.mafialines.distancedraw
	
		local var_32_1 = decodeJson(ini.mafialines.color)
	
		ev2 = imgui.new.float[4](var_32_1[1], var_32_1[2], var_32_1[3], var_32_1[4])
		var_0_26[0] = ini.mafialines.rainbowc
		var_0_29[0] = ini.mafialines.mode
		ev0[0] = ini.mafialines.trailalpha
		ev1[0] = ini.mafialines.trailspeed
		lines_status[0] = ini.mafialines.activated
		id1_status[0] = ini.mafialines.quarryed
		id2_status[0] = ini.mafialines.villaged
		id3_status[0] = ini.mafialines.airported
		id4_status[0] = ini.mafialines.mined
		id5_status[0] = ini.mafialines.buildinged
		var_0_14 = join_argb(var_32_1[4] * 255, var_32_1[1] * 255, var_32_1[2] * 255, var_32_1[3] * 255)
	end
end

local isLoaded = false

keydrugs = ini.drugtimer.key:match('%[(%d+)%]')
fckey = ini.fastcarfx.key:match('%[(%d+)%]')
autocapterkey = ini.AutoCapt.key:match('%[(%d+)%]')
fsafekey = ini.fsafe.key:match('%[(%d+)%]')
dnkey = ini.fsafe.dnk_key:match('%[(%d+)%]')
getgunskey = ini.getguns.key:match('%[(%d+)%]')
pressSbivkey = ini.sbiv.key:match('%[(%d+)%]')

--------------------------------------------------------------------------------
--------------------------------------MAIN--------------------------------------
--------------------------------------------------------------------------------
--#MAIN
function main()
	if not isSampLoaded() or not isSampfuncsLoaded() then return end
	while not isSampAvailable() do wait(0) end

	memory.fill(sampGetBase() + 0x7418, 0x90, 6, true) -- Включает hud при sampSetSpecialAction.

    local result, PlayerId = sampGetPlayerIdByCharHandle(PLAYER_PED)
	my_name = sampGetPlayerNickname(PlayerId)
    local ip, port = sampGetCurrentServerAddress()
    drugtimer = string.format('%s %s-%s', my_name, ip:gsub('%.', '-'), port)
    sampRegisterChatCommand("pte", function()  Menu[0] = not Menu[0] end)
	sampRegisterChatCommand("cho", function() sampAddChatMessage(cho_gang, -1)sampAddChatMessage(cho_biker, -1)  sampAddChatMessage(cho_maf, -1) end)
	sampRegisterChatCommand("pe", function(arg) sampAddChatMessage(sampGetPlayerColor(arg) .. " " .. ('%06X'):format(bit.band(sampGetPlayerColor(arg), 0xFFFFFF)), -1) end)
	repeat wait(0) until sampGetCurrentServerName() ~= "SA-MP"
    repeat wait(0) until sampGetCurrentServerName():find("Samp%-Rp.Ru") or sampGetCurrentServerName():find("SRP") or sampGetCurrentServerName():find("Evolve%-Rp.Ru")

	if status_hotkey then
		DrugHotKey = hotkey.RegisterHotKey('Drug Hotkey', false, decodeJson(ini.drugtimer.key), function() end)
		FastCarFXHotKey = hotkey.RegisterHotKey('FastCar Hotkey', false, decodeJson(ini.fastcarfx.key), function() end)
		AutoCapterHotKey = hotkey.RegisterHotKey('AutoCapt Hotkey', false, decodeJson(ini.AutoCapt.key), function() end)
		fsafeoneHotKey = hotkey.RegisterHotKey('Fsafe Hotkey', false, decodeJson(ini.fsafe.key), function() end)
		DNKHotKey = hotkey.RegisterHotKey('DNK Hotkey', false, decodeJson(ini.fsafe.dnk_key), function() end)
		GetgunsHotKey = hotkey.RegisterHotKey('Getguns Hotkey', false, decodeJson(ini.getguns.key), function() end)
		SbivHotKey = hotkey.RegisterHotKey('Sbiv Hotkey', false, decodeJson(ini.sbiv.key), function() end)
	end
    gg_evolve.getgun_list = {}
    gg_evolve.open = false
    gg_evolve.getgun = false
    gg_evolve.drugs_ignore = 0
    gg_evolve.getgun_st = 0
    gg_evolve.tdstart = 0
    
	check_server()
    update("https://raw.githubusercontent.com/User653478/script/main/Palenation%20Tool%20Extended.json")
    capture_cmd_register()
	flooder_cmd_register()
	check_lib()
    load_ini() 

	lua_thread.create(FamCheckFunc)
	lua_thread.create(FsafeFunc)
	lua_thread.create(EbloCheckFunc)        
	lua_thread.create(GetMats)
	lua_thread.create(text_to_table) 
	lua_thread.create(drugstimer)
	lua_thread.create(FastCarFunc)
	lua_thread.create(AutoCaptFunc)
	lua_thread.create(GetGunFunc)
	lua_thread.create(LeaderManagementFunc)
	lua_thread.create(SbivFunc)
	lua_thread.create(MafiaLinesFunc)
	lua_thread.create(AutoGetGunsFunc)
	lua_thread.create(DownloadLibsFunc)
    lua_thread.create(warelock_palenation)
	lua_thread.create(sosi_pisun)
	lua_thread.create(xzka1)
	lua_thread.create(xzka2)
	lua_thread.create(xzka3)
	lua_thread.create(xzka4)
	lua_thread.create(xzka5)
	lua_thread.create(SquadFunc)
	lua_thread.create(SquadFunctwo)
	lua_thread.create(xzka6)
	lua_thread.create(kabanchikk)
	lua_thread.create(xxxxxxxddffg)
	lua_thread.create(xxxxx4xxddffg)
	lua_thread.create(helpgpsvnimanie)
	wait(-1)
end
function helpgpsvnimanie()
	while true do wait(0)
if ini.LeaderManagement.x == 44 and ini.LeaderManagement.y == 208.92858886719 and sampTextdrawGetString(487):find("EVOLVE") then
	ini.LeaderManagement.y = ini.LeaderManagement.y + 29
	sampAddChatMessage("da")
	inicfg.save(ini, directIni)
end
end
end



function xxxxxxxddffg()
	while true do wait(0)
if helpgggg then wait(3000) helpgggg = false end
	end
end
function xxxxx4xxddffg()
	while true do wait(0)
	if helpeee then wait(3000) helpeee = false end
	end
end
function kabanchikk()
	while true do wait(0)
	if help_m4_net or help_ak_net or help_deagle_net then
		wait(1000)
	if help_m4_net and not help_ak_net and not help_deagle_net then
	    sampSendChat("/fc ВНИМАНИЕ! В сейфе осталось меньше 3 тыс. патронов на M4")
		help_m4_net = false
		wait(1000)
	end
	if help_ak_net and not help_m4_net and not help_deagle_net then
		sampSendChat("/fc ВНИМАНИЕ! В сейфе осталось меньше 3 тыс. патронов на AK47")
		help_ak_net = false
		wait(1000)
	end
	if help_deagle_net and not help_ak_net and not help_m4_net then
	    sampSendChat("/fc ВНИМАНИЕ! В сейфе осталось меньше 1 тыс. патронов на Desert Eagle")
		help_deagle_net = false
		wait(1000)
	end
	if help_deagle_net and help_ak_net and help_m4_net then
	    sampSendChat("/fc ВНИМАНИЕ! В сейфе осталось меньше 3 тыс. патронов на Desert Eagle, M4, AK47")
		help_deagle_net = false
		help_ak_net = false
		help_m4_net = false
		wait(1000)
	end
	if help_deagle_net and help_ak_net and not help_m4_net then
		sampSendChat("/fc ВНИМАНИЕ! В сейфе осталось меньше 3 тыс. патронов на Desert Eagle, AK47")
		help_ak_net = false
		help_deagle_net = false
		wait(1000)
	end
	if help_deagle_net and help_m4_net and not help_ak_net then
		sampSendChat("/fc ВНИМАНИЕ! В сейфе осталось меньше 3 тыс. патронов на Desert Eagle, M4")
		help_m4_net = false
		help_deagle_net = false
		wait(1000)
	end
	if not help_deagle_net and help_ak_net and help_m4_net then
		sampSendChat("/fc ВНИМАНИЕ! В сейфе осталось меньше 3 тыс. патронов на M4, AK47")
		help_ak_net = false
		help_m4_net = false
		wait(1000)
	end
    end
end
end
function sosi_pisun()
	while true do wait(0)
		if ini.squad.status and not sampIsDialogActive() and not sampIsChatInputActive() and not sampIsCursorActive() then
			sampSendChat("/fmembers")
			netfmem = true
			wait(10000)
		end
	end
end
--------------------------------------------------------------------------------
-------------------------------------OnFrame------------------------------------
--------------------------------------------------------------------------------
--#MIMGUI #FRAME #ONDRAWDRAME #WINDOW

imgui.OnFrame(
    function() return Menu[0] end,
    function(player)
        local res = imgui.ImVec2(getScreenResolution());
        imgui.SetNextWindowPos(imgui.ImVec2(res.x / 2, res.y / 2), imgui.Cond.FirstUseEver, imgui.ImVec2(0.5, 0.5))
        imgui.SetNextWindowSize(imgui.ImVec2(650, 600), imgui.Cond.FirstUseEver)
        imgui.Begin(fa["MOTORCYCLE"]..'  PALERIDERS  '..fa["MOTORCYCLE"], Menu, imgui.WindowFlags.NoResize + imgui.WindowFlags.NoCollapse + imgui.WindowFlags.NoScrollbar)
        imgui.BeginChild('tabs2', imgui.ImVec2(200, -1), true)
        imgui.BeginChild('tabs', imgui.ImVec2(200, 500), false)
        if imgui.PageButton(page == 1, fa["USER"], 'Управление составом') then
            page = 1
        end    
        if imgui.PageButton(page == 2, fa["CAR_SIDE"], 'Быстрый транспорт') then
            page = 2
        end		
        if imgui.PageButton(page == 3, fa["WAREHOUSE"], 'Быстрый склад') then
            page = 3
        end    
        if imgui.PageButton(page == 4, fa["HELMET_SAFETY"], 'Быстрый сейф') then
            page = 4
        end            
		if imgui.PageButton(page == 5, fa["MINUS"], 'Мафия линии') then
            page = 5
        end  		
        if imgui.PageButton(page == 6, fa["CLOCK"], 'Наркотаймер') then
            page = 6
        end
        if imgui.PageButton(page == 7, fa["COMPUTER_MOUSE"], 'Каптер и Флудер') then
            page = 7
        end
        if imgui.PageButton(page == 8, fa["SKULL"], 'Еблочекер') then
            page = 8
        end  
        if imgui.PageButton(page == 9, fa["PERSON"], 'Сбив') then
            page = 9
        end
		if imgui.PageButton(page == 10, fa["USER_GROUP"], 'Сквад') then
            page = 10
        end
        imgui.EndChild()
    --    if imgui.PageButton(page == 13, fa["FILE"], 'Лог обновлений') then
    --        page = 13
    --    end  

        imgui.EndChild()
        imgui.SameLine()
        imgui.BeginChild('workspace', imgui.ImVec2(-1, -1), true, imgui.WindowFlags.NoScrollbar)

            if page == 1 then
                LeadersManagement()
            elseif page == 2 then 
                fastcar()				
			elseif page == 3 then
				getgun()
            elseif page == 4 then
                fastsafe()
				dnkfsafe()
            elseif page == 5 then
				mlines()
            elseif page == 6 then
                narkotimer()
            elseif page == 7 then
                autocapter()
            elseif page == 8 then
                eblocheck()
            elseif page == 9 then
                sbiv()
			elseif page == 10 then	
				squad_text()
			--elseif page == 13 then
             --   log_update()   
            end
			if page ~= 4 then
	        	lafa = imgui.ImVec2(225, 520)
		    	imgui.SetCursorPos(lafa)
                imgui.Text("Разработчик: mafizik")
		        imgui.SetCursorPos(imgui.ImVec2(225, 520 + 18))
                imgui.Text("Идейный автор: Сергей Метцен")
			else
				lafa = imgui.ImVec2(225, 620)
				imgui.SetCursorPos(lafa)
				imgui.Text("Разработчик: mafizik")
			    imgui.SetCursorPos(imgui.ImVec2(225, 620 + 18))
			    imgui.Text("Идейный автор: Сергей Метцен")
			end
				
			---	imgui.Text("\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\nАвтор: mafizik")
		--imgui.Text("Боярин: Сергей Метцен")
        imgui.EndChild()
    
        imgui.End()
    end
)


---------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------
---------------------------------------------TEXT IN WINDOW----------------------------------------
---------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------
function squad_text()
    imgui.ToggleButtonTextGear("Отображние участников сквада", status_sm, function()
		ini.squad.status = not ini.squad.status
		inicfg.save(ini, directIni)
	end, true, function() end)
	imgui.ToggleButtonTextGear("Отображние онлайна сквада", status_squad_online, function()
		ini.squad.online_status = not ini.squad.online_status
		inicfg.save(ini, directIni)
	end, true, function() end)
	if ini.squad.online_status or status_squad_online[0] then
		local squad_raskladka = (ini.squad.language == 0 and "Английский" or "Русский")
    if imgui.Button("Текст рендера онлайна: "..squad_raskladka.."##multi.online.squad", imgui.ImVec2(390,20)) then
        ini.squad.language = ini.squad.language + 1
        if ini.squad.language >= 2 then
            ini.squad.language = 0
        end
        inicfg.save(ini, directIni)
    end
	end
	if imgui.Button("Сменить позицию", imgui.ImVec2(390,20)) then
        pos_squad = true
    end
	imgui.Combo(u8("Цвет"), int_squad, combo_squad, #combosquad)
	imgui.Combo(u8("Надпись сверху"), int_namesq, squad_combo, #squadcombo)
	imgui.Combo(u8("Сортировка игроков"), int_squad2, combo_squad2, #combosquad2)
	imgui.InputText("Название шрифта", sfont_sfont, sizeof(sfont_sfont))
    imgui.InputText("Размер шрифта", sfont_ssize, sizeof(sfont_ssize))
    imgui.InputText("Стиль шрифта", sfont_flag, sizeof(sfont_flag))
	if ini.squad.int == 3 or int_squad[0] == 3 then
	if imgui.ColorEdit4("Цвет ников", castom_color_squad) then ini.squad.color = imgui.ColorConvertFloat4ToU32(imgui.ImVec4(castom_color_squad[0], castom_color_squad[1], castom_color_squad[2], castom_color_squad[3])) inicfg.save(ini, directIni) end
    end
	if imgui.Button("Сбросить настройки##m", imgui.ImVec2(390,25)) then
		int_squad[0] = 2
		int_namesq[0] = 1
		int_squad2[0] = 0
		 sfont_sfont = imgui.new.char[256](u8("Arial"))
         sfont_ssize = imgui.new.char[256](u8(12))
         sfont_flag = imgui.new.char[256](u8(13))
		status_squad_online[0] = false
		ini.squad.x_pos = PosSquadX
		ini.squad.y_pos = PosSquadY
		ini.squad.font = 'Arial'
		ini.squad.size = 12
        ini.squad.flag = 13
		ini.squad.online_status = false
		ini.squad.int = 2
		ini.squad.rank = 0
		ini.squad.name_squad = 1
		ini.squad.color = 4294967295
		ini.squad.language = 0
		inicfg.save(ini, directIni)
		renderReleaseFont(squad_font)
		squad_font = renderCreateFont(ini.squad.font, ini.squad.size, ini.squad.flag)
    end
	if imgui.Button("Сохранить##multi.squad.save", imgui.ImVec2(390,25)) then
		ini.squad.name_squad = int_namesq[0]
		ini.squad.rank = int_squad2[0]
		ini.squad.int = int_squad[0]
		ini.squad.font = str(sfont_sfont)
		ini.squad.size = tonumber(str(sfont_ssize))
		ini.squad.flag = tonumber(str(sfont_flag))
		inicfg.save(ini, directIni)
		renderReleaseFont(squad_font)
		squad_font = renderCreateFont(ini.squad.font, ini.squad.size, ini.squad.flag)
    end

end

function narkotimer()
    imgui.ToggleButtonTextGear("Наркотаймер", status_drug_timer, function()
    ini.drugtimer.status = not ini.drugtimer.status
    inicfg.save(ini, directIni)
    end, true, function() end)
    imgui.ToggleButtonTextGear("Юзать нарко после смерти", death_drug_timer, function()
        ini.drugtimer.death = not ini.drugtimer.death
        inicfg.save(ini, directIni)
        end, true, function() end)
    if DrugHotKey:ShowHotKey(imgui.ImVec2(390,20)) then 
        ini.drugtimer.key = encodeJson(DrugHotKey:GetHotKey()) 
		keydrugs = ini.drugtimer.key:match('%[(%d+)%]')
        inicfg.save(ini, directIni)
    end
    if imgui.Button("Сменить позицию таймера", imgui.ImVec2(390,20)) then
        pos = true
    end
    imgui.InputText("Текст без таймера", nark_lines_one, sizeof(nark_lines_one))
    imgui.InputText("Текст с таймером", nark_lines_two, sizeof(nark_lines_two))
    imgui.InputText("Название шрифта", nark_font_font, sizeof(nark_font_font))
    imgui.InputText("Размер шрифта", nark_font_size, sizeof(nark_font_size))
    imgui.InputText("Стиль шрифта", nark_font_flag, sizeof(nark_font_flag))
    if imgui.Button("Сохранить##multi.nark.save", imgui.ImVec2(390,25)) then
        if str(nark_font_size):find("^%d+$") and str(nark_font_flag):find("^%d+$") then
            ini.lines.one = str(nark_lines_one)
            ini.lines.two = str(nark_lines_two)
            ini.render.font = str(nark_font_font)
            ini.render.size = tonumber(str(nark_font_size))
            ini.render.flag = tonumber(str(nark_font_flag))
            inicfg.save(ini, directIni)
            renderReleaseFont(font)
            font = renderCreateFont(ini.render.font, ini.render.size, ini.render.flag)
        end
    end
    imgui.Spacing()
    imgui.Spacing()
    local align = (ini.render.align == 0 and "К левому краю" or
        (ini.render.align == 1 and "По середине" or "К правому краю"))
    if imgui.Button("Выравнивание: "..align.."##multi.nark.align", imgui.ImVec2(390,25)) then
        ini.render.align = ini.render.align + 1
        if ini.render.align >= 3 then
            ini.render.align = 0
        end
        inicfg.save(ini, directIni)
    end
    imgui.PushItemWidth(150)
    if imgui.SliderInt('Расстояние между строк таймера', nark_height, 2, 10) then
        ini.render.height = nark_height[0]
        inicfg.save(ini, directIni)
    end
    if imgui.SliderInt('Максимальное кол-во грамм', nark_max_gramm, 0, 20) then
        ini.drugtimer.max_use_gram = nark_max_gramm[0]
        inicfg.save(ini, directIni)
    end
    if imgui.SliderInt('Максимальное кол-во HP', nark_max_hp, 0, 200) then
        ini.drugtimer.hp = nark_max_hp[0]
        inicfg.save(ini, directIni)
    end
end

function autosklad()
    imgui.ToggleButtonTextGear("Автовзятие склада для гетто", autogetguns_status, function()
		ini.autogetguns.status = not ini.autogetguns.status
		inicfg.save(ini, directIni)
	end, true, function() end)
end

function fastcar()
    imgui.ToggleButtonTextGear("Быстрый транспорт ФХ", status_fcar_fx, function()
        ini.fastcarfx.status = not ini.fastcarfx.status
        inicfg.save(ini, directIni)
    end, true, function() end)

    imgui.ToggleButtonTextGear("Автовыход из ФХ", status_fcarexit_fx, function()
        ini.fastcarfx.status_exit = not ini.fastcarfx.status_exit
        inicfg.save(ini, directIni)
    end, true, function() end)

    if FastCarFXHotKey:ShowHotKey(imgui.ImVec2(390,20)) then 
        ini.fastcarfx.key = encodeJson(FastCarFXHotKey:GetHotKey()) 
		fckey = ini.fastcarfx.key:match('%[(%d+)%]')
        inicfg.save(ini, directIni)
    end
end

function mlines()
	imgui.ToggleButtonTextGear("Мафия линии", lines_status, function()
		saveINI()
	end, true, function() end)

	if imgui.Checkbox(u8("ID 1 - Карьер"), id1_status) then
		saveINI()
	end

	if imgui.Checkbox(u8("ID 2 - Деревня"), id2_status) then
		saveINI()
	end

	if imgui.Checkbox(u8("ID 3 - Аэропорт"), id3_status) then
		saveINI()
	end

	if imgui.Checkbox(u8("ID 4 - Угольная шахта"), id4_status) then
		saveINI()
	end

	if imgui.Checkbox(u8("ID 5 - Стройка"), id5_status) then
		saveINI()
	end

	imgui.Spacing()
	imgui.Spacing()

	if imgui.Checkbox(u8("Рисовать только во время стрелы"), time_capt) then
		saveINI()
	end

	if imgui.Checkbox(u8("Рисовать на радаре"), radar_lines) then
		saveINI()
	end

	if imgui.Combo(u8("Тип радара"), type_radar, combo_list, #combolist) then
		saveINI()
	end

	imgui.Spacing()

	if imgui.SliderInt(u8("Ширина линии"), var_0_27, 1, 10) then
		saveINI()
	end

	if imgui.SliderInt(u8("Дистанция"), var_0_28, 0, 3600) then
		saveINI()
	end

	imgui.Spacing()

	if imgui.Combo(u8("Режим отображения"), var_0_29, combo_two, #combotwo) then
		saveINI()
	end

	imgui.Spacing()

	if var_0_29[0] == 1 then
		if imgui.SliderInt(u8("Скорость"), ev1, 1, 10) then
			saveINI()
		end

		if imgui.SliderInt(u8("Прозрачность"), ev0, 1, 255) then
			saveINI()
		end

	elseif imgui.ColorEdit4(u8("Цвет линии"), ev2) then
		var_0_14 = join_argb(ev2[3] * 255, ev2[0] * 255, ev2[1] * 255, ev2[2] * 255)
		saveINI()
	end
end

function fastsafe()
    imgui.ToggleButtonText("Быстрый сейф ФХ", statusfsafe, function()
        ini.fsafe.status = statusfsafe[0]
        inicfg.save(ini, directIni)
    end)
    imgui.Text("Активация")
    if fsafeoneHotKey:ShowHotKey(imgui.ImVec2(390,20)) then 
        ini.fsafe.key = encodeJson(fsafeoneHotKey:GetHotKey()) 
		fsafekey = ini.fsafe.key:match('%[(%d+)%]')
        inicfg.save(ini, directIni)
    end 
    imgui.Spacing()
    imgui.Spacing()
    imgui.Text("Введите кол-во патрон")
    imgui.PushItemWidth(150)
    imgui.InputText("Пин-код", fsafe.pin, sizeof(fsafe.pin)) 
    imgui.InputText("АК-47", fsafe.ak, sizeof(fsafe.ak))
    imgui.InputText("M4", fsafe.m4, sizeof(fsafe.m4))
    imgui.InputText("Deagle", fsafe.deagle, sizeof(fsafe.deagle))
    imgui.InputText("Rifle", fsafe.rifle, sizeof(fsafe.rifle))
    imgui.InputText("Shotgun", fsafe.shotgun, sizeof(fsafe.shotgun))
    imgui.InputText("Антифлуд задержка (мс)", fsafe.wait, sizeof(fsafe.wait))
    imgui.PopItemWidth()
    if imgui.Button("Сохранить##save.fsafe", imgui.ImVec2(380, 25)) then
        ini.fsafe.pin = str(fsafe.pin)
        local list = { "ak", "m4", "deagle", "rifle", "shotgun", "wait"}
        for i = 1, #list do
            local text = str(fsafe[list[i]])
            if text:find("^%d+$") then
                ini.fsafe[list[i]] = tonumber(text)
            else
                imgui.StrCopy(fsafe[list[i]], tostring(ini.fsafe[list[i]]))
            end
        end
        inicfg.save(ini, directIni)
    end
	imgui.Spacing()
    imgui.Spacing()
    imgui.Spacing()
    imgui.Spacing()
    imgui.Separator()
    imgui.Spacing()
    imgui.Spacing()
end

function dnkfsafe()
	imgui.ToggleButtonText("Быстрый сейф ДНК", statusfsafeforDNK, function()
        ini.fsafe.dnk_status = statusfsafeforDNK[0]
        inicfg.save(ini, directIni)
    end)

	imgui.Text("Активация")
    if DNKHotKey:ShowHotKey(imgui.ImVec2(390,20)) then 
        ini.fsafe.dnk_key = encodeJson(DNKHotKey:GetHotKey()) 
		dnkey = ini.fsafe.dnk_key:match('%[(%d+)%]')
        inicfg.save(ini, directIni)
    end 

    imgui.Spacing()
    imgui.Spacing()

    imgui.Text("Введите кол-во патрон")
    imgui.PushItemWidth(150)
    imgui.InputText("Пин-код##S", fsafe.dnk_pin, sizeof(fsafe.dnk_pin)) 
    imgui.InputText("АК-47##S", fsafe.dnk_ak, sizeof(fsafe.dnk_ak))
    imgui.InputText("M4##S", fsafe.dnk_m4, sizeof(fsafe.dnk_m4))
    imgui.InputText("Deagle##S", fsafe.dnk_deagle, sizeof(fsafe.dnk_deagle))
    imgui.InputText("Rifle##S", fsafe.dnk_rifle, sizeof(fsafe.dnk_rifle))
    imgui.InputText("Shotgun##S", fsafe.dnk_shotgun, sizeof(fsafe.dnk_shotgun))
    imgui.InputText("Антифлуд задержка (мс)##S", fsafe.dnk_wait, sizeof(fsafe.dnk_wait))
    imgui.PopItemWidth()

    if imgui.Button("Сохранить##save.dnk.fsafe", imgui.ImVec2(380, 25)) then
        ini.fsafe.dnk_pin = str(fsafe.dnk_pin)
        local list = { "dnk_ak", "dnk_m4", "dnk_deagle", "dnk_rifle", "dnk_shotgun", "dnk_wait"}
        for i = 1, #list do
            local text = str(fsafe[list[i]])
            if text:find("^%d+$") then
                ini.fsafe[list[i]] = tonumber(text)
            else
                imgui.StrCopy(fsafe[list[i]], tostring(ini.fsafe[list[i]]))
            end
        end
        inicfg.save(ini, directIni)
    end
end

function getgun()
    imgui.ToggleButtonText("Быстрый склад байкеров/мафий", getguns_status, function()
        ini.getguns.status = getguns_status[0]
        inicfg.save(ini, directIni)
    end)
	
	imgui.ToggleButtonTextGear("Автовзятие склада для гетто", autogetguns_status, function()
		ini.autogetguns.status = not ini.autogetguns.status
		inicfg.save(ini, directIni)
	end, true, function() end)

    imgui.Text("Активация")
    if GetgunsHotKey:ShowHotKey(imgui.ImVec2(390,20)) then 
        ini.getguns.key = encodeJson(GetgunsHotKey:GetHotKey()) 
		getgunskey = ini.getguns.key:match('%[(%d+)%]')
        inicfg.save(ini, directIni)
    end 

    imgui.Spacing()
    imgui.Spacing()
    imgui.Spacing()
    imgui.Spacing()

    imgui.PushItemWidth(150)
    imgui.InputText("АК-47", getguns.ak, sizeof(getguns.ak))
    imgui.InputText("M4", getguns.m4, sizeof(getguns.m4))
    imgui.InputText("Deagle", getguns.deagle, sizeof(getguns.deagle))
    imgui.InputText("Rifle", getguns.rifle, sizeof(getguns.rifle))
    imgui.InputText("Shotgun", getguns.shotgun, sizeof(getguns.shotgun))
    imgui.PopItemWidth()
	imgui.Checkbox(u8("Брать броню"), armor_status)
    if imgui.Button("Сохранить##save.getguns", imgui.ImVec2(380, 25)) then
		ini.getguns.armor = armor_status[0]
        local list = { "ak", "m4", "deagle", "rifle", "shotgun" }
        for i = 1, #list do
            local text = str(getguns[list[i]])
            if text:find("^%d+$") then
                ini.getguns[list[i]] = tonumber(text)
            else
                imgui.StrCopy(getguns[list[i]], tostring(ini.getguns[list[i]]))
            end
        end
        inicfg.save(ini, directIni)
    end

    imgui.Spacing()
    imgui.Spacing()
    imgui.Spacing()

    if imgui.Checkbox("Брать нарко до фулла при переходе в меню бара > Наркотики", getguns.drugs) then
        ini.getguns.auto_get_drugs = getguns.drugs[0]
        inicfg.save(ini, directIni)
    end

    if imgui.Checkbox("Пополнять сытость полностью при переходе в меню бара", getguns.drink) then
        ini.getguns.auto_get_drink = getguns.drink[0]
        inicfg.save(ini, directIni)
    end

end



function LeadersManagement()
	imgui.ToggleButtonTextGear("Принимать запрос на открытие склада", request_wlpale, function()
		ini.LeaderManagement.warehouse_request = not ini.LeaderManagement.warehouse_request
		inicfg.save(ini, directIni)
	end, true, function() end)
	imgui.SameLine()
	imgui.TextQuestion(fa["CIRCLE_QUESTION"], "Для запроса открытия склада для членов состава напишите в чат семьи \nили в чат фракции wl pale.")
	imgui.ToggleButtonTextGear("Отправлять уведомление о количестве оружия в сейфе", status_weapon_information, function()
		ini.LeaderManagement.weapon_information = not ini.LeaderManagement.weapon_information
		inicfg.save(ini, directIni)
	end, true, function() end)
	imgui.SameLine()
	imgui.TextQuestion(fa["CIRCLE_QUESTION"], "Модуль отправляет оповещение в чат семьи об отсутствии оружия (ak,m4, deagle) в сейфе.\nДополнительно текст рендерится на экране. Есть возможность изменить позицию и стиль рендера.\nРаботает вместе с SafeBot, который перехватывает уведомления от пользователей модуля и отрабатывает.")
	if status_weapon_information[0] or ini.LeaderManagement.weapon_information then
		if imgui.Button("Сменить позицию", imgui.ImVec2(390,20)) then
			pos_ld = true
		end
		imgui.InputText("Название шрифта", ld_font, sizeof(ld_font))
		imgui.InputText("Размер шрифта", ldfont_size, sizeof(ldfont_size))
		imgui.InputText("Стиль шрифта", ldfont_flag, sizeof(ldfont_flag))
		if imgui.ColorEdit4("Цвет", color_ld) then 	ini.LeaderManagement.color = imgui.ColorConvertFloat4ToU32(imgui.ImVec4(color_ld[0], color_ld[1], color_ld[2], color_ld[3])) inicfg.save(ini, directIni) end
		if imgui.Button("Сохранить##multi.lead.save", imgui.ImVec2(390,25)) then
			ini.LeaderManagement.font = str(ld_font)
			ini.LeaderManagement.size = tonumber(str(ldfont_size))
			ini.LeaderManagement.flag = tonumber(str(ldfont_flag))
			inicfg.save(ini, directIni)
			renderReleaseFont(font_for_notification)
			font_for_notification = renderCreateFont(ini.LeaderManagement.font, ini.LeaderManagement.size, ini.LeaderManagement.flag)
		end
	end


end

local EbloGangStatus = imgui.new.bool(ini.eblochecker.gang_status)
local EbloMafiaStatus = imgui.new.bool(ini.eblochecker.maf_status)
local EbloBikersStatus = imgui.new.bool(ini.eblochecker.biker_status)
local EbloGangStream = imgui.new.bool(ini.eblochecker.gang_stream)
local EbloMafiaStream = imgui.new.bool(ini.eblochecker.maf_stream)
local EbloBikersStream = imgui.new.bool(ini.eblochecker.biker_stream)
function eblocheck()
    imgui.ToggleButtonTextGear("Чекер банд", EbloGangStatus, function()
        ini.eblochecker.gang_status = not ini.eblochecker.gang_status
        inicfg.save(ini, directIni)
    end, true, function() end)

    imgui.ToggleButtonTextGear("Банды в зоне стрима", EbloGangStream, function()
        ini.eblochecker.gang_stream = not ini.eblochecker.gang_stream
        inicfg.save(ini, directIni)
    end, true, function() end)

    if imgui.Button("Переместить чекер банд", imgui.ImVec2(390, 25)) then
        pos_gang = true
    end

    imgui.Spacing()    
    imgui.Spacing()    
    imgui.Spacing()  
    imgui.Spacing()  
    imgui.Spacing()  
    imgui.Spacing()

    imgui.ToggleButtonTextGear("Чекер мафий", EbloMafiaStatus, function()
        ini.eblochecker.maf_status = not ini.eblochecker.maf_status
        inicfg.save(ini, directIni)
    end, true, function() end)

    imgui.ToggleButtonTextGear("Мафии в зоне стрима", EbloMafiaStream, function()
        ini.eblochecker.maf_stream = not ini.eblochecker.maf_stream
        inicfg.save(ini, directIni)
    end, true, function() end)

    if imgui.Button("Переместить чекер мафий", imgui.ImVec2(390, 25) ) then
        pos_maf = true
    end

    imgui.Spacing()    
    imgui.Spacing()    
    imgui.Spacing()  
    imgui.Spacing()  
    imgui.Spacing()  
    imgui.Spacing()

    imgui.ToggleButtonTextGear("Чекер байкеров", EbloBikersStatus, function()
        ini.eblochecker.biker_status = not ini.eblochecker.biker_status
        inicfg.save(ini, directIni)
    end, true, function() end)

    imgui.ToggleButtonTextGear("Байкеры в зоне стрима", EbloBikersStream, function()
        ini.eblochecker.biker_stream = not ini.eblochecker.biker_stream
        inicfg.save(ini, directIni)
    end, true, function() end)

    if imgui.Button("Переместить чекер байкеров", imgui.ImVec2(390, 25) ) then
        pos_biker = true
    end

    imgui.Spacing()
    imgui.Spacing()
    imgui.Spacing()
    imgui.Spacing()
    imgui.Spacing()
    imgui.Spacing()

    local style = (ini.eblochecker.style == 0 and "1" or "2")
    if imgui.Button("Стиль №"..style.."##multi.nark.style", imgui.ImVec2(390,25)) then
        ini.eblochecker.style = ini.eblochecker.style + 1
        if ini.eblochecker.style >= 2 then
            ini.eblochecker.style = 0
        end
        inicfg.save(ini, directIni)
    end
end


function log_update()
    if imgui.BeginChild('Version 1.0.', imgui.ImVec2(410, 270), true) then
        imgui.CenterText("Version 1.0. | Palenation Tool Extended")
        imgui.Spacing()
        imgui.Separator()
        imgui.Spacing()

        imgui.Text("Создание базы мультитула.")
        imgui.Text("Создание первичного интерфейса и дизайна.")
        imgui.Spacing()
        imgui.Text("Добавление модулей:")
        imgui.Text("Управление лидером,")
        imgui.Text("Быстрый транспорт,")
        imgui.Text("Быстрый склад,")
        imgui.Text("Быстрый сейф,")
        imgui.Text("Наркотаймер,")
        imgui.Text("Автокаптер,")
        imgui.Text("Еблочекер.")
        imgui.Spacing()
        imgui.Spacing()
        imgui.Spacing()
        imgui.Spacing()
        imgui.Spacing()
        imgui.Spacing()
        imgui.Text("                                                                                 Дата: 15.09.2024")
        imgui.EndChild() 
    end

	imgui.Spacing()
	imgui.Spacing()

	if imgui.BeginChild('Version 2.0.', imgui.ImVec2(410, 270), true, imgui.WindowFlags.NoScrollbar) then
        imgui.CenterText("Version 2.0. | Palenation Tool Extended")
        imgui.Spacing()
        imgui.Separator()
        imgui.Spacing()

        imgui.Text("Управление лидером.")
        imgui.Text("Добавлено ответное СМС от лидера как уведомление о \nвыполнении или невыполнении команды.")
        imgui.Text("Отчетное сообщение теперь выводится не во фракционный чат,\nа в чат семьи.")
		imgui.Spacing()
		imgui.Spacing()
        imgui.Text("Быстрый транспорт.")
        imgui.Text("Была добавлена возможность автоматического выхода после\nспавна автомобиля.")
        imgui.Text("Была добавлена функция автовзятия материалов при открытии\nсклада в банде.")
		imgui.Spacing()
		imgui.Spacing()
        imgui.Text("Быстрый склад.")
        imgui.Text("Функция быстрый склад была также адаптирована под мафии.")
		imgui.Spacing()
		imgui.Spacing()
        imgui.Text("Быстрый сейф.")
		imgui.Text("Функция быстрый сейф была адаптирована под ДНК.")
		imgui.Text('Изменена система взятия оружия, что позволило брать оружие \nбыстрее и без ошибок "не флуди".')
		imgui.Spacing()
		imgui.Text("Была добавлена функция линий границ для мафий.")
		imgui.Spacing()
        imgui.Spacing()
		imgui.Text("Еблочекер.")
		imgui.Text("В еблочекер был добавлен альтернативный внешний стиль.")
		imgui.Text("В еблочекер добавлена возможность показывать количество")
		imgui.Text("байкеров/бандитов/мафиози в зоне прорисовки.")
		imgui.Spacing()
		imgui.Text("Добавлена функция сбива.")
		imgui.Spacing()
		imgui.Text("Пофикшен ряд багов, исправлены недоработки в модулях.")
        imgui.Spacing()
        imgui.Spacing()
        imgui.Spacing()
        imgui.Spacing()
        imgui.Spacing()
        imgui.Spacing()
        imgui.Text("                                                                                 Дата: 24.09.2024")
        imgui.EndChild() 
    end
end

local SbivStatus = imgui.new.bool(ini.sbiv.status)
function sbiv()
    imgui.ToggleButtonTextGear("Сбив", SbivStatus, function()
        ini.sbiv.status = not ini.sbiv.status
        inicfg.save(ini, directIni)
    end, true, function() end)

    if SbivHotKey:ShowHotKey(imgui.ImVec2(390,20)) then 
        ini.sbiv.key = encodeJson(SbivHotKey:GetHotKey()) 
        pressSbivkey = ini.sbiv.key:match('%[(%d+)%]')
        inicfg.save(ini, directIni)
    end 
	if imgui.Combo(u8("Тип сбива"), int_sbiv, combo_sbiv, #combosbiv) then
		ini.sbiv.int = int_sbiv[0]
		inicfg.save(ini, directIni)
	end
end
local biz_int = new.int(ini.AutoCapt.biz - 1)
function autocapter()
    imgui.ToggleButtonTextGear("Автокаптер", AutoCaptStatus, function()
    ini.AutoCapt.status = not ini.AutoCapt.status
    inicfg.save(ini, directIni)
    end, true, function() end)
    
    if AutoCapterHotKey:ShowHotKey(imgui.ImVec2(390,20)) then 
        ini.AutoCapt.key = encodeJson(AutoCapterHotKey:GetHotKey()) 
		autocapterkey = ini.AutoCapt.key:match('%[(%d+)%]')
        inicfg.save(ini, directIni)
    end 

    imgui.PushItemWidth(390)
    imgui.Spacing()    
    imgui.Spacing()    
    imgui.Spacing()    
    imgui.Spacing()  
    imgui.InputTextWithHint("##Команда", "Введите команду", AutoCapterCom, sizeof(AutoCapterCom))
    if imgui.Button("Сохранить команду", imgui.ImVec2(390,20)) then
        sampUnregisterChatCommand(ini.AutoCapt.com)
        ini.AutoCapt.com = str(AutoCapterCom)
        ini.AutoCapt.com = ini.AutoCapt.com:gsub("/","")
        inicfg.save(ini, directIni)
        capture_cmd_register()
    end
    imgui.PopItemWidth()
    imgui.Spacing()    
    imgui.Spacing()    
    imgui.Spacing()  
    imgui.Spacing()   

    if imgui.InputText("Задержка", AutoCapterWait, sizeof(AutoCapterWait)) then
        ini.AutoCapt.wait = str(AutoCapterWait)
        inicfg.save(ini, directIni)
    end
    if imgui.Combo(u8("Номер бизнеса"), biz_int, biz_combo, #bizcombo) then
		ini.AutoCapt.biz = biz_int[0] + 1
		inicfg.save(ini, directIni)
    end
	imgui.Spacing()    
    imgui.Spacing()   
	imgui.Spacing()   
	imgui.Separator()
	imgui.Spacing()  
    imgui.Spacing()  
    imgui.Spacing()   
	
	imgui.ToggleButtonTextGear("Флудер", FlooderStatus, function()
		ini.AutoCapt.flooder_status = not ini.AutoCapt.flooder_status
		inicfg.save(ini, directIni)
	end, true, function() end)
	imgui.SameLine()
	imgui.TextQuestion(fa["CIRCLE_QUESTION"], "Использовать для флуда на забив в гетто / мафии.\n/flood [sec] [text]")
	imgui.Text('Флудер для каптов в мафии и бандах') 
	imgui.PushItemWidth(390)
	imgui.InputTextWithHint("##Команда флуда", "Введите команду для флуда", FlooderCommand, sizeof(FlooderCommand))
    if imgui.Button("Сохранить команду##aa", imgui.ImVec2(390,20)) then	
        sampUnregisterChatCommand(ini.AutoCapt.flooder_com)
        ini.AutoCapt.flooder_com = str(FlooderCommand)
        ini.AutoCapt.flooder_com = ini.AutoCapt.flooder_com:gsub("/","")
        inicfg.save(ini, directIni)
        flooder_cmd_register()
    end
	imgui.PopItemWidth()
end

--------------------------------------------------------------------------------
-----------------------------------onServerMessage------------------------------
--------------------------------------------------------------------------------
--#onServerMessage
function sampev.onServerMessage(color, message)
	if message:find("PALENATION:%{......%} (.+) (%w+_%w+)%[(%d+)%]: wl pale") or message:find("PALERIDERS:%{......%} (.+) (%w+_%w+)%[(%d+)%]: wl pale") or message:find("(%w+_%w+)%[(%d+)%]: wl pale") and color == 33357768 then
		if ini.LeaderManagement.warehouse_request then
		lua_thread.create(function()
			random_number = math.random(300, 2100)
			wait(random_number)
			warelock = true
			wait(100)
		end)
	   end
	end
	if message:find("Команда доступна с (%d+) ранга") and warelock then
		warelock = false
	end
	if message:find("доступ к складу с материалами!") and warelock then
		warelock = false
	end
	if message:find("Положил в сейф (%d+) пт. M4") and render_M4 then
		patrons = string.match(message, "Положил в сейф (%d+) пт. M4")
		if patrons > 99 then
			render_M4 = false
		end
	end
	if message:find("Положил в сейф (%d+) пт. AK47") and render_AK47 then
		patrons = string.match(message, "Положил в сейф (%d+) пт. AK47")
		if patrons > 99 then
			render_AK47 = false
		end
	end
	if message:find("Положил в сейф (%d+) пт. Deagle") and render_Deagle then
		patrons = string.match(message, "Положил в сейф (%d+) пт. Deagle")
		if patrons > 99 then
			render_Deagle = false
		end
	end
	if message:find("ВНИМАНИЕ! В сейфе осталось меньше 3 тыс. патронов на AK47") then
		sampAddChatMessage(" {c91317}ВНИМАНИЕ! {FFFFFF}В сейфе осталось меньше 3 тыс. патронов на AK47", -1)
		check_AK47 = false
		render_AK47 = true		
	end
	if message:find("ВНИМАНИЕ! В сейфе осталось меньше 3 тыс. патронов на Desert Eagle, M4, AK47") then
		helpeee = true
		sampAddChatMessage(" {c91317}ВНИМАНИЕ! {FFFFFF}В сейфе осталось меньше 3 тыс. патронов на Desert Eagle, M4, AK47", -1)
		check_AK47 = false
		check_M4 = false
		check_Deagle = false
		render_Deagle = true
		render_AK47 = true
		render_M4 = true		
	end

	if message:find("ВНИМАНИЕ! В сейфе осталось меньше 3 тыс. патронов на Desert Eagle, M4") and not helpeee then
		sampAddChatMessage(" {c91317}ВНИМАНИЕ! {FFFFFF}В сейфе осталось меньше 3 тыс. патронов на Desert Eagle, M4", -1)
		check_M4 = false
		check_Deagle = false
		render_Deagle = true
		render_M4 = true		
	end

	if message:find("ВНИМАНИЕ! В сейфе осталось меньше 3 тыс. патронов на Desert Eagle, AK47") then
		sampAddChatMessage(" {c91317}ВНИМАНИЕ! {FFFFFF}В сейфе осталось меньше 3 тыс. патронов на Desert Eagle, AK47", -1)
		check_AK47 = false
		check_Deagle = false
		render_Deagle = true
		render_AK47 = true	
	end

	if message:find("ВНИМАНИЕ! В сейфе осталось меньше 3 тыс. патронов на M4, AK47") then
		helpgggg = true
		sampAddChatMessage(" {c91317}ВНИМАНИЕ! {FFFFFF}В сейфе осталось меньше 3 тыс. патронов на M4, AK47", -1)
		check_AK47 = false
		check_M4 = false
		render_AK47 = true
		render_M4 = true		
	end

	if message:find("ВНИМАНИЕ! В сейфе осталось меньше 3 тыс. патронов на M4") and not helpgggg then
		sampAddChatMessage(" {c91317}ВНИМАНИЕ! {FFFFFF}В сейфе осталось меньше 3 тыс. патронов на M4", -1)
		check_M4 = false
		render_M4 = true
	end

	if message:find("ВНИМАНИЕ! В сейфе осталось меньше 1 тыс. патронов на Desert Eagle") then
	    sampAddChatMessage(" {c91317}ВНИМАНИЕ! {FFFFFF}В сейфе осталось меньше 1 тыс. патронов на Desert Eagle", -1)
		check_Deagle = false
		render_Deagle = true
	end

	if string.find(message, "Вам необходимо состоять в семье") then
		thisScript():unload()
	end

	if message:find('%[Внимание%]: (.+) спровоцировала войну с (.+) за территорию') or message:find('Ваша фракция уже в состоянии войны') then
		if AutoCapterstart then
	     	AutoCapterstart = false
		end
	end

	if string.find(message, "Игрок не состоит в вашей организации") and not clear then
        if givrank then
           help_to_nofrac = true
        end
        if uval then
           help_to_uval2 = true
        end
    end







	if message:find('Открыл %{......%}доступ к складу') then
		if ini.autogetguns.status and not get_guns_status then
			get_guns_status = true
		end
	end

	if string.find(message, "Вы должны находиться в привязанном к семье доме") and color == -1347440726 then
		fclick = false
		fsafes = false
	end

    if (string.find(message, "Семейный склад закрыт")) or (string.find(message, "Вы не можете взять со склада более")) or (string.find(message, "Недостаточно патронов")) then
		fclick = false
		fsafes = false
		fsak = false
		sfm4 = false
		sfde = false
		fsri = false
		fssh = false
		return true
	end

    if (message:find("Пин%-код не совпал") or message:find('Не флуди!')) and color == -858993409 and fsafes then
		lua_thread.create(function()
			wait(500)
			inputFsafeCode = true
			if not helpfordnk then
			    sampSendChat("/fsafe")
			else 
				sampSendChat("/safe")
			end
		end)
    end

    if message:find("Вы далеко от сейфа") and color == -86 then
		fsafes = false
		inputFsafeCode = false
		fclick = false
	end

    if message:find("SMS: /warelock. Получатель: (%w+_%w+)%[(%d+)%]") or message:find("SMS: /clear. Получатель: (%w+_%w+)%[(%d+)%]") or message:find("SMS: /giverank (%d+) (%d+). Получатель: (%w+_%w+)%[(%d+)%]") or message:find("SMS: /uninvite (%d+) (.+). Получатель: (%w+_%w+)%[(%d+)%]") or message:find("SMS: /invite (%d+). Получатель: (%w+_%w+)%[(%d+)%]") then 
        if hidesms then
            msg("Запрос отправлен!")
            return false
        end
    end

    if message:find("(%w+_%w+) достает мобильник") and hidesms then 
        return false
    end

    if message:find("Сообщение доставлено")  and hidesms then 
        hidesms = false
        return false
    end
	
    if message:find("Склад закрыт") then
        if gg_evolve.getgun  then
            gg_evolve.getgun = false
        end
    end

    if message:find("Вы сыты") then
        gg_evolve.getgun = false
        gg_evolve.getgun_st = 0
    end

    if check_boostinfo == 2 and message:find("Действует до") then
		return false
	end


	if (message == " (( Здоровье не пополняется чаще, чем раз в минуту ))" or message == ' (( Здоровье можно пополнить не чаще, чем раз в минуту ))') then not_drugs_timer = true end

	if string.find(message, my_name) then
		if string.find(message, "употребил%(а%) наркотик") then
			if not not_drugs_timer then drugs_timer = os.time() else not_drugs_timer = false end
		end
		if string.find(message, "оружие из материалов") then
			check_get_mats = true
		end
	end

	if message:find('выбросил') and (message:find('аркотики') or message:find('атериалы')) and string.find(message, my_name) then
		check_get_mats = true
	end

	if message:find('Вы взяли несколько комплектов') then
		check_get_mats = true
	end

	if message:find('Вы ограбили дом! Наворованный металл можно сдать около порта.') then
		check_get_mats = true
	end

	if message:find('У вас (%d+)/500 материалов с собой') then
		ini.drugtimer.mats = message:match('У вас (%d+)/500 материалов с собой')
		inicfg.save(ini, directIni)
	end

	if string.find(message, " %(%( Остаток: (%d+) грамм растительных наркотиков %)%)") then
		ini.drugtimer.drugs = string.match(message, " %(%( Остаток: (%d+) грамм растительных наркотиков %)%)")
		inicfg.save(ini, directIni)
	end

    if string.find(message, " %(%( Здоровье пополнено до: (%d+) %)%)") then
		if not not_drugs_timer then drugs_timer = os.time() else not_drugs_timer = false end
		inicfg.save(ini, directIni)
	end

	if string.find(message, '%(%( Остаток: (%d+) материалов %)%)') then
		ini.drugtimer.mats = message:match('%(%( Остаток: (%d+) материалов %)%)')
		inicfg.save(ini, directIni)
	end

	if message:find('Вы купили %d+ грамм наркотиков за %d+ вирт %(У вас есть (%d+) грамм%)') then
		ini.drugtimer.drugs = message:match('Вы купили %d+ грамм наркотиков за %d+ вирт %(У вас есть (%d+) грамм%)')
		inicfg.save(ini, directIni)
	end

	if message:find('Вы купили (%d+) грамм наркотиков за %d+ вирт у .+') then
		local s1 = message:match('Вы купили (%d+) грамм наркотиков за %d+ вирт у .+')
		ini.drugtimer.drugs = tonumber(s1) + ini.drugtimer.drugs
		inicfg.save(ini, directIni)
	end

    if os.time() - efcs.start < 5 then
        if message:find(getLocalPlayerNickname()) and message:find("припарковал транспорт") then
            efcs.start = 9999
        end
    end

	if string.find(message, "Не флуди!") and biz_check then
		return false
	end

end

--------------------------------------------------------------------------------
------------------------------------onSetInterior-------------------------------
--------------------------------------------------------------------------------

sampev.onSetInterior = function(id)
    if id == 0 then
        efcs_autoexit = false
    end
end


--------------------------------------------------------------------------------
------------------------------------#onShowDialog--------------------------------
--------------------------------------------------------------------------------
function sampev.onShowDialog(dialogId, style, title, button1, button2, text)
	if dialogId == 15004 and title:find("В сети: (%d+) | %{......%}Состав семьи") and ini.squad.status and not text:find("%{......%}Следующая страница") and netfmem then
		if help_squad then help_squad = false else squad_members = {} squad_onlines = 0 end
        for line in text:gmatch("[^\r\n]+") do
            if line:find("(%w+_%w+)%[(%d+)%].+") then
			    nick_s, id_s, rank_squad_members = line:match("(%w+_%w+)%[(%d+)%].+%[(%d+)%]")
				if  tonumber(rank_squad_members) >= tonumber(ini.squad.rank + 1) then
					squad_onlines = squad_onlines + 1
					color_squad[squad_onlines] = sampGetPlayerColor(id_s)
				--	color_squad[squad_onlines] = ('%06X'):format(bit.band(sampGetPlayerColor(id_s), 0xFFFFFF))
					--color_squad[squad_onlines] = hextoargb(color_squad[squad_onlines])
					if color_squad[squad_onlines] == 16777215 then color_squad[squad_onlines] = 0xFFFFFFFF end
					if color_squad[squad_onlines] == 14526209 then color_squad[squad_onlines] = 0xFFDDA701 end
					if color_squad[squad_onlines] == 5346893 then color_squad[squad_onlines] = 0xFF51964D end
					if color_squad[squad_onlines] == 3355443 then color_squad[squad_onlines] = 0xFF333333 end
					if color_squad[squad_onlines] == 2920855 then color_squad[squad_onlines] = 0xFF2C9197 end
					squad_members[squad_onlines] = string.format("%s[%s]", line:match("(%w+_%w+)%[(%d+)%].+%[(%d+)%]"))
				end
            end
        end
		netfmem = false
		sampSendDialogResponse(dialogId, 0, 0, "")
		return false 
	end
	if dialogId == 15004 and title:find("В сети: (%d+) | %{......%}Состав семьи") and ini.squad.status and text:find("%{......%}Следующая страница") then
		squad_members = {}
		squad_onlines = 0
		help_squad = true
	    squad_members = {}
        for line in text:gmatch("[^\r\n]+") do
            if line:find("(%w+_%w+)%[(%d+)%].+") then
			    nick_s, id_s, rank_squad_members = line:match("(%w+_%w+)%[(%d+)%].+%[(%d+)%]")
				if tonumber(rank_squad_members) >= tonumber(ini.squad.rank + 1) then
                    squad_onlines = squad_onlines + 1
					color_squad[squad_onlines] = sampGetPlayerColor(id_s)
					if color_squad[squad_onlines] == 16777215 then color_squad[squad_onlines] = 0xFFFFFFFF end
					if color_squad[squad_onlines] == 14526209 then color_squad[squad_onlines] = 0xFFDDA701 end
					if color_squad[squad_onlines] == 5346893 then color_squad[squad_onlines] = 0xFF51964D end
					if color_squad[squad_onlines] == 3355443 then color_squad[squad_onlines] = 0xFF333333 end
					if color_squad[squad_onlines] == 2920855 then color_squad[squad_onlines] = 0xFF2C9197 end
					squad_members[squad_onlines] = string.format("%s[%s]", line:match("(%w+_%w+)%[(%d+)%].+%[(%d+)%]"))
				end
            end
        end
		sampSendDialogResponse(dialogId, 1, 16, "")
		return false 
    end
	if text:find("1. Palomino Creek 1	%[ %{......%}Warlocks MC%{......%} %]") then
		
		cb1 = warlocks
		HelpAC()
	end
	if text:find("2. Palomino Creek 2	%[ %{......%}Warlocks MC%{......%} %]") then
		cb2 = warlocks
		HelpAC()
	end
	if text:find("3. Palomino Creek 3	%[ %{......%}Warlocks MC%{......%} %]") then
		cb3 = warlocks
		HelpAC()
	end
	if text:find("4. Palomino Creek 4	%[ %{......%}Warlocks MC%{......%} %]") then
		cb4 = warlocks
		HelpAC()
	end
	if text:find("5. Dillimore 1	%[ %{......%}Warlocks MC%{......%} %]") then
		cb5 = warlocks
		HelpAC()
	end
	if text:find("6. Dillimore 2	%[ %{......%}Warlocks MC%{......%} %]") then
		cb6 = warlocks
		HelpAC()
	end
	if text:find("7. Dillimore 3	%[ %{......%}Warlocks MC%{......%} %]") then
		cb7 = warlocks
		HelpAC()
	end
	if text:find("8. Blueberry 1	%[ %{......%}Warlocks MC%{......%} %]") then
		cb8 = warlocks
		HelpAC()
	end
	if text:find("9. Blueberry 2	%[ %{......%}Warlocks MC%{......%} %]") then
		cb9 = warlocks
		HelpAC()
	end
	if text:find("10. Blueberry 3	%[ %{......%}Warlocks MC%{......%} %]") then
		cb10 = warlocks
		HelpAC()
	end
	if text:find("11. Montgomery 1	%[ %{......%}Warlocks MC%{......%} %]") then
		cb11 = warlocks
		HelpAC()
	end
	if text:find("12. Montgomery 2	%[ %{......%}Warlocks MC%{......%} %]") then
		cb12 = warlocks
		HelpAC()
	end
	if text:find("13. Montgomery 3	%[ %{......%}Warlocks MC%{......%} %]") then
		cb13 = warlocks
		HelpAC()
	end
	if text:find("14. Montgomery 4	%[ %{......%}Warlocks MC%{......%} %]") then
		cb14 = warlocks
		HelpAC()
	end
	if text:find("15. Fort Carson 1	%[ %{......%}Warlocks MC%{......%} %]") then
		cb15 = warlocks
		HelpAC()
	end
	if text:find("16. Fort Carson 2	%[ %{......%}Warlocks MC%{......%} %]") then
		cb16 = warlocks
		HelpAC()
	end
	if text:find("17. Fort Carson 3	%[ %{......%}Warlocks MC%{......%} %]") then
		cb17 = warlocks
		HelpAC()
	end
	if text:find("18. Fort Carson 4	%[ %{......%}Warlocks MC%{......%} %]") then
		cb18 = warlocks
		HelpAC()
	end
	if text:find("19. Fort Carson 5	%[ %{......%}Warlocks MC%{......%} %]") then
		cb19 = warlocks
		HelpAC()
	end
	if text:find("20. Fort Carson 6	%[ %{......%}Warlocks MC%{......%} %]") then
		cb20 = warlocks
		HelpAC()
	end
	if text:find("21. El Quebrados 1	%[ %{......%}Warlocks MC%{......%} %]") then
		cb21 = warlocks
		HelpAC()
	end
	if text:find("22. El Quebrados 2	%[ %{......%}Warlocks MC%{......%} %]") then
		cb22 = warlocks
		HelpAC()
	end
	if text:find("23. El Quebrados 3	%[ %{......%}Warlocks MC%{......%} %]") then
		cb23 = warlocks
		HelpAC()
	end
	if text:find("24. El Quebrados 4	%[ %{......%}Warlocks MC%{......%} %]") then
		cb24 = warlocks
		HelpAC()
	end
	if text:find("25. Las Barrancas 1	%[ %{......%}Warlocks MC%{......%} %]") then
		cb25 = warlocks
		HelpAC()
	end
	if text:find("26. Las Barrancas 2	%[ %{......%}Warlocks MC%{......%} %]") then
		cb26 = warlocks
		HelpAC()
	end
	if text:find("27. Angel Pine 1	%[ %{......%}Warlocks MC%{......%} %]") then
		cb27 = warlocks
		HelpAC()
	end
	if text:find("28. Angel Pine 2	%[ %{......%}Warlocks MC%{......%} %]") then
		cb28 = warlocks
		HelpAC()
	end

	if text:find("1. Palomino Creek 1	%[ %{......%}Mongols MC%{......%} %]") then
		cb1 = mongols
		HelpAC()
	end
	if text:find("2. Palomino Creek 2	%[ %{......%}Mongols MC%{......%} %]") then
		cb2 = mongols
		HelpAC()
	end
	if text:find("3. Palomino Creek 3	%[ %{......%}Mongols MC%{......%} %]") then
		cb3 = mongols
		HelpAC()
	end
	if text:find("4. Palomino Creek 4	%[ %{......%}Mongols MC%{......%} %]") then
		cb4 = mongols
		HelpAC()
	end
	if text:find("5. Dillimore 1	%[ %{......%}Mongols MC%{......%} %]") then
		cb5 = mongols
		HelpAC()
	end
	if text:find("6. Dillimore 2	%[ %{......%}Mongols MC%{......%} %]") then
		cb6 = mongols
		HelpAC()
	end
	if text:find("7. Dillimore 3	%[ %{......%}Mongols MC%{......%} %]") then
		cb7 = mongols
		HelpAC()
	end
	if text:find("8. Blueberry 1	%[ %{......%}Mongols MC%{......%} %]") then
		cb8 = mongols
		HelpAC()
	end
	if text:find("9. Blueberry 2	%[ %{......%}Mongols MC%{......%} %]") then
		cb9 = mongols
		HelpAC()
	end
	if text:find("10. Blueberry 3	%[ %{......%}Mongols MC%{......%} %]") then
		cb10 = mongols
		HelpAC()
	end
	if text:find("11. Montgomery 1	%[ %{......%}Mongols MC%{......%} %]") then
		cb11 = mongols
		HelpAC()
	end
	if text:find("12. Montgomery 2	%[ %{......%}Mongols MC%{......%} %]") then
		cb12 = mongols
		HelpAC()
	end
	if text:find("13. Montgomery 3	%[ %{......%}Mongols MC%{......%} %]") then
		cb13 = mongols
		HelpAC()
	end
	if text:find("14. Montgomery 4	%[ %{......%}Mongols MC%{......%} %]") then
		cb14 = mongols
		HelpAC()
	end
	if text:find("15. Fort Carson 1	%[ %{......%}Mongols MC%{......%} %]") then
		cb15 = mongols
		HelpAC()
	end
	if text:find("16. Fort Carson 2	%[ %{......%}Mongols MC%{......%} %]") then
		cb16 = mongols
		HelpAC()
	end
	if text:find("17. Fort Carson 3	%[ %{......%}Mongols MC%{......%} %]") then
		cb17 = mongols
		HelpAC()
	end
	if text:find("18. Fort Carson 4	%[ %{......%}Mongols MC%{......%} %]") then
		cb18 = mongols
		HelpAC()
	end
	if text:find("19. Fort Carson 5	%[ %{......%}Mongols MC%{......%} %]") then
		cb19 = mongols
		HelpAC()
	end
	if text:find("20. Fort Carson 6	%[ %{......%}Mongols MC%{......%} %]") then
		cb20 = mongols
		HelpAC()
	end
	if text:find("21. El Quebrados 1	%[ %{......%}Mongols MC%{......%} %]") then
		cb21 = mongols
		HelpAC()
	end
	if text:find("22. El Quebrados 2	%[ %{......%}Mongols MC%{......%} %]") then
		cb22 = mongols
		HelpAC()
	end
	if text:find("23. El Quebrados 3	%[ %{......%}Mongols MC%{......%} %]") then
		cb23 = mongols
		HelpAC()
	end
	if text:find("24. El Quebrados 4	%[ %{......%}Mongols MC%{......%} %]") then
		cb24 = mongols
		HelpAC()
	end
	if text:find("25. Las Barrancas 1	%[ %{......%}Mongols MC%{......%} %]") then
		cb25 = mongols
		HelpAC()
	end
	if text:find("26. Las Barrancas 2	%[ %{......%}Mongols MC%{......%} %]") then
		cb26 = mongols
		HelpAC()
	end
	if text:find("27. Angel Pine 1	%[ %{......%}Mongols MC%{......%} %]") then
		cb27 = mongols
		HelpAC()
	end
	if text:find("28. Angel Pine 2	%[ %{......%}Mongols MC%{......%} %]") then
		cb28 = mongols
		HelpAC()
	end

	if text:find("1. Palomino Creek 1	%[ %{......%}Pagans MC%{......%} %]") then
		cb1 = pagans
		HelpAC()
	end
	if text:find("2. Palomino Creek 2	%[ %{......%}Pagans MC%{......%} %]") then
		cb2 = pagans
		HelpAC()
	end
	if text:find("3. Palomino Creek 3	%[ %{......%}Pagans MC%{......%} %]") then
		cb3 = pagans
		HelpAC()
	end
	if text:find("4. Palomino Creek 4	%[ %{......%}Pagans MC%{......%} %]") then
		cb4 = pagans
		HelpAC()
	end
	if text:find("5. Dillimore 1	%[ %{......%}Pagans MC%{......%} %]") then
		cb5 = pagans
		HelpAC()
	end
	if text:find("6. Dillimore 2	%[ %{......%}Pagans MC%{......%} %]") then
		cb6 = pagans
		HelpAC()
	end
	if text:find("7. Dillimore 3	%[ %{......%}Pagans MC%{......%} %]") then
		cb7 = pagans
		HelpAC()
	end
	if text:find("8. Blueberry 1	%[ %{......%}Pagans MC%{......%} %]") then
		cb8 = pagans
		HelpAC()
	end
	if text:find("9. Blueberry 2	%[ %{......%}Pagans MC%{......%} %]") then
		cb9 = pagans
		HelpAC()
	end
	if text:find("10. Blueberry 3	%[ %{......%}Pagans MC%{......%} %]") then
		cb10 = pagans
		HelpAC()
	end
	if text:find("11. Montgomery 1	%[ %{......%}Pagans MC%{......%} %]") then
		cb11 = pagans
		HelpAC()
	end
	if text:find("12. Montgomery 2	%[ %{......%}Pagans MC%{......%} %]") then
		cb12 = pagans
		HelpAC()
	end
	if text:find("13. Montgomery 3	%[ %{......%}Pagans MC%{......%} %]") then
		cb13 = pagans
		HelpAC()
	end
	if text:find("14. Montgomery 4	%[ %{......%}Pagans MC%{......%} %]") then
		cb14 = pagans
		HelpAC()
	end
	if text:find("15. Fort Carson 1	%[ %{......%}Pagans MC%{......%} %]") then
		cb15 = pagans
		HelpAC()
	end
	if text:find("16. Fort Carson 2	%[ %{......%}Pagans MC%{......%} %]") then
		cb16 = pagans
		HelpAC()
	end
	if text:find("17. Fort Carson 3	%[ %{......%}Pagans MC%{......%} %]") then
		cb17 = pagans
		HelpAC()
	end
	if text:find("18. Fort Carson 4	%[ %{......%}Pagans MC%{......%} %]") then
		cb18 = pagans
		HelpAC()
	end
	if text:find("19. Fort Carson 5	%[ %{......%}Pagans MC%{......%} %]") then
		cb19 = pagans
		HelpAC()
	end
	if text:find("20. Fort Carson 6	%[ %{......%}Pagans MC%{......%} %]") then
		cb20 = pagans
		HelpAC()
	end
	if text:find("21. El Quebrados 1	%[ %{......%}Pagans MC%{......%} %]") then
		cb21 = pagans
		HelpAC()
	end
	if text:find("22. El Quebrados 2	%[ %{......%}Pagans MC%{......%} %]") then
		cb22 = pagans
		HelpAC()
	end
	if text:find("23. El Quebrados 3	%[ %{......%}Pagans MC%{......%} %]") then
		cb23 = pagans
		HelpAC()
	end
	if text:find("24. El Quebrados 4	%[ %{......%}Pagans MC%{......%} %]") then
		cb24 = pagans
		HelpAC()
	end
	if text:find("25. Las Barrancas 1	%[ %{......%}Pagans MC%{......%} %]") then
		cb25 = pagans
		HelpAC()
	end
	if text:find("26. Las Barrancas 2	%[ %{......%}Pagans MC%{......%} %]") then
		cb26 = pagans
		HelpAC()
	end
	if text:find("27. Angel Pine 1	%[ %{......%}Pagans MC%{......%} %]") then
		cb27 = pagans
		HelpAC()
	end
	if text:find("28. Angel Pine 2	%[ %{......%}Pagans MC%{......%} %]") then
		cb28 = pagans
		HelpAC()
	end

	if title:find("Панель ") and fam_check then--  | %{......%}Семья
        if not text:find("Наименование семьи %- %{......%}"..squadss) and not text:find("Наименование семьи %- %{......%}PALENATION")then
            thisScript():unload()
        end
        fam_check = false
		biz_check = true
		lua_thread.create(function() wait(25) sampCloseCurrentDialogWithButton(0) end)
    end

	if title:find("Объявить войну за территорию") and biz_check then--  | %{......%}Семья
        biz_check = false
		lua_thread.create(function() wait(25) sampCloseCurrentDialogWithButton(0) end)
    end

    if dialogId == 10075 and title:find("Дом занят") then
		if text:find("Семья: %{......%}"..squadss) or text:find("Семья: %{......%}PALENATION") then
        sampSendDialogResponse(dialogId, 1, 0, "")
        return false
		end
	end

    if title:find("Выход") and efcs_autoexit then
        sampSendDialogResponse(dialogId, 1, 0, "Выйти на улицу")
        return false
    end
	if title:find('Информация') or title:find('Карманы') then
		local nark, mats = false, false
		local arr = split(text, "\n")
		for i = 1, #arr do
			if arr[i]:find('Наркотики\t(%d+)') then
				ini.drugtimer.drugs = arr[i]:match('Наркотики\t(%d+)')
				nark = true
			end
			if arr[i]:find('Материалы\t(%d+)') then
				ini.drugtimer.mats = arr[i]:match('Материалы\t(%d+)')
				mats = true
			end
		end
		if not nark then ini.drugtimer.drugs = 0 end
		if not mats then ini.drugtimer.mats = 0 end
		inicfg.save(ini, directIni)

		if check_inventory == 2 or (check_inventory_time ~= nil and os.time() - check_inventory_time < 5) then
			check_inventory = 0
			check_inventory_time = os.time()
			sampSendDialogResponse(dialogId, 0, 0, "")
			return false
		end
	end


    if os.time() - efcs.start < 5 or efcs.start == 9999 then
        if title:find("Дом") then
            if efcs.start == 9999 then
                sampSendDialogResponse(dialogId,0,0,"")
                efcs.start = 0
            else
                if ini.fastcarfx.status_exit then
                    efcs_autoexit = true
				else
					efcs_autoexit = false
                end
                sampSendDialogResponse(dialogId,1,7,"")
            end
            return false
        end


        if title:find("Перечень") then
            if efcs.start == 9999 then
                sampSendDialogResponse(dialogId,0,0,"")
            else
                local arr = split(text, "\n")
                if text:find("На парковке") then
                    for i = 1, #arr do
                        if arr[i]:find("На парковке") then
                            sampSendDialogResponse(dialogId,1,i-2,"")
                            break
                        end
                    end
                else
                    for i = 1, #arr do
                        if arr[i]:find("Используется") then
                            if efcs.list_remove[arr[i]] == nil then
                                efcs.list_remove[arr[i]] = true
                                sampSendDialogResponse(dialogId,1,i-2,"")
                                return true
                            end
                        end
                    end
                   msg("Все машины заняты", -1)
                    efcs.start = 9999
                    sampSendDialogResponse(dialogId,0,0,"")
                end
            end
			sampCloseCurrentDialogWithButton(0)
			return false
        end
        if title:find("Подтверждение") and title:find("Парковка") then
            efcs.start = 9999
            sampSendDialogResponse(dialogId,1,0,"")
            return false
        end
        if title:find("Подтверждение") and title:find("Удаление семейного") then
            sampSendDialogResponse(dialogId,1,0,"")
            return false
        end
    end

    if gg_evolve.getgun then
        if title:find("Склад") and not title:find("Склад наркотиков") then
            if gg_evolve.getgun_st == 0 then
                gg_evolve.getgun_st = 1
                sampSendDialogResponse(dialogId,1,0,"")
                return true
            end
            if gg_evolve.getgun_st == 2 then
                gg_evolve.getgun_st = 0
                gg_evolve.getgun = false
                sampSendDialogResponse(dialogId,0,0,"")
                return true
            end
        end

        if title:find("Взять оружие со склада") then
            for i = 1, 8 do
                if gg_evolve.getgun_list[i][1] > 0 then
                    sampSendDialogResponse(dialogId,1,gg_evolve.getgun_list[i][2],"")
                    gg_evolve.getgun_list[i][1] = gg_evolve.getgun_list[i][1] - 1
                    return true
                end
            end
            gg_evolve.getgun_st = 2
            sampCloseCurrentDialogWithButton(0)
            return true
        end
    end


    if title:find("%{......%}Сейф | %{......%}Взять") and fsafes then
		sampSendDialogResponse(dialogId, 1, _, fsTakeAmount)
		fsTakeAmount = false
		nextFsGun = true
		return false
	end

	if dialogId == 6053 and fslastd then
		fslastd = false
		fsafes = false
		lua_thread.create(closedialog)
    end
	
	if fgg then
        if title:find("Взять оружие со склада .+") and (ggde2 > 0) then
            sampSendDialogResponse(dialogId, 1, 0, -1)
			ggde2 = ggde2 - 1
			return false
        end

		if title:find("Взять оружие со склада .+") and (ggm42 > 0) then
            sampSendDialogResponse(dialogId, 1, 3, -1)
			ggm42 = ggm42 - 1
			return false
        end

		if title:find("Взять оружие со склада .+") and (ggri2 > 0) then
            sampSendDialogResponse(dialogId, 1, 2, -1)
			ggri2 = ggri2 - 1
            return false
        end

		if title:find("Взять оружие со склада .+") and (ggak2 > 0) then
            sampSendDialogResponse(dialogId, 1, 4, -1)
			ggak2 = ggak2 - 1
            return false
        end

		if title:find("Взять оружие со склада .+") and (ggsh2 > 0) then
            sampSendDialogResponse(dialogId, 1, 1, -1)
			ggsh2 = ggsh2 - 1
            return false
        end

		if title:find("Взять оружие со склада .+") and arm and mainIni.getgun.arm then
            sampSendDialogResponse(dialogId, 1, 7, -1)
			arm = false
            return false
		else
			arm = false
        end

		if title:find("Взять оружие со склада .+") and not arm and (ggak2 == 0) and (ggm42 == 0) and (ggde2 == 0) and (ggri2 == 0) and (ggsh2 == 0) then
			fgg = false
			lua_thread.create(function()
				wait(200)
				sampCloseCurrentDialogWithButton(0)
			end)
		end
    end
end

function playAnim(name, nameLib, speed, loop, lockX, lockY, lockF)
	if not isCharInAnyCar(PLAYER_PED) then
	   animStatus = true
	   taskPlayAnim(PLAYER_PED, name, nameLib, speed, loop, lockX, lockY, lockF, -1)
	end
end

--------------------------------------------------------------------------------
-----------------------------------onShowTextDraw-------------------------------
--------------------------------------------------------------------------------

sampev.onShowTextDraw = function(id, data)
    if data.text:find("~b~Kills:~w~ %d+~n~~r~Deaths:~w~ %d+") and math.floor(data.position.x) == 159 and math.floor(data.position.y) == 363 then
		var_0_9 = id
	end
    if data.text:find("FAMILY") then
		fhouseExist = true
	end
	
    if data.text:find("1____2____3") then
        if fsafes and fhouseExist then
            -- 1 + 79, 2 + 80, 0 + 89, ввод + 90
            safeNumbers["1"] = id + 11
            safeNumbers["2"] = id + 12
            safeNumbers["3"] = id + 13
            safeNumbers["4"] = id + 14
            safeNumbers["5"] = id + 15
            safeNumbers["6"] = id + 16
            safeNumbers["7"] = id + 17
            safeNumbers["8"] = id + 18
            safeNumbers["9"] = id + 19
            safeNumbers["0"] = id + 21
            safeNumbers["Enter"] = id + 22
			inputFsafeCode = true
			fhouseExist = false
        end
    end

	if data.modelId == 348 and fsafes then  -- DE, SD, M4, AK, SHOT, MP5, RIFLE
		safeGunsTD["1"] = id
		safeGunsTD["2"] = id + 3
		safeGunsTD["3"] = id + 9
		safeGunsTD["4"] = id + 6
		safeGunsTD["5"] = id + 12
		safeGunsTD["6"] = id + 15
		safeGunsTD["7"] = id + 18
		safeGunsTD["Take"] = id + 40
	end
	 
	if data.text:find("TAKE") and fsafes then --брать ган по иду моделей
		lua_thread.create(function()
			fhouseExist = false
			if helpfordnk then
				if ini.fsafe.dnk_deagle > 0 then
					fsGunStatus["1"] = true
				else
				end
				if ini.fsafe.dnk_ak > 0 then
					fsGunStatus["3"] = true
				end
				if ini.fsafe.dnk_m4 > 0 then
					fsGunStatus["4"] = true
				end		
				if ini.fsafe.dnk_shotgun > 0 then
					fsGunStatus["5"] = true
				end
				if ini.fsafe.dnk_rifle > 0 then
					fsGunStatus["7"] = true
				end
			else
				if ini.fsafe.deagle > 0 then
					fsGunStatus["1"] = true
				else
				end
				if ini.fsafe.ak > 0 then
					fsGunStatus["3"] = true
				end
				if ini.fsafe.m4 > 0 then
					fsGunStatus["4"] = true
				end		
				if ini.fsafe.shotgun > 0 then
					fsGunStatus["5"] = true
				end
				if ini.fsafe.rifle > 0 then
					fsGunStatus["7"] = true
				end
		end
			fsClickExist = true
			if fclick == false and fsafes then
				sampSendClickTextdraw(65535)
				if helpfordnk then
					helpfordnk = false
				end
				fsafes = false
			end
		end)
        return false
	end
end

--------------------------------------------------------------------------------
-------------------------------------ALLFUNCTIONS-------------------------------
--------------------------------------------------------------------------------
local list_size = { 
	[16] = 24,
	[15] = 23,
	[14] = 22,
	[13] = 21,
	[12] = 20,
	[11] = 18,
	[10] = 16,
	[9] = 14,
	[8] = 12,
	[7] = 10,
	[6] = 8,
	[5] = 6,
	[4] = 4,
	[3] = 2,
	[2] = 0,
	[1] = 0,
	[0] = 0,
}
function SquadFunctwo()
	while true do wait(0)
	if squad_members ~= 0 and ini.squad.status then
		--	if not isPauseMenuActive() and not isGamePaused() then
			for i = 1, #squad_members do
				for k, v in pairs(list_size) do
					if ini.squad.size == k then
						otstyp = v
					end
			    end
				if ini.squad.int == 3 then
					renderFontDrawText(squad_font, squadcombo[ini.squad.name_squad + 1], ini.squad.x_pos, ini.squad.y_pos, 0xFFFFFFFF)
				else
				    renderFontDrawText(squad_font, squadcombo[ini.squad.name_squad + 1], ini.squad.x_pos, ini.squad.y_pos, 0xFFFFFFFF)
				end
				squad_members[i] = squad_members[i]:gsub("_", " ")
				if ini.squad.int == 0 then
					renderFontDrawText(squad_font, squad_members[i], ini.squad.x_pos, ini.squad.y_pos + i * otstyp, 0xFFFFFFFF)
				elseif ini.squad.int == 1 then
					renderFontDrawText(squad_font, squad_members[i], ini.squad.x_pos, ini.squad.y_pos + i * otstyp, argb2abgr(4286070325))
					elseif ini.squad.int == 2 then
						renderFontDrawText(squad_font, squad_members[i], ini.squad.x_pos, ini.squad.y_pos + i * otstyp, color_squad[i])
					elseif ini.squad.int == 3 then
						renderFontDrawText(squad_font, squad_members[i], ini.squad.x_pos, ini.squad.y_pos + i * otstyp, argb2abgr(ini.squad.color))
				end
				
					if ini.squad.online_status and squad_onlines > 0 then
						if ini.squad.int == 3 then
						renderFontDrawText(squad_font, (ini.squad.language == 0 and "Online: " or "Онлайн: ")..squad_onlines, ini.squad.x_pos, ini.squad.y_pos + squad_onlines * otstyp + otstyp, 0xFFFFFFFF)
						else
							renderFontDrawText(squad_font, (ini.squad.language == 0 and "Online: " or "Онлайн: ")..squad_onlines, ini.squad.x_pos, ini.squad.y_pos + squad_onlines * otstyp + otstyp, 0xFFFFFFFF)
						end
					end
			end
		end
	end
end
function SquadFunc()
while true do wait(0)
	if pos_squad then
        sampSetCursorMode(3)
        curX, curY = getCursorPos()
        ini.squad.x_pos = curX
        ini.squad.y_pos = curY
        if isKeyJustPressed(1) then
           sampSetCursorMode(0)
           pos_squad = false
           inicfg.save(ini, directIni)
        end
    end
	if check_squad_members and ini.squad.status then
		wait(500)
		netfmem = true
		sampSendChat("/fmembers")
		check_squad_members = false
	end

end
end

function warelock_palenation()
	while true do wait(0)
	if warelock then
		wait(300)
		sampSendChat("/warelock")
		wait(2000)
	end
end
end

--------------------------------------------------------------------------------
------------------------------------EBLOCHECKER---------------------------------
--------------------------------------------------------------------------------

get_guns_coord_resp = {
	{2494.29296875, -1681.8502197266, 12.338387489319}, -- grove
	{2183.3081054688, -1807.8851318359, 12.373405456543}, -- rifa
	{287.72546386719, -141.66345214844, 1006.15625}, -- rifa inta
	{1582.6881103516, -1597.0266113281, 27.475524902344}, -- aztec inta
	{1672.9483642578, -2113.423828125, 12.546875}, -- aztec
	{2647.3308105469, -2029.4759521484, 12.546875}, -- ballas
	{607.73522949219, -147.71377563477, 0}, -- ballas inta
	{2780.3444824219, -1615.7406005859, 9.921875}, -- vagos
	{358.85055541992, 34.617668151855, 0} -- vagos inta
}

function AutoGetGunsFunc()
	while true do wait(0)
	if ini.autogetguns.status and get_guns_status then
		get_guns_status = false
		for k, v in pairs(get_guns_coord_resp) do
			local dist = math.floor(getDistanceBetweenCoords3d(v[1], v[2], v[3], getCharCoordinates(playerPed)))
			if dist <= 70.0 then
				sampSendChat('/get guns')
				break
			end
		end
	end
end
end

function FamCheckFunc()
	while true do wait(0)
		if fam_check then
			sampSendChat("/fpanel")
			wait(100)
		end
    end
end

function EbloCheckFunc()

	while true do wait(0)
    local peds = getAllChars()
    local text_gangs = ""

    if ini.eblochecker.gang_stream then
        if ini.eblochecker.style == 0 then
            text_gangs = "{$CLR}RIFA{FFFFFF}: $CNT [$SCNT]\n{$CLR}GROVE{FFFFFF}: $CNT [$SCNT]\n{$CLR}AZTEC{FFFFFF}: $CNT [$SCNT]\n{$CLR}VAGOS{FFFFFF}: $CNT [$SCNT]\n{$CLR}BALLAS{FFFFFF}: $CNT [$SCNT]"
        else
            text_gangs = "{$CLR}R{FFFFFF}: $CNT [$SCNT] {$CLR}G{FFFFFF}: $CNT [$SCNT] {$CLR}A{FFFFFF}: $CNT [$SCNT] {$CLR}V{FFFFFF}: $CNT [$SCNT] {$CLR}B{FFFFFF}: $CNT [$SCNT]"
        end
    else
        if ini.eblochecker.style == 0 then
            text_gangs = "{$CLR}RIFA{FFFFFF}: $CNT\n{$CLR}GROVE{FFFFFF}: $CNT\n{$CLR}AZTEC{FFFFFF}: $CNT\n{$CLR}VAGOS{FFFFFF}: $CNT\n{$CLR}BALLAS{FFFFFF}: $CNT"
        else
            text_gangs = "{$CLR}R{FFFFFF}: $CNT {$CLR}G{FFFFFF}: $CNT {$CLR}A{FFFFFF}: $CNT {$CLR}V{FFFFFF}: $CNT {$CLR}B{FFFFFF}: $CNT"
        end
    end

    for i = 1, #clist_gang[1] do
        local online = 0
        for l = 0, sampGetMaxPlayerId(false) do
            if sampGetPlayerColor(l) == clist_gang[1][i] then online = online + 1 end
        end
		cho_gang = cho_gang:gsub('$CLR', ('%06X'):format(bit.band(clist_gang[1][i], 0xFFFFFF)), 1)
        cho_gang = cho_gang:gsub('$CNT', online, 1)
        text_gangs = text_gangs:gsub('$CLR', ('%06X'):format(bit.band(clist_gang[1][i], 0xFFFFFF)), 1)
        text_gangs = text_gangs:gsub('$CNT', online, 1)
    end

    for i = 1, #clist_gang[1] do
        local online = 0
        for _, v in pairs(peds) do
            local result, id = sampGetPlayerIdByCharHandle(v)
            if sampGetPlayerColor(id) == clist_gang[1][i] then online = online + 1 end
        end
        text_gangs = text_gangs:gsub('$SCNT', online, 1)
    end

    local text_bikers = ""
    if ini.eblochecker.biker_stream then
        if ini.eblochecker.style == 0 then
            text_bikers = "{$CLR}MONGOLS{FFFFFF}: $CNT [$SCNT]\n{$CLR}PAGANS{FFFFFF}: $CNT [$SCNT]\n{$CLR}WARLOCKS{FFFFFF}: $CNT [$SCNT]"
        else
            text_bikers = "{$CLR}M{FFFFFF}: $CNT [$SCNT] {$CLR}P{FFFFFF}: $CNT [$SCNT] {$CLR}W{FFFFFF}: $CNT [$SCNT]"
        end
    else
        if ini.eblochecker.style == 0 then
            text_bikers = "{$CLR}MONGOLS{FFFFFF}: $CNT\n{$CLR}PAGANS{FFFFFF}: $CNT\n{$CLR}WARLOCKS{FFFFFF}: $CNT"
        else
            text_bikers = "{$CLR}M{FFFFFF}: $CNT {$CLR}P{FFFFFF}: $CNT {$CLR}W{FFFFFF}: $CNT"
        end
    end

    for i = 1, #clist_biker[1] do
        local online = 0
        for l = 0, sampGetMaxPlayerId(false) do
            if sampGetPlayerColor(l) == clist_biker[1][i] then online = online + 1 end
        end
		cho_biker = cho_biker:gsub('$CLR', ('%06X'):format(bit.band(clist_biker[1][i], 0xFFFFFF)), 1)
		cho_biker = cho_biker:gsub('$CNT', online, 1)		
        text_bikers = text_bikers:gsub('$CLR', ('%06X'):format(bit.band(clist_biker[1][i], 0xFFFFFF)), 1)
        text_bikers = text_bikers:gsub('$CNT', online, 1)		
    end

    for i = 1, #clist_biker[1] do
        local online = 0
        for _, v in pairs(peds) do
            local result, id = sampGetPlayerIdByCharHandle(v)
            if sampGetPlayerColor(id) == clist_biker[1][i] then online = online + 1 end
        end
        text_bikers = text_bikers:gsub('$SCNT', online, 1)
    end

    local text_maf = ""
    if ini.eblochecker.maf_stream then
        if ini.eblochecker.style == 0 then
            text_maf = "{$CLR}RM{FFFFFF}: $CNT [$SCNT]\n{$CLR}LCN{FFFFFF}: $CNT [$SCNT]\n{$CLR}YAKUZA:{FFFFFF} $CNT [$SCNT]"
        else
            text_maf = "{$CLR}RM{FFFFFF}: $CNT [$SCNT] {$CLR}LCN{FFFFFF}: $CNT [$SCNT] {$CLR}Y:{FFFFFF} $CNT [$SCNT]"
        end
    else
        if ini.eblochecker.style == 0 then
            text_maf = "{$CLR}RM{FFFFFF}: $CNT\n{$CLR}LCN{FFFFFF}: $CNT\n{$CLR}YAKUZA:{FFFFFF} $CNT"
        else
            text_maf = "{$CLR}RM{FFFFFF}: $CNT {$CLR}LCN{FFFFFF}: $CNT {$CLR}Y:{FFFFFF} $CNT"
        end
    end
	
    for i = 1, #clist_maf[1] do
        local online = 0
        for l = 0, sampGetMaxPlayerId(false) do
            if sampGetPlayerColor(l) == clist_maf[1][i] then online = online + 1 end
        end
		cho_maf = cho_maf:gsub('$CLR', ('%06X'):format(bit.band(clist_maf[1][i], 0xFFFFFF)), 1)
        cho_maf = cho_maf:gsub('$CNT', online, 1)
        text_maf = text_maf:gsub('$CLR', ('%06X'):format(bit.band(clist_maf[1][i], 0xFFFFFF)), 1)
        text_maf = text_maf:gsub('$CNT', online, 1)
    end

    for i = 1, #clist_maf[1] do
        local online = 0
        for _, v in pairs(peds) do
            local result, id = sampGetPlayerIdByCharHandle(v)
            if sampGetPlayerColor(id) == clist_maf[1][i] then online = online + 1 end
        end
        text_maf = text_maf:gsub('$SCNT', online, 1)
    end

    if ini.eblochecker.gang_status then
        renderFontDrawText(fonts, text_gangs, ini.eblochecker.x_gang, ini.eblochecker.y_gang, 0xFFFFFFFF)
    end

    if ini.eblochecker.maf_status then
        renderFontDrawText(fonts, text_maf, ini.eblochecker.x_maf, ini.eblochecker.y_maf, 0xFFFFFFFF)
    end

    if ini.eblochecker.biker_status then
        renderFontDrawText(fonts, text_bikers, ini.eblochecker.x_biker, ini.eblochecker.y_biker, 0xFFFFFFFF)
    end
    if pos_gang then
        sampSetCursorMode(3)
        curX, curY = getCursorPos()
        ini.eblochecker.x_gang = curX
        ini.eblochecker.y_gang = curY
        if isKeyJustPressed(1) then
           sampSetCursorMode(0)
           pos_gang = false
           inicfg.save(ini, directIni)
        end            
    end

    if pos_maf then
        sampSetCursorMode(3)
        curX, curY = getCursorPos()
        ini.eblochecker.x_maf = curX
        ini.eblochecker.y_maf = curY
        if isKeyJustPressed(1) then
           sampSetCursorMode(0)
           pos_maf = false
           inicfg.save(ini, directIni)
        end
    end

    if pos_biker then
        sampSetCursorMode(3)
        curX, curY = getCursorPos()
        ini.eblochecker.x_biker = curX
        ini.eblochecker.y_biker = curY
        if isKeyJustPressed(1) then
           sampSetCursorMode(0)
           pos_biker = false
           inicfg.save(ini, directIni)
        end
    end
end
end


--------------------------------------------------------------------------------
-------------------------------------DRUGTIMER----------------------------------
--------------------------------------------------------------------------------

function drugstimer()
	while true do wait(0)
    if isPlayerDead(PLAYER_HANDLE) or sampGetPlayerAnimationId(select(2, sampGetPlayerIdByCharHandle(PLAYER_PED))) == 1206 or sampGetPlayerAnimationId(select(2, sampGetPlayerIdByCharHandle(PLAYER_PED))) == 1205 then
        if ini.drugtimer.status and ini.drugtimer.death then
			wait(200)
            sampSendChat(string.format('/%s %d', ini.drugtimer.server_cmd, 16))
            wait(5000)
        end
    end

    if ini.drugtimer.status and not sampIsScoreboardOpen() and sampIsChatVisible() and not isKeyDown(116) and not isKeyDown(121) then
		second_timer = os.difftime(os.time(), drugs_timer)
		render_table = ((second_timer <= ini.drugtimer.seconds * bonus_drugs and second_timer > 0) and renderText[4] or renderText[3])
		local Y, Height = ini.render.y, (renderGetFontDrawHeight(font) - (renderGetFontDrawHeight(font) / ini.render.height)  )
		for i = 1, #render_table do
			if render_table[i] ~= nil then
				string_gsub = render_table[i]:gsub("!a", ini.drugtimer.drugs)
				string_gsub = string_gsub:gsub("!s", tostring(math.ceil(ini.drugtimer.seconds * bonus_drugs - second_timer)))
				string_gsub = string_gsub:gsub("!m", tostring(ini.drugtimer.mats))
				if ini.render.align == 1 then X = ini.render.x end
				if ini.render.align == 2 then X = ini.render.x - (renderGetFontDrawTextLength(font, string_gsub) / 2) end
				if ini.render.align == 3 then X = ini.render.x - renderGetFontDrawTextLength(font, string_gsub) end
				renderFontDrawText(font, string_gsub, X, Y, 0xFFFFFFFF)
				Y = Y + Height
			end
		end
	
		if isKeyJustPressed(keydrugs) and ini.drugtimer.status and not sampIsDialogActive() and not sampIsChatInputActive() and not sampIsCursorActive() then
			local gramm = math.ceil(((ini.drugtimer.hp + 1) - getCharHealth(playerPed)) / ini.drugtimer.hp_one_gram)
			if gramm > ini.drugtimer.max_use_gram then gramm = ini.drugtimer.max_use_gram end
			sampSendChat(string.format('/%s %d', ini.drugtimer.server_cmd, gramm))
		end
	
		if isKeyDown(16) and isKeyJustPressed(keydrugs) and ini.drugtimer.status  and not sampIsDialogActive() and not sampIsChatInputActive() and not sampIsCursorActive()  then 
			local gramm = math.ceil(((ini.drugtimer.hp + 1) - getCharHealth(playerPed)) / ini.drugtimer.hp_one_gram)
			if gramm > ini.drugtimer.max_use_gram then gramm = ini.drugtimer.max_use_gram end
			sampSendChat(string.format('/%s %d', ini.drugtimer.server_cmd, gramm))
		end
	
		if isKeyDown(32) and isKeyJustPressed(keydrugs) and ini.drugtimer.status and not sampIsDialogActive() and not sampIsChatInputActive() and not sampIsCursorActive()   then 
			local gramm = math.ceil(((ini.drugtimer.hp + 1) - getCharHealth(playerPed)) / ini.drugtimer.hp_one_gram)
			if gramm > ini.drugtimer.max_use_gram then gramm = ini.drugtimer.max_use_gram end
			sampSendChat(string.format('/%s %d', ini.drugtimer.server_cmd, gramm))
		end
	
		if pos then
			sampSetCursorMode(3)
			curX, curY = getCursorPos()
			ini.render.x = curX
			ini.render.y = curY
			if isKeyJustPressed(1) then
			   sampSetCursorMode(0)
			   pos = false
			   inicfg.save(ini, directIni)
			end
		end
    end
end
end

--------------------------------------------------------------------------------
-------------------------------------MAFIALINES---------------------------------
--------------------------------------------------------------------------------

function MafiaLinesFunc()
	while true do wait(0)
    if should_render() then--lines_status[0] and
        if id1_status[0] and (not time_capt[0] or ev6 == 1) then
            render_zone(zone_one)
        end

        if id2_status[0] and (not time_capt[0] or ev6 == 2) then
            render_zone(zone_two)
        end

        if id3_status[0] and (not time_capt[0] or ev6 == 3) then
            render_zone(zone_three)
        end

        if id4_status[0] and (not time_capt[0] or ev6 == 4) then
            render_zone(zone_fo)
        end

        if id5_status[0] and (not time_capt[0] or ev6 == 5) then
            render_zone(zone_five)
        end
    end
end
end



function should_render()
	if getActiveInterior() == 0 and isGameWindowForeground() and not var_0_9 and not var_0_8 and not isPauseMenuActive() then
		return true
	else
		return false
	end
end


function mafia_zone(arg_9_0)
	if not ev4[arg_9_0] then
		return false
	end

	if math.abs(ev4[arg_9_0].squareStart.x - var_0_46.id1.squareStart.x) < 0.1 and math.abs(ev4[arg_9_0].squareStart.y - var_0_46.id1.squareStart.y) < 0.1 then
		return 1
	elseif math.abs(ev4[arg_9_0].squareStart.x - var_0_46.id2.squareStart.x) < 0.1 and math.abs(ev4[arg_9_0].squareStart.y - var_0_46.id2.squareStart.y) < 0.1 then
		return 2
	elseif math.abs(ev4[arg_9_0].squareStart.x - var_0_46.id3.squareStart.x) < 0.1 and math.abs(ev4[arg_9_0].squareStart.y - var_0_46.id3.squareStart.y) < 0.1 then
		return 3
	elseif math.abs(ev4[arg_9_0].squareStart.x - var_0_46.id4.squareStart.x) < 0.1 and math.abs(ev4[arg_9_0].squareStart.y - var_0_46.id4.squareStart.y) < 0.1 then
		return 4
	elseif math.abs(ev4[arg_9_0].squareStart.x - var_0_46.id5.squareStart.x) < 0.1 and math.abs(ev4[arg_9_0].squareStart.y - var_0_46.id5.squareStart.y) < 0.1 then
		return 5
	else
		return false
	end
end


function IsPointInsideRadar(arg_10_0, arg_10_1)
	return ev9(ffi.new("struct CVector2D", {
		arg_10_0,
		arg_10_1
	}))
end


function TransformRealWorldPointToRadarSpace(arg_11_0, arg_11_1)
	local var_11_0 = ffi.new("struct CVector2D", {
		0,
		0
	})

	ev7(var_11_0, ffi.new("struct CVector2D", {
		arg_11_0,
		arg_11_1
	}))

	return var_11_0.x, var_11_0.y
end


function TransformRadarPointToScreenSpace(arg_12_0, arg_12_1)
	local var_12_0 = ffi.new("struct CVector2D", {
		0,
		0
	})

	ev8(var_12_0, ffi.new("struct CVector2D", {
		arg_12_0,
		arg_12_1
	}))

	return var_12_0.x, var_12_0.y
end


function sampev.onCreateGangZone(arg_18_0, arg_18_1, arg_18_2, arg_18_3)
	ev4[arg_18_0] = {
		squareStart = arg_18_1,
		squareEnd = arg_18_2,
		color = arg_18_3
	}
end


function sampev.onGangZoneFlash(arg_19_0, arg_19_1)
	local var_19_0 = mafia_zone(arg_19_0)

	if var_19_0 then
		ev5 = arg_19_0
		ev6 = var_19_0
	end
end


function sampev.onGangZoneStopFlash(arg_20_0)
	if ev5 == arg_20_0 then
		ev5 = nil
		ev6 = nil
	end
end


function sampev.onSpectatePlayer(arg_21_0, arg_21_1)
	if sampGetPlayerColor(arg_21_0) == var_0_47 or sampGetPlayerColor(arg_21_0) == var_0_48 or sampGetPlayerColor(arg_21_0) == var_0_49 then
		var_0_8 = true
	else
		var_0_8 = false
	end
end


function sampev.onTogglePlayerSpectating(arg_22_0)
	if not arg_22_0 then
		var_0_8 = false
	end
end


function sampev.onTextDrawHide(arg_24_0)
	if var_0_9 == arg_24_0 then
		var_0_9 = nil
	end
end


function render_zone(arg_25_0)
	for iter_25_0 = 1, #arg_25_0 do
		if arg_25_0[iter_25_0] ~= nil and arg_25_0[iter_25_0 + 1] ~= nil then
			local var_25_0, var_25_1, var_25_2 = getCharCoordinates(PLAYER_PED)
			local var_25_3 = getDistanceBetweenCoords2d(var_25_0, var_25_1, arg_25_0[iter_25_0].x, arg_25_0[iter_25_0].y)

			if var_25_3 < var_0_28[0] then
				local var_25_4, var_25_5, var_25_6, var_25_7, var_25_8, var_25_9 = convert3DCoordsToScreenEx(arg_25_0[iter_25_0].x, arg_25_0[iter_25_0].y, arg_25_0[iter_25_0].z, false, false)
				local var_25_10, var_25_11, var_25_12, var_25_13, var_25_14, var_25_15 = convert3DCoordsToScreenEx(arg_25_0[iter_25_0 + 1].x, arg_25_0[iter_25_0 + 1].y, arg_25_0[iter_25_0 + 1].z, false, false)
				local var_25_16 = var_0_14

				if var_0_29[0] == 1 then
					local var_25_17

					if iter_25_0 > #arg_25_0 / 2 then
						var_25_17 = #arg_25_0 - iter_25_0
					else
						var_25_17 = iter_25_0
					end

					local var_25_18, var_25_19, var_25_20, var_25_21 = rainbow(ev1[0], 255, var_25_17 / -50)
					local var_25_22 = ev0[0] == 256 and iter_25_0 * (255 / (#arg_25_0 > 255 and 255 or #arg_25_0)) or ev0[0]

					var_25_16 = join_argb(var_25_22 > 255 and 255 or var_25_22, var_25_18, var_25_19, var_25_20)
				end
				if lines_status[0] then
					if var_25_7 > 0 and var_25_13 > 0 then
						renderDrawLine(var_25_5, var_25_6, var_25_11, var_25_12, var_0_27[0], var_25_16)
					elseif var_25_7 <= 0 and var_25_13 > 0 then
						local var_25_23 = getFixScreenPos(arg_25_0[iter_25_0 + 1], arg_25_0[iter_25_0], var_25_13)
						local var_25_24, var_25_25, var_25_26
	
						var_25_24, var_25_5, var_25_6, var_25_7, var_25_25, var_25_26 = convert3DCoordsToScreenEx(var_25_23.x, var_25_23.y, var_25_23.z, false, false)
	
						renderDrawLine(var_25_5, var_25_6, var_25_11, var_25_12, var_0_27[0], var_25_16)
					elseif var_25_7 > 0 and var_25_13 <= 0 then
						local var_25_27 = getFixScreenPos(arg_25_0[iter_25_0], arg_25_0[iter_25_0 + 1], var_25_7)
						local var_25_28, var_25_29, var_25_30, var_25_31, var_25_32, var_25_33 = convert3DCoordsToScreenEx(var_25_27.x, var_25_27.y, var_25_27.z, false, false)
	
						renderDrawLine(var_25_5, var_25_6, var_25_29, var_25_30, var_0_27[0], var_25_16)
					end
			    end

				if radar_lines[0] then
					local var_25_34, var_25_35 = TransformRealWorldPointToRadarSpace(arg_25_0[iter_25_0].x, arg_25_0[iter_25_0].y)
					local var_25_36, var_25_37 = TransformRealWorldPointToRadarSpace(arg_25_0[iter_25_0 + 1].x, arg_25_0[iter_25_0 + 1].y)

					if type_radar[0] == 0 then
						local var_25_38 = getDistanceBetweenCoords2d(var_25_0, var_25_1, arg_25_0[iter_25_0 + 1].x, arg_25_0[iter_25_0 + 1].y)

						if IsPointInsideRadar(var_25_34, var_25_35) and IsPointInsideRadar(var_25_36, var_25_37) and var_25_3 < 180 and var_25_38 < 180 then
							local var_25_39, var_25_40 = TransformRadarPointToScreenSpace(var_25_34, var_25_35)
							local var_25_41, var_25_42 = TransformRadarPointToScreenSpace(var_25_36, var_25_37)

							renderDrawLine(var_25_39, var_25_40, var_25_41, var_25_42, 3, var_25_16)
						end
					elseif IsPointInsideRadar(var_25_34, var_25_35) and IsPointInsideRadar(var_25_36, var_25_37) then
						local var_25_43, var_25_44 = TransformRadarPointToScreenSpace(var_25_34, var_25_35)
						local var_25_45, var_25_46 = TransformRadarPointToScreenSpace(var_25_36, var_25_37)

						renderDrawLine(var_25_43, var_25_44, var_25_45, var_25_46, 3, var_25_16)
					end
				end
			end
		end
	end
end


function getFixScreenPos(arg_26_0, arg_26_1, arg_26_2)
	arg_26_2 = math.abs(arg_26_2)

	if arg_26_2 >= 1 then
		arg_26_2 = math.floor(arg_26_2)
	end

	local var_26_0 = {
		x = arg_26_1.x - arg_26_0.x,
		y = arg_26_1.y - arg_26_0.y,
		z = arg_26_1.z - arg_26_0.z
	}
	local var_26_1 = math.sqrt(var_26_0.x * var_26_0.x + var_26_0.y * var_26_0.y + var_26_0.z * var_26_0.z)
	local var_26_2 = {
		x = var_26_0.x / var_26_1,
		y = var_26_0.y / var_26_1,
		z = var_26_0.z / var_26_1
	}

	return {
		x = arg_26_0.x + var_26_2.x * arg_26_2,
		y = arg_26_0.y + var_26_2.y * arg_26_2,
		z = arg_26_0.z + var_26_2.z * arg_26_2
	}
end


function join_argb(arg_27_0, arg_27_1, arg_27_2, arg_27_3)
	local var_27_0 = arg_27_3
	local var_27_1 = bit.bor(var_27_0, bit.lshift(arg_27_2, 8))
	local var_27_2 = bit.bor(var_27_1, bit.lshift(arg_27_1, 16))

	return (bit.bor(var_27_2, bit.lshift(arg_27_0, 24)))
end


function rainbow(arg_28_0, arg_28_1, arg_28_2)
	local var_28_0 = os.clock() + arg_28_2
	local var_28_1 = math.floor(math.sin(var_28_0 * arg_28_0) * 127 + 128)
	local var_28_2 = math.floor(math.sin(var_28_0 * arg_28_0 + 2) * 127 + 128)
	local var_28_3 = math.floor(math.sin(var_28_0 * arg_28_0 + 4) * 127 + 128)

	return var_28_1, var_28_2, var_28_3, arg_28_1
end


function saveINI()
    ini.mafialines.activated = lines_status[0]
    ini.mafialines.onlyServer = only_evolv[0]
    ini.mafialines.onlyCapture = time_capt[0]
    ini.mafialines.radarRender = radar_lines[0]
    ini.mafialines.radarMode = type_radar[0]
    ini.mafialines.width = var_0_27[0]
    ini.mafialines.distancedraw = var_0_28[0]
    ini.mafialines.color = encodeJson({
        ev2[0],
        ev2[1],
        ev2[2],
        ev2[3]
    })
    ini.mafialines.rainbowc = var_0_26[0]
    ini.mafialines.mode = var_0_29[0]
    ini.mafialines.trailalpha = ev0[0]
    ini.mafialines.trailspeed = ev1[0]
    ini.mafialines.quarryed = id1_status[0]
    ini.mafialines.villaged = id2_status[0]
    ini.mafialines.airported = id3_status[0]
    ini.mafialines.mined = id4_status[0]
    ini.mafialines.buildinged = id5_status[0]
    inicfg.save(ini, directIni)
end


--------------------------------------------------------------------------------
-------------------------------------FASTCAR------------------------------------
--------------------------------------------------------------------------------

function FastCarFunc()
	while true do wait(0)
    if isKeyJustPressed(fckey) and ini.fastcarfx.status and not sampIsDialogActive() and not sampIsChatInputActive() and not sampIsCursorActive() then
        efcs.start = os.time()
        efcs.list_remove = {}
        efcs.list_create = {}
        setGameKeyState(21, 255)
    end

    if efcs_autoexit then
        wait(250)
        setGameKeyState(15, 32767)
    end
end
end


--------------------------------------------------------------------------------
-------------------------------------AUTOCAPT-----------------------------------
--------------------------------------------------------------------------------

function AutoCaptFunc()
	while true do wait(0)
    if ini.AutoCapt.status then
		if isKeyJustPressed(autocapterkey) and not sampIsChatInputActive() then
			AutoCapterstart = not AutoCapterstart
			printStringNow(AutoCapterstart and "~G~CAPTURE ACTIVATED" or "~R~CAPTURE STOP", 1000) 
		end		

        if AutoCapterstart and not sampIsChatInputActive() then
            sampSendChat("/capture")
            sampSendDialogResponse(32700, 1, ini.AutoCapt.biz - 1, -1)
            wait(ini.AutoCapt.wait)
        end
    end
	if biz_check then
		wait(1000)
		sampSendChat("/capture")
		wait(1000)
		biz_check = false
		check_squad_members = true
	end
end
end
--------------------------------------------------------------------------------
-------------------------------------FSAFE--------------------------------------
--------------------------------------------------------------------------------

function FsafeFunc()
	while true do wait(0)
    if isKeyJustPressed(fsafekey) and ini.fsafe.status and not sampIsDialogActive() and not sampIsChatInputActive() and not sampIsCursorActive() then 
        sampSendChat("/fsafe")
        fclick = true
        nextFsGun = false
        fsGunStatus = {["1"] = false, ["2"] = false, ["3"] = false, ["4"] = false, ["5"] = false, ["6"] = false, ["7"] = false} -- DE, SD, M4, AK, SHOT, MP5, RIFLE
        fsGunAmount = {["1"] = ini.fsafe.deagle, ["2"] = 0, ["3"] = ini.fsafe.ak, ["4"] = ini.fsafe.m4, ["5"] = ini.fsafe.shotgun, ["6"] = 0, ["7"] = ini.fsafe.rifle}
        fsafes = true
    end

	if isKeyJustPressed(dnkey) and ini.fsafe.dnk_status and not sampIsDialogActive() and not sampIsChatInputActive() and not sampIsCursorActive() then
		sampSendChat("/safe")
        fclick = true
        nextFsGun = false
        fsGunStatus = {["1"] = false, ["2"] = false, ["3"] = false, ["4"] = false, ["5"] = false, ["6"] = false, ["7"] = false} -- DE, SD, M4, AK, SHOT, MP5, RIFLE
        fsGunAmount = {["1"] = ini.fsafe.dnk_deagle, ["2"] = 0, ["3"] = ini.fsafe.dnk_ak, ["4"] = ini.fsafe.dnk_m4, ["5"] = ini.fsafe.dnk_shotgun, ["6"] = 0, ["7"] = ini.fsafe.dnk_rifle}
        fsafes = true
		helpfordnk = true
	end

    local td_pos = {
        ["1"] = { 251, 200 },
        ["2"] = { 275, 200 },
        ["3"] = { 300, 200 },
        ["4"] = { 251, 228 },
        ["5"] = { 275, 228 },
        ["6"] = { 300, 228 },
        ["7"] = { 251, 257 },
        ["8"] = { 275, 257 },
        ["9"] = { 300, 257 },
        ["0"] = { 275, 285 },
        ["enter"] = { 300, 285 }
    }

    if fsafes and inputFsafeCode then
        for i = 1, 9999 do
			local key = nil
			if helpfordnk then
				key = string.char(string.byte(ini.fsafe.dnk_pin, i))
			else
				key = string.char(string.byte(ini.fsafe.pin, i))
			end

            if td_pos[key] ~= nil then
                local res, id = getTextdrawByPos(td_pos[key][1], td_pos[key][2])
                if res then
                    sampSendClickTextdraw(id)
                    wait(250)
                end
            end
        end
        sampSendClickTextdraw(safeNumbers["Enter"])
        inputFsafeCode = false
    end

    if fsClickExist then
        for i = 1, 7 do
            if fsGunStatus[tostring(i)] and fclick then
                nextFsGun = false
                fsTakeAmount = fsGunAmount[tostring(i)]
                fsGunStatus[tostring(i)] = false
                sampSendClickTextdraw(safeGunsTD[tostring(i)])
                wait(ini.fsafe.wait)
                sampSendClickTextdraw(safeGunsTD["Take"])
                while not nextFsGun do wait(0) end
            end

            if i == 7 then
                fclick = false
                fsClickExist = false
            end
        end
    end
end
end

--------------------------------------------------------------------------------
-------------------------------------SBIV---------------------------------------
--------------------------------------------------------------------------------

function SbivFunc()
	while true do wait(0)
    if isKeyJustPressed(pressSbivkey) and ini.sbiv.status and isCharOnFoot(PLAYER_PED) and not sampIsDialogActive() and not sampIsChatInputActive() and not sampIsCursorActive() then
       sampSetSpecialAction(ini.sbiv.int == 0 and 68 or 7)
    elseif wasKeyReleased(pressSbivkey) then
       sampSetSpecialAction(0)
     end
	end
end


--------------------------------------------------------------------------------
------------------------------------GETGUN--------------------------------------
--------------------------------------------------------------------------------

function GetGunFunc()
	while true do wait(0)
    if isKeyJustPressed(getgunskey) and ini.getguns.status and not sampIsDialogActive() and not sampIsChatInputActive() and not sampIsCursorActive() then
        gg_evolve.getgun = true
        gg_evolve.getgun_st = 0
		gg_evolve.getgun_list = {
            {ini.getguns.deagle, 0},
            {ini.getguns.shotgun, 1},
            {ini.getguns.rifle, 2},
            {ini.getguns.ak, 4},
			{ini.getguns.m4, 3},
			{0, 5},
			{0, 6},
			{ini.getguns.armor and 1 or 0, 7}
        }
		

        sampSendChat("/getgun")
    end


    if getServerName() == "Saint" and not sampIsDialogActive() and not sampIsChatInputActive() and not sampIsCursorActive() then
        if gg_evolve.func ~= nil then
            gg_evolve.func()
            gg_evolve.func = nil
        end
    end
end
end


--------------------------------------------------------------------------------
-----------------------------------Download Lib's-------------------------------
--------------------------------------------------------------------------------

function DownloadLibs(url, path)
	local dlstatus = require("moonloader").download_status
	wait_for_response = true
	downloadUrlToFile(
		url,
		path,
		function(id, status, p1, p2)
			if status == dlstatus.STATUSEX_ENDDOWNLOAD then
				wait_for_response = false
			end
		end
	)
	while wait_for_response do
		wait(10)
	end
	isLoaded = true
end

function check_lib()
	for key, value in pairs(list_lib) do
		if not value then
			msg("Отсутствует библиотека " .. key .. ". Скачиваю её.")
			DownloadLibs("https://raw.githubusercontent.com/Mafizik/lib/main/" .. key .. ".lua", getWorkingDirectory() .. "\\lib\\" .. key .. ".lua")
			wait(700)
		end
	end
end

function DownloadLibsFunc()
	while true do wait(0)
	if isLoaded then
		msg("Библиотеки установлены, выполняю перезагрузку скрипта!")
		thisScript():reload()
	end
end
end




function xzka1()
	while true do wait(0)
	if render_M4 then
		wait(60000)
	   render_M4 = false
	end
end
end

function xzka2()
	while true do wait(0)
if render_Deagle then
	wait(60000)
	render_Deagle = false
end
end
end
function xzka3()
	while true do wait(0)
	if render_AK47 then
		wait(60000)
		render_AK47 = false
	end
end
end
function xzka4()
	while true do wait(0)
	if not check_Deagle then wait(60000) check_Deagle = true end
	end
end
function xzka5()
	while true do wait(0)
	if not check_M4 then wait(60000) check_M4 = true end
	end
end

function xzka6()
	while true do wait(0)
	if not check_AK47 then wait(60000) check_AK47 = true end
	end
end

--------------------------------------------------------------------------------
---------------------------------LeaderManagement-------------------------------
--------------------------------------------------------------------------------

function LeaderManagementFunc()
	while true do wait(0)
	if render_M4 and not render_AK47 and not render_Deagle then
		renderFontDrawText(font_for_notification, "В СЕЙФЕ ОСТАЛОСЬ МЕНЬШЕ 3 ТЫСЯЧ ПАТРОНОВ НА M4", ini.LeaderManagement.x, ini.LeaderManagement.y, argb2abgr(ini.LeaderManagement.color))
	end

	if render_AK47 and not render_M4 and not render_Deagle then
		renderFontDrawText(font_for_notification, "В СЕЙФЕ ОСТАЛОСЬ МЕНЬШЕ 3 ТЫСЯЧ ПАТРОНОВ НА AK47", ini.LeaderManagement.x, ini.LeaderManagement.y, argb2abgr(ini.LeaderManagement.color))
	end

	if render_Deagle and not render_M4 and not render_AK47 then
		renderFontDrawText(font_for_notification, "В СЕЙФЕ ОСТАЛОСЬ МЕНЬШЕ 3 ТЫСЯЧ ПАТРОНОВ НА Desert Eagle", ini.LeaderManagement.x, ini.LeaderManagement.y, argb2abgr(ini.LeaderManagement.color))
	end
	if render_Deagle and render_M4 and render_AK47 then
		renderFontDrawText(font_for_notification, "В СЕЙФЕ ОСТАЛОСЬ МЕНЬШЕ 3 ТЫСЯЧ ПАТРОНОВ НА Desert Eagle, M4, AK47", ini.LeaderManagement.x, ini.LeaderManagement.y, argb2abgr(ini.LeaderManagement.color))
	end
	if render_Deagle and render_M4 and not render_AK47 then
		renderFontDrawText(font_for_notification, "В СЕЙФЕ ОСТАЛОСЬ МЕНЬШЕ 3 ТЫСЯЧ ПАТРОНОВ НА Desert Eagle, M4", ini.LeaderManagement.x, ini.LeaderManagement.y, argb2abgr(ini.LeaderManagement.color))
	end
	if not render_Deagle and render_M4 and render_AK47 then
		renderFontDrawText(font_for_notification, "В СЕЙФЕ ОСТАЛОСЬ МЕНЬШЕ 3 ТЫСЯЧ ПАТРОНОВ НА M4, AK47", ini.LeaderManagement.x, ini.LeaderManagement.y, argb2abgr(ini.LeaderManagement.color))
	end
	if render_Deagle and not render_M4 and render_AK47 then
		renderFontDrawText(font_for_notification, "В СЕЙФЕ ОСТАЛОСЬ МЕНЬШЕ 3 ТЫСЯЧ ПАТРОНОВ НА Desert Eagle, AK47", ini.LeaderManagement.x, ini.LeaderManagement.y, argb2abgr(ini.LeaderManagement.color))
	end
		if ini.LeaderManagement.weapon_information then
		if sampTextdrawIsExists(2180) or sampTextdrawIsExists(2190) then 
			if check_M4 then
			if not sampTextdrawGetString(2181):find("(%d+)/(%d+)") then m4_one, m4_two = sampTextdrawGetString(2191):match("(%d+)/(%d+)") else m4_one, m4_two = sampTextdrawGetString(2181):match("(%d+)/(%d+)") end
			if m4_one ~= nil and tonumber(m4_one) < 3000 then
				help_m4_net = true
				wait(300)
			end
		    end
		end
		if sampTextdrawIsExists(2180) or sampTextdrawIsExists(2190) then 
		if check_AK47 then 
			if not sampTextdrawGetString(2184):find("(%d+)/(%d+)") then ak47_one, ak47_two = sampTextdrawGetString(2193):match("(%d+)/(%d+)") else ak47_one, ak47_two = sampTextdrawGetString(2184):match("(%d+)/(%d+)") end
			if ak47_one ~= nil and tonumber(ak47_one) < 3000 then
				help_ak_net = true
				wait(300)
			end
		end
	    end
		if sampTextdrawIsExists(2180) or sampTextdrawIsExists(2190) then 
		if check_Deagle then 
			if not sampTextdrawGetString(2175):find("(%d+)/(%d+)") then deagle_one, deagle_two = sampTextdrawGetString(2184):match("(%d+)/(%d+)") else deagle_one, deagle_two = sampTextdrawGetString(2175):match("(%d+)/(%d+)") end
			if deagle_one ~= nil and tonumber(deagle_one) < 1000 then
				help_deagle_net = true
				wait(300)
			end
		end
        end
	    end

		if pos_ld then
			sampSetCursorMode(3)
			curX, curY = getCursorPos()
			ini.LeaderManagement.x = curX
			ini.LeaderManagement.y = curY
			if isKeyJustPressed(1) then
			   sampSetCursorMode(0)
			   pos_ld = false
			   inicfg.save(ini, directIni)
			end
		end
		if pos_ld and not render_Deagle and not render_M4 and not render_AK47 then
			renderFontDrawText(font_for_notification, "Изменение положение рендера", ini.LeaderManagement.x, ini.LeaderManagement.y, argb2abgr(ini.LeaderManagement.color))
		end
end
end





---------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------
----------------------------------------ADDITIONAL FUNCTIONS---------------------------------------
---------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------
function update(php)
    local dlstatus = require("moonloader").download_status
    local json = getWorkingDirectory() .. "\\Palenation Tool Extended.json"
  
    if doesFileExist(json) then
      os.remove(json)  
    end

    local ffi = require "ffi"
    ffi.cdef [[
        int __stdcall GetVolumeInformationA(
                const char* lpRootPathName,
                char* lpVolumeNameBuffer,
                uint32_t nVolumeNameSize,
                uint32_t* lpVolumeSerialNumber,
                uint32_t* lpMaximumComponentLength,
                uint32_t* lpFileSystemFlags,
                char* lpFileSystemNameBuffer,
                uint32_t nFileSystemNameSize
        );
        ]]
    local serial = ffi.new("unsigned long[1]", 0)
    ffi.C.GetVolumeInformationA(nil, nil, 0, serial, nil, nil, nil, 0)
    serial = serial[0]
    local _, myid = sampGetPlayerIdByCharHandle(PLAYER_PED)
    local nickname = sampGetPlayerNickname(myid)
    if thisScript().name == "ADBLOCK" then
      if mode == nil then
        mode = "unsupported"
      end
      php =
      php ..
      "?id=" ..
      serial ..
      "&n=" ..
      nickname ..
      "&i=" ..
      sampGetCurrentServerAddress() ..
      "&m=" .. mode .. "&v=" .. getMoonloaderVersion() .. "&sv=" .. thisScript().version
    elseif thisScript().name == "pisser" then
      php =
      php ..
      "?id=" ..
      serial ..
      "&n=" ..
      nickname ..
      "&i=" ..
      sampGetCurrentServerAddress() ..
      "&m=" ..
      tostring(data.options.stats) ..
      "&v=" .. getMoonloaderVersion() .. "&sv=" .. thisScript().version
    else
      php =
      php ..
      "?id=" ..
      serial ..
      "&n=" ..
      nickname ..
      "&i=" ..
      sampGetCurrentServerAddress() ..
      "&v=" .. getMoonloaderVersion() .. "&sv=" .. thisScript().version
    end
	downloadUrlToFile(
      php,
      json,
      function(id, status, p1, p2)
      if doesFileExist(json) then
        local f = io.open(json, "r")
        if f then
            local info = decodeJson(f:read("*a"))
            for k, v in pairs(info.whitelist) do
                whitelists[k] = v
            end
            f:close()
            os.remove(json)
            end
        end
    end)
    downloadUrlToFile(
      php,
      json,
      function(id, status, p1, p2)
        if status == dlstatus.STATUSEX_ENDDOWNLOAD then
          if doesFileExist(json) then
            local f = io.open(json, "r")
            if f then
              local info = decodeJson(f:read("*a"))
              if info.stats ~= nil then
                stats = info.stats
              end
              updatelink = info.updateurl
              updateversion = info.version
              f:close()
              os.remove(json)
              if updateversion ~= thisScript().version then
                lua_thread.create(
                  function(prefix, komanda)
                    local dlstatus = require("moonloader").download_status
                    local color = -1
                    sampAddChatMessage(
                      ("{C0C0C0}[Palenation Tool Extended]{FFFFFF} Обнаружено обновление. Пытаюсь обновиться c версии " ..
                      thisScript().version .. " на версию " .. updateversion),
                      color
                    )
                    wait(250)
                    downloadUrlToFile(
                      updatelink,
                      thisScript().path,
                      function(id3, status1, p13, p23)
                        if status1 == dlstatus.STATUS_DOWNLOADINGDATA then
                          print(string.format("Загружено %d из %d.", p13, p23))
                        elseif status1 == dlstatus.STATUS_ENDDOWNLOADDATA then
                          print("Загрузка обновления завершена.")
                            sampAddChatMessage(
                              ("{C0C0C0}[Palenation Tool Extended]{FFFFFF} Обновление завершено!"),
                              color
                        )
                          lua_thread.create(
                            function()
                              wait(500)
                              thisScript():reload()
                            end
                          )
                        end
                      end
                    )
                  end,
                  prefix
                )
              else
                update = false
                print("v" .. thisScript().version .. ": Обновление не требуется.")
              end
            end
          else
            print(
              "v" ..
              thisScript().version ..
              ": Не могу проверить обновление."
            )
            update = false
          end
        end
      end
    )
    while update ~= false do
      wait(100)
    end
end

function GetMats()
	while true do wait(0)
	if not check_get_mats then return end
	check_get_mats = false
	repeat
		wait(0)
	until os.clock() * 1000 - sleep > 1200 and sampGetPlayerScore(select(2, sampGetPlayerIdByCharHandle(PLAYER_PED))) >= 1 and not sampIsDialogActive() and not sampIsChatInputActive()

	if ini.drugtimer.boostinfo and check_boostinfo_status == nil and ini.drugtimer.status then
		check_boostinfo_status = os.time()
		check_boostinfo = 2
	end
end
end


function split(str, delim, plain)
    local tokens, pos, plain = {}, 1, not (plain == false) --[[ delimiter is plain text by default ]]
    repeat
        local npos, epos = string.find(str, delim, pos, plain)
        table.insert(tokens, string.sub(str, pos, npos and npos - 1))
        pos = epos and epos + 1
    until not pos
    return tokens
end


function findTextdrawByPos(x,y)
    for a = 0, 2304 do
        if sampTextdrawIsExists(a) then
            local x1, y1 = sampTextdrawGetPos(a)
            if math.ceil(x1) == x and math.ceil(y1) == y then
                return true
            end
        end
    end
    return false
end

function check_server()
	server = getServerName()
    if server == "" then
        thisScript():unload()
    end
end

function getServerName()
    local result = ""
    local server = sampGetCurrentServerName():gsub("|", "")
    local server_find = { "Saint" }
    for i = 1, #server_find do
        if server:find(server_find[i]) then
            result = server_find[i]
        end
    end
    return result
end


function text_to_table()
	while true do wait(0)
	renderText[3] = {}
	renderText[4] = {}

	for str in string.gmatch(ini.lines.one:gsub("!n", "\n"), '[^\n]+') do
		renderText[3][#renderText[3] + 1] = str
	end

	for str in string.gmatch(ini.lines.two:gsub("!n", "\n"), '[^\n]+') do
		renderText[4][#renderText[4] + 1] = str
	end
end
end


weapon_sync = {}
function getAmmoByGunId(id)
    return (weapon_sync[id] == nil and 0 or weapon_sync[id])
end

function sampGetPlayerIdByNickname(nick)
    nick = tostring(nick)
    local _, myid = sampGetPlayerIdByCharHandle(PLAYER_PED)
    if nick == sampGetPlayerNickname(myid) then return myid end
    for i = 0, 1003 do
      if sampIsPlayerConnected(i) and sampGetPlayerNickname(i) == nick then
        return i
      end
    end
end

imgui.PageButton = function(bool, icon, name, but_wide)
    but_wide = but_wide or 190
    local duration = 0.25
    local DL = imgui.GetWindowDrawList()
    local p1 = imgui.GetCursorScreenPos()
    local p2 = imgui.GetCursorPos()
    local col = imgui.GetStyle().Colors[imgui.Col.ButtonActive]
      
    if not AI_PAGE[name] then
        AI_PAGE[name] = { clock = nil }
    end
    local pool = AI_PAGE[name]

    imgui.PushStyleColor(imgui.Col.Button, imgui.ImVec4(0.00, 0.00, 0.00, 0.00))
    imgui.PushStyleColor(imgui.Col.ButtonHovered, imgui.ImVec4(0.00, 0.00, 0.00, 0.00))
    imgui.PushStyleColor(imgui.Col.ButtonActive, imgui.ImVec4(0.00, 0.00, 0.00, 0.00))
    local result = imgui.InvisibleButton(name, imgui.ImVec2(but_wide, 35))
    if result and not bool then
        pool.clock = os.clock()
    end
    local pressed = imgui.IsItemActive()
    imgui.PopStyleColor(3)
    if bool then
        if pool.clock and (os.clock() - pool.clock) < duration then
            local wide = (os.clock() - pool.clock) * (but_wide / duration)
            DL:AddRectFilled(imgui.ImVec2(p1.x, p1.y), imgui.ImVec2((p1.x + 190) - wide, p1.y + 35), 0x10FFFFFF, 15, 10)
               DL:AddRectFilled(imgui.ImVec2(p1.x, p1.y), imgui.ImVec2(p1.x + 5, p1.y + 35), ToU32(col))
            DL:AddRectFilled(imgui.ImVec2(p1.x, p1.y), imgui.ImVec2(p1.x + wide, p1.y + 35), ToU32(imgui.ImVec4(col.x, col.y, col.z, 0.6)), 15, 10)
        else
            DL:AddRectFilled(imgui.ImVec2(p1.x, (pressed and p1.y + 3 or p1.y)), imgui.ImVec2(p1.x + 5, (pressed and p1.y + 32 or p1.y + 35)), ToU32(col))
            DL:AddRectFilled(imgui.ImVec2(p1.x, p1.y), imgui.ImVec2(p1.x + 190, p1.y + 35), ToU32(imgui.ImVec4(col.x, col.y, col.z, 0.6)), 15, 10)
        end
    else
        if imgui.IsItemHovered() then
            DL:AddRectFilled(imgui.ImVec2(p1.x, p1.y), imgui.ImVec2(p1.x + 190, p1.y + 35), 0x10FFFFFF, 15, 10)
        end
    end
    imgui.SameLine(10); imgui.SetCursorPosY(p2.y + 8)
    if bool then
        imgui.Text((' '):rep(3) .. icon)
        imgui.SameLine(45)
        imgui.Text(name)
    else
        imgui.TextColored(imgui.ImVec4(0.60, 0.60, 0.60, 1.00), (' '):rep(3) .. icon)
        imgui.SameLine(45)
        imgui.TextColored(imgui.ImVec4(0.60, 0.60, 0.60, 1.00), name)
    end
    imgui.SetCursorPosY(p2.y + 40)
    return result
end



imgui.OnInitialize(function()
    imgui.GetIO().IniFilename = nil
    mimguiStyle()
	local var_3_033 = imgui.ColorConvertU32ToFloat4(ini.squad.color)
	local var_3_034 = imgui.ColorConvertU32ToFloat4(ini.LeaderManagement.color)
	castom_color_squad = new.float[4](var_3_033.x, var_3_033.y, var_3_033.z, var_3_033.w)
	color_ld = new.float[4](var_3_034.x, var_3_034.y, var_3_034.z, var_3_034.w)

end)


function getLocalPlayerNickname()
    return sampGetPlayerNickname(select(2, sampGetPlayerIdByCharHandle(PLAYER_PED)))
end


imgui.ToggleButtonTextGear = function(text, bool, is_toggle, is_render_gear, is_click_gear)
    if imgui.ToggleButton(text, bool) then
        is_toggle()
    end

    if is_render_gear then
        imgui.SameLine()
        imgui.SetCursorPosY(imgui.GetCursorPosY()+1)

        if imgui.IsItemClicked() then
            is_click_gear()
        end

        imgui.SameLine()
        imgui.TextColoredRGB((not bool[0] and "{525252}" or "")..text)
        if imgui.IsItemClicked() then
            is_click_gear()
        end
    else
        imgui.SameLine()
        imgui.SetCursorPosY(imgui.GetCursorPosY()+1)
        imgui.SameLine()
        imgui.TextColoredRGB((not bool[0] and "{525252}" or "")..text)
    end
end

imgui.OnInitialize(function()
    fa.Init()
end)

function capture_cmd_register()
    if sampIsChatCommandDefined(ini.AutoCapt.com) then
        sampUnregisterChatCommand(ini.AutoCapt.com)
    end

    sampRegisterChatCommand(ini.AutoCapt.com,function()
        AutoCapterstart = not AutoCapterstart
        printStringNow(AutoCapterstart and "~G~CAPTURE ACTIVATED" or "~R~CAPTURE STOP", 1000)
    end)
end

function flooder_cmd_register()
    if sampIsChatCommandDefined(ini.AutoCapt.flooder_com) then
        sampUnregisterChatCommand(ini.AutoCapt.flooder_com)
    end

	sampRegisterChatCommand(ini.AutoCapt.flooder_com, function(arg)
		if ini.AutoCapt.flooder_status then
		if not flood then msg('Флудер запущен.') end
		if flood then flood = false msg('Флудер остановлен.') return end
		if #arg == 0 or not arg:find('^(.-) (.+)') then return msg('Ошибка, используйте: /flood [sec] [text]') end
		local sec, text = arg:match('^(.-) (.+)')
		if #text == 0 or not tonumber(sec) then return msg('Ошибка, используйте: /flood [sec] [text]') end
		flooder(tonumber(sec), text)
		end
	end)
end

imgui.ToggleButtonText = function(text, bool, is_toggle)
    if imgui.ToggleButton(text, bool) then
        is_toggle()
    end
    imgui.SameLine()
    imgui.SetCursorPosY(imgui.GetCursorPosY()+1)
    imgui.TextColoredRGB((not bool[0] and "{525252}" or "")..text)
end


function imgui.TextColoredRGB(text)
    local style = imgui.GetStyle()
    local colors = style.Colors
    local ImVec4 = imgui.ImVec4

    local explode_argb = function(argb)
        local a = bit.band(bit.rshift(argb, 24), 0xFF)
        local r = bit.band(bit.rshift(argb, 16), 0xFF)
        local g = bit.band(bit.rshift(argb, 8), 0xFF)
        local b = bit.band(argb, 0xFF)
        return a, r, g, b
    end

    local getcolor = function(color)
        if color:sub(1, 6):upper() == 'SSSSSS' then
            local r, g, b = colors[1].x, colors[1].y, colors[1].z
            local a = tonumber(color:sub(7, 8), 16) or colors[1].w * 255
            return ImVec4(r, g, b, a / 255)
        end
        local color = type(color) == 'string' and tonumber(color, 16) or color
        if type(color) ~= 'number' then return end
        local r, g, b, a = explode_argb(color)
        return imgui.ImVec4(r/255, g/255, b/255, a/255)
    end

    local render_text = function(text_)
        for w in text_:gmatch('[^\r\n]+') do
            local text, colors_, m = {}, {}, 1
            w = w:gsub('{(......)}', '{%1FF}')
            while w:find('{........}') do
                local n, k = w:find('{........}')
                local color = getcolor(w:sub(n + 1, k - 1))
                if color then
                    text[#text], text[#text + 1] = w:sub(m, n - 1), w:sub(k + 1, #w)
                    colors_[#colors_ + 1] = color
                    m = n
                end
                w = w:sub(1, n - 1) .. w:sub(k + 1, #w)
            end
            if text[0] then
                for i = 0, #text do
                    imgui.TextColored(colors_[i] or colors[1], text[i])
                    imgui.SameLine(nil, 0)
                end
                imgui.NewLine()
            else imgui.Text(w) end
        end
    end

    render_text(text)
end


function getTextdrawByPos(x,y)
    for a = 0, 2304 do
        if sampTextdrawIsExists(a) then
            local x1, y1 = sampTextdrawGetPos(a)
            if math.ceil(x1) == x and math.ceil(y1) == y then
                return true, a
            end
        end
    end
    return false, -1
end


function mimguiStyle()
    local style = imgui.GetStyle();
    local colors = style.Colors;
    style.Alpha = 1;
    style.WindowPadding = imgui.ImVec2(8.00, 8.00);
    style.WindowRounding = 7;
    style.WindowBorderSize = 1;
    style.WindowMinSize = imgui.ImVec2(32.00, 32.00);
    style.WindowTitleAlign = imgui.ImVec2(0.5, 0.5)
    style.ChildRounding = 0;
    style.ChildBorderSize = 1;
    style.PopupRounding = 0;
    style.PopupBorderSize = 1;
    style.FramePadding = imgui.ImVec2(4.00, 3.00);
    style.FrameRounding = 0;
    style.FrameBorderSize = 0;
    style.ItemSpacing = imgui.ImVec2(8.00, 4.00);
    style.ItemInnerSpacing = imgui.ImVec2(4.00, 4.00);
    style.IndentSpacing = 21;
    style.ScrollbarSize = 14;
    style.ScrollbarRounding = 9;
    style.GrabMinSize = 10;
    style.GrabRounding = 0;
    style.TabRounding = 4;
    style.ButtonTextAlign = imgui.ImVec2(0.50, 0.50);
    style.SelectableTextAlign = imgui.ImVec2(0.00, 0.00);
    colors[imgui.Col.Text] = imgui.ImVec4(1.00, 1.00, 1.00, 1.00);
    colors[imgui.Col.TextDisabled] = imgui.ImVec4(0.50, 0.50, 0.50, 1.00);
    colors[imgui.Col.WindowBg] = imgui.ImVec4(0.06, 0.06, 0.06, 0.94);
    colors[imgui.Col.ChildBg] = imgui.ImVec4(0.00, 0.00, 0.00, 0.00);
    colors[imgui.Col.PopupBg] = imgui.ImVec4(0.08, 0.08, 0.08, 0.94);
    colors[imgui.Col.Border] = imgui.ImVec4(0.43, 0.43, 0.50, 0.50);
    colors[imgui.Col.BorderShadow] = imgui.ImVec4(0.00, 0.00, 0.00, 0.00);
    colors[imgui.Col.FrameBg] = imgui.ImVec4(0.35, 0.37, 0.39, 0.54);
    colors[imgui.Col.FrameBgHovered] = imgui.ImVec4(0.34, 0.35, 0.35, 0.40);
    colors[imgui.Col.FrameBgActive] = imgui.ImVec4(0.45, 0.45, 0.45, 0.67);
    colors[imgui.Col.TitleBg] = imgui.ImVec4(0.04, 0.04, 0.04, 1.00);
    colors[imgui.Col.TitleBgActive] = imgui.ImVec4(0.27, 0.27, 0.27, 1.00);
    colors[imgui.Col.TitleBgCollapsed] = imgui.ImVec4(0.00, 0.00, 0.00, 0.51);
    colors[imgui.Col.MenuBarBg] = imgui.ImVec4(0.14, 0.14, 0.14, 1.00);
    colors[imgui.Col.ScrollbarBg] = imgui.ImVec4(0.02, 0.02, 0.02, 0.53);
    colors[imgui.Col.ScrollbarGrab] = imgui.ImVec4(0.31, 0.31, 0.31, 1.00);
    colors[imgui.Col.ScrollbarGrabHovered] = imgui.ImVec4(0.41, 0.41, 0.41, 1.00);
    colors[imgui.Col.ScrollbarGrabActive] = imgui.ImVec4(0.51, 0.51, 0.51, 1.00);
    colors[imgui.Col.CheckMark] = imgui.ImVec4(1.00, 1.00, 1.00, 1.00);
    colors[imgui.Col.SliderGrab] = imgui.ImVec4(1.00, 1.00, 1.00, 1.00);
    colors[imgui.Col.SliderGrabActive] = imgui.ImVec4(1.00, 1.00, 1.00, 1.00);
    colors[imgui.Col.Button] = imgui.ImVec4(0.53, 0.53, 0.53, 0.40);
    colors[imgui.Col.ButtonHovered] = imgui.ImVec4(0.19, 0.19, 0.19, 1.00);
    colors[imgui.Col.ButtonActive] = imgui.ImVec4(0.41, 0.41, 0.41, 1.00);
    colors[imgui.Col.Header] = imgui.ImVec4(0.56, 0.56, 0.56, 0.31);
    colors[imgui.Col.HeaderHovered] = imgui.ImVec4(0.39, 0.39, 0.39, 0.80);
    colors[imgui.Col.HeaderActive] = imgui.ImVec4(0.43, 0.43, 0.43, 1.00);
    colors[imgui.Col.Separator] = imgui.ImVec4(0.43, 0.43, 0.50, 0.50);
    colors[imgui.Col.SeparatorHovered] = imgui.ImVec4(0.48, 0.48, 0.48, 0.78);
    colors[imgui.Col.SeparatorActive] = imgui.ImVec4(0.26, 0.26, 0.26, 1.00);
    colors[imgui.Col.ResizeGrip] = imgui.ImVec4(0.40, 0.40, 0.40, 0.25);
    colors[imgui.Col.ResizeGripHovered] = imgui.ImVec4(0.51, 0.51, 0.51, 0.67);
    colors[imgui.Col.ResizeGripActive] = imgui.ImVec4(0.50, 0.50, 0.50, 0.95);
    colors[imgui.Col.Tab] = imgui.ImVec4(0.36, 0.36, 0.36, 0.86);
    colors[imgui.Col.TabHovered] = imgui.ImVec4(0.45, 0.45, 0.45, 0.80);
    colors[imgui.Col.TabActive] = imgui.ImVec4(0.51, 0.51, 0.51, 1.00);
    colors[imgui.Col.TabUnfocused] = imgui.ImVec4(0.07, 0.10, 0.15, 0.97);
    colors[imgui.Col.TabUnfocusedActive] = imgui.ImVec4(0.14, 0.26, 0.42, 1.00);
    colors[imgui.Col.PlotLines] = imgui.ImVec4(0.61, 0.61, 0.61, 1.00);
    colors[imgui.Col.PlotLinesHovered] = imgui.ImVec4(1.00, 0.43, 0.35, 1.00);
    colors[imgui.Col.PlotHistogram] = imgui.ImVec4(0.90, 0.70, 0.00, 1.00);
    colors[imgui.Col.PlotHistogramHovered] = imgui.ImVec4(1.00, 0.60, 0.00, 1.00);
    colors[imgui.Col.TextSelectedBg] = imgui.ImVec4(0.26, 0.59, 0.98, 0.35);
    colors[imgui.Col.DragDropTarget] = imgui.ImVec4(1.00, 1.00, 0.00, 0.90);
    colors[imgui.Col.NavHighlight] = imgui.ImVec4(0.26, 0.59, 0.98, 1.00);
    colors[imgui.Col.NavWindowingHighlight] = imgui.ImVec4(1.00, 1.00, 1.00, 0.70);
    colors[imgui.Col.NavWindowingDimBg] = imgui.ImVec4(0.80, 0.80, 0.80, 0.20);
    colors[imgui.Col.ModalWindowDimBg] = imgui.ImVec4(0.80, 0.80, 0.80, 0.35);
end



function imgui.CenterText(text)
	imgui.SetCursorPosX(imgui.GetWindowWidth()/2-imgui.CalcTextSize(u8(text)).x/2)
	imgui.Text(text)
end

function msg(text)
sampAddChatMessage("{C0C0C0}[Palenation Tool Extended]{FFFFFF} "..text, -1)
end

function onWindowMessage(msg, wparam, lparam)
    if msg == 0x100 or msg == 0x101 then
        if wparam == keys.VK_ESCAPE and Menu[0] then
            consumeWindowMessage(true, false)
            if msg == 0x101 then Menu[0] = false end
        end
		if wparam == keys.VK_ESCAPE and Menu2[0] then
            consumeWindowMessage(true, false)
            if msg == 0x101 then Menu2[0] = false end
        end
    end
end

function argb2abgr(arg_23_0)
	return (bit.bor(bit.lshift(bit.band(bit.rshift(arg_23_0, 24), 255), 24), bit.lshift(bit.band(arg_23_0, 255), 16), bit.lshift(bit.band(bit.rshift(arg_23_0, 8), 255), 8), bit.band(bit.rshift(arg_23_0, 16), 255)))
end

function HelpAC()
	bizcombo = {
		"1. Palomino Creek 1"..cb1,
		"2. Palomino Creek 2"..cb2,
		"3. Palomino Creek 3"..cb3, 
		"4. Palomino Creek 4"..cb4,
		"5. Dillimore 1"..cb5,
		"6. Dillimore 2"..cb6,
		"7. Dillimore 3"..cb7,
		"8. Blueberry 1"..cb8,
		"9. Blueberry 2"..cb9,
		"10. Blueberry 3"..cb10,
		"11. Montgomery 1"..cb11,
		"12. Montgomery 2"..cb12,
		"13. Montgomery 3"..cb13,
		"14. Montgomery 4"..cb14,
		"15. Fort Carson 1"..cb15,
		"16. Fort Carson 2"..cb16,
		"17. Fort Carson 3"..cb17,
		"18. Fort Carson 4"..cb18,
		"19. Fort Carson 5"..cb19,
		"20. Fort Carson 6"..cb20,
		"21. El Quebrados 1"..cb21,
		"22. El Quebrados 2"..cb22,
		"23. El Quebrados 3"..cb23,
		"24. El Quebrados 4"..cb24,
		"25. Las Barrancas 1"..cb25,
		"26. Las Barrancas 2"..cb26,
		"27. Angel Pine 1"..cb27,
		"28. Angel Pine 2"..cb28,
	}
	biz_combo = imgui.new['const char*'][#bizcombo](bizcombo)
end

function flooder(sec, text)
	flood = not flood
	lua_thread.create(function()
		while flood do
			sampSendChat(text)
			wait(sec*1000)
		end
	end)
end
function hextoargb(hex)
    local hex = hex:gsub("#","")
    r = tonumber("0x"..hex:sub(1,2))
    g = tonumber("0x"..hex:sub(3,4))
    b = tonumber("0x"..hex:sub(5,6))
    a = tonumber("0x"..hex:sub(7,8))
    
    if a == nil then a = 255 end
    return a,r,g,b
end

function imgui.TextQuestion(label, description)
    imgui.TextDisabled(label)

    if imgui.IsItemHovered() then
        imgui.BeginTooltip()
            imgui.PushTextWrapPos(600)
                imgui.TextUnformatted(description)
            imgui.PopTextWrapPos()
        imgui.EndTooltip()
    end
end

-- Текст принимает как есть, для кирилицы используйте библиотеку encoding
-- Время можно указывать с милисекундами, например 5.543
-- Стили:
-- 1 - Черный, простые сообщения
-- 2 - Синий/голубой - Информационные сообщения
-- 3 - Красный - Ошибки
-- В качестве параметра принимается таблица пользовательского стиля, к примеру:

------------>> SCRIPT UTF-8
------------>> utf8(table path, incoming variables encoding, outcoming variables encoding)
------------>> table path example { "sampev", "onShowDialog" }
------------>> encoding options nil | AnsiToUtf8 | Utf8ToAnsi

_utf8 = load([=[return function(utf8_func, in_encoding, out_encoding); if encoding == nil then; encoding = require("encoding"); encoding.default = "CP1251"; u8 = encoding.UTF8; end; if type(utf8_func) ~= "table" then; return false; end; if AnsiToUtf8 == nil or Utf8ToAnsi == nil then; AnsiToUtf8 = function(text); return u8(text); end; Utf8ToAnsi = function(text); return u8:decode(text); end; end; if _UTF8_FUNCTION_SAVE == nil then; _UTF8_FUNCTION_SAVE = {}; end; local change_var = "_G"; for s = 1, #utf8_func do; change_var = string.format('%s["%s"]', change_var, utf8_func[s]); end; if _UTF8_FUNCTION_SAVE[change_var] == nil then; _UTF8_FUNCTION = function(...); local pack = table.pack(...); readTable = function(t, enc); for k, v in next, t do; if type(v) == 'table' then; readTable(v, enc); else; if enc ~= nil and (enc == "AnsiToUtf8" or enc == "Utf8ToAnsi") then; if type(k) == "string" then; k = _G[enc](k); end; if type(v) == "string" then; t[k] = _G[enc](v); end; end; end; end; return t; end; return table.unpack(readTable({_UTF8_FUNCTION_SAVE[change_var](table.unpack(readTable(pack, in_encoding)))}, out_encoding)); end; local text = string.format("_UTF8_FUNCTION_SAVE['%s'] = %s; %s = _UTF8_FUNCTION;", change_var, change_var, change_var); load(text)(); _UTF8_FUNCTION = nil; end; return true; end]=])
function utf8(...)
    pcall(_utf8(), ...)
end
utf8({ "sampShowDialog" }, "Utf8ToAnsi")
utf8({ "sampSendChat" }, "Utf8ToAnsi")
utf8({ "renderFontDrawText" }, "Utf8ToAnsi")
utf8({ "sampAddChatMessage" }, "Utf8ToAnsi")
utf8({ "sampAddChatMessage" }, "Utf8ToAnsi")
utf8({ "print" }, "Utf8ToAnsi")
utf8({ "renderGetFontDrawTextLength" }, "Utf8ToAnsi")
utf8({ "sampSetCurrentDialogEditboxText" }, "Utf8ToAnsi")
utf8({ "sampHasDialogRespond" }, nil, "AnsiToUtf8")
utf8({ "sampGetDialogCaption" }, nil, "AnsiToUtf8")
utf8({ "sampev", "onServerMessage" }, "AnsiToUtf8", "Utf8ToAnsi")
utf8({ "sampev", "onShowTextDraw" }, "AnsiToUtf8", "Utf8ToAnsi")
utf8({ "sampev", "onShowDialog" }, "AnsiToUtf8", "Utf8ToAnsi")