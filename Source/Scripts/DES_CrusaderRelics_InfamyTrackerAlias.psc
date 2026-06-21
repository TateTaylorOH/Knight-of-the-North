Scriptname DES_CrusaderRelics_InfamyTrackerAlias extends ReferenceAlias  
{Hands off events to the Infamy Functions script.}

Event OnMagicEffectApply(ObjectReference akCaster, MagicEffect akEffect)
	(self.getOwningQuest() as DES_CrusaderRelics_InfamyFunctions).OnMagicEffectApply_Alias(akCaster, akEffect)
EndEvent



