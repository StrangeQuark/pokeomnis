.set LOCALID_NURSE, 1

CianwoodCity_PokemonCenter_1F_MapScripts::
	map_script MAP_SCRIPT_ON_TRANSITION, CianwoodCity_PokemonCenter_1F_OnTransition
	map_script MAP_SCRIPT_ON_RESUME, CableClub_OnResume
	.byte 0

CianwoodCity_PokemonCenter_1F_OnTransition:
	setrespawn HEAL_LOCATION_CIANWOOD_CITY
	end

CianwoodCity_PokemonCenter_1F_EventScript_Nurse::
	setvar VAR_0x800B, LOCALID_NURSE
	call Common_EventScript_KantoPkmnCenterNurse
	waitmessage
	waitbuttonpress
	release
	end
