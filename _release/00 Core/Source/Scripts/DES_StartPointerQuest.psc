Scriptname DES_StartPointerQuest extends ObjectReference  

GlobalVariable Property RelicGlobal Auto
Quest Property ccMTY_DES_CrusaderPointerQuest auto

Event OnActivate(ObjectReference akActionRef)
	RelicGlobal.SetValue(1)
	ccMTY_DES_CrusaderPointerQuest.SetStage(10)
EndEvent