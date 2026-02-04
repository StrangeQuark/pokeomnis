.set LOCALID_COLE, 2
.set LOCALID_GERALD, 3
.set LOCALID_AXLE, 4
.set LOCALID_DANIELLE, 5

MauvilleCity_Gym_MapScripts::
	map_script MAP_SCRIPT_ON_TRANSITION, MauvilleCity_Gym_OnTransition
	.byte 0

MauvilleCity_Gym_OnTransition:
	call MauvilleCity_Gym_EventScript_SetTrainerTempVars
	call MauvilleCity_Gym_EventScript_CheckBuryTrainers
	end

@ Unclear where/if these temp vars are getting checked
MauvilleCity_Gym_EventScript_SetTrainerTempVars::
	setvar VAR_TEMP_B, 0
	setvar VAR_TEMP_C, 0
	setvar VAR_TEMP_D, 0
	setvar VAR_TEMP_E, 0
	setvar VAR_TEMP_F, 0
	goto_if_defeated TRAINER_COLE, MauvilleCity_Gym_EventScript_SetGeraldTempVar
	setvar VAR_TEMP_B, 1
MauvilleCity_Gym_EventScript_SetGeraldTempVar::
	goto_if_defeated TRAINER_GERALD, MauvilleCity_Gym_EventScript_SetAxleTempVar
	setvar VAR_TEMP_C, 1
MauvilleCity_Gym_EventScript_SetAxleTempVar::
	goto_if_defeated TRAINER_AXLE, MauvilleCity_Gym_EventScript_SetDanielleTempVar
	setvar VAR_TEMP_D, 1
MauvilleCity_Gym_EventScript_SetDanielleTempVar::
	goto_if_defeated TRAINER_DANIELLE, MauvilleCity_Gym_EventScript_EndSetTrainerTempVars
	setvar VAR_TEMP_E, 1
MauvilleCity_Gym_EventScript_EndSetTrainerTempVars::
	return

MauvilleCity_Gym_EventScript_CheckBuryTrainers::
	goto_if_defeated TRAINER_COLE, MauvilleCity_Gym_EventScript_CheckBuryGerald
	setobjectmovementtype LOCALID_COLE, MOVEMENT_TYPE_BURIED
MauvilleCity_Gym_EventScript_CheckBuryGerald::
	goto_if_defeated TRAINER_GERALD, MauvilleCity_Gym_EventScript_CheckBuryAxle
	setobjectmovementtype LOCALID_GERALD, MOVEMENT_TYPE_BURIED
MauvilleCity_Gym_EventScript_CheckBuryAxle::
	goto_if_defeated TRAINER_AXLE, MauvilleCity_Gym_EventScript_CheckBuryDanielle
	setobjectmovementtype LOCALID_AXLE, MOVEMENT_TYPE_BURIED
MauvilleCity_Gym_EventScript_CheckBuryDanielle::
	goto_if_defeated TRAINER_DANIELLE, MauvilleCity_Gym_EventScript_EndCheckBuryTrainers
	setobjectmovementtype LOCALID_DANIELLE, MOVEMENT_TYPE_BURIED
MauvilleCity_Gym_EventScript_EndCheckBuryTrainers::
	return

MauvilleCity_Gym_EventScript_Flannery::
	trainerbattle_single TRAINER_FLANNERY_1, MauvilleCity_Gym_Text_FlanneryIntro, MauvilleCity_Gym_Text_FlanneryDefeat, MauvilleCity_Gym_EventScript_FlanneryDefeated, NO_MUSIC
	specialvar VAR_RESULT, ShouldTryRematchBattle
	goto_if_eq VAR_RESULT, TRUE, MauvilleCity_Gym_EventScript_FlanneryRematch
	goto_if_unset FLAG_RECEIVED_TM_OVERHEAT, MauvilleCity_Gym_EventScript_GiveOverheat2
	checkplayerregion
	goto_if_eq VAR_RESULT, HOENN, MauvilleCity_Gym_EventScript_FlanneryPostBattle_HoennPlayer
	msgbox MauvilleCity_Gym_Text_FlanneryPostBattle, MSGBOX_DEFAULT
	release
	end

MauvilleCity_Gym_EventScript_FlanneryPostBattle_HoennPlayer::
	msgbox MauvilleCity_Gym_Text_FlanneryPostBattle_HoennPlayer, MSGBOX_DEFAULT
	release
	end

