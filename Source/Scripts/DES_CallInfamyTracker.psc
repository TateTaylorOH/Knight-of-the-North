Scriptname DES_CallInfamyTracker extends Quest  

Quest Property DES_InfamyTracker auto

Event OnStoryKillActor(ObjectReference akVictim, ObjectReference akKiller, Location akLocation, int aiCrimeStatus, \
  int aiRelationshipRank)
	Debug.MessageBox("Murder!")
	IF DES_InfamyTracker.IsRunning()
		if aiCrimeStatus
			(DES_InfamyTracker as DES_CrimeValues).modInfamy(5)
		endIf
	endif
	stop()
endEvent

Event OnStoryAssaultActor(ObjectReference akVictim, ObjectReference akAttacker, Location akLocation, int aiCrime)
	Debug.MessageBox("Assault!!")
	IF DES_InfamyTracker.IsRunning()
		if aiCrime
			(DES_InfamyTracker as DES_CrimeValues).modInfamy(2)		
		endIf
	endif
	stop()
endEvent

Event OnStoryAddToPlayer(ObjectReference akOwner, ObjectReference akContainer, Location akLocation, Form akItemBase, \
  int aiAcquireType)	
	Debug.MessageBox("Theft!")
  	IF DES_InfamyTracker.IsRunning()
		if aiAcquireType == 1 ; Steal
			(DES_InfamyTracker as DES_CrimeValues).modInfamy(1)
		endIf
	endif
	stop()
endEvent

Event OnStoryEscapeJail(Location akLocation, Form akCrimeGroup)
	Debug.MessageBox("Escape!")	
	IF DES_InfamyTracker.IsRunning()
		(DES_InfamyTracker as DES_CrimeValues).modInfamy(1)
	endif
	stop()
endEvent

Event OnStoryCrimeGold(ObjectReference akVictim, ObjectReference akCriminal, Form akFaction, int aiGoldAmount, int aiCrime)
	Debug.MessageBox("Crime!")
	IF DES_InfamyTracker.IsRunning()
		if aiCrime == 2 ; Trespassing
			(DES_InfamyTracker as DES_CrimeValues).modInfamy(1)
		endIf
	endif
	stop()
EndEvent