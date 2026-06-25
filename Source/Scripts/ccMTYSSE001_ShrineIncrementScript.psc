scriptName ccMTYSSE001_ShrineIncrementScript extends Quest

globalvariable property ccMTYSSE001_CrusaderGlobalInfamy auto
globalvariable property ccMTYSSE001_CrusaderGlobalMessageShown auto
Int property TargetValue auto
globalvariable property ccMTYSSE001_CrusaderGlobalShrines auto
referencealias[] property Shrines auto
Quest property ccMTYSSE001_Quest auto

Int ShrinesPrayedAt

function ResetShrines()
	ShrinesPrayedAt = 0
	ccMTYSSE001_CrusaderGlobalShrines.SetValueInt(0)
	UpdateCurrentInstanceGlobal(ccMTYSSE001_CrusaderGlobalShrines)
	Int i = 0
	while i < Shrines.length
		Shrines[i].TryToEnableNoWait()
		i += 1
	endWhile
	ccMTYSSE001_Quest.SetObjectiveCompleted(10, 0 as Bool)
	ccMTYSSE001_Quest.SetObjectiveDisplayed(10, true, true)
endFunction

function SetCrimeStatBaseline()
	ccMTYSSE001_CrusaderGlobalInfamy.SetValueInt(0)
endFunction

function HasPrayed()
	ccMTYSSE001_CrusaderGlobalShrines.Mod(1 as Float)
	ShrinesPrayedAt = ccMTYSSE001_CrusaderGlobalShrines.GetValueInt()
	UpdateCurrentInstanceGlobal(ccMTYSSE001_CrusaderGlobalShrines)
	if ShrinesPrayedAt >= TargetValue
		ccMTYSSE001_Quest.SetObjectiveCompleted(10, 1 as Bool)
		ccMTYSSE001_Quest.SetStage(100)
	elseIf ShrinesPrayedAt < TargetValue
		ccMTYSSE001_Quest.SetObjectiveCompleted(10, 0 as Bool)
		ccMTYSSE001_Quest.SetObjectiveDisplayed(10, true, true)
	endIf
endFunction
