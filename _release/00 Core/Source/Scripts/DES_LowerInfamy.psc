Scriptname DES_LowerInfamy extends ReferenceAlias  

GlobalVariable property ccMTYSSE001_CrusaderGlobalInfamy auto
Formlist property ccMTY_DES_NineDivines auto
float property InfamyChangeShrines auto
float property CoolDown auto
Quest Property ccMTYSSE001_Quest auto
Keyword Property DES_InfamyEffect auto
Actor Property PlayerRef auto
Keyword Property DES_DogBlessingKeyword auto

auto state Waiting
    Event OnMagicEffectApply(ObjectReference akCaster, MagicEffect akEffect)
	;debug.notification("A magic effect has been applied.")
        if ccMTY_DES_NineDivines.HasForm(akEffect) || akEffect.HasKeyword(DES_DogBlessingKeyword)
	    ; debug.notification("A Divine has been prayed to.")
	     If !ccMTYSSE001_Quest.IsRunning()
            		ChangeInfamy(InfamyChangeShrines)
           		GoToState("Cooldown")
		ENDIF
	endIf
    EndEvent

function ChangeInfamy(float d)
	;debug.notification("Infamy is being changed.")
        float oldInfamy = ccMTYSSE001_CrusaderGlobalInfamy.GetValue()
        float newInfamy = ccMTYSSE001_CrusaderGlobalInfamy.Mod(d)
        if(newInfamy < 0.0)
            ccMTYSSE001_CrusaderGlobalInfamy.SetValue(0.0)
            newInfamy = 0.0
        endIf
	;debug.notification("Infamy is now " + newInfamy)
        ;do threshold stuff here
        ;if old infamy < threshold && new infamy > threshold
	(self.getOwningQuest() as DES_CrimeValues).InfamyMessages(oldInfamy, newInfamy)
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

function ChangeInfamy(float d)
endFunction