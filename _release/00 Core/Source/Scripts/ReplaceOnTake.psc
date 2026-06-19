Scriptname ReplaceOnTake extends ObjectReference  

Armor Property ThisArmor Auto
Armor Property OtherArmor Auto

Event OnContainerChanged(ObjectReference akNewContainer, ObjectReference akOldContainer)
	if(akNewContainer)
		int count = akNewContainer.getItemCount(ThisArmor)
		akNewContainer.removeItem(ThisArmor, count, true)
		akNewContainer.addItem(OtherArmor, count, true)
	endIf
endEvent