extends Node2D

export var nPCArticleTriggerTypeID: int = 0

onready var textureRect1 = $textureRect1

var m_IsMouseEntered: bool = false
var m_IsShowTipsDirty: bool = false
var m_FirstTime_body_entered_NeedInValid_IsHadUsed: bool = false

func _ready():
	textureRect1.material = textureRect1.material.duplicate(true)
	
	var nPCArticleTriggerInfo: Dictionary = TableManager.GetNPCArticleTriggerInfo(nPCArticleTriggerTypeID)
	var textureResource: Resource = TableManager.Get_PRELOAD_RESOURCE_MAP(nPCArticleTriggerInfo.preloadResource)
	textureRect1.texture = textureResource

func _process(_delta: float):
	if not GetIsValid():
		return
	
	if AvatarManager.IsCurrentActiveAvatarValid():
		m_FirstTime_body_entered_NeedInValid_IsHadUsed = true
	
	if m_IsShowTipsDirty:
		m_IsShowTipsDirty = false
		
		var nPCArticleTriggerInfo: Dictionary = TableManager.GetNPCArticleTriggerInfo(nPCArticleTriggerTypeID)
		UIManager.UpNamePanel_ShowTipsWithStringKey(nPCArticleTriggerInfo.showNameKey)
	
	if m_IsMouseEntered:
		if AvatarManager.IsCurrentActiveAvatarInState_IDLE():
			if not UIManager.UpNamePanel_IsTipsVisible():
				m_IsShowTipsDirty = true
		else:
			MouseExited()

func GetNPCArticleTriggerTypeID() -> int:
	return nPCArticleTriggerTypeID

func SetRectScaleX_1():
	textureRect1.rect_scale = Vector2(1.0, 1.0)

func SetRectScaleX_0_5():
	textureRect1.rect_scale = Vector2(0.5, 1.0)

func SetRectScaleX_0_25():
	textureRect1.rect_scale = Vector2(0.25, 1.0)

func GetIsValid():
	return (0 < nPCArticleTriggerTypeID) and self.visible

func SetInvalid():
	self.visible = false

func SetValid():
	self.visible = true

func ShowOutline():
	textureRect1.material.shader = TableManager.Get_PRELOAD_RESOURCE_MAP("Shader_SpriteOutline")
	var OUTLINE_WIDTH: float = 1.5
	textureRect1.material.set_shader_param("outline_width", OUTLINE_WIDTH)
	textureRect1.material.set_shader_param("outline_color", HQH.COLORPALETTE_AVATAR.COLOR_NPC_ARTICLE_OUTLINE)

func HideOutline():
	textureRect1.material.shader = null

func SetInInteraction(isInInteraction: bool):
	if isInInteraction:
		ShowOutline()
	else:
		HideOutline()

func _on_area2D1_body_entered(body: Node2D):
	if not GetIsValid():
		return
	
	if not m_FirstTime_body_entered_NeedInValid_IsHadUsed:
		return
	
	UIManager.NPCTrigger_on_area2D1_body_entered(body, self, TableManager.NPC_TRIGGER_TYPE.NPC_ARTICLE, nPCArticleTriggerTypeID)

func _on_area2D1_body_exited(body: Node2D):
	if not GetIsValid():
		return
	
	m_FirstTime_body_entered_NeedInValid_IsHadUsed = true
	
	UIManager.NPCTrigger_on_area2D1_body_exited(body, self)

func _on_textureRect1_mouse_entered():
	if not GetIsValid():
		return
	
	m_IsMouseEntered = true
	AudioManager.PlayByName_ButtonHover()
	ShowOutline()
	var nPCArticleTriggerInfo: Dictionary = TableManager.GetNPCArticleTriggerInfo(nPCArticleTriggerTypeID)
	UIManager.UpNamePanel_ShowTipsWithStringKey(nPCArticleTriggerInfo.showNameKey)

func _on_textureRect1_mouse_exited():
	MouseExited()

func MouseExited():
	if not GetIsValid():
		return
	
	m_IsMouseEntered = false
	HideOutline()
	UIManager.UpNamePanel_HideTips()

func TrySetDoorOpened():
	var doorCollision: DoorCollision = self.get_node("doorCollision")
	if is_instance_valid(doorCollision):
		var isHas: bool = SceneManager.IsHas_DoorOpened_NPCArticleTriggerTypeIDList(GetNPCArticleTriggerTypeID())
		if isHas:
			doorCollision.SetDisabledTrue()
			SetRectScaleX_0_5()

func CloseDoor():
	var doorCollision: DoorCollision = self.get_node("doorCollision")
	if is_instance_valid(doorCollision):
		doorCollision.SetDisabledFalse()
		SetRectScaleX_1()

func CheckInvalid(wrangleDialogTypeID: int, currentWrangleDialogTypeID: int):
	var isHasSuccess: bool = SaveGameManager.IsHasSaveGameData_Archive_TaskList_TaskInfoByWrangleDialogTypeIDAndlastChoiceWrangleDialogTypeID(wrangleDialogTypeID, currentWrangleDialogTypeID)
	if isHasSuccess:
		SetInvalid()
