Scriptname DES_CrusaderRelics_QuestAlias extends ReferenceAlias
{Hands off events to the Quest Functions script.}

Event OnLocationChange(Location akOldLoc, Location akNewLoc)
	(GetOwningQuest() as DES_CrusaderRelics_QuestFunctions).OnLocationChange_Alias(akOldLoc, akNewLoc)
endEvent