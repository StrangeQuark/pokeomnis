.set LOCALID_CAPT_STERN, 4
.set LOCALID_SS_TIDAL, 5
.set LOCALID_GRUNT, 6
.set LOCALID_ARCHIE, 7
.set LOCALID_SUBMARINE, 8

SlateportCity_Harbor_MapScripts::
	map_script MAP_SCRIPT_ON_TRANSITION, SlateportCity_Harbor_OnTransition
	.byte 0

SlateportCity_Harbor_OnTransition:
	setescapewarp MAP_SLATEPORT_CITY, 28, 13
	setvar VAR_TEMP_1, 0
	clearflag FLAG_HIDE_SLATEPORT_CITY_HARBOR_SS_TIDAL
	end

SlateportCity_Harbor_EventScript_FerryAttendant::
	lock
	faceplayer
	goto_if_unset FLAG_SYS_GAME_CLEAR, SlateportCity_Harbor_EventScript_FerryUnavailable
	call SlateportCity_Harbor_EventScript_GetEonTicketState
	call SlateportCity_Harbor_EventScript_GetAuroraTicketState
	call SlateportCity_Harbor_EventScript_GetOldSeaMapState
	call SlateportCity_Harbor_EventScript_GetMysticTicketState
	call SlateportCity_Harbor_EventScript_GetFirstTimeShowingTicket
	call SlateportCity_Harbor_EventScript_GetHasTicketsState
	goto_if_eq VAR_TEMP_C, 2, SlateportCity_Harbor_EventScript_OldSeaMapFirstTime
	goto_if_eq VAR_TEMP_B, 1, SlateportCity_Harbor_EventScript_EonTicketFirstTime
	goto_if_eq VAR_TEMP_B, 2, SlateportCity_Harbor_EventScript_AuroraTicketFirstTime
	goto_if_eq VAR_TEMP_B, 4, SlateportCity_Harbor_EventScript_OldSeaMapFirstTime
	goto_if_eq VAR_TEMP_B, 8, SlateportCity_Harbor_EventScript_MysticTicketFirstTime
	goto_if_ne VAR_TEMP_B, 0, SlateportCity_Harbor_EventScript_MultipleEventTicketsFirstTime
	goto SlateportCity_Harbor_EventScript_NoFirstTimeEventTickets
	end

@ First goto_if_eq is unnecessary; identical scripts
SlateportCity_Harbor_EventScript_NoFirstTimeEventTickets::
	goto_if_eq VAR_TEMP_A, 0, SlateportCity_Harbor_EventScript_NoEventTickets
	msgbox SlateportCity_Harbor_Text_MayISeeYourTicket, MSGBOX_DEFAULT
	message SlateportCity_Harbor_Text_FlashTicketWhereTo
	waitmessage
	goto SlateportCity_Harbor_EventScript_FerryRegularLocationSelect
	end

SlateportCity_Harbor_EventScript_FerryRegularLocationSelect::
	setvar VAR_0x8004, 0
	special ScriptMenu_CreateSlateportSSTidalMultichoice
	waitstate
	special GetSlateportSSTidalSelection
	switch VAR_RESULT
	case 0, SlateportCity_Harbor_EventScript_GoToLilycove
	case 1, SlateportCity_Harbor_EventScript_GoToVermilion
	case 2, SlateportCity_Harbor_EventScript_GoToOlivine
	case 3, SlateportCity_Harbor_EventScript_GoToSevii
	case 4, SlateportCity_Harbor_EventScript_GoToBattleFrontier
	case 5, SlateportCity_Harbor_EventScript_GoToSouthernIsland
	case 6, SlateportCity_Harbor_EventScript_GoToNavelRock
	case 7, SlateportCity_Harbor_EventScript_GoToBirthIsland
	case 8, SlateportCity_Harbor_EventScript_GoToFarawayIsland
	case 9, SlateportCity_Harbor_EventScript_ExitSailSelect
	case MULTI_B_PRESSED, SlateportCity_Harbor_EventScript_ExitSailSelect
	end

SlateportCity_Harbor_EventScript_GoToSouthernIsland::
	call SlateportCity_Harbor_EventScript_BoardFerry
	warp MAP_SOUTHERN_ISLAND_EXTERIOR, 13, 22
	waitstate
	release
	end

SlateportCity_Harbor_EventScript_GoToNavelRock::
	call SlateportCity_Harbor_EventScript_BoardFerry
	warp MAP_NAVEL_ROCK_HARBOR, 8, 4
	waitstate
	release
	end

SlateportCity_Harbor_EventScript_GoToBirthIsland::
	call SlateportCity_Harbor_EventScript_BoardFerry
	warp MAP_BIRTH_ISLAND_HARBOR, 8, 4
	waitstate
	release
	end

SlateportCity_Harbor_EventScript_GoToFarawayIsland::
	call SlateportCity_Harbor_EventScript_BoardFerry
	warp MAP_FARAWAY_ISLAND_ENTRANCE, 13, 38
	waitstate
	release
	end

