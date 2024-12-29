extends Node2D

onready var commonHeadPortrait1 = $controlPanel/commonHeadPortrait1
onready var commonButtonSkill1 = $controlPanel/controlButton/commonButtonSkill1
onready var commonButtonSkill2 = $controlPanel/controlButton/commonButtonSkill2
onready var commonButtonItem1 = $controlPanel/controlButton/commonButtonItem1
onready var commonButtonItem2 = $controlPanel/controlButton/commonButtonItem2
onready var commonButtonBuff1 = $controlPanel/controlButton/commonButtonBuff1
onready var commonButtonBuff2 = $controlPanel/controlButton/commonButtonBuff2
onready var commonRichTextLabel1 = $controlPanel/controlCommonRichTextLabel/commonRichTextLabel1
onready var commonRichTextLabelWave = $controlPanel/controlCommonRichTextLabel/commonRichTextLabelWave
onready var commonRichTextLabelTornado = $controlPanel/controlCommonRichTextLabel/commonRichTextLabelTornado
onready var commonRichTextLabelShake = $controlPanel/controlCommonRichTextLabel/commonRichTextLabelShake
onready var commonRichTextLabelFade = $controlPanel/controlCommonRichTextLabel/commonRichTextLabelFade
onready var commonRichTextLabelRainbow = $controlPanel/controlCommonRichTextLabel/commonRichTextLabelRainbow
onready var commonRichTextLabelGhost = $controlPanel/controlCommonRichTextLabel/commonRichTextLabelGhost
onready var commonRichTextLabelPulse = $controlPanel/controlCommonRichTextLabel/commonRichTextLabelPulse
onready var commonRichTextLabelMatrix = $controlPanel/controlCommonRichTextLabel/commonRichTextLabelMatrix

var m_CommonButtonSkill1CD: float = 0.0
var m_CommonButtonItem1CD: float = 0.0
var m_CommonButtonBuff2CD: float = 0.0

