Scriptname DES_CrusaderRelics_InfamyTrackerAlias extends ReferenceAlias  
{Hands off events to the Infamy Functions script.}

DES_CrusaderRelics_InfamyFunctions Property InfamyFunctions auto

Event OnMagicEffectApply(ObjectReference akCaster, MagicEffect akEffect)
	InfamyFunctions.OnMagicEffectApply_Alias(akCaster, akEffect)
EndEvent

Event OnSpellCast(Form akSpell)
	InfamyFunctions.OnSpellCast_Alias(akSpell)
endEvent
