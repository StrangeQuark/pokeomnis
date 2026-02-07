SaffronCity_Gym_MapScripts::
	.byte 0

SaffronCity_Gym_EventScript_T1::
	call SaffronCity_Gym_EventScript_UnlockRoom1
	msgbox SaffronCity_Gym_Text_BeepBoop, MSGBOX_DEFAULT
	release
	end

SaffronCity_Gym_EventScript_T2::
	call SaffronCity_Gym_EventScript_UnlockRoom2
	msgbox SaffronCity_Gym_Text_BeepBoop, MSGBOX_DEFAULT
	release
	end

SaffronCity_Gym_EventScript_T3::
	call SaffronCity_Gym_EventScript_UnlockRoom3
	msgbox SaffronCity_Gym_Text_BeepBoop, MSGBOX_DEFAULT
	release
	end

SaffronCity_Gym_EventScript_T4::
	call SaffronCity_Gym_EventScript_UnlockRoom4
	msgbox SaffronCity_Gym_Text_BeepBoop, MSGBOX_DEFAULT
	release
	end

SaffronCity_Gym_EventScript_T5::
	call SaffronCity_Gym_EventScript_UnlockRoom5
	msgbox SaffronCity_Gym_Text_BeepBoop, MSGBOX_DEFAULT
	release
	end

SaffronCity_Gym_EventScript_T6::
	call SaffronCity_Gym_EventScript_UnlockRoom6
	msgbox SaffronCity_Gym_Text_BeepBoop, MSGBOX_DEFAULT
	release
	end

SaffronCity_Gym_EventScript_T7::
	call SaffronCity_Gym_EventScript_UnlockRoom7
	msgbox SaffronCity_Gym_Text_BeepBoop, MSGBOX_DEFAULT
	release
	end

SaffronCity_Gym_EventScript_GymLeader::
	call SaffronCity_Gym_EventScript_UnlockGymLeaderRoom
	msgbox SaffronCity_Gym_Text_BeepBoop, MSGBOX_DEFAULT
	release
	end

SaffronCity_Gym_EventScript_UnlockRoom1::
	setmetatile 0, 4, METATILE_SaffronCityGym_WarpUnlocked, FALSE
	setmetatile 8, 4, METATILE_SaffronCityGym_WarpUnlocked, FALSE
	setmetatile 0, 7, METATILE_SaffronCityGym_WarpUnlocked, FALSE
	setmetatile 8, 7, METATILE_SaffronCityGym_WarpUnlocked, FALSE
	playse SE_EFFECTIVE
	special DrawWholeMapView
	return

SaffronCity_Gym_EventScript_UnlockRoom2::
	setmetatile 12, 4, METATILE_SaffronCityGym_WarpUnlocked, FALSE
	setmetatile 16, 4, METATILE_SaffronCityGym_WarpUnlocked, FALSE
	setmetatile 12, 7, METATILE_SaffronCityGym_WarpUnlocked, FALSE
	setmetatile 17, 7, METATILE_SaffronCityGym_WarpUnlocked, FALSE
	playse SE_EFFECTIVE
	special DrawWholeMapView
	return

SaffronCity_Gym_EventScript_UnlockRoom3::
	setmetatile 20, 4, METATILE_SaffronCityGym_WarpUnlocked, FALSE
	setmetatile 28, 4, METATILE_SaffronCityGym_WarpUnlocked, FALSE
	setmetatile 20, 7, METATILE_SaffronCityGym_WarpUnlocked, FALSE
	setmetatile 28, 7, METATILE_SaffronCityGym_WarpUnlocked, FALSE
	playse SE_EFFECTIVE
	special DrawWholeMapView
	return

SaffronCity_Gym_EventScript_UnlockRoom4::
	setmetatile 0, 12, METATILE_SaffronCityGym_WarpUnlocked, FALSE
	setmetatile 8, 12, METATILE_SaffronCityGym_WarpUnlocked, FALSE
	setmetatile 0, 15, METATILE_SaffronCityGym_WarpUnlocked, FALSE
	setmetatile 8, 15, METATILE_SaffronCityGym_WarpUnlocked, FALSE
	playse SE_EFFECTIVE
	special DrawWholeMapView
	return

SaffronCity_Gym_EventScript_UnlockRoom5::
	setmetatile 20, 12, METATILE_SaffronCityGym_WarpUnlocked, FALSE
	setmetatile 28, 12, METATILE_SaffronCityGym_WarpUnlocked, FALSE
	setmetatile 20, 15, METATILE_SaffronCityGym_WarpUnlocked, FALSE
	setmetatile 28, 15, METATILE_SaffronCityGym_WarpUnlocked, FALSE
	playse SE_EFFECTIVE
	special DrawWholeMapView
	return

SaffronCity_Gym_EventScript_UnlockRoom6::
	setmetatile 0, 20, METATILE_SaffronCityGym_WarpUnlocked, FALSE
	setmetatile 8, 20, METATILE_SaffronCityGym_WarpUnlocked, FALSE
	setmetatile 0, 23, METATILE_SaffronCityGym_WarpUnlocked, FALSE
	setmetatile 8, 23, METATILE_SaffronCityGym_WarpUnlocked, FALSE
	playse SE_EFFECTIVE
	special DrawWholeMapView
	return

SaffronCity_Gym_EventScript_UnlockRoom7::
	setmetatile 20, 20, METATILE_SaffronCityGym_WarpUnlocked, FALSE
	setmetatile 28, 20, METATILE_SaffronCityGym_WarpUnlocked, FALSE
	setmetatile 20, 23, METATILE_SaffronCityGym_WarpUnlocked, FALSE
	setmetatile 28, 23, METATILE_SaffronCityGym_WarpUnlocked, FALSE
	playse SE_EFFECTIVE
	special DrawWholeMapView
	return

SaffronCity_Gym_EventScript_UnlockGymLeaderRoom::
	setmetatile 18, 15, METATILE_SaffronCityGym_WarpUnlocked, FALSE
	special DrawWholeMapView
	return

SaffronCity_Gym_Text_BeepBoop:
	.string "Beep boop$"
