Scriptname DES_CrusaderRelics_InfamyTrackerAlias extends ReferenceAlias  
{Hands off events to the Infamy Functions script.}

DES_CrusaderRelics_InfamyFunctions Property InfamyFunctions auto

Event OnMagicEffectApply(ObjectReference akCaster, MagicEffect akEffect)
	(GetOwningQuest() as DES_CrusaderRelics_InfamyFunctions).OnMagicEffectApply_Alias(akCaster, akEffect)
EndEvent
