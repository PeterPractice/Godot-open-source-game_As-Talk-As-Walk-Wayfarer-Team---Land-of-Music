extends Control
class_name CommonButtonItem

onready var textureRectPressed = $textureRectPressed

onready var textureRectNormal = $textureRectNormal
onready var textureProgressCD = $textureProgressCD
onready var textureButton1 = $textureButton1
onready var commonLabelLeft = $commonLabelLeft
onready var commonLabelRight = $commonLabelRight

var m_CDStartTimeInMilliseconds: int = 0
var m_CDLengthTimeInMilliseconds: int = 0
var m_UIInputActionEventType: String = ""
var m_IsHadSetPressedTrue: bool = false
var m_IsHadSetPressedTrueCount: int = 0
var m_TypeID: int = 0

func _process(_delta: float):
	if textureRectNormal.visible:
		if 0 < m_CDLengthTimeInMilliseconds:
			var currentTimeInMilliseconds: int = HQH.MilliTime()
			var cDRemainTimeInMilliseconds: int = currentTimeInMilliseconds - m_CDStartTimeInMilliseconds
			var cDValue: float = 0.0
			if 0 < cDRemainTimeInMilliseconds:
				cDValue = (float(cDRemainTimeInMilliseconds) / float(m_CDLengthTimeInMilliseconds)) * UIManager.PROGRESS_MAX_VALUE_100
			
#			HQH.Log("cDValue: %s, m_CDLengthTimeInMilliseconds: %s" % [cDValue, m_CDLengthTimeInMilliseconds])
			SetCurrentCDValue(cDValue)
	
	if m_IsHadSetPressedTrue:
		m_IsHadSetPressedTrueCount += 1
		if UIManager.BUTTON_PRESSED_TRUE_COUNT_STEP < m_IsHadSetPressedTrueCount:
			m_IsHadSetPressedTrue = false
			m_IsHadSetPressedTrueCount = 0
			
			textureRectPressed.visible = false

func SetTextureRectNormalVisible(v: bool):
	textureRectNormal.visible = v
	if textureRectNormal.visible:
		textureButton1.SetPressedAudioType(AudioManager.BUTTON_PRESSED_AUDIO_TYPE.ITEM_PRESSED)
	else:
		textureButton1.SetPressedAudioType(AudioManager.BUTTON_PRESSED_AUDIO_TYPE.NONE)

func SetTextureRectNormal(itemResourceName: String):
	if textureRectNormal.visible:
		var textureResource: Resource = TableManager.Get_PRELOAD_RESOURCE_MAP(itemResourceName)
		textureRectNormal.texture = textureResource
		textureRectNormal.modulate.v = HQH.COMMON_BUTTON_TEXTURERECTNORMAL_MODULATE_V

func SetLeftText(s: String):
	commonLabelLeft.text = s

func SetRightText(s: String):
	commonLabelRight.text = s

func SetCurrentCDValue(cDValue: float):
	textureProgressCD.value = textureProgressCD.max_value - cDValue

func SetCD(cDStartTimeInMilliseconds: int, cDLengthTimeInMilliseconds: int):
	m_CDStartTimeInMilliseconds = cDStartTimeInMilliseconds
	m_CDLengthTimeInMilliseconds = cDLengthTimeInMilliseconds
	
	if 0 == m_CDLengthTimeInMilliseconds:
		SetCurrentCDValue(textureProgressCD.max_value)

func SetUIInputActionEventType(uIInputActionEventType: String):
	m_UIInputActionEventType = uIInputActionEventType

func _on_textureButton1_pressed():
	textureButton1.release_focus()
	
	if textureRectNormal.visible:
		HQH.Log("CommonButtonItem._on_textureButton1_pressed, textureRectNormal.texture.resource_path: %s" % textureRectNormal.texture.resource_path)
		UIManager.UIInputActionEventHandle(m_UIInputActionEventType)

func SetPressedTrue():
	HQH.Log("SetPressedTrue, pressed true m_UIInputActionEventType: %s" % m_UIInputActionEventType)
	
	textureRectPressed.visible = true
	textureButton1._pressed()
	
	m_IsHadSetPressedTrue = true
	m_IsHadSetPressedTrueCount = 0

func SetTypeID(typeID: int):
	m_TypeID = typeID

func _on_textureButton1_mouse_entered():
	UIManager.UpNamePanel_ShowTipsByAvatarTypeID(m_TypeID)

func _on_textureButton1_mouse_exited():
	UIManager.UpNamePanel_HideTipsByAvatarTypeID(false, m_TypeID)