SlateportCity_Harbor_EventScript_GoToBattleFrontier::
	msgbox SlateportCity_Harbor_Text_BattleFrontierItIs, MSGBOX_YESNO
	goto_if_eq VAR_RESULT, NO, SlateportCity_Harbor_EventScript_FerryDestinationChangeMind
	call SlateportCity_Harbor_EventScript_BoardFerry
	warp MAP_BATTLE_FRONTIER_OUTSIDE_WEST, 19, 67
	waitstate
	release
	end

SlateportCity_Harbor_EventScript_GoToVermilion::
	msgbox SlateportCity_Harbor_Text_VermilionItIs, MSGBOX_YESNO
	compare VAR_RESULT, NO
	goto_if_eq SlateportCity_Harbor_EventScript_FerryDestinationChangeMind
	setvar VAR_SS_TIDAL_STATE, SS_TIDAL_BOARD_LILYCOVE
	call SlateportCity_Harbor_EventScript_BoardFerry
	warp MAP_SSANNE_EXTERIOR, 255, 32, 13
	waitstate
	release
	end

SlateportCity_Harbor_EventScript_GoToLilycove::
	msgbox SlateportCity_Harbor_Text_LilycoveItIs, MSGBOX_YESNO
	compare VAR_RESULT, NO
	goto_if_eq SlateportCity_Harbor_EventScript_FerryDestinationChangeMind
	setvar VAR_SS_TIDAL_STATE, SS_TIDAL_BOARD_LILYCOVE
	call SlateportCity_Harbor_EventScript_BoardFerry
	warp MAP_LILYCOVE_CITY_HARBOR, 255, 8, 11
	waitstate
	release
	end

SlateportCity_Harbor_EventScript_GoToOlivine::
	msgbox TwoIsland_Harbor_Text_OlivineItIs, MSGBOX_YESNO
	compare VAR_RESULT, NO
	goto_if_eq TwoIsland_Harbor_EventScript_FerryDestinationChangeMind
	setvar VAR_SS_TIDAL_STATE, SS_TIDAL_BOARD_LILYCOVE
	call TwoIsland_Harbor_EventScript_BoardFerry
	warp MAP_OLIVINE_CITY_HARBOR, 255, 8, 5
	waitstate
	release
	end

SlateportCity_Harbor_EventScript_GoToSevii::
	setvar VAR_0x8004, 0
	special ScriptMenu_CreateLilycoveSSTidalSeviiMultichoice
	waitstate
	special GetLilycoveSSTidalSeviiSelection
	switch VAR_RESULT
	case 0, SlateportCity_Harbor_EventScript_GoToSevii1
	case 1, SlateportCity_Harbor_EventScript_GoToSevii2
	case 2, SlateportCity_Harbor_EventScript_GoToSevii3
	case 3, SlateportCity_Harbor_EventScript_GoToSevii4
	case 4, SlateportCity_Harbor_EventScript_GoToSevii5
	case 5, SlateportCity_Harbor_EventScript_GoToSevii6
	case 6, SlateportCity_Harbor_EventScript_GoToSevii7
	case 7, SlateportCity_Harbor_EventScript_ExitSailSelect
	case MULTI_B_PRESSED, SlateportCity_Harbor_EventScript_ExitSailSelect
	end

SlateportCity_Harbor_EventScript_GoToSevii1::
	msgbox SlateportCity_Harbor_Text_Sevii1ItIs, MSGBOX_YESNO
	compare VAR_RESULT, NO
	goto_if_eq SlateportCity_Harbor_EventScript_FerryDestinationChangeMind
	setvar VAR_SS_TIDAL_STATE, SS_TIDAL_BOARD_LILYCOVE
	call SlateportCity_Harbor_EventScript_BoardFerry
	warp MAP_ONE_ISLAND_HARBOR, 255, 8, 5
	waitstate
	release
	end

SlateportCity_Harbor_EventScript_GoToSevii2::
	msgbox SlateportCity_Harbor_Text_Sevii2ItIs, MSGBOX_YESNO
	compare VAR_RESULT, NO
	goto_if_eq SlateportCity_Harbor_EventScript_FerryDestinationChangeMind
	setvar VAR_SS_TIDAL_STATE, SS_TIDAL_BOARD_LILYCOVE
	call SlateportCity_Harbor_EventScript_BoardFerry
	warp MAP_TWO_ISLAND_HARBOR, 255, 8, 5
	waitstate
	release
	end

SlateportCity_Harbor_EventScript_GoToSevii3::
	msgbox SlateportCity_Harbor_Text_Sevii3ItIs, MSGBOX_YESNO
	compare VAR_RESULT, NO
	goto_if_eq SlateportCity_Harbor_EventScript_FerryDestinationChangeMind
	setvar VAR_SS_TIDAL_STATE, SS_TIDAL_BOARD_LILYCOVE
	call SlateportCity_Harbor_EventScript_BoardFerry
	warp MAP_THREE_ISLAND_HARBOR, 255, 8, 5
	waitstate
	release
	end

SlateportCity_Harbor_EventScript_GoToSevii4::
	msgbox SlateportCity_Harbor_Text_Sevii4ItIs, MSGBOX_YESNO
	compare VAR_RESULT, NO
	goto_if_eq SlateportCity_Harbor_EventScript_FerryDestinationChangeMind
	setvar VAR_SS_TIDAL_STATE, SS_TIDAL_BOARD_LILYCOVE
	call SlateportCity_Harbor_EventScript_BoardFerry
	warp MAP_FOUR_ISLAND_HARBOR, 255, 8, 5
	waitstate
	release
	end

