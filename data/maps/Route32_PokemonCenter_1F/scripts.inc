.set LOCALID_NURSE, 1

Route32_PokemonCenter_1F_MapScripts::
	map_script MAP_SCRIPT_ON_TRANSITION, Route32_PokemonCenter_1F_OnTransition
	map_script MAP_SCRIPT_ON_RESUME, CableClub_OnResume
	.byte 0

Route32_PokemonCenter_1F_OnTransition:
	setrespawn HEAL_LOCATION_ROUTE32
	end

Route32_PokemonCenter_1F_EventScript_Nurse::
	setvar VAR_0x800B, LOCALID_NURSE
	call Common_EventScript_KantoPkmnCenterNurse
	waitmessage
	waitbuttonpress
	release
	end
