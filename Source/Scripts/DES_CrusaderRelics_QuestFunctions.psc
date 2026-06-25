Scriptname DES_CrusaderRelics_QuestFunctions extends Quest
{Shared functions for the Relics of the Crusader Quest.}

;--------------------------------------------------
;QUEST FUNCTIOINS
;--------------------------------------------------

Quest Property DES_CrusaderRelics_Quest auto
Quest Property DES_CrusaderRelics_QuestPointer auto

Function CheckRelics(int o)
{Sets the relevant objective Completed then checks to see if the Player has gathered all the Relics.}

	SetObjectiveCompleted(o)

	int i = 10
	int s = 0
	While i < 80
		if GetStageDone(i)
			s += 1
		endIf
		i += 10
	endWhile
	if s == 7
		if GetStageDone(5)
			DES_CrusaderRelics_Quest.SetStage(255)
		else
			DES_CrusaderRelics_QuestPointer.SetObjectiveCompleted(4)
			DES_CrusaderRelics_Quest.SetStage(255)
		endif			
 	endIf

endFunction

;--------------------------------------------------

Armor[] Property CrusaderArmor auto
Weapon[] Property CrusaderWeapon auto

Function RefreshMagicEffects()
{Unequips and reequips Crusader Relics to update the magnitude of their effects.}

	int i = 0
	while i < CrusaderArmor.Length
		Reequip(CrusaderArmor[i])
		i += 1
	endWhile

	i = 0
	while i < CrusaderWeapon.Length
		Reequip(CrusaderWeapon[i])
		i += 1
	endWhile

endFunction

;--------------------------------------------------

Actor Property PlayerRef auto

Function Reequip(Form akItem)
{Silently reequips the Player's item.}

DefaultObjectManager kDefObjMan = Game.GetFormFromFile(0x00000031, "Skyrim.esm") as DefaultObjectManager

	If PlayerRef.IsEquipped(akItem)
		Form exArmorPickupSound = kDefObjMan.GetForm("PUSA")
		Form exArmorPutdownSound = kDefObjMan.GetForm("PDSA")
		Form exWeaponPickupSound = kDefObjMan.GetForm("PUSW")
		Form exWeaponPutdownSound = kDefObjMan.GetForm("PDSW")

		kDefObjMan.SetForm("PUSA", None)
		kDefObjMan.SetForm("PDSA", None)
		kDefObjMan.SetForm("PUSW", None)
		kDefObjMan.SetForm("PDSW", None)
		PlayerRef.UnequipItem(akItem, false, true)
		PlayerRef.EquipItem(akItem, false, true)
		kDefObjMan.SetForm("PUSA", exArmorPickupSound)
		kDefObjMan.SetForm("PDSA", exArmorPutdownSound)
		kDefObjMan.SetForm("PUSW", exWeaponPickupSound)
		kDefObjMan.SetForm("PDSW", exWeaponPutdownSound)
	endIf

endFunction

;--------------------------------------------------

Location Property StendarrsBeaconLocation auto

Function OnLocationChange_Alias(Location akOldLoc, Location akNewLoc)

	if IsStageDone(255) && akNewLoc != StendarrsBeaconLocation
		SetStage(300)
	endif

endFunction