SlateportCity_Harbor_EventScript_GoToSevii5::
	msgbox SlateportCity_Harbor_Text_Sevii5ItIs, MSGBOX_YESNO
	compare VAR_RESULT, NO
	goto_if_eq SlateportCity_Harbor_EventScript_FerryDestinationChangeMind
	setvar VAR_SS_TIDAL_STATE, SS_TIDAL_BOARD_LILYCOVE
	call SlateportCity_Harbor_EventScript_BoardFerry
	warp MAP_FIVE_ISLAND_HARBOR, 255, 8, 5
	waitstate
	release
	end

SlateportCity_Harbor_EventScript_GoToSevii6::
	msgbox SlateportCity_Harbor_Text_Sevii6ItIs, MSGBOX_YESNO
	compare VAR_RESULT, NO
	goto_if_eq SlateportCity_Harbor_EventScript_FerryDestinationChangeMind
	setvar VAR_SS_TIDAL_STATE, SS_TIDAL_BOARD_LILYCOVE
	call SlateportCity_Harbor_EventScript_BoardFerry
	warp MAP_SIX_ISLAND_HARBOR, 255, 8, 5
	waitstate
	release
	end

SlateportCity_Harbor_EventScript_GoToSevii7::
	msgbox SlateportCity_Harbor_Text_Sevii7ItIs, MSGBOX_YESNO
	compare VAR_RESULT, NO
	goto_if_eq SlateportCity_Harbor_EventScript_FerryDestinationChangeMind
	setvar VAR_SS_TIDAL_STATE, SS_TIDAL_BOARD_LILYCOVE
	call SlateportCity_Harbor_EventScript_BoardFerry
	warp MAP_SEVEN_ISLAND_HARBOR, 255, 8, 5
	waitstate
	release
	end

SlateportCity_Harbor_EventScript_GetEonTicketState::
	setvar VAR_TEMP_E, 0
	goto_if_unset FLAG_ENABLE_SHIP_SOUTHERN_ISLAND, Common_EventScript_NopReturn
	checkitem ITEM_EON_TICKET
	goto_if_eq VAR_RESULT, FALSE, Common_EventScript_NopReturn
	setvar VAR_TEMP_E, 1
	goto_if_set FLAG_SHOWN_EON_TICKET, Common_EventScript_NopReturn
	setvar VAR_TEMP_E, 2
	return

SlateportCity_Harbor_EventScript_GetAuroraTicketState::
	setvar VAR_TEMP_D, 0
	goto_if_unset FLAG_ENABLE_SHIP_BIRTH_ISLAND, Common_EventScript_NopReturn
	checkitem ITEM_AURORA_TICKET
	goto_if_eq VAR_RESULT, FALSE, Common_EventScript_NopReturn
	setvar VAR_TEMP_D, 1
	goto_if_set FLAG_SHOWN_AURORA_TICKET, Common_EventScript_NopReturn
	setvar VAR_TEMP_D, 2
	return

SlateportCity_Harbor_EventScript_GetOldSeaMapState::
	setvar VAR_TEMP_C, 0
	goto_if_unset FLAG_ENABLE_SHIP_FARAWAY_ISLAND, Common_EventScript_NopReturn
	checkitem ITEM_OLD_SEA_MAP
	goto_if_eq VAR_RESULT, FALSE, Common_EventScript_NopReturn
	setvar VAR_TEMP_C, 1
	goto_if_set FLAG_SHOWN_OLD_SEA_MAP, Common_EventScript_NopReturn
	setvar VAR_TEMP_C, 2
	return

SlateportCity_Harbor_EventScript_GetMysticTicketState::
	setvar VAR_TEMP_9, 0
	goto_if_unset FLAG_ENABLE_SHIP_NAVEL_ROCK, Common_EventScript_NopReturn
	checkitem ITEM_MYSTIC_TICKET
	goto_if_eq VAR_RESULT, FALSE, Common_EventScript_NopReturn
	setvar VAR_TEMP_9, 1
	goto_if_set FLAG_SHOWN_MYSTIC_TICKET, Common_EventScript_NopReturn
	setvar VAR_TEMP_9, 2
	return

SlateportCity_Harbor_EventScript_GetFirstTimeShowingTicket::
	setvar VAR_TEMP_B, 0
	call_if_eq VAR_TEMP_E, 2, SlateportCity_Harbor_EventScript_SetFirstTimeShowingEonTicket
	call_if_eq VAR_TEMP_D, 2, SlateportCity_Harbor_EventScript_SetFirstTimeShowingAuroraTicket
	call_if_eq VAR_TEMP_C, 2, SlateportCity_Harbor_EventScript_SetFirstTimeShowingOldSeaMap
	call_if_eq VAR_TEMP_9, 2, SlateportCity_Harbor_EventScript_SetFirstTimeShowingMysticTicket
	return

SlateportCity_Harbor_EventScript_SetFirstTimeShowingEonTicket::
	addvar VAR_TEMP_B, 1
	return

SlateportCity_Harbor_EventScript_SetFirstTimeShowingAuroraTicket::
	addvar VAR_TEMP_B, 2
	return

