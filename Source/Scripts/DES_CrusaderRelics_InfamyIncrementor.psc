Scriptname DES_CrusaderRelics_InfamyIncrementor extends Quest  
{Controls Infamy modifications based on crime.}

DES_CrusaderRelics_InfamyFunctions Property InfamyFunctions auto

Event OnStoryKillActor(ObjectReference akVictim, ObjectReference akKiller, Location akLocation, int aiCrimeStatus, \
  int aiRelationshipRank)
	InfamyFunctions.Murder(akVictim, akKiller, akLocation, aiCrimeStatus, aiRelationshipRank)
	stop()
endEvent

Event OnStoryAssaultActor(ObjectReference akVictim, ObjectReference akAttacker, Location akLocation, int aiCrime)
	InfamyFunctions.Assault(akVictim, akAttacker, akLocation, aiCrime)
	stop()
endEvent

Event OnStoryAddToPlayer(ObjectReference akOwner, ObjectReference akContainer, Location akLocation, Form akItemBase, \
  int aiAcquireType)	
	InfamyFunctions.Theft(akOwner, akContainer, akLocation, akItemBase, aiAcquireType)
	stop()
endEvent

Event OnStoryEscapeJail(Location akLocation, Form akCrimeGroup)
	InfamyFunctions.EscapeJail(akLocation, akCrimeGroup)
	stop()
endEvent

Event OnStoryCrimeGold(ObjectReference akVictim, ObjectReference akCriminal, Form akFaction, int aiGoldAmount, int aiCrime)
	InfamyFunctions.Trespassing(akVictim, akCriminal, akFaction, aiGoldAmount, aiCrime)
	stop()
EndEvent
