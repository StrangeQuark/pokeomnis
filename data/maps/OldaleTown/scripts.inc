
OldaleTown_MapScripts::
	map_script MAP_SCRIPT_ON_TRANSITION, OldaleTown_OnTransition
	.byte 0

OldaleTown_OnTransition:
	setflag FLAG_VISITED_OLDALE_TOWN
	end

OldaleTown_EventScript_TownSign::
	msgbox OldaleTown_Text_TownSign, MSGBOX_SIGN
	end

OldaleTown_EventScript_RivalsHouseSign::
	msgbox OldaleTown_Text_RivalsHouseSign, MSGBOX_SIGN
	end

OldaleTown_EventScript_BagIsFull::
	msgbox gText_TooBadBagIsFull, MSGBOX_DEFAULT
	fadedefaultbgm
	release
	end

OldaleTown_Text_TownSign:
	.string "OLDALE TOWN\n"
	.string "“Where things start off scarce.”$"

OldaleTown_Text_RivalsHouseSign:
	.string "{RIVAL}'S HOUSE$"
