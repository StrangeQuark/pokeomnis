.set LOCALID_RIVAL, 1

LittlerootTown_PlayersHouse_2F_MapScripts::
	map_script MAP_SCRIPT_ON_TRANSITION, LittlerootTown_PlayersHouse_2F_OnTransition
	map_script MAP_SCRIPT_ON_WARP_INTO_MAP_TABLE, LittlerootTown_PlayersHouse_2F_OnWarp
	.byte 0

LittlerootTown_PlayersHouse_2F_OnTransition:
	call_if_eq VAR_INTRO_STATE, 4, PlayersHouse_2F_EventScript_BlockStairsUntilClockIsSet
	call SecretBase_EventScript_SetDecorationFlags
	setvar VAR_SECRET_BASE_INITIALIZED, 0
	end

LittlerootTown_PlayersHouse_2F_OnWarp:
	map_script_2 VAR_SECRET_BASE_INITIALIZED, 0, LittlerootTown_PlayersHouse_2F_EventScript_CheckInitDecor
	.2byte 0

LittlerootTown_PlayersHouse_2F_EventScript_CheckInitDecor::
	checkplayergender
	goto_if_eq VAR_RESULT, MALE, SecretBase_EventScript_InitDecorations
	end

LittlerootTown_PlayersHouse_2F_EventScript_PC::
	lockall
	checkplayergender
	goto_if_eq VAR_RESULT, MALE, LittlerootTown_PlayersHouse_2F_EventScript_CheckPlayersPC
	goto_if_eq VAR_RESULT, FEMALE, LittlerootTown_PlayersHouse_2F_EventScript_CheckRivalsPC
	end

LittlerootTown_PlayersHouse_2F_EventScript_CheckPlayersPC::
	setvar VAR_0x8004, PC_LOCATION_BRENDANS_HOUSE
	special DoPCTurnOnEffect
	playse SE_PC_ON
	msgbox gText_PlayerHouseBootPC, MSGBOX_DEFAULT
	special BedroomPC
	waitstate
	releaseall
	end

LittlerootTown_PlayersHouse_2F_EventScript_TurnOffPlayerPC::
	setvar VAR_0x8004, PC_LOCATION_BRENDANS_HOUSE
	playse SE_PC_OFF
	special DoPCTurnOffEffect
	releaseall
	end

LittlerootTown_PlayersHouse_2F_EventScript_CheckRivalsPC::
	msgbox gText_PokemonTrainerSchoolEmail, MSGBOX_DEFAULT
	releaseall
	end

PlayersHouse_2F_EventScript_Notebook::
	msgbox PlayersHouse_2F_Text_Notebook, MSGBOX_SIGN
	end

PlayersHouse_2F_EventScript_GameCube::
	msgbox PlayersHouse_2F_Text_ItsAGameCube, MSGBOX_SIGN
	end

PlayersHouse_2F_Text_ClockIsStopped:
	.string "The clock is stopped…\p"
	.string "Better set it and start it!$"

PlayersHouse_2F_Text_Notebook:
	.string "{PLAYER} flipped open the notebook.\p"
	.string "ADVENTURE RULE NO. 1\n"
	.string "Open the MENU with START.\p"
	.string "ADVENTURE RULE NO. 2\n"
	.string "Record your progress with SAVE.\p"
	.string "The remaining pages are blank…$"

Common_Text_LookCloserAtMap:
	.string "{PLAYER} took a closer look at the\n"
	.string "HOENN region map.$"

Common_Text_LookCloserAtMapKanto:
	.string "{PLAYER} took a closer look at the\n"
	.string "KANTO region map.$"

Common_Text_LookCloserAtMapJohto:
	.string "{PLAYER} took a closer look at the\n"
	.string "JOHTO region map.$"

Common_Text_LookCloserAtMapSevii:
	.string "{PLAYER} took a closer look at the\n"
	.string "SEVII ISLES map.$"

PlayersHouse_2F_Text_ItsAGameCube:
	.string "It's a Nintendo GameCube.\p"
	.string "A Game Boy Advance is connected to\n"
	.string "serve as the Controller.$"