MauvilleCity_Gym_EventScript_FlanneryDefeated::
	message MauvilleCity_Gym_Text_ReceivedFireBadge
	waitmessage
	call Common_EventScript_PlayGymBadgeFanfare
	msgbox MauvilleCity_Gym_Text_ExplainFireBadgeTakeThis, MSGBOX_DEFAULT
	setflag FLAG_DEFEATED_MAUVILLE_GYM
	setflag FLAG_HOENN_BADGE02_GET
	addvar VAR_PETALBURG_GYM_STATE, 1
	call_if_eq VAR_PETALBURG_GYM_STATE, 6, Common_EventScript_ReadyPetalburgGymForBattle
	setvar VAR_0x8008, 4
	call Common_EventScript_SetGymTrainers
	setflag FLAG_HIDE_VERDANTURF_TOWN_WANDAS_HOUSE_WALLY
	setvar VAR_LAVARIDGE_TOWN_STATE, 1
	call MauvilleCity_Gym_EventScript_GiveOverheat
	closemessage
	delay 30
	playfanfare MUS_REGISTER_MATCH_CALL
	msgbox MauvilleCity_Gym_Text_RegisteredFlannery, MSGBOX_DEFAULT
	waitfanfare
	closemessage
	delay 30
	setflag FLAG_ENABLE_FLANNERY_MATCH_CALL
	release
	end

MauvilleCity_Gym_EventScript_GiveOverheat2::
	giveitem ITEM_TM_OVERHEAT
	goto_if_eq VAR_RESULT, FALSE, Common_EventScript_ShowBagIsFull
	msgbox MauvilleCity_Gym_Text_ExplainOverheat, MSGBOX_DEFAULT
	setflag FLAG_RECEIVED_TM_OVERHEAT
	release
	end

MauvilleCity_Gym_EventScript_GiveOverheat::
	giveitem ITEM_TM_OVERHEAT
	goto_if_eq VAR_RESULT, FALSE, Common_EventScript_BagIsFull
	msgbox MauvilleCity_Gym_Text_ExplainOverheat, MSGBOX_DEFAULT
	setflag FLAG_RECEIVED_TM_OVERHEAT
	return

MauvilleCity_Gym_EventScript_FlanneryRematch::
	trainerbattle_rematch_double TRAINER_FLANNERY_1, MauvilleCity_Gym_Text_FlanneryPreRematch, MauvilleCity_Gym_Text_FlanneryRematchDefeat, MauvilleCity_Gym_Text_FlanneryRematchNeedTwoMons
	msgbox MauvilleCity_Gym_Text_FlanneryPostRematch, MSGBOX_AUTOCLOSE
	end

MauvilleCity_Gym_EventScript_Cole::
	trainerbattle TRAINER_BATTLE_CONTINUE_SCRIPT, TRAINER_COLE, LOCALID_COLE, MauvilleCity_Gym_Text_ColeIntro, MauvilleCity_Gym_Text_ColeDefeat, MauvilleCity_Gym_EventScript_CheckTrainerScript
	msgbox MauvilleCity_Gym_Text_ColePostBattle, MSGBOX_AUTOCLOSE
	end

MauvilleCity_Gym_EventScript_CheckTrainerScript::
	call MauvilleCity_Gym_EventScript_SetTrainerTempVars
	release
	special ShouldTryGetTrainerScript
	goto_if_eq VAR_RESULT, 1, EventScript_GotoTrainerScript
	end

MauvilleCity_Gym_EventScript_Axle::
	trainerbattle TRAINER_BATTLE_CONTINUE_SCRIPT, TRAINER_AXLE, LOCALID_AXLE, MauvilleCity_Gym_Text_AxleIntro, MauvilleCity_Gym_Text_AxleDefeat, MauvilleCity_Gym_EventScript_CheckTrainerScript
	msgbox MauvilleCity_Gym_Text_AxlePostBattle, MSGBOX_AUTOCLOSE
	end