func _ready():
	$node2DWalkScene/node2DWater/node2DSuanLaTang/suanLaTang1.SetRandom()
	$node2DWalkScene/node2DWater/node2DSuanLaTang/suanLaTang2.SetRandom()
	
	commonHeadPortrait1.SetHeadPortrait("HeadPortrait_Player1")
	
	commonButtonSkill1.SetTextureRectNormal("Skill_SkillConventionalFlatAttack")
	commonButtonSkill1.SetLeftText("U")
	commonButtonSkill2.SetTextureRectNormal("Skill_SkillConventionalLongRangeAttack")
	commonButtonSkill2.SetLeftText("J")
	
	commonButtonItem1.SetTextureRectNormal("Item_ItemHP1")
	commonButtonItem1.SetLeftText("1")
	commonButtonItem1.SetRightText("10")
	commonButtonItem2.SetTextureRectNormal("Item_ItemHP2")
	commonButtonItem2.SetLeftText("2")
	commonButtonItem2.SetRightText("20")
	
	commonButtonBuff1.SetTextureRectNormal("Skill_SkillConventionalFlatAttack")
	commonButtonBuff1.SetRightText("33")
	commonButtonBuff2.SetTextureRectNormal("Item_ItemMP05")
	commonButtonBuff2.SetRightText("44")
	
	# RichText Sample string:
	#[color=#FF0000]Red Color Text[/color]\n
	#[url=COMMONRICHTEXTLABEL_META_CLICKED_EVENT1_COMMONRICHTEXTLABEL1]Click Event 1[/url]\n
	#[u]Underline[/u]\n
	#[color=#FF0000][url=COMMONRICHTEXTLABEL_META_CLICKED_EVENT1_COMMONRICHTEXTLABEL1]Red Color Text, and Click Event 1[/url][/color]\n
	#[color=#FF0000][u]Red Color Text, and Underline[/u][/color]\n
	commonRichTextLabel1.AddText("[color=#FF0000]Red Color Text[/color]\n[url=COMMONRICHTEXTLABEL_META_CLICKED_EVENT1_COMMONRICHTEXTLABEL1]Click Event 1[/url]\n[u]Underline[/u]\n[color=#FF0000][url=COMMONRICHTEXTLABEL_META_CLICKED_EVENT1_COMMONRICHTEXTLABEL1]Red Color Text, and Click Event 1[/url][/color]\n[color=#FF0000][u]Red Color Text, and Underline[/u][/color]\n")
	
	var blueColorString: String = UIManager.RichTextLabel_GetStringWithColor("Blue Color Text", "#0000FF")
	commonRichTextLabel1.AddText(blueColorString)
	commonRichTextLabel1.AddNewLine()
	var clickEventString: String = UIManager.RichTextLabel_GetStringWithClickEvent("Click Event 2", UIManager.UI_INPUT_ACTION_EVENT_TYPE.COMMONRICHTEXTLABEL_META_CLICKED_EVENT2_COMMONRICHTEXTLABEL1)
	commonRichTextLabel1.AddText(clickEventString)
	commonRichTextLabel1.AddNewLine()
	var underlineString: String = UIManager.RichTextLabel_GetStringWithUnderline("Underline")
	commonRichTextLabel1.AddText(underlineString)
	commonRichTextLabel1.AddNewLine()
	var blueColorAndClickEvent2String: String = UIManager.RichTextLabel_GetStringWithColorAndClickEvent("Blue Color Text and Click Event 2", "#0000FF", UIManager.UI_INPUT_ACTION_EVENT_TYPE.COMMONRICHTEXTLABEL_META_CLICKED_EVENT2_COMMONRICHTEXTLABEL1)
	commonRichTextLabel1.AddText(blueColorAndClickEvent2String)
	commonRichTextLabel1.AddNewLine()
	var blueColorAndUnderlineString: String = UIManager.RichTextLabel_GetStringWithColorAndUnderline("Blue Color Text and Underline", "#0000FF")
	commonRichTextLabel1.AddText(blueColorAndUnderlineString)
	commonRichTextLabel1.AddNewLine()
	
	commonRichTextLabel1.AddText("[url=COMMONRICHTEXTLABEL_META_CLICKED_EVENT2_COMMONRICHTEXTLABEL1]Rich Text[/url] [color=#0000FF][url={URLEventString1}]url click event[/url][/color]\nThe [color=#FF0000]Red[/color] color text to show, and [u]Underline[/u] text works too, [u][color=#00FF00]Green Underline[/color][/u] and normal text content.".format({"URLEventString1": UIManager.UI_INPUT_ACTION_EVENT_TYPE.COMMONRICHTEXTLABEL_META_CLICKED_EVENT1_COMMONRICHTEXTLABEL1}))
	commonRichTextLabel1.AddText("\nA New line, and also the last line.")
	commonRichTextLabelWave.AddText("[wave amp=50 freq=2]Wave[/wave]")
	commonRichTextLabelTornado.AddText("[tornado radius=5 freq=2]Tornado[/tornado]")
	commonRichTextLabelShake.AddText("[shake rate=5 level=10]Shake[/shake]")
	commonRichTextLabelFade.AddText("[fade start=4 length=14]Fade away effect[/fade]")
	commonRichTextLabelRainbow.AddText("[rainbow freq=0.2 sat=10 val=20]Rainbow[/rainbow]")
	commonRichTextLabelGhost.AddText("[ghost freq=5.0 span=10.0]Ghost[/ghost]")
	commonRichTextLabelPulse.AddText("[pulse color=#00FFAA height=0.0 freq=2.0]Pulse[/pulse]")
	commonRichTextLabelMatrix.AddText("[matrix clean=2.0 dirty=1.0 span=50]Matrix[/matrix]")

func _process(_delta: float):
	m_CommonButtonSkill1CD = m_CommonButtonSkill1CD + (_delta * 10.0)
	var skill1CDTime: float = int(m_CommonButtonSkill1CD) % int(UIManager.PROGRESS_MAX_VALUE_100)
	commonButtonSkill1.SetCurrentCDValue(skill1CDTime)
	
	m_CommonButtonItem1CD = m_CommonButtonItem1CD + (_delta * 20.0)
	var item1CDTime: float = int(m_CommonButtonItem1CD) % int(UIManager.PROGRESS_MAX_VALUE_100)
	commonButtonItem1.SetCurrentCDValue(item1CDTime)
	
	m_CommonButtonBuff2CD = m_CommonButtonBuff2CD + (_delta * 20.0)
	var buff1CDTime: float = int(m_CommonButtonBuff2CD) % int(UIManager.PROGRESS_MAX_VALUE_100)
	commonButtonBuff1.SetCurrentCDValue(buff1CDTime)
