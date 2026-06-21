Scriptname DES_CrusaderRelics_InfamyIncrementor extends Quest  

Quest Property DES_CrusaderRelics_InfamyTracker auto
DES_CrusaderRelics_InfamyFunctions Property InfamyFunctions auto

Event OnStoryKillActor(ObjectReference akVictim, ObjectReference akKiller, Location akLocation, int aiCrimeStatus, \
  int aiRelationshipRank)
	;Debug.MessageBox("Murder!")
	IF DES_CrusaderRelics_InfamyTracker.IsRunning()
		if aiCrimeStatus
			InfamyFunctions.modInfamy(5)
		endIf
	endif
	stop()
endEvent

Event OnStoryAssaultActor(ObjectReference akVictim, ObjectReference akAttacker, Location akLocation, int aiCrime)
	;Debug.MessageBox("Assault!!")
	IF DES_CrusaderRelics_InfamyTracker.IsRunning()
		if aiCrime
			InfamyFunctions.modInfamy(2)		
		endIf
	endif
	stop()
endEvent

Event OnStoryAddToPlayer(ObjectReference akOwner, ObjectReference akContainer, Location akLocation, Form akItemBase, \
  int aiAcquireType)	
	;Debug.MessageBox("Theft!")
  	IF DES_CrusaderRelics_InfamyTracker.IsRunning()
		if aiAcquireType == 1 ; Steal
			InfamyFunctions.modInfamy(1)
		endIf
	endif
	stop()
endEvent

Event OnStoryEscapeJail(Location akLocation, Form akCrimeGroup)
	;Debug.MessageBox("Escape!")	
	IF DES_CrusaderRelics_InfamyTracker.IsRunning()
		InfamyFunctions.modInfamy(1)
	endif
	stop()
endEvent

Event OnStoryCrimeGold(ObjectReference akVictim, ObjectReference akCriminal, Form akFaction, int aiGoldAmount, int aiCrime)
	;Debug.MessageBox("Crime!")
	IF DES_CrusaderRelics_InfamyTracker.IsRunning()
		if aiCrime == 2 ; Trespassing
			InfamyFunctions.modInfamy(1)
		endIf
	endif
	stop()
EndEvent