MauvilleCity_Gym_B1F_EventScript_Keegan::
	trainerbattle TRAINER_BATTLE_CONTINUE_SCRIPT, TRAINER_KEEGAN, LOCALID_KEEGAN, MauvilleCity_Gym_B1F_Text_KeeganIntro, MauvilleCity_Gym_B1F_Text_KeeganDefeat, MauvilleCity_Gym_EventScript_CheckTrainerScript
	msgbox MauvilleCity_Gym_B1F_Text_KeeganPostBattle, MSGBOX_AUTOCLOSE
	end

MauvilleCity_Gym_EventScript_Danielle::
	trainerbattle TRAINER_BATTLE_CONTINUE_SCRIPT, TRAINER_DANIELLE, LOCALID_DANIELLE, MauvilleCity_Gym_Text_DanielleIntro, MauvilleCity_Gym_Text_DanielleDefeat, MauvilleCity_Gym_EventScript_CheckTrainerScript
	msgbox MauvilleCity_Gym_Text_DaniellePostBattle, MSGBOX_AUTOCLOSE
	end

MauvilleCity_Gym_EventScript_Gerald::
	trainerbattle TRAINER_BATTLE_CONTINUE_SCRIPT, TRAINER_GERALD, LOCALID_GERALD, MauvilleCity_Gym_Text_GeraldIntro, MauvilleCity_Gym_Text_GeraldDefeat, MauvilleCity_Gym_EventScript_CheckTrainerScript
	msgbox MauvilleCity_Gym_Text_GeraldPostBattle, MSGBOX_AUTOCLOSE
	end

MauvilleCity_Gym_B1F_EventScript_Jace::
	trainerbattle TRAINER_BATTLE_CONTINUE_SCRIPT, TRAINER_JACE, LOCALID_JACE, MauvilleCity_Gym_B1F_Text_JaceIntro, MauvilleCity_Gym_B1F_Text_JaceDefeat, MauvilleCity_Gym_EventScript_CheckTrainerScript
	msgbox MauvilleCity_Gym_B1F_Text_JacePostBattle, MSGBOX_AUTOCLOSE
	end

MauvilleCity_Gym_B1F_EventScript_Jeff::
	trainerbattle TRAINER_BATTLE_CONTINUE_SCRIPT, TRAINER_JEFF, LOCALID_JEFF, MauvilleCity_Gym_B1F_Text_JeffIntro, MauvilleCity_Gym_B1F_Text_JeffDefeat, MauvilleCity_Gym_EventScript_CheckTrainerScript
	msgbox MauvilleCity_Gym_B1F_Text_JeffPostBattle, MSGBOX_AUTOCLOSE
	end

MauvilleCity_Gym_B1F_EventScript_Eli::
	trainerbattle TRAINER_BATTLE_CONTINUE_SCRIPT, TRAINER_ELI, LOCALID_ELI, MauvilleCity_Gym_B1F_Text_EliIntro, MauvilleCity_Gym_B1F_Text_EliDefeat, MauvilleCity_Gym_EventScript_CheckTrainerScript
	msgbox MauvilleCity_Gym_B1F_Text_EliPostBattle, MSGBOX_AUTOCLOSE
	end

MauvilleCity_Gym_EventScript_GymGuide::
	lock
	faceplayer
	goto_if_set FLAG_DEFEATED_LAVARIDGE_GYM, MauvilleCity_Gym_EventScript_GymGuidePostVictory
	msgbox MauvilleCity_Gym_Text_GymGuideAdvice, MSGBOX_DEFAULT
	release
	end

MauvilleCity_Gym_EventScript_GymGuidePostVictory::
	msgbox MauvilleCity_Gym_Text_GymGuidePostVictory, MSGBOX_DEFAULT
	release
	end

MauvilleCity_Gym_EventScript_LeftGymStatue::
	lockall
	goto_if_set FLAG_HOENN_BADGE02_GET, MauvilleCity_Gym_EventScript_GymStatueCertified
	goto MauvilleCity_Gym_EventScript_GymStatue
	end

MauvilleCity_Gym_EventScript_RightGymStatue::
	lockall
	goto_if_set FLAG_HOENN_BADGE02_GET, MauvilleCity_Gym_EventScript_GymStatueCertified
	goto MauvilleCity_Gym_EventScript_GymStatue
	end

MauvilleCity_Gym_EventScript_GymStatueCertified::
	msgbox MauvilleCity_Gym_Text_GymStatueCertified, MSGBOX_DEFAULT
	releaseall
	end

