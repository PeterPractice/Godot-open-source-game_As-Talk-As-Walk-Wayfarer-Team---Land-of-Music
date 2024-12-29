extends Control
class_name CommonButtonBuff

onready var textureRectNormal = $textureRectNormal
onready var textureProgressCD = $textureProgressCD
onready var textureButton1 = $textureButton1
onready var commonLabelRight = $commonLabelRight

var m_CDStartTimeInMilliseconds: int = 0
var m_CDLengthTimeInMilliseconds: int = 0
var m_UIInputActionEventType: String = ""
var m_GoodsTypeID: int = 0

func _process(_delta: float):
	if not self.visible:
		return
	
	if 0 < m_CDLengthTimeInMilliseconds:
		var currentTimeInMilliseconds: int = HQH.MilliTime()
		var cDRemainTimeInMilliseconds: int = currentTimeInMilliseconds - m_CDStartTimeInMilliseconds
		var cDValue: float = 0.0
		if 0 < cDRemainTimeInMilliseconds:
			cDValue = (float(cDRemainTimeInMilliseconds) / float(m_CDLengthTimeInMilliseconds)) * UIManager.PROGRESS_MAX_VALUE_100
		
		SetCurrentCDValue(cDValue)

func SetTextureRectNormal(buffResourceName: String):
	var textureResource: Resource = TableManager.Get_PRELOAD_RESOURCE_MAP(buffResourceName)
	textureRectNormal.texture = textureResource
	textureRectNormal.modulate.v = HQH.COMMON_BUTTON_TEXTURERECTNORMAL_MODULATE_V

func SetRightText(s: String):
	commonLabelRight.text = s

func SetCurrentCDValue(cDValue: float):
	textureProgressCD.value = textureProgressCD.max_value - cDValue

func SetCD(cDStartTimeInMilliseconds: int, cDLengthTimeInMilliseconds: int):
	m_CDStartTimeInMilliseconds = cDStartTimeInMilliseconds
	m_CDLengthTimeInMilliseconds = cDLengthTimeInMilliseconds

func SetUIInputActionEventType(uIInputActionEventType: String):
	m_UIInputActionEventType = uIInputActionEventType

func _on_textureButton1_pressed():
	textureButton1.release_focus()
	
	if textureRectNormal.visible:
		HQH.Log("CommonButtonBuff._on_textureButton1_pressed, textureRectNormal.texture.resource_path: %s" % textureRectNormal.texture.resource_path)
		UIManager.UIInputActionEventHandle(m_UIInputActionEventType)

func SetGoodsTypeID(goodsTypeID: int):
	self.m_GoodsTypeID = goodsTypeID
	
func _on_textureButton1_mouse_entered():
	if 0 < m_GoodsTypeID:
		var goodsInfo: Dictionary = TableManager.GetGoodsInfo(m_GoodsTypeID)
		if not goodsInfo.empty():
			var tipsString: String = TableManager.GetLanguageString(goodsInfo.goodsName)
			UIManager.UpNamePanel_ShowTips(tipsString)

func _on_textureButton1_mouse_exited():
	if 0 < m_GoodsTypeID:
		UIManager.UpNamePanel_HideTips()

func SetTextureButton1DisabledTrue():
	textureButton1.disabled = true

func SetTextureButton1PlayAudio_Hover_false():
	textureButton1.SetPlayAudio_Hover_false()
