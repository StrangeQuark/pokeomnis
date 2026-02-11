.set LOCALID_WOMAN1, 2
.set LOCALID_WOMAN2, 3

OlivineCity_Gym_MapScripts::
	.byte 0

OlivineCity_Gym_EventScript_T1::
	lock
	faceplayer
	msgbox OlivineCity_Gym_Text_BeepBoop, MSGBOX_DEFAULT
	closemessage
	call OlivineCity_Gym_EventScript_UnlockRoom1
	release
	end

OlivineCity_Gym_EventScript_T2::
	lock
	faceplayer
	msgbox OlivineCity_Gym_Text_BeepBoop, MSGBOX_DEFAULT
	closemessage
	call OlivineCity_Gym_EventScript_UnlockRoom2
	release
	end

OlivineCity_Gym_EventScript_T3::
	lock
	faceplayer
	msgbox OlivineCity_Gym_Text_BeepBoop, MSGBOX_DEFAULT
	closemessage
	call OlivineCity_Gym_EventScript_UnlockRoom3
	release
	end

OlivineCity_Gym_EventScript_T4::
	lock
	faceplayer
	msgbox OlivineCity_Gym_Text_BeepBoop, MSGBOX_DEFAULT
	closemessage
	call OlivineCity_Gym_EventScript_UnlockRoom4
	release
	end

OlivineCity_Gym_EventScript_T5::
	lock
	faceplayer
	msgbox OlivineCity_Gym_Text_BeepBoop, MSGBOX_DEFAULT
	closemessage
	applymovement LOCALID_WOMAN1, OlivineCity_Gym_Movement_Woman1
	applymovement LOCALID_WOMAN2, OlivineCity_Gym_Movement_Woman2
	waitmovement 0
	call OlivineCity_Gym_EventScript_UnlockGymLeaderRoom
	release
	end

OlivineCity_Gym_EventScript_GymLeader::
	lock
	msgbox OlivineCity_Gym_Text_BeepBoop, MSGBOX_DEFAULT
	closemessage
	release
	end

OlivineCity_Gym_Movement_Woman1:
	walk_left
	walk_in_place_down
	step_end

OlivineCity_Gym_Movement_Woman2:
	walk_right
	walk_in_place_down
	step_end

OlivineCity_Gym_EventScript_UnlockRoom1::
	setmetatile 26, 8, METATILE_CinnabarIslandGym_NormalFloor, FALSE
	setmetatile 27, 8, METATILE_CinnabarIslandGym_NormalFloor, FALSE
	setmetatile 26, 9, METATILE_CinnabarIslandGym_NormalFloor, FALSE
	setmetatile 27, 9, METATILE_CinnabarIslandGym_NormalFloor, FALSE
	setmetatile 26, 10, METATILE_CinnabarIslandGym_NormalFloor, FALSE
	setmetatile 27, 10, METATILE_CinnabarIslandGym_NormalFloor, FALSE
	setmetatile 28, 10, METATILE_CinnabarIslandGym_SlantedShadowFloor, FALSE
	playse SE_EFFECTIVE
	special DrawWholeMapView
	return

OlivineCity_Gym_EventScript_UnlockRoom2::
	setmetatile 17, 8, METATILE_CinnabarIslandGym_NormalFloor, FALSE
	setmetatile 18, 8, METATILE_CinnabarIslandGym_NormalFloor, FALSE
	setmetatile 17, 9, METATILE_CinnabarIslandGym_NormalFloor, FALSE
	setmetatile 18, 9, METATILE_CinnabarIslandGym_NormalFloor, FALSE
	setmetatile 17, 10, METATILE_CinnabarIslandGym_NormalFloor, FALSE
	setmetatile 18, 10, METATILE_CinnabarIslandGym_NormalFloor, FALSE
	setmetatile 19, 10, METATILE_CinnabarIslandGym_SlantedShadowFloor, FALSE
	playse SE_EFFECTIVE
	special DrawWholeMapView
	return

OlivineCity_Gym_EventScript_UnlockRoom3::
	setmetatile 17, 15, METATILE_CinnabarIslandGym_NormalFloor, FALSE
	setmetatile 18, 15, METATILE_CinnabarIslandGym_NormalFloor, FALSE
	setmetatile 17, 16, METATILE_CinnabarIslandGym_NormalFloor, FALSE
	setmetatile 18, 16, METATILE_CinnabarIslandGym_NormalFloor, FALSE
	setmetatile 17, 17, METATILE_CinnabarIslandGym_NormalFloor, FALSE
	setmetatile 18, 17, METATILE_CinnabarIslandGym_NormalFloor, FALSE
	setmetatile 19, 17, METATILE_CinnabarIslandGym_SlantedShadowFloor, FALSE
	playse SE_EFFECTIVE
	special DrawWholeMapView
	return

OlivineCity_Gym_EventScript_UnlockRoom4::
	setmetatile 5, 16, METATILE_CinnabarIslandGym_NormalFloor, FALSE
	setmetatile 6, 16, METATILE_CinnabarIslandGym_NormalFloor, FALSE
	setmetatile 5, 17, METATILE_CinnabarIslandGym_NormalFloor, FALSE
	setmetatile 6, 17, METATILE_CinnabarIslandGym_NormalFloor, FALSE
	setmetatile 5, 18, METATILE_CinnabarIslandGym_NormalFloor, FALSE
	setmetatile 6, 18, METATILE_CinnabarIslandGym_NormalFloor, FALSE
	setmetatile 7, 18, METATILE_CinnabarIslandGym_SlantedShadowFloor, FALSE
	playse SE_EFFECTIVE
	special DrawWholeMapView
	return

OlivineCity_Gym_EventScript_UnlockGymLeaderRoom::
	setmetatile 5, 8, METATILE_CinnabarIslandGym_NormalFloor, FALSE
	setmetatile 6, 8, METATILE_CinnabarIslandGym_NormalFloor, FALSE
	setmetatile 5, 9, METATILE_CinnabarIslandGym_NormalFloor, FALSE
	setmetatile 6, 9, METATILE_CinnabarIslandGym_NormalFloor, FALSE
	setmetatile 5, 10, METATILE_CinnabarIslandGym_NormalFloor, FALSE
	setmetatile 6, 10, METATILE_CinnabarIslandGym_NormalFloor, FALSE
	setmetatile 7, 10, METATILE_CinnabarIslandGym_SlantedShadowFloor, FALSE
	playse SE_EFFECTIVE
	special DrawWholeMapView
	return

OlivineCity_Gym_Text_BeepBoop:
	.string "Beep boop$"