MauvilleCity_Gym_EventScript_GymStatue::
	msgbox MauvilleCity_Gym_Text_GymStatue, MSGBOX_DEFAULT
	releaseall
	end

MauvilleCity_Gym_Text_GymGuideAdvice:
	.string "Hey, how's it going, champion-\n"
	.string "bound {PLAYER}?\p"
	.string "Mauville's gym leader Flannery\n"
	.string "uses fire-type pokémon.\p"
	.string "Her passion for pokémon burns stronger\n"
	.string "and hotter than a volcano.\p"
	.string "Don't get too close to her--you'll burn!\n"
	.string "Hose her down with water and then\l"
	.string "go for it!$"

MauvilleCity_Gym_Text_GymGuidePostVictory:
	.string "Yow! That was a scorching-hot battle!$"

MauvilleCity_Gym_Text_ColeIntro:
	.string "Owowowowow!\n"
	.string "Yikes, it's hot!$"

MauvilleCity_Gym_Text_ColeDefeat:
	.string "I'm blinded by sweat in my eyes…$"

MauvilleCity_Gym_Text_ColePostBattle:
	.string "Being buried in hot sand promotes\n"
	.string "circulation.\p"
	.string "It's effective for healing pain in\n"
	.string "your joints.$"

MauvilleCity_Gym_Text_AxleIntro:
	.string "I'm trying to relieve my stress.\n"
	.string "Don't come along and stress me out!$"

MauvilleCity_Gym_Text_AxleDefeat:
	.string "I hope Flannery flames you good!$"

MauvilleCity_Gym_Text_AxlePostBattle:
	.string "Haaah… Whew…\p"
	.string "If you spend too much time buried in\n"
	.string "hot sand, it tuckers you out…$"

MauvilleCity_Gym_B1F_Text_KeeganIntro:
	.string "You must be getting tired by now.\n"
	.string "You'd like to rest in the hot sand,\l"
	.string "wouldn't you?\p"
	.string "But you should know that maintaining\n"
	.string "your willpower is an important ability\l"
	.string "for all trainers.$"

MauvilleCity_Gym_B1F_Text_KeeganDefeat:
	.string "Play with fire, and be burned…$"

MauvilleCity_Gym_B1F_Text_KeeganPostBattle:
	.string "Your skill is real…\n"
	.string "But our leader Flannery is strong.\p"
	.string "If you don't watch yourself, you'll be\n"
	.string "burned seriously.$"

MauvilleCity_Gym_Text_GeraldIntro:
	.string "Can your pokémon withstand\n"
	.string "392-degree heat?$"

MauvilleCity_Gym_Text_GeraldDefeat:
	.string "It didn't burn hotly enough…$"

MauvilleCity_Gym_Text_GeraldPostBattle:
	.string "The temperature of magma is\n"
	.string "392 degrees.\p"
	.string "Your pokémon beat me, so they should\n"
	.string "easily survive in magma.$"

MauvilleCity_Gym_Text_DanielleIntro:
	.string "Um…\n"
	.string "Okay, I'll battle with you.$"

MauvilleCity_Gym_Text_DanielleDefeat:
	.string "Oh, but you're too strong.$"

MauvilleCity_Gym_Text_DaniellePostBattle:
	.string "I'm going to be a pretty and strong\n"
	.string "trainer just like Flannery.$"

MauvilleCity_Gym_B1F_Text_JaceIntro:
	.string "Come on, get with it!\n"
	.string "Let's go before my feelings cool!$"

MauvilleCity_Gym_B1F_Text_JaceDefeat:
	.string "It's so hot, and yet my heart is\n"
	.string "clutched by ice…$"

MauvilleCity_Gym_B1F_Text_JacePostBattle:
	.string "The way the battling spirit burns\n"
	.string "within you, you may stand a chance\l"
	.string "against our leader.$"

MauvilleCity_Gym_B1F_Text_JeffIntro:
	.string "See how the flames blaze wildly?\n"
	.string "They flare in anticipation of my win!$"

MauvilleCity_Gym_B1F_Text_JeffDefeat:
	.string "Something didn't go right.$"

MauvilleCity_Gym_B1F_Text_JeffPostBattle:
	.string "Well, so what? I say so what?\n"
	.string "I can walk on hot coals barefoot!\p"
	.string "…Don't even think about trying it!$"

