extends "res://Script/Scene/Trigger/NPCArticleTrigger.gd"

func TrySetDoorOpened():
	var doorCollision: DoorCollision = self.get_node("doorCollision")
	if is_instance_valid(doorCollision):
		var isHas: bool = SceneManager.IsHas_DoorOpened_NPCArticleTriggerTypeIDList(GetNPCArticleTriggerTypeID())
		if isHas:
			doorCollision.SetDisabledTrue()
			SetRectScaleX_0_25()
	
	var doorCollision2: DoorCollision = self.get_node("doorCollision2")
	if is_instance_valid(doorCollision2):
		var isHas: bool = SceneManager.IsHas_DoorOpened_NPCArticleTriggerTypeIDList(GetNPCArticleTriggerTypeID())
		if isHas:
			doorCollision2.SetDisabledTrue()

func CloseDoor():
	var doorCollision: DoorCollision = self.get_node("doorCollision")
	if is_instance_valid(doorCollision):
		doorCollision.SetDisabledFalse()
		SetRectScaleX_1()
		
	var doorCollision2: DoorCollision = self.get_node("doorCollision2")
	if is_instance_valid(doorCollision2):
		doorCollision2.SetDisabledFalse()
