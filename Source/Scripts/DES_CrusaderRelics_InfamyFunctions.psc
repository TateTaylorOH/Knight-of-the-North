Scriptname DES_CrusaderRelics_InfamyFunctions extends Quest  
{Shared functions for the Crusader Relics Infamy system.}

Import PO3_SKSEFunctions

;--------------------------------------------------
;SHARED PROPERTIES
;--------------------------------------------------

Quest Property ccMTYSSE001_Quest auto

;--------------------------------------------------
;INFAMY FUNCTIOINS
;--------------------------------------------------

Message Property DES_BeGood auto
Message Property DES_BeGoodMsgBox auto

Function InfamyTutorial()
{Displays the Honor tutorial. If using PO3's Papyrus Extender it will display as a proper tutorial prompt. If not, it will be a message box.}
	
	int[] ExtenderVersion = GetPapyrusExtenderVersion()
	bool ExtenderMinVer

	if (ExtenderVersion && (ExtenderVersion[0] > 6 || (ExtenderVersion[0] == 6 && ExtenderVersion[1] >= 4)))
		ExtenderMinVer = true
	endif
	Utility.Wait(5)
	If ExtenderMinVer
		ShowTutorialMessage(DES_BeGood)
	else
		DES_BeGoodMsgBox.Show()
	endif

endFunction

;--------------------------------------------------

GlobalVariable Property ccMTYSSE001_CrusaderGlobalInfamy auto
Message Property ccMTYSSE001_CrusaderRelicsShrine auto
GlobalVariable Property ccMTYSSE001_CrusaderGlobalMessageShown auto

Function modInfamy(int i, bool ShowMsg = true)
{Modifies the Player's Infamy depending on input.}

	IF !ccMTYSSE001_Quest.IsRunning()
		float oldInfamy = ccMTYSSE001_CrusaderGlobalInfamy.GetValueInt()
		ccMTYSSE001_CrusaderGlobalInfamy.Mod(i)
		float newInfamy = ccMTYSSE001_CrusaderGlobalInfamy.GetValueInt()
		IF ccMTYSSE001_CrusaderGlobalInfamy.GetValueInt() > 15
			IF !ccMTYSSE001_Quest.IsRunning()
				ccMTYSSE001_CrusaderRelicsShrine.Show()
				ccMTYSSE001_CrusaderGlobalMessageShown.SetValueInt(2)
				ccMTYSSE001_Quest.SetStage(10)
			ENDIF
		ENDIF
		IF ShowMsg
			InfamyMessages(oldInfamy, newInfamy)
		ENDIF
	ENDIF

endFunction

;--------------------------------------------------

Message Property DES_FinalWarning auto
ReferenceAlias Property Alias_Player auto
Formlist Property DES_CrusaderRelics auto
Message Property DES_HonorIncreaseMsg auto
Message Property DES_HonorDecreaseMsg auto

Function InfamyMessages(float oldInfamy, float newInfamy)
{Displays Infamy feedback messages based on what the Player's latest Infamy mod was.}

	IF newInfamy >= 15 && newInfamy < 16 
		DES_FinalWarning.Show()
	ENDIF
	IF !ccMTYSSE001_Quest.IsRunning()
		IF (Alias_Player.GetActorRef().GetItemCount(DES_CrusaderRelics) > 0)
			IF newInfamy < oldInfamy
				IF newInfamy <= 0 && oldInfamy >0
					DES_HonorIncreaseMsg.Show()
				ELSEIF newInfamy <= 6 && oldInfamy >= 5
					DES_HonorIncreaseMsg.Show()
				ELSEIF newInfamy <= 11 && oldInfamy >= 10
					DES_HonorIncreaseMsg.Show()
				ENDIF
			ELSEIF newInfamy > oldInfamy
				IF newInfamy > 0 && oldInfamy <=0
					DES_HonorDecreaseMsg.Show()
				ELSEIF newInfamy >= 6 && oldInfamy <= 5
					DES_HonorDecreaseMsg.Show()
				ELSEIF newInfamy >= 11 && oldInfamy <= 10
					DES_HonorDecreaseMsg.Show()
				ENDIF
			ENDIF
		ENDIF
	ENDIF

endFunction

;--------------------------------------------------

Formlist Property DES_NineDivines auto
Int Property InfamyChangeShrines auto
Int Property Cooldown auto

Function Pray(ObjectReference akCaster, MagicEffect akEffect)
{Modifies the Player's Infamy based on prayers to the Divines, then sets cooldown period to prevent spamming.}

	If !ccMTYSSE001_Quest.IsRunning()
		if DES_NineDivines.HasForm(akEffect)
			modInfamy(InfamyChangeShrines)
			GoToState(CoolDown)
		ENDIF
	endIf

endFunction

;--------------------------------------------------

Spell Property FavorJobsBeggarsAbility auto
Keyword Property DES_DogBlessingKeyword auto
Int Property InfamyChangeCharity auto

Function Charity(ObjectReference akCaster, MagicEffect akEffect)
{Modifies the Player's Infamy based on acts of charity, then sets cooldown period to prevent spamming.}

Keyword USKPGiftOfCharity = Game.GetFormFromFile(0x1A179, "unofficial skyrim special edition patch.esp") as Keyword

	If !ccMTYSSE001_Quest.IsRunning()
		if akEffect.HasKeyword(USKPGiftOfCharity) || akEffect.HasKeyword(DES_DogBlessingKeyword)
			modInfamy(InfamyChangeCharity)
			GoToState(CoolDown)
		ENDIF		
	endif

endFunction

;--------------------------------------------------

Formlist Property DES_GodlyBoons auto
Int Property InfamyChangeGodlyBoons auto

Function Boon(ObjectReference akCaster, MagicEffect akEffect)
{Modifies the Player's Infamy based on receiving godly boons.}

	If !ccMTYSSE001_Quest.IsRunning()
		if DES_GodlyBoons.HasForm(akEffect)
			modInfamy(InfamyChangeGodlyBoons)
		ENDIF
	endIf

endFunction

;--------------------------------------------------
;EVENTS
;--------------------------------------------------

auto state Waiting

Function OnMagicEffectApply_Alias(ObjectReference akCaster, MagicEffect akEffect)

	Boon(akCaster, akEffect)
	Pray(akCaster, akEffect)
	Charity(akCaster, akEffect)

endFunction

endState

;------------------------

state Cooldown

Event OnBeginState()

	RegisterForSingleUpdateGameTime(CoolDown)

endEvent

Event OnUpdateGameTime()

	GoToState("Waiting")

endEvent

endState

Function OnMagicEffectApply_Alias(ObjectReference akCaster, MagicEffect akEffect)
{Passes through OnMagicEffectApply events during cooldown period.}

	Boon(akCaster, akEffect)

endFunction
