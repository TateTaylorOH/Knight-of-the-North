Scriptname DES_CrusaderRelics_InfamyIncrementor extends Quest  
{Controls Infamy modifications based on crime.}

DES_CrusaderRelics_InfamyFunctions Property InfamyFunctions auto

Int Property InfamyChangeMurder auto

Event OnStoryKillActor(ObjectReference akVictim, ObjectReference akKiller, Location akLocation, int aiCrimeStatus, \
  int aiRelationshipRank)
{Modifies the Player's Infamy based on murder.}
	if aiCrimeStatus
		InfamyFunctions.modInfamy(InfamyChangeMurder)
	endIf
	stop()
endEvent

Int Property InfamyChangeAssault auto

Event OnStoryAssaultActor(ObjectReference akVictim, ObjectReference akAttacker, Location akLocation, int aiCrime)
{Modifies the Player's Infamy based on assault.}
	if aiCrime
		InfamyFunctions.modInfamy(InfamyChangeAssault)		
	endIf
	stop()
endEvent

Int Property InfamyChangeTheft auto

Event OnStoryAddToPlayer(ObjectReference akOwner, ObjectReference akContainer, Location akLocation, Form akItemBase, \
  int aiAcquireType)
{Modifies the Player's Infamy based on theft.}
	if aiAcquireType == 1 ; Steal
		InfamyFunctions.modInfamy(InfamyChangeTheft)
	endIf
	stop()
endEvent

Int Property InfamyChangeEscapeJail auto

Event OnStoryEscapeJail(Location akLocation, Form akCrimeGroup)
{Modifies the Player's Infamy based on prison breaks.}
	InfamyFunctions.modInfamy(InfamyChangeEscapeJail)
	stop()
endEvent

Int Property InfamyChangeTrespassing auto

Event OnStoryCrimeGold(ObjectReference akVictim, ObjectReference akCriminal, Form akFaction, int aiGoldAmount, int aiCrime)
{Modifies the Player's Infamy based on trespassing.}
	if aiCrime == 2 ; Trespassing
		InfamyFunctions.modInfamy(InfamyChangeTrespassing)
	endIf
	stop()
EndEvent