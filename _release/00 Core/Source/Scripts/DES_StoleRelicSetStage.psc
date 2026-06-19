Scriptname DES_StoleRelicSetStage extends ReferenceAlias  
{Sets a quest stage when this item is put in the player's inventory.}

Actor Property PlayerRef auto
int Property preReqStage auto
int Property StageToSet auto
int Property RetrieveStageToSet auto
	
auto State waiting	
	Event OnContainerChanged(ObjectReference akNewContainer, ObjectReference akOldContainer)
		if (PlayerRef == akNewContainer)
			if !getOwningQuest().GetStageDone(preReqStage)
				getOwningQuest().SetStage(stageToSet)
			elseif getOwningQuest().GetStageDone(preReqStage)
				getOwningQuest().SetStage(RetrieveStageToSet)			
			endif
			GoToState("inactive")	
		endif
	EndEvent
EndState

State inactive
EndState