SlateportCity_Harbor_EventScript_SetFirstTimeShowingOldSeaMap::
	addvar VAR_TEMP_B, 4
	return

SlateportCity_Harbor_EventScript_SetFirstTimeShowingMysticTicket::
	addvar VAR_TEMP_B, 8
	return

SlateportCity_Harbor_EventScript_GetHasTicketsState::
	setvar VAR_TEMP_A, 0
	call_if_eq VAR_TEMP_E, 1, SlateportCity_Harbor_EventScript_SetHasEonTicket
	call_if_eq VAR_TEMP_D, 1, SlateportCity_Harbor_EventScript_SetHasAuroraTicket
	call_if_eq VAR_TEMP_C, 1, SlateportCity_Harbor_EventScript_SetHasOldSeaMap
	call_if_eq VAR_TEMP_9, 1, SlateportCity_Harbor_EventScript_SetHasMysticTicket
	return

SlateportCity_Harbor_EventScript_SetHasEonTicket::
	addvar VAR_TEMP_A, 1
	return

SlateportCity_Harbor_EventScript_SetHasAuroraTicket::
	addvar VAR_TEMP_A, 2
	return

SlateportCity_Harbor_EventScript_SetHasOldSeaMap::
	addvar VAR_TEMP_A, 4
	return

SlateportCity_Harbor_EventScript_SetHasMysticTicket::
	addvar VAR_TEMP_A, 8
	return

SlateportCity_Harbor_EventScript_EonTicketFirstTime::
	setflag FLAG_SHOWN_EON_TICKET
	msgbox EventTicket_Text_ThatPass, MSGBOX_DEFAULT
	closemessage
	call SlateportCity_Harbor_EventScript_GetEventTicketSailor
	msgbox EventTicket_Text_ShowEonTicket, MSGBOX_DEFAULT
	goto SlateportCity_Harbor_EventScript_GoToSouthernIslandFirstTime
	end

SlateportCity_Harbor_EventScript_GoToSouthernIslandFirstTime::
	closemessage
	call SlateportCity_Harbor_EventScript_BoardFerryWithSailor
	warp MAP_SOUTHERN_ISLAND_EXTERIOR, 13, 22
	waitstate
	release
	end

SlateportCity_Harbor_EventScript_AuroraTicketFirstTime::
	setflag FLAG_SHOWN_AURORA_TICKET
	msgbox EventTicket_Text_ThatPass, MSGBOX_DEFAULT
	closemessage
	call SlateportCity_Harbor_EventScript_GetEventTicketSailor
	msgbox EventTicket_Text_OddTicketGetOnBoard, MSGBOX_DEFAULT
	goto SlateportCity_Harbor_EventScript_GoToBirthIslandFirstTime
	end

SlateportCity_Harbor_EventScript_GoToBirthIslandFirstTime::
	closemessage
	call SlateportCity_Harbor_EventScript_BoardFerryWithSailor
	warp MAP_BIRTH_ISLAND_HARBOR, 8, 4
	waitstate
	release
	end

SlateportCity_Harbor_EventScript_OldSeaMapFirstTime::
	setflag FLAG_SHOWN_OLD_SEA_MAP
	msgbox EventTicket_Text_ShowOldSeaMap, MSGBOX_DEFAULT
	closemessage
	call SlateportCity_Harbor_EventScript_GetEventTicketSailor
	msgbox EventTicket_Text_OldSeaMapTooFar, MSGBOX_DEFAULT
	closemessage
	applymovement LOCALID_FERRY_SAILOR, Common_Movement_WalkInPlaceFasterUp
	waitmovement 0
	playse SE_PIN
	applymovement LOCALID_FERRY_SAILOR, Common_Movement_ExclamationMark
	waitmovement 0
	applymovement LOCALID_FERRY_SAILOR, Common_Movement_Delay48
	waitmovement 0
	call_if_eq VAR_FACING, DIR_NORTH, SlateportCity_Harbor_EventScript_MoveSailorOutOfWayNorth
	call_if_eq VAR_FACING, DIR_EAST, SlateportCity_Harbor_EventScript_MoveSailorOutOfWayEast
	addobject LOCALID_BRINEY
	call_if_eq VAR_FACING, DIR_NORTH, SlateportCity_Harbor_EventScript_BrineyFaceSailorNorth
	call_if_eq VAR_FACING, DIR_EAST, SlateportCity_Harbor_EventScript_BrineyFaceSailorEast
	msgbox EventTicket_Text_BrineyHoldOnASecond, MSGBOX_DEFAULT
	call_if_eq VAR_FACING, DIR_NORTH, SlateportCity_Harbor_EventScript_BrineyFacePlayerNorth
	call_if_eq VAR_FACING, DIR_EAST, SlateportCity_Harbor_EventScript_BrineyFacePlayerEast
	msgbox EventTicket_Text_BrineyLetsSail, MSGBOX_DEFAULT
	closemessage
	call_if_eq VAR_FACING, DIR_NORTH, SlateportCity_Harbor_EventScript_BoardFerryWithBrineyAndSailorNorth
	call_if_eq VAR_FACING, DIR_EAST, SlateportCity_Harbor_EventScript_BoardFerryWithBrineyAndSailorEast
	setvar VAR_0x8004, LOCALID_SS_TIDAL
	call Common_EventScript_FerryDepart
	warp MAP_FARAWAY_ISLAND_ENTRANCE, 13, 38
	waitstate
	release
	end

