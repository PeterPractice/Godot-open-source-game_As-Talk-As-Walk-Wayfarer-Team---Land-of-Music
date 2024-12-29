extends Node2D

export var nPCArticleTriggerTypeID: int = 0

onready var textureRect1 = $control3/textureRect1
onready var textureRect2 = $control3/textureRect2
onready var control4 = $control4
onready var colorRectV1 = $control4/colorRectV1

var m_IsMouseEntered: bool = false
var m_IsShowTipsDirty: bool = false
var m_FirstTime_body_entered_NeedInValid_IsHadUsed: bool = false

func _ready():
	SetShowNormal(true)

func SetShowNormal(isShowNormal: bool):
	if isShowNormal:
		# Normal
		textureRect1.visible = true
		textureRect2.visible = false
		for iv in control4.get_children():
			iv.color = HQH.COLORPALETTE_SCENE.COLOR_ODETOJOY_BG
	else:
		# Highlight
		textureRect1.visible = false
		textureRect2.visible = true
		
		var colorHighight: Color = HQH.COLORPALETTE_SCENE.COLOR_ODETOJOY_HIGHLIGHT
		if 0 < nPCArticleTriggerTypeID:
			var goodsTypeID: int = UIManager.GetOdeToJoyGoodsTypeIDByNPCArticleTriggerTypeID(nPCArticleTriggerTypeID)
			var goodsInfo: Dictionary = TableManager.GetGoodsInfo(goodsTypeID)
			var colorString: String = TableManager.TableGetValue_EquipTable1_ColorString(String(goodsInfo.equipTypeID))
			colorHighight = Color(colorString)
		
		for iv in control4.get_children():
			iv.color = colorHighight

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

func GetIsValid():
	return (0 < nPCArticleTriggerTypeID) and self.visible

func SetInvalid():
	self.visible = false

func ShowOutline():
	SetShowNormal(false)

func HideOutline():
	SetShowNormal(true)

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

func _on_area2D1_mouse_entered():
	_on_textureRect1_mouse_entered()

func _on_area2D1_mouse_exited():
	_on_textureRect1_mouse_exited()

func MouseExited():
	if not GetIsValid():
		return
	
	m_IsMouseEntered = false
	HideOutline()
	UIManager.UpNamePanel_HideTips()

func CheckInvalid(wrangleDialogTypeID: int, currentWrangleDialogTypeID: int):
	var isHasSuccess: bool = SaveGameManager.IsHasSaveGameData_Archive_TaskList_TaskInfoByWrangleDialogTypeIDAndlastChoiceWrangleDialogTypeID(wrangleDialogTypeID, currentWrangleDialogTypeID)
	if isHasSuccess:
		SetInvalid()
