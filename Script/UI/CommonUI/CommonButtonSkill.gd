extends Control
class_name CommonButtonSkill

onready var textureRectNormal = $textureRectNormal
onready var textureProgressCD = $textureProgressCD
onready var textureButton1 = $textureButton1
onready var commonLabelLeft = $commonLabelLeft

var m_CDStartTimeInMilliseconds: int = 0
var m_CDLengthTimeInMilliseconds: int = 0

func _process(_delta: float):
	if textureRectNormal.visible:
		if 0 < m_CDLengthTimeInMilliseconds:
			var currentTimeInMilliseconds: int = HQH.MilliTime()
			var cDRemainTimeInMilliseconds: int = currentTimeInMilliseconds - m_CDStartTimeInMilliseconds
			var cDValue: float = 0.0
			if 0 < cDRemainTimeInMilliseconds:
				cDValue = (float(cDRemainTimeInMilliseconds) / float(m_CDLengthTimeInMilliseconds)) * UIManager.PROGRESS_MAX_VALUE_100
			
			SetCurrentCDValue(cDValue)

func SetTextureRectNormalVisible(v: bool):
	textureRectNormal.visible = v

func SetTextureRectNormal(skillResourceName: String):
	if textureRectNormal.visible:
		var textureResource: Resource = TableManager.Get_PRELOAD_RESOURCE_MAP(skillResourceName)
		textureRectNormal.texture = textureResource

func SetLeftText(s: String):
	commonLabelLeft.text = s

func SetCurrentCDValue(cDValue: float):
	textureProgressCD.value = textureProgressCD.max_value - cDValue

func SetCD(cDStartTimeInMilliseconds: int, cDLengthTimeInMilliseconds: int):
	m_CDStartTimeInMilliseconds = cDStartTimeInMilliseconds
	m_CDLengthTimeInMilliseconds = cDLengthTimeInMilliseconds

func _on_textureButton1_pressed():
	textureButton1.release_focus()
	
	if textureRectNormal.visible:
		HQH.Log("CommonButtonSkill._on_textureButton1_pressed, textureRectNormal.texture.resource_path: %s" % textureRectNormal.texture.resource_path)
