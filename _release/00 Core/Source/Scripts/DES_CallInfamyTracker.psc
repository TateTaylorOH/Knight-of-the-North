Scriptname DES_CallInfamyTracker extends Quest  

Quest Property DES_InfamyTrackerQuest auto

Event OnStoryKillActor(ObjectReference akVictim, ObjectReference akKiller, Location akLocation, int aiCrimeStatus, \
  int aiRelationshipRank)
	IF DES_InfamyTrackerQuest.IsRunning()
		if aiCrimeStatus
			(DES_InfamyTrackerQuest as DES_CrimeValues).modInfamy(5)
		endIf
	endif
	stop()
endEvent

Event OnStoryAssaultActor(ObjectReference akVictim, ObjectReference akAttacker, Location akLocation, int aiCrime)
	IF DES_InfamyTrackerQuest.IsRunning()
		if aiCrime
			(DES_InfamyTrackerQuest as DES_CrimeValues).modInfamy(2)		
		endIf
	endif
	stop()
endEvent

Event OnStoryAddToPlayer(ObjectReference akOwner, ObjectReference akContainer, Location akLocation, Form akItemBase, \
  int aiAcquireType)	
  	IF DES_InfamyTrackerQuest.IsRunning()
		if aiAcquireType == 1 ; Steal
			(DES_InfamyTrackerQuest as DES_CrimeValues).modInfamy(1)
		endIf
	endif
	stop()
endEvent

Event OnStoryEscapeJail(Location akLocation, Form akCrimeGroup)	
	IF DES_InfamyTrackerQuest.IsRunning()
		(DES_InfamyTrackerQuest as DES_CrimeValues).modInfamy(1)
	endif
	stop()
endEvent

Event OnStoryCrimeGold(ObjectReference akVictim, ObjectReference akCriminal, Form akFaction, int aiGoldAmount, int aiCrime)
	IF DES_InfamyTrackerQuest.IsRunning()
		if aiCrime == 2 ; Trespassing
			(DES_InfamyTrackerQuest as DES_CrimeValues).modInfamy(1)
		endIf
	endif
	stop()
EndEvent