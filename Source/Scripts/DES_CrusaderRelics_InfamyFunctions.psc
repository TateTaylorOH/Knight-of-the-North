Scriptname DES_CrusaderRelics_InfamyFunctions extends Quest  
{Shared functions for the Crusader Relics Infamy system.}

Import PO3_SKSEFunctions

;--------------------------------------------------
;SHARED PROPERTIES
;--------------------------------------------------

Actor Property PlayerRef auto
Quest Property ccMTYSSE001_Quest auto

;--------------------------------------------------
;INFAMY FUNCTIOINS
;--------------------------------------------------

Message Property DES_BeGood auto
Message Property DES_BeGoodMsgBox auto

Function InfamyTutorial()
{Displays the Honor tutorial. If using PO3's Papyrus Extender it will display as a proper tutorial prompt. If not, it will be a message box.}
	
	int[] ExtenderVersion = GetPapyrusExtenderVersion()
	bool ExtenderMinVer = false
	
	if ExtenderVersion[0] >= 6 && ExtenderVersion[1] >= 4 && ExtenderVersion[2] >= 0
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

Function modInfamy(int i)
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
		InfamyMessages(oldInfamy, newInfamy)
	ENDIF

endFunction

;--------------------------------------------------

Message Property DES_FinalWarning auto
Formlist Property DES_CrusaderRelics auto
Message Property DES_HonorIncreaseMsg auto
Message Property DES_HonorDecreaseMsg auto

Function InfamyMessages(float oldInfamy, float newInfamy)
{Displays Infamy feedback messages based on what the Player's latest Infamy mod was.}

	IF newInfamy >= 15 && newInfamy < 16 
		DES_FinalWarning.Show()
	ENDIF
	IF !ccMTYSSE001_Quest.IsRunning()
		IF (PlayerRef.GetItemCount(DES_CrusaderRelics) > 0)
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

Int Property InfamyChangeMurder auto

Function Murder(ObjectReference akVictim, ObjectReference akKiller, Location akLocation, int aiCrimeStatus, \
  int aiRelationshipRank)
{Modifies the Player's Infamy based on murder.}

	if aiCrimeStatus
		modInfamy(InfamyChangeMurder)
	endIf

endFunction

;--------------------------------------------------

Int Property InfamyChangeAssault auto

Function Assault(ObjectReference akVictim, ObjectReference akAttacker, Location akLocation, int aiCrime)
{Modifies the Player's Infamy based on assault.}

	if aiCrime
		modInfamy(InfamyChangeAssault)		
	endIf

endFunction

;--------------------------------------------------

Int Property InfamyChangeTheft auto

Function Theft(ObjectReference akOwner, ObjectReference akContainer, Location akLocation, Form akItemBase, \
  int aiAcquireType)
{Modifies the Player's Infamy based on theft.}

	if aiAcquireType == 1 ; Steal
		modInfamy(InfamyChangeTheft)
	endIf

endFunction

;--------------------------------------------------

Int Property InfamyChangeEscapeJail auto

Function EscapeJail(Location akLocation, Form akCrimeGroup)
{Modifies the Player's Infamy based on prison breaks.}

	modInfamy(InfamyChangeEscapeJail)

endFunction

;--------------------------------------------------

Int Property InfamyChangeTrespassing auto

Function Trespassing(ObjectReference akVictim, ObjectReference akCriminal, Form akFaction, int aiGoldAmount, int aiCrime)
{Modifies the Player's Infamy based on trespassing.}

	if aiCrime == 2 ; Trespassing
		modInfamy(InfamyChangeTrespassing)
	endIf

endFunction

;--------------------------------------------------

Keyword Property DES_DogBlessingKeyword auto
Formlist Property DES_NineDivines auto
ReferenceAlias Property Alias_Player auto
Int Property InfamyChangeShrines auto
Int Property Cooldown auto

Function PrayToGod(ObjectReference akCaster, MagicEffect akEffect)
{Modifies the Player's Infamy based on divine prayers.}

	If !ccMTYSSE001_Quest.IsRunning()
		if DES_NineDivines.HasForm(akEffect) || akEffect.HasKeyword(DES_DogBlessingKeyword)
			modInfamy(InfamyChangeShrines)
			GoToState(CoolDown)
		ENDIF
	endIf

endFunction

;--------------------------------------------------

Spell Property FavorJobsBeggarsAbility auto
Int Property InfamyChangeCharity auto

Function GiveCharity(Form akSpell)
{Modifies the Player's Infamy based on acts of charity.}

	If !ccMTYSSE001_Quest.IsRunning()
		if akSpell == FavorJobsBeggarsAbility
			modInfamy(InfamyChangeCharity)
			GoToState(CoolDown)
		ENDIF		
	endif

endFunction

;--------------------------------------------------

Formlist Property DES_GodlyBoons auto
Int Property InfamyChangeGodlyBoons auto

Function ObtainGodlyBoon(ObjectReference akCaster, MagicEffect akEffect)
{Modifies the Player's Infamy based on obtaining godly boons.}

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
{Passes through OnMagicEffectApply events.}

	ObtainGodlyBoon(akCaster, akEffect)
	PrayToGod(akCaster, akEffect)
	GiveCharity(akSpell)

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
{Passes through OnMagicEffectApply events during cooldown.}

	ObtainGodlyBoon(akCaster, akEffect)

endFunction
