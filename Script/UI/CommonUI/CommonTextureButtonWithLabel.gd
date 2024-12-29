extends "res://Script/UI/CommonUI/CommonTextureButton.gd"
class_name CommonTextureButtonWithLabel

onready var commonLabelLeft = $commonLabelLeft
onready var textureRectPressed = $textureRectPressed

var m_IsHadSetPressedTrue: bool = false
var m_IsHadSetPressedTrueCount: int = 0

func _process(_delta: float):
	if m_IsHadSetPressedTrue:
		m_IsHadSetPressedTrueCount += 1
		if UIManager.BUTTON_PRESSED_TRUE_COUNT_STEP < m_IsHadSetPressedTrueCount:
			m_IsHadSetPressedTrue = false
			m_IsHadSetPressedTrueCount = 0
			
			textureRectPressed.visible = false

func SetLeftText(s: String):
	commonLabelLeft.text = s

func GetLeftText() -> String:
	return commonLabelLeft.text

func GetLeftLabel() -> CommonLabel:
	return commonLabelLeft

func SetPressedTrue():
	textureRectPressed.visible = true
	self._pressed()
	
	m_IsHadSetPressedTrue = true
	m_IsHadSetPressedTrueCount = 0
