BlackthornCity_Gym_MapScripts::
	.byte 0

BlackthornCity_Gym_EventScript_Switch1::
	lock
	setmetatile 12, 10, METATILE_VioletCityGym_RegularFloor, FALSE
	setmetatile 13, 10, METATILE_VioletCityGym_RegularFloor, FALSE
	setmetatile 14, 10, METATILE_VioletCityGym_RegularFloor, FALSE
	setmetatile 12, 11, METATILE_VioletCityGym_RegularFloor, FALSE
	setmetatile 13, 11, METATILE_VioletCityGym_RegularFloor, FALSE
	setmetatile 14, 11, METATILE_VioletCityGym_RegularFloor, FALSE
	setmetatile 3, 22, METATILE_VioletCityGym_StatueEyesGlowing_1, FALSE
	playse SE_EFFECTIVE
	special DrawWholeMapView
	release
	end

BlackthornCity_Gym_EventScript_Switch2::
	lock
	setmetatile 12, 8, METATILE_VioletCityGym_RegularFloor, FALSE
	setmetatile 13, 8, METATILE_VioletCityGym_RegularFloor, FALSE
	setmetatile 14, 8, METATILE_VioletCityGym_RegularFloor, FALSE
	setmetatile 12, 9, METATILE_VioletCityGym_RegularFloor, FALSE
	setmetatile 13, 9, METATILE_VioletCityGym_RegularFloor, FALSE
	setmetatile 14, 9, METATILE_VioletCityGym_RegularFloor, FALSE
	setmetatile 23, 15, METATILE_VioletCityGym_StatueEyesGlowing_1, FALSE
	playse SE_EFFECTIVE
	special DrawWholeMapView
	release
	end

BlackthornCity_Gym_EventScript_Switch3::
	lock
	setmetatile 12, 6, METATILE_VioletCityGym_RegularFloor, FALSE
	setmetatile 13, 6, METATILE_VioletCityGym_RegularFloor, FALSE
	setmetatile 14, 6, METATILE_VioletCityGym_RegularFloor, FALSE
	setmetatile 12, 7, METATILE_VioletCityGym_RegularFloor, FALSE
	setmetatile 13, 7, METATILE_VioletCityGym_RegularFloor, FALSE
	setmetatile 14, 7, METATILE_VioletCityGym_RegularFloor, FALSE
	setmetatile 24, 6, METATILE_VioletCityGym_StatueEyesGlowing_2, FALSE
	playse SE_EFFECTIVE
	special DrawWholeMapView
	release
	end