MauvilleCity_Gym_B1F_Text_EliIntro:
	.string "As much as I love mountains,\n"
	.string "I especially love volcanoes.$"

MauvilleCity_Gym_B1F_Text_EliDefeat:
	.string "Well, it seems to me I lost without\n"
	.string "ever being in control.$"

MauvilleCity_Gym_B1F_Text_EliPostBattle:
	.string "I stay here because I became a fan\n"
	.string "of Flannery's power.\p"
	.string "Hehehehe.$"

MauvilleCity_Gym_Text_FlanneryIntro:
	.string "Welcome, how good to see you've\n"
	.string "made it here!\p"
	.string "I am Flannery, and I'm the\n"
	.string "leader of the Mauville fire gym!\p"
	.string "Dare not underestimate me,\l"
	.string "I have been leader a long time!\p"
	.string "With skills inherited from my\n"
	.string "grandfather, I will demonstrate the\l"
	.string "hot moves we have honed on this land!$"

MauvilleCity_Gym_Text_FlanneryDefeat:
	.string "Oh…\n"
	.string "I guess I was trying too hard…\p"
	.string "I have to do things my natural way. If\n"
	.string "I don't, my pokémon will be confused.\p"
	.string "Thanks for teaching me that.\n"
	.string "For that, you deserve this.$"

MauvilleCity_Gym_Text_ReceivedFireBadge:
	.string "{PLAYER} received the Fire Badge\n"
	.string "from Flannery.$"

MauvilleCity_Gym_Text_ExplainFireBadgeTakeThis:
	.string "Also, take this as a token of my\n"
	.string "appreciation. Don't be shy!$"

MauvilleCity_Gym_Text_ExplainOverheat:
	.string "That TM50 contains Overheat.\p"
	.string "That move inflicts serious damage on\n"
	.string "the opponent.\p"
	.string "But it also sharply cuts the SP. ATK\n"
	.string "of the pokémon using it. It might not\l"
	.string "be suitable for longer battles.$"

MauvilleCity_Gym_Text_RegisteredFlannery:
	.string "Registered Gym Leader Flannery\n"
	.string "in the pokénav.$"

MauvilleCity_Gym_Text_FlanneryPostBattle:
	.string "Your power reminds me of someone…\p"
	.string "It's on the tip of my tongue but I\n"
	.string "can't think of it!$"

MauvilleCity_Gym_Text_FlanneryPostBattle_HoennPlayer:
	.string "Your power reminds me of someone…\p"
	.string "Oh! I know! You battle like Norman,\n"
	.string "the gym leader of Petalburg.$"

MauvilleCity_Gym_Text_GymStatue:
	.string "Mauville City Pokémon Gym$"

MauvilleCity_Gym_Text_GymStatueCertified:
	.string "Mauville City Pokémon Gym\p"
	.string "Flannery'S certified trainers:\n"
	.string "{PLAYER}$"

MauvilleCity_Gym_Text_FlanneryPreRematch:
	.string "Flannery: Losing a battle isn't going\n"
	.string "to deflate me.\p"
	.string "I love pokémon.\n"
	.string "I love to battle.\l"
	.string "And… I love this GYM!\p"
	.string "Let's exchange superhot moves\n"
	.string "in another battle!$"

MauvilleCity_Gym_Text_FlanneryRematchDefeat:
	.string "Whew!\n"
	.string "On the verge of eruption!$"

MauvilleCity_Gym_Text_FlanneryPostRematch:
	.string "Flannery: I lost the match,\n"
	.string "but I'm completely satisfied.\p"
	.string "It's not often I get to enjoy a battle\n"
	.string "this heated.\p"
	.string "Let's have another one like this\n"
	.string "again sometime!$"

MauvilleCity_Gym_Text_FlanneryRematchNeedTwoMons:
	.string "Flannery: Losing a battle isn't going\n"
	.string "to deflate me.\p"
	.string "I love pokémon.\n"
	.string "I love to battle.\l"
	.string "And… I love this GYM!\p"
	.string "Let's exchange superhot moves\n"
	.string "in another battle!\p"
	.string "Oh, wait. Do you only have one pokémon\n"
	.string "that can battle?\p"
	.string "I hate to say this, but when you come\n"
	.string "see me, bring at least two pokémon.$"
