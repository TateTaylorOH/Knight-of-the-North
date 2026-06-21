Scriptname DES_CrusaderRelics_InfamyFunctions extends Quest  
{Shared functions for the Crusader Relic's Infamy system.}

;--------------------------------------------------
;SHARED PROPERTIES
;--------------------------------------------------

Actor Property PlayerRef auto
Quest Property ccMTYSSE001_Quest auto

;--------------------------------------------------
;INFAMY FUNCTIOINS
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

Keyword Property DES_DogBlessingKeyword auto
Formlist Property DES_NineDivines auto
ReferenceAlias Property Alias_Player auto
Int Property InfamyChangeShrines auto
Int Property Cooldown auto

Function PrayToGod(ObjectReference akCaster, MagicEffect akEffect)
{Controls modifying the Player's Infamy based on divine prayers.}

	if DES_NineDivines.HasForm(akEffect) || akEffect.HasKeyword(DES_DogBlessingKeyword)
		If !ccMTYSSE001_Quest.IsRunning()
			modInfamy(InfamyChangeShrines)
			GoToState(CoolDown)
		ENDIF
	endIf

endFunction

;--------------------------------------------------

MagicEffect Property PerkT01Dibella auto
MagicEffect Property PerkT02Mara auto
MagicEffect Property MQpathToHHShrineEffect auto
Int Property InfamyChangeGodlyBoons auto

Function ObtainGodlyBoon(ObjectReference akCaster, MagicEffect akEffect)

	if akEffect == PerkT01Dibella || akEffect == PerkT02Mara || akEffect == MQpathToHHShrineEffect 
		If !ccMTYSSE001_Quest.IsRunning()
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
	endFunction

endState

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