extends Node2D
class_name DoorCollision

onready var collisionShape2D1 = $staticBody2D1/collisionShape2D1

var m_IsBodyEntered: bool = false

func _ready():
	self.visible = false

func _process(_delta: float):
	if not GetDisabled():
		if m_IsBodyEntered:
			if NavigationManager.AStarIsBegin():
				UIManager.DownPanel_AddJournalRecordWithStringKey("NAVIGATIONMANAGER_END_OBSTRUCTIONS_NEARBY")
			
			NavigationManager.AStarEnd()

func GetDisabled() -> bool:
	return collisionShape2D1.disabled

func SetDisabledTrue():
	collisionShape2D1.disabled = true

func SetDisabledFalse():
	collisionShape2D1.disabled = false

func _on_area2D1_body_entered(body: Node2D):
	if body.has_method("GetAvatarObjectID"):
		if AvatarManager.IsCurrentActiveAvatar(body.GetAvatarObjectID()):
			HQH.Log("DoorCollision, _on_area2D1_body_entered")
			
			m_IsBodyEntered = true

func _on_area2D1_body_exited(body: Node2D):
	if body.has_method("GetAvatarObjectID"):
		if AvatarManager.IsCurrentActiveAvatar(body.GetAvatarObjectID()):
			HQH.Log("DoorCollision, _on_area2D1_body_exited")
			
			m_IsBodyEntered = false
