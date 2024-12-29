extends Control
class_name CommonHeadPortrait

onready var textureRectHeadPortrait = $textureRectHeadPortrait
onready var textureRectHover = $textureRectHover

var m_TypeID: int = 0

func SetHeadPortrait(headPortraitName: String):
	var headPortraitResource: Resource = TableManager.Get_PRELOAD_RESOURCE_MAP(headPortraitName)
	textureRectHeadPortrait.texture = headPortraitResource

func SetTypeID(typeID: int):
	m_TypeID = typeID

func _on_CommonHeadPortrait_mouse_entered():
	if 0 < m_TypeID:
		AudioManager.PlayByName_ButtonHover()
		textureRectHover.visible = true
		UIManager.UpNamePanel_ShowTipsByAvatarTypeID(m_TypeID)

func _on_CommonHeadPortrait_mouse_exited():
	if 0 < m_TypeID:
		textureRectHover.visible = false
		UIManager.UpNamePanel_HideTipsByAvatarTypeID(false, m_TypeID)