SlateportCity_Harbor_EventScript_GoToFarawayIslandFirstTime::
	closemessage
	call SlateportCity_Harbor_EventScript_BoardFerryWithSailor
	warp MAP_FARAWAY_ISLAND_ENTRANCE, 13, 38
	waitstate
	release
	end

SlateportCity_Harbor_EventScript_MysticTicketFirstTime::
	setflag FLAG_SHOWN_MYSTIC_TICKET
	msgbox EventTicket_Text_ThatPass, MSGBOX_DEFAULT
	closemessage
	call SlateportCity_Harbor_EventScript_GetEventTicketSailor
	msgbox EventTicket_Text_OddTicketGetOnBoard, MSGBOX_DEFAULT
	goto SlateportCity_Harbor_EventScript_GoToNavelRockFirstTime
	end

SlateportCity_Harbor_EventScript_GoToNavelRockFirstTime::
	closemessage
	call SlateportCity_Harbor_EventScript_BoardFerryWithSailor
	warp MAP_NAVEL_ROCK_HARBOR, 8, 4
	waitstate
	release
	end

SlateportCity_Harbor_EventScript_MultipleEventTicketsFirstTime::
	msgbox EventTicket_Text_ThatPass, MSGBOX_DEFAULT
	closemessage
	call SlateportCity_Harbor_EventScript_GetEventTicketSailor
	message EventTicket_Text_OddTicketsWhereTo
	waitmessage
	setvar VAR_0x8004, 1
	special ScriptMenu_CreateSlateportSSTidalMultichoice
	waitstate
	special GetSlateportSSTidalSelection
	switch VAR_RESULT
	case 2, SlateportCity_Harbor_EventScript_GoToSouthernIslandFirstTime
	case 3, SlateportCity_Harbor_EventScript_GoToNavelRockFirstTime
	case 4, SlateportCity_Harbor_EventScript_GoToBirthIslandFirstTime
	case 5, SlateportCity_Harbor_EventScript_GoToFarawayIslandFirstTime
	case 6, SlateportCity_Harbor_EventScript_ExitFirstTimeTicketSailSelect
	case MULTI_B_PRESSED, SlateportCity_Harbor_EventScript_ExitFirstTimeTicketSailSelect
	release
	end

SlateportCity_Harbor_EventScript_ExitFirstTimeTicketSailSelect::
	msgbox EventTicket_Text_AsYouLike, MSGBOX_DEFAULT
	closemessage
	applymovement LOCALID_FERRY_SAILOR, Common_Movement_WalkInPlaceFasterUp
	waitmovement 0
	delay 30
	removeobject LOCALID_FERRY_SAILOR
	delay 30
	applymovement LOCALID_ATTENDANT, Common_Movement_WalkInPlaceFasterDown
	waitmovement 0
	showobjectat LOCALID_ATTENDANT, MAP_SLATEPORT_CITY_HARBOR
	delay 30
	msgbox SlateportCity_Harbor_Text_SailAnotherTime, MSGBOX_DEFAULT
	release
	end

SlateportCity_Harbor_EventScript_GetEventTicketSailor::
	applymovement VAR_LAST_TALKED, Common_Movement_WalkInPlaceFasterUp
	waitmovement 0
	delay 30
	hideobjectat VAR_LAST_TALKED, MAP_SLATEPORT_CITY_HARBOR
	delay 60
	addobject LOCALID_FERRY_SAILOR
	delay 30
	applymovement LOCALID_FERRY_SAILOR, Common_Movement_FacePlayer
	waitmovement 0
	return

SlateportCity_Harbor_EventScript_BoardFerryWithSailor::
	applymovement LOCALID_FERRY_SAILOR, Common_Movement_WalkInPlaceFasterUp
	waitmovement 0
	delay 30
	removeobject LOCALID_FERRY_SAILOR
	call_if_eq VAR_FACING, DIR_NORTH, SlateportCity_Harbor_EventScript_PlayerBoardFerryNorth
	call_if_eq VAR_FACING, DIR_EAST, SlateportCity_Harbor_EventScript_PlayerBoardFerryEast
	delay 30
	hideobjectat OBJ_EVENT_ID_PLAYER, 0
	setvar VAR_0x8004, LOCALID_SS_TIDAL
	call Common_EventScript_FerryDepart
	return

SlateportCity_Harbor_EventScript_FerryUnavailable::
	msgbox SlateportCity_Harbor_Text_FerryUnavailable, MSGBOX_DEFAULT
	release
	end

SlateportCity_Harbor_EventScript_NoEventTickets::
	msgbox SlateportCity_Harbor_Text_MayISeeYourTicket, MSGBOX_DEFAULT
	message SlateportCity_Harbor_Text_FlashTicketWhereTo
	waitmessage
	goto SlateportCity_Harbor_EventScript_FerryRegularLocationSelect
	end

@ Unused
SlateportCity_Harbor_EventScript_NoTicket::
	msgbox SlateportCity_Harbor_Text_NoTicket, MSGBOX_DEFAULT
	release
	end

