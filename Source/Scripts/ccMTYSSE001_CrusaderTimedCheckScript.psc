scriptName ccMTYSSE001_CrusaderTimedCheckScript extends ActiveMagicEffect

globalvariable property ccMTYSSE001_CrusaderGlobalInfamy auto
Int property timeToCheck auto
globalvariable property ccMTYSSE001_CrusaderGlobalMessageShown auto
message property ccMTYSSE001_CrusaderRelicsShrine auto
Int property infamyUnequipNumber auto
quest property ccMTYSSE001_Quest auto
Int property infamyWarningNumber auto

;function OnEffectStart(Actor akTarget, Actor akCaster)
;	RegisterForSingleUpdateGameTime(timeToCheck as Float)
;endFunction

;function OnUpdateGameTime()
;	Int myCrime = ccmtysse001_crimesharedfunctions.GetPlayerCrimeTotal()
;	if myCrime > ccMTYSSE001_CrusaderGlobalInfamy.GetValueInt()
;		ccMTYSSE001_CrusaderRelicsShrine.Show()
;		ccMTYSSE001_CrusaderGlobalMessageShown.SetValueInt(2)
;		ccMTYSSE001_Quest.SetStage(10)
;	endIf
;	RegisterForSingleUpdateGameTime(timeToCheck as Float)
;endFunction

;function OnEffectFinish(Actor akTarget, Actor akCaster)
;	UnregisterForUpdateGameTime()
;endFunction
