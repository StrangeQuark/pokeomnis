GoldenrodCity_DepartmentStore_6F_MapScripts::
	.byte 0

GoldenrodCity_DepartmentStore_6F_EventScript_FloorSign::
	msgbox GoldenrodCity_DepartmentStore_6F_Text_FloorSign, MSGBOX_SIGN
	end

GoldenrodCity_DepartmentStore_6F_Text_FloorSign::
	.string "6F: TRANQUIL SQUARE$"

GoldenrodCity_DepartmentStore_6F_EventScript_VendingMachine::
	lockall
	message GoldenrodCity_DepartmentStore_6F_Text_VendingMachineWhatDoesItHave
	waitmessage
	showmoneybox 0, 0
	goto GoldenrodCity_DepartmentStore_6F_EventScript_ChooseDrink
	end

GoldenrodCity_DepartmentStore_6F_EventScript_ChooseDrink::
	multichoice 16, 0, MULTI_VENDING_MACHINE, FALSE
	copyvar VAR_TEMP_1, VAR_RESULT
	switch VAR_TEMP_1
	case 0, GoldenrodCity_DepartmentStore_6F_EventScript_BuyFreshWater
	case 1, GoldenrodCity_DepartmentStore_6F_EventScript_BuySodaPop
	case 2, GoldenrodCity_DepartmentStore_6F_EventScript_BuyLemonade
	msgbox GoldenrodCity_DepartmentStore_6F_Text_NotThirsty
	goto GoldenrodCity_DepartmentStore_6F_EventScript_ExitVendingMachine
	end

GoldenrodCity_DepartmentStore_6F_EventScript_BuyFreshWater::
	setvar VAR_TEMP_0, ITEM_FRESH_WATER
	checkmoney 200
	goto GoldenrodCity_DepartmentStore_6F_EventScript_TryBuyDrink
	end

GoldenrodCity_DepartmentStore_6F_EventScript_BuySodaPop::
	setvar VAR_TEMP_0, ITEM_SODA_POP
	checkmoney 300
	goto GoldenrodCity_DepartmentStore_6F_EventScript_TryBuyDrink
	end

GoldenrodCity_DepartmentStore_6F_EventScript_BuyLemonade::
	setvar VAR_TEMP_0, ITEM_LEMONADE
	checkmoney 350
	goto GoldenrodCity_DepartmentStore_6F_EventScript_TryBuyDrink
	end

GoldenrodCity_DepartmentStore_6F_EventScript_RemoveMoneyFreshWater::
	removemoney 200
	return

GoldenrodCity_DepartmentStore_6F_EventScript_RemoveMoneySodaPop::
	removemoney 300
	return

GoldenrodCity_DepartmentStore_6F_EventScript_RemoveMoneyLemonade::
	removemoney 350
	return

GoldenrodCity_DepartmentStore_6F_EventScript_TryBuyDrink::
	goto_if_eq VAR_RESULT, FALSE, GoldenrodCity_DepartmentStore_6F_EventScript_NotEnoughMoney
	checkitemspace VAR_TEMP_0
	goto_if_eq VAR_RESULT, FALSE, GoldenrodCity_DepartmentStore_6F_EventScript_NoRoomForDrink
	call_if_eq VAR_TEMP_1, 0, GoldenrodCity_DepartmentStore_6F_EventScript_RemoveMoneyFreshWater
	call_if_eq VAR_TEMP_1, 1, GoldenrodCity_DepartmentStore_6F_EventScript_RemoveMoneySodaPop
	call_if_eq VAR_TEMP_1, 2, GoldenrodCity_DepartmentStore_6F_EventScript_RemoveMoneyLemonade
	updatemoneybox
	bufferitemname STR_VAR_1, VAR_TEMP_0
	playse SE_VEND
	msgbox GoldenrodCity_DepartmentStore_6F_Text_DrinkCanPoppedOut
	additem VAR_TEMP_0
	goto GoldenrodCity_DepartmentStore_6F_EventScript_ChooseNewDrink
	end

GoldenrodCity_DepartmentStore_6F_EventScript_ChooseNewDrink::
	message GoldenrodCity_DepartmentStore_6F_Text_VendingMachineWhatDoesItHave
	waitmessage
	goto GoldenrodCity_DepartmentStore_6F_EventScript_ChooseDrink
	end

GoldenrodCity_DepartmentStore_6F_EventScript_NotEnoughMoney::
	msgbox GoldenrodCity_DepartmentStore_6F_Text_NotEnoughMoney
	goto GoldenrodCity_DepartmentStore_6F_EventScript_ExitVendingMachine
	end

GoldenrodCity_DepartmentStore_6F_EventScript_NoRoomForDrink::
	msgbox GoldenrodCity_DepartmentStore_6F_Text_NoMoreRoomForStuff
	goto GoldenrodCity_DepartmentStore_6F_EventScript_ExitVendingMachine
	end

GoldenrodCity_DepartmentStore_6F_EventScript_ExitVendingMachine::
	hidemoneybox
	releaseall
	end

GoldenrodCity_DepartmentStore_6F_Text_VendingMachineWhatDoesItHave::
    .string "A vending machine!\n"
    .string "What does it have?$"

GoldenrodCity_DepartmentStore_6F_Text_NotEnoughMoney::
    .string "Oops, not enough money!$"

GoldenrodCity_DepartmentStore_6F_Text_DrinkCanPoppedOut::
    .string "A can of {STR_VAR_1} popped out!$"

GoldenrodCity_DepartmentStore_6F_Text_NoMoreRoomForStuff::
    .string "There's no more room for stuff!$"

GoldenrodCity_DepartmentStore_6F_Text_NotThirsty::
    .string "Not thirsty!$"