@ Unused
SlateportCity_Harbor_EventScript_GoToBattleFrontierUnused::
	msgbox SlateportCity_Harbor_Text_BattleFrontierItIs, MSGBOX_YESNO
	goto_if_eq VAR_RESULT, NO, SlateportCity_Harbor_EventScript_FerryDestinationChangeMind
	call SlateportCity_Harbor_EventScript_BoardFerry
	warp MAP_BATTLE_FRONTIER_OUTSIDE_WEST, 19, 67
	waitstate
	release
	end

SlateportCity_Harbor_EventScript_FerryDestinationChangeMind::
	message SlateportCity_Harbor_Text_WhereWouldYouLikeToGo
	waitmessage
	goto SlateportCity_Harbor_EventScript_FerryRegularLocationSelect
	end

SlateportCity_Harbor_EventScript_BoardFerry::
	msgbox SlateportCity_Harbor_Text_PleaseBoard, MSGBOX_DEFAULT
	closemessage
	applymovement VAR_LAST_TALKED, Common_Movement_WalkInPlaceFasterUp
	waitmovement 0
	delay 30
	hideobjectat VAR_LAST_TALKED, MAP_SLATEPORT_CITY_HARBOR
	call_if_eq VAR_FACING, DIR_NORTH, SlateportCity_Harbor_EventScript_PlayerBoardFerryNorth
	call_if_eq VAR_FACING, DIR_EAST, SlateportCity_Harbor_EventScript_PlayerBoardFerryEast
	delay 30
	hideobjectat OBJ_EVENT_ID_PLAYER, 0
	setvar VAR_0x8004, LOCALID_SS_TIDAL
	call Common_EventScript_FerryDepart
	return

SlateportCity_Harbor_EventScript_PlayerBoardFerryEast::
	applymovement OBJ_EVENT_ID_PLAYER, SlateportCity_Harbor_Movement_PlayerBoardFerryEast
	waitmovement 0
	return

SlateportCity_Harbor_EventScript_PlayerBoardFerryNorth::
	applymovement OBJ_EVENT_ID_PLAYER, SlateportCity_Harbor_Movement_PlayerBoardFerryNorth
	waitmovement 0
	return

SlateportCity_Harbor_EventScript_ExitSailSelect::
	msgbox SlateportCity_Harbor_Text_SailAnotherTime, MSGBOX_DEFAULT
	release
	end

SlateportCity_Harbor_Movement_PlayerBoardFerryEast:
	walk_right
	walk_in_place_faster_up
	step_end

SlateportCity_Harbor_Movement_PlayerBoardFerryNorth:
	walk_up
	step_end

SlateportCity_Harbor_EventScript_Sailor::
	msgbox SlateportCity_Harbor_Text_LoveToGoDeepUnderwaterSomeday, MSGBOX_DEFAULT
	release
	end

SlateportCity_Harbor_EventScript_MoveSailorOutOfWayNorth::
	applymovement LOCALID_FERRY_SAILOR, SlateportCity_Harbor_Movement_SailorOutOfWayNorth
	waitmovement 0
	return

SlateportCity_Harbor_EventScript_MoveSailorOutOfWayEast::
	applymovement LOCALID_FERRY_SAILOR, SlateportCity_Harbor_Movement_SailorOutOfWayEast
	waitmovement 0
	return

SlateportCity_Harbor_Movement_SailorOutOfWayNorth:
	walk_in_place_faster_right
	lock_facing_direction
	walk_left
	unlock_facing_direction
	step_end

SlateportCity_Harbor_Movement_SailorOutOfWayEast:
	lock_facing_direction
	walk_down
	unlock_facing_direction
	step_end

SlateportCity_Harbor_EventScript_BrineyFaceSailorNorth::
	applymovement LOCALID_BRINEY, Common_Movement_WalkInPlaceFasterLeft
	waitmovement 0
	return

SlateportCity_Harbor_EventScript_BrineyFaceSailorEast::
	applymovement LOCALID_BRINEY, Common_Movement_WalkInPlaceFasterDown
	waitmovement 0
	return

SlateportCity_Harbor_EventScript_BrineyFacePlayerNorth::
	applymovement LOCALID_BRINEY, Common_Movement_WalkInPlaceFasterDown
	waitmovement 0
	return

SlateportCity_Harbor_EventScript_BrineyFacePlayerEast::
	applymovement LOCALID_BRINEY, Common_Movement_WalkInPlaceFasterLeft
	waitmovement 0
	return

SlateportCity_Harbor_EventScript_BoardFerryWithBrineyAndSailorNorth::
	applymovement LOCALID_BRINEY, SlateportCity_Harbor_Movement_BrineyBoardFerry
	applymovement OBJ_EVENT_ID_PLAYER, SlateportCity_Harbor_Movement_PlayerBoardWithBrineyNorth
	applymovement LOCALID_FERRY_SAILOR, SlateportCity_Harbor_Movement_SailorBoardWithBrineyNorth
	waitmovement 0
	return

SlateportCity_Harbor_EventScript_BoardFerryWithBrineyAndSailorEast::
	applymovement LOCALID_BRINEY, SlateportCity_Harbor_Movement_BrineyBoardFerry
	applymovement OBJ_EVENT_ID_PLAYER, SlateportCity_Harbor_Movement_PlayerBoardWithBrineyEast
	applymovement LOCALID_FERRY_SAILOR, SlateportCity_Harbor_Movement_SailorBoardWithBrineyEast
	waitmovement 0
	return

SlateportCity_Harbor_Movement_BrineyBoardFerry:
	walk_in_place_faster_up
	delay_8
	set_invisible
	step_end

SlateportCity_Harbor_Movement_PlayerBoardWithBrineyNorth:
	delay_16
	walk_up
	delay_16
	set_invisible
	step_end

SlateportCity_Harbor_Movement_SailorBoardWithBrineyNorth:
	delay_16
	delay_16
	delay_16
	walk_right
	walk_in_place_faster_up
	delay_16
	set_invisible
	step_end

SlateportCity_Harbor_Movement_PlayerBoardWithBrineyEast:
	delay_16
	walk_right
	walk_in_place_faster_up
	delay_16
	set_invisible
	step_end

SlateportCity_Harbor_Movement_SailorBoardWithBrineyEast:
	delay_16
	delay_16
	delay_16
	walk_up
	delay_16
	set_invisible
	step_end

SlateportCity_Harbor_EventScript_FatMan::
	msgbox SlateportCity_Harbor_Text_SubTooSmallForMe, MSGBOX_NPC
	end

SlateportCity_Harbor_EventScript_CaptStern::
	lock
	faceplayer
	goto_if_set FLAG_HOENN_BADGE05_GET, SlateportCity_Harbor_EventScript_CaptSternFerryOrScannerComment
	msgbox SlateportCity_Harbor_Text_FinishedMakingFerry, MSGBOX_DEFAULT
	closemessage
	applymovement VAR_LAST_TALKED, Common_Movement_FaceOriginalDirection
	waitmovement 0
	release
	end

SlateportCity_Harbor_EventScript_CaptSternFerryOrScannerComment::
	goto_if_eq VAR_TEMP_1, 1, SlateportCity_Harbor_EventScript_TradedScanner
	checkitem ITEM_SCANNER
	goto_if_eq VAR_RESULT, TRUE, SlateportCity_Harbor_EventScript_AskToTradeScanner
	msgbox SlateportCity_Harbor_Text_FinishedMakingFerry, MSGBOX_DEFAULT
	release
	end

SlateportCity_Harbor_EventScript_AskToTradeScanner::
	message SlateportCity_Harbor_Text_WouldYouTradeScanner
	waitmessage
	goto SlateportCity_Harbor_EventScript_ChooseScannerTrade
	end

SlateportCity_Harbor_EventScript_ChooseScannerTrade::
	multichoice 0, 0, MULTI_STERN_DEEPSEA, FALSE
	switch VAR_RESULT
	case 0, SlateportCity_Harbor_EventScript_DeepSeaTooth
	case 1, SlateportCity_Harbor_EventScript_DeepSeaScale
	case 2, SlateportCity_Harbor_EventScript_DeclineTrade
	case MULTI_B_PRESSED, SlateportCity_Harbor_EventScript_DeclineTrade
	end

SlateportCity_Harbor_EventScript_DeepSeaTooth::
	msgbox SlateportCity_Harbor_Text_TradeForDeepSeaTooth, MSGBOX_YESNO
	goto_if_eq VAR_RESULT, NO, SlateportCity_Harbor_EventScript_ChooseDifferentTrade
	giveitem ITEM_DEEP_SEA_TOOTH
	goto_if_eq VAR_RESULT, FALSE, Common_EventScript_ShowBagIsFull
	removeitem ITEM_SCANNER
	msgbox SlateportCity_Harbor_Text_HandedScannerToStern, MSGBOX_DEFAULT
	setflag FLAG_EXCHANGED_SCANNER
	goto SlateportCity_Harbor_EventScript_TradedScanner
	end

SlateportCity_Harbor_EventScript_DeepSeaScale::
	msgbox SlateportCity_Harbor_Text_TradeForDeepSeaScale, MSGBOX_YESNO
	goto_if_eq VAR_RESULT, NO, SlateportCity_Harbor_EventScript_ChooseDifferentTrade
	giveitem ITEM_DEEP_SEA_SCALE
	goto_if_eq VAR_RESULT, FALSE, Common_EventScript_ShowBagIsFull
	removeitem ITEM_SCANNER
	msgbox SlateportCity_Harbor_Text_HandedScannerToStern, MSGBOX_DEFAULT
	setflag FLAG_EXCHANGED_SCANNER
	goto SlateportCity_Harbor_EventScript_TradedScanner
	end

SlateportCity_Harbor_EventScript_DeclineTrade::
	msgbox SlateportCity_Harbor_Text_IfYouWantToTradeLetMeKnow, MSGBOX_DEFAULT
	release
	end

SlateportCity_Harbor_EventScript_ChooseDifferentTrade::
	message SlateportCity_Harbor_Text_WhichOneDoYouWant
	waitmessage
	goto SlateportCity_Harbor_EventScript_ChooseScannerTrade
	end

SlateportCity_Harbor_EventScript_TradedScanner::
	setvar VAR_TEMP_1, 1
	msgbox SlateportCity_Harbor_Text_ThisWillHelpResearch, MSGBOX_DEFAULT
	release
	end

SlateportCity_Harbor_Text_FerryUnavailable:
	.string "I beg your pardon?\n"
	.string "You're looking for a ship?\p"
	.string "I'm sorry, the ferry service isn't\n"
	.string "available at present…$"

SlateportCity_Harbor_Text_MayISeeYourTicket:
	.string "Hello, are you here for the ferry?\n"
	.string "May I see your TICKET?$"

SlateportCity_Harbor_Text_NoTicket:
	.string "{PLAYER} doesn't have the TICKET…\p"
	.string "I'm terribly sorry.\p"
	.string "You must have a TICKET to board\n"
	.string "the ferry.$"

SlateportCity_Harbor_Text_FlashTicketWhereTo:
	.string "{PLAYER} flashed the TICKET.\p"
	.string "Perfect! That's all you need!\p"
	.string "And where would you like to go?$"

SlateportCity_Harbor_Text_SailAnotherTime:
	.string "Please sail with us another time!$"

SlateportCity_Harbor_Text_OlivineItIs:
	.string "OLIVINE CITY it is, then!$"

SlateportCity_Harbor_Text_VermilionItIs:
	.string "VERMILION CITY it is, then!$"

SlateportCity_Harbor_Text_LilycoveItIs:
	.string "LILYCOVE CITY it is, then!$"

SlateportCity_Harbor_Text_Sevii1ItIs:
	.string "ONE ISLAND it is, then!$"

SlateportCity_Harbor_Text_Sevii2ItIs:
	.string "TWO ISLAND it is, then!$"

SlateportCity_Harbor_Text_Sevii3ItIs:
	.string "THREE ISLAND it is, then!$"

SlateportCity_Harbor_Text_Sevii4ItIs:
	.string "FOUR ISLAND it is, then!$"

SlateportCity_Harbor_Text_Sevii5ItIs:
	.string "FIVE ISLAND it is, then!$"

SlateportCity_Harbor_Text_Sevii6ItIs:
	.string "SIX ISLAND it is, then!$"

SlateportCity_Harbor_Text_Sevii7ItIs:
	.string "SEVEN ISLAND it is, then!$"

SlateportCity_Harbor_Text_BattleFrontierItIs:
	.string "BATTLE FRONTIER it is, then!$"

SlateportCity_Harbor_Text_PleaseBoard:
	.string "Please board the ferry and wait for\n"
	.string "departure.$"

SlateportCity_Harbor_Text_WhereWouldYouLikeToGo:
	.string "Then, where would you like to go?$"

SlateportCity_Harbor_Text_LoveToGoDeepUnderwaterSomeday:
	.string "A journey to the bottom of the sea…\n"
	.string "I wonder what it'd be like?\p"
	.string "I'd love to go deep underwater like\n"
	.string "that someday.$"

SlateportCity_Harbor_Text_SubTooSmallForMe:
	.string "I wanted to go with CAPT. STERN on\n"
	.string "the ocean floor exploration.\p"
	.string "But the sub's too small for me.\p"
	.string "If I squeezed in, there wouldn't be\n"
	.string "any room for the CAPTAIN…$"

SlateportCity_Harbor_Text_FinishedMakingFerry:
	.string "CAPT. STERN: {PLAYER}{KUN}!\p"
	.string "We finally finished making the ferry\n"
	.string "S.S. TIDAL!\p"
	.string "We couldn't have done it without\n"
	.string "your friend MR. BRINEY.\p"
	.string "Please go for a short cruise on it!$"

SlateportCity_Harbor_Text_WouldYouTradeScanner:
	.string "CAPT. STERN: Oh?\n"
	.string "{PLAYER}{KUN}, that item you have…\p"
	.string "That's a SCANNER! That would sure\n"
	.string "help us on our explorations.\p"
	.string "{PLAYER}{KUN}, would you trade your\n"
	.string "SCANNER for something?\p"
	.string "Like, say, a DEEPSEATOOTH or\n"
	.string "a DEEPSEASCALE that I have?$"

SlateportCity_Harbor_Text_IfYouWantToTradeLetMeKnow:
	.string "CAPT. STERN: Are you certain?\n"
	.string "It's useless to you, {PLAYER}{KUN}…\p"
	.string "Well, okay, then. If you want to trade\n"
	.string "your SCANNER, let me know.$"

SlateportCity_Harbor_Text_TradeForDeepSeaTooth:
	.string "CAPT. STERN: So you'll trade it for\n"
	.string "my DEEPSEATOOTH?$"

SlateportCity_Harbor_Text_TradeForDeepSeaScale:
	.string "CAPT. STERN: So you'll trade it for\n"
	.string "my DEEPSEASCALE?$"

SlateportCity_Harbor_Text_WhichOneDoYouWant:
	.string "CAPT. STERN: Which one do you want?$"

SlateportCity_Harbor_Text_HandedScannerToStern:
	.string "{PLAYER} handed the SCANNER to\n"
	.string "CAPT. STERN.$"

SlateportCity_Harbor_Text_ThisWillHelpResearch:
	.string "CAPT. STERN: Thanks, {PLAYER}{KUN}!\n"
	.string "This will help our research a lot!$"
