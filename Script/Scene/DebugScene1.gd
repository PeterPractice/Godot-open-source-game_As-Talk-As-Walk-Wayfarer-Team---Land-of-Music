extends Node2D

onready var snake1A: KinematicBody2DAvatar = $node2DAvatarExhibition/snake1A
onready var dog1A: KinematicBody2DAvatar = $node2DAvatarExhibition/dog1A
onready var player1A: KinematicBody2DAvatar = $node2DAvatarExhibition/player1A
onready var silverCarp1A: KinematicBody2DAvatar = $node2DAvatarExhibition/silverCarp1A
onready var tortoise1A: KinematicBody2DAvatar = $node2DAvatarExhibition/tortoise1A
onready var snake2A: KinematicBody2DAvatar = $node2DAvatarExhibition/snake2A
onready var snake3A: KinematicBody2DAvatar = $node2DAvatarExhibition/snake3A
onready var turtle1A: KinematicBody2DAvatar = $node2DAvatarExhibition/turtle1A
onready var angel1A: KinematicBody2DAvatar = $node2DAvatarExhibition/angel1A
onready var donkey1A: KinematicBody2DAvatar = $node2DAvatarExhibition/donkey1A
onready var qiuYu1A: KinematicBody2DAvatar = $node2DAvatarExhibition/qiuYu1A
onready var clergy1A: KinematicBody2DAvatar = $node2DAvatarExhibition/clergy1A
onready var monster1A: KinematicBody2DAvatar = $node2DAvatarExhibition/monster1A
onready var monster2A: KinematicBody2DAvatar = $node2DAvatarExhibition/monster2A
onready var monster3A: KinematicBody2DAvatar = $node2DAvatarExhibition/monster3A
onready var monster4A: KinematicBody2DAvatar = $node2DAvatarExhibition/monster4A
onready var monster5A: KinematicBody2DAvatar = $node2DAvatarExhibition/monster5A
onready var monster6A: KinematicBody2DAvatar = $node2DAvatarExhibition/monster6A
onready var monster7A: KinematicBody2DAvatar = $node2DAvatarExhibition/monster7A
onready var monster8A: KinematicBody2DAvatar = $node2DAvatarExhibition/monster8A
onready var monster9A: KinematicBody2DAvatar = $node2DAvatarExhibition/monster9A
onready var monster10A: KinematicBody2DAvatar = $node2DAvatarExhibition/monster10A
onready var monster11A: KinematicBody2DAvatar = $node2DAvatarExhibition/monster11A
onready var monster12A: KinematicBody2DAvatar = $node2DAvatarExhibition/monster12A
onready var kingA: KinematicBody2DAvatar = $node2DAvatarExhibition/kingA
onready var queenA: KinematicBody2DAvatar = $node2DAvatarExhibition/queenA
onready var sisterA: KinematicBody2DAvatar = $node2DAvatarExhibition/sisterA
onready var housekeeperA: KinematicBody2DAvatar = $node2DAvatarExhibition/housekeeperA
onready var butlerA: KinematicBody2DAvatar = $node2DAvatarExhibition/butlerA

onready var snake1A_commonLabelName: CommonLabel = $node2DAvatarExhibition/snake1A/commonLabelName
onready var dog1A_commonLabelName: CommonLabel = $node2DAvatarExhibition/dog1A/commonLabelName
onready var player1A_commonLabelName: CommonLabel = $node2DAvatarExhibition/player1A/commonLabelName
onready var silverCarp1A_commonLabelName: CommonLabel = $node2DAvatarExhibition/silverCarp1A/commonLabelName
onready var tortoise1A_commonLabelName: CommonLabel = $node2DAvatarExhibition/tortoise1A/commonLabelName
onready var snake2A_commonLabelName: CommonLabel = $node2DAvatarExhibition/snake2A/commonLabelName
onready var snake3A_commonLabelName: CommonLabel = $node2DAvatarExhibition/snake3A/commonLabelName
onready var turtle1A_commonLabelName: CommonLabel = $node2DAvatarExhibition/turtle1A/commonLabelName
onready var angel1A_commonLabelName: CommonLabel = $node2DAvatarExhibition/angel1A/commonLabelName
onready var donkey1A_commonLabelName: CommonLabel = $node2DAvatarExhibition/donkey1A/commonLabelName
onready var qiuYu1A_commonLabelName: CommonLabel = $node2DAvatarExhibition/qiuYu1A/commonLabelName
onready var clergy1A_commonLabelName: CommonLabel = $node2DAvatarExhibition/clergy1A/commonLabelName
onready var monster1A_commonLabelName: CommonLabel = $node2DAvatarExhibition/monster1A/commonLabelName
onready var monster2A_commonLabelName: CommonLabel = $node2DAvatarExhibition/monster2A/commonLabelName
onready var monster3A_commonLabelName: CommonLabel = $node2DAvatarExhibition/monster3A/commonLabelName
onready var monster4A_commonLabelName: CommonLabel = $node2DAvatarExhibition/monster4A/commonLabelName
onready var monster5A_commonLabelName: CommonLabel = $node2DAvatarExhibition/monster5A/commonLabelName
onready var monster6A_commonLabelName: CommonLabel = $node2DAvatarExhibition/monster6A/commonLabelName
onready var monster7A_commonLabelName: CommonLabel = $node2DAvatarExhibition/monster7A/commonLabelName
onready var monster8A_commonLabelName: CommonLabel = $node2DAvatarExhibition/monster8A/commonLabelName
onready var monster9A_commonLabelName: CommonLabel = $node2DAvatarExhibition/monster9A/commonLabelName
onready var monster10A_commonLabelName: CommonLabel = $node2DAvatarExhibition/monster10A/commonLabelName
onready var monster11A_commonLabelName: CommonLabel = $node2DAvatarExhibition/monster11A/commonLabelName
onready var monster12A_commonLabelName: CommonLabel = $node2DAvatarExhibition/monster12A/commonLabelName
onready var kingA_commonLabelName: CommonLabel = $node2DAvatarExhibition/kingA/commonLabelName
onready var queenA_commonLabelName: CommonLabel = $node2DAvatarExhibition/queenA/commonLabelName
onready var sisterA_commonLabelName: CommonLabel = $node2DAvatarExhibition/sisterA/commonLabelName
onready var housekeeperA_commonLabelName: CommonLabel = $node2DAvatarExhibition/housekeeperA/commonLabelName
onready var butlerA_commonLabelName: CommonLabel = $node2DAvatarExhibition/butlerA/commonLabelName

onready var commonHeadPortrait1 = $controlPanel/controlHeadPortrait/commonHeadPortrait1
onready var commonButtonSkill1 = $controlPanel/controlButton/commonButtonSkill1
onready var commonButtonItem1 = $controlPanel/controlButton/commonButtonItem1
onready var commonButtonBuff1 = $controlPanel/controlButton/commonButtonBuff1
onready var commonRichTextLabel1 = $controlPanel/controlCommonRichTextLabel/commonRichTextLabel1
onready var commonRichTextLabelWave = $controlPanel/controlCommonRichTextLabel/commonRichTextLabelWave
onready var commonRichTextLabelTornado = $controlPanel/controlCommonRichTextLabel/commonRichTextLabelTornado
onready var commonRichTextLabelShake = $controlPanel/controlCommonRichTextLabel/commonRichTextLabelShake
onready var commonRichTextLabelFade = $controlPanel/controlCommonRichTextLabel/commonRichTextLabelFade
onready var commonRichTextLabelRainbow = $controlPanel/controlCommonRichTextLabel/commonRichTextLabelRainbow
onready var commonRichTextLabelGhost = $controlPanel/controlCommonRichTextLabel/commonRichTextLabelGhost
onready var commonRichTextLabelPulse = $controlPanel/controlCommonRichTextLabel/commonRichTextLabelPulse
onready var commonRichTextLabelMatrix = $controlPanel/controlCommonRichTextLabel/commonRichTextLabelMatrix

func _ready():
	var commonLabelPreloadResource: Resource = TableManager.Get_PRELOAD_RESOURCE_MAP("UI_CommonUI_CommonLabel")
	for k in HQH.COLORPALETTE_UI:
		var color: Color = HQH.COLORPALETTE_UI.get(k)
		var labelObject = commonLabelPreloadResource.instance()
		match k:
			"COLOR_BG3":
				labelObject.SetFontColorType(2)
			
			"FONT_COLOR1":
				labelObject.SetFontColorType(2)
			
			"FONT_COLOR3":
				labelObject.SetFontColorType(2)
		
		labelObject.text = GetColorPaletteString(k, color)
		var colorRectObject: ColorRect = AddColorRect(labelObject, color)
		$controlPanel/controlCOLORPALETTE_UI/vBoxContainer1.add_child(colorRectObject)
	
	for k in HQH.COLORPALETTE_EQUIP:
		var color: Color = HQH.COLORPALETTE_EQUIP.get(k)
		var labelObject = commonLabelPreloadResource.instance()
		match k:
			"COLOR_PALE_YELLOW", "COLOR_BLUE2", "COLOR_YELLOW2":
				labelObject.SetFontColorType(2)
		
		labelObject.text = GetColorPaletteString(k, color)
		var colorRectObject: ColorRect = AddColorRect(labelObject, color)
		$controlPanel/controlCOLORPALETTE_EQUIP/vBoxContainer1.add_child(colorRectObject)
	
	for k in HQH.COLORPALETTE_SCENE:
		var color: Color = HQH.COLORPALETTE_SCENE.get(k)
		var labelObject = commonLabelPreloadResource.instance()
		match k:
			"COLOR_MYSTERIOUSDEVICE_BG":
				labelObject.SetFontColorType(2)
			
			"COLOR_ODETOJOY_FBG":
				labelObject.SetFontColorType(2)
		
		labelObject.text = GetColorPaletteString(k, color)
		var colorRectObject: ColorRect = AddColorRect(labelObject, color)
		$controlPanel/controlCOLORPALETTE_SCENE/vBoxContainer1.add_child(colorRectObject)
	
	for k in HQH.COLORPALETTE_AVATAR:
		var color: Color = HQH.COLORPALETTE_AVATAR.get(k)
		var labelObject = commonLabelPreloadResource.instance()
		labelObject.text = GetColorPaletteString(k, color)
		var colorRectObject: ColorRect = AddColorRect(labelObject, color)
		$controlPanel/controlCOLORPALETTE_AVATAR/vBoxContainer1.add_child(colorRectObject)
	
	$controlPanel/controlItemList/commonItemList1.add_item("CommonItemList-item1")
	$controlPanel/controlItemList/commonItemList1.add_item("CommonItemList-item2")
	$controlPanel/controlItemList/commonItemList1.add_item("CommonItemList-item3")
	$controlPanel/controlItemList/commonItemList1.add_item("CommonItemList-item4")
	$controlPanel/controlItemList/commonItemList1.add_item("CommonItemList-item5")
	
#	var createAvatarInfoList: Array = []
#	var avatarTypeID: int = 4
#	var initPosition: Vector2 = Vector2.ZERO
#	var equipTypeID: int = 5
#	var createAvatarInfo: Dictionary = AvatarManager.GetCreateAvatarInfo(avatarTypeID, initPosition, equipTypeID)
#	createAvatarInfoList.append(createAvatarInfo)
#	AvatarManager.SpawnAvatar(false, createAvatarInfoList)
	
#	OptionButton的BUG：
#	OptionButton弹出的PopupMenu的y坐标需要大于0，否则，PopupMenu的y坐标最小为0。
#	按照这个逻辑，同样，PopupMenu的x坐标也需要大于0。
#	并且，需要在当前Camera能看到的地方。一般UI都在当前Camera之下，所以这种情况一般不会发生。
	$controlPanel/controlOptionButton/commonOptionButton.add_item("CommonOptionButton 1")
	$controlPanel/controlOptionButton/commonOptionButton.add_item("CommonOptionButton 2")
	$controlPanel/controlOptionButton/commonOptionButton.add_item("CommonOptionButton 3")
	
	$node2DWalkScene/node2DWater/node2DSuanLaTang/suanLaTang1.SetRandom()
	
	snake1A.ShowOutline()
	dog1A.SetIsNPC(true, HQH.NPC_MANNER_TYPE.NPC_MANNER_FRIENDLY)
	dog1A.ShowOutline()
	player1A.SetIsNPC(true, HQH.NPC_MANNER_TYPE.NPC_MANNER_HOSTILITY)
	player1A.ShowOutline()
	silverCarp1A.SetIsNPC(true, HQH.NPC_MANNER_TYPE.NPC_MANNER_ARTICLE)
	silverCarp1A.ShowOutline()
	
	snake1A_commonLabelName.text = TableManager.GetAvatarShowName(1)
	snake1A_commonLabelName.SetColor(TableManager.GetAvatarFlagColor(1))
	snake1A_commonLabelName.text = TableManager.GetAvatarShowName(1)
	snake1A_commonLabelName.SetColor(TableManager.GetAvatarFlagColor(1))
	dog1A_commonLabelName.text = TableManager.GetAvatarShowName(2)
	dog1A_commonLabelName.SetColor(TableManager.GetAvatarFlagColor(2))
	player1A_commonLabelName.text = TableManager.GetAvatarShowName(3)
	player1A_commonLabelName.SetColor(TableManager.GetAvatarFlagColor(3))
	silverCarp1A_commonLabelName.text = TableManager.GetAvatarShowName(4)
	silverCarp1A_commonLabelName.SetColor(TableManager.GetAvatarFlagColor(4))
	tortoise1A_commonLabelName.text = TableManager.GetAvatarShowName(5)
	tortoise1A_commonLabelName.SetColor(TableManager.GetAvatarFlagColor(5))
	snake2A_commonLabelName.text = TableManager.GetAvatarShowName(6)
	snake2A_commonLabelName.SetColor(TableManager.GetAvatarFlagColor(6))
	snake3A_commonLabelName.text = TableManager.GetAvatarShowName(7)
	snake3A_commonLabelName.SetColor(TableManager.GetAvatarFlagColor(7))
	turtle1A_commonLabelName.text = TableManager.GetAvatarShowName(8)
	turtle1A_commonLabelName.SetColor(TableManager.GetAvatarFlagColor(8))
	angel1A_commonLabelName.text = TableManager.GetAvatarShowName(9)
	angel1A_commonLabelName.SetColor(TableManager.GetAvatarFlagColor(9))
	donkey1A_commonLabelName.text = TableManager.GetAvatarShowName(10)
	donkey1A_commonLabelName.SetColor(TableManager.GetAvatarFlagColor(10))
	qiuYu1A_commonLabelName.text = TableManager.GetAvatarShowName(11)
	qiuYu1A_commonLabelName.SetColor(TableManager.GetAvatarFlagColor(11))
	clergy1A_commonLabelName.text = TableManager.GetAvatarShowName(12)
	clergy1A_commonLabelName.SetColor(TableManager.GetAvatarFlagColor(12))
	monster1A_commonLabelName.text = TableManager.GetAvatarShowName(13)
	monster1A_commonLabelName.SetColor(TableManager.GetAvatarFlagColor(13))
	monster2A_commonLabelName.text = TableManager.GetAvatarShowName(14)
	monster2A_commonLabelName.SetColor(TableManager.GetAvatarFlagColor(14))
	monster3A_commonLabelName.text = TableManager.GetAvatarShowName(15)
	monster3A_commonLabelName.SetColor(TableManager.GetAvatarFlagColor(15))
	monster4A_commonLabelName.text = TableManager.GetAvatarShowName(16)
	monster4A_commonLabelName.SetColor(TableManager.GetAvatarFlagColor(16))
	monster5A_commonLabelName.text = TableManager.GetAvatarShowName(17)
	monster5A_commonLabelName.SetColor(TableManager.GetAvatarFlagColor(17))
	monster6A_commonLabelName.text = TableManager.GetAvatarShowName(18)
	monster6A_commonLabelName.SetColor(TableManager.GetAvatarFlagColor(18))
	monster7A_commonLabelName.text = TableManager.GetAvatarShowName(19)
	monster7A_commonLabelName.SetColor(TableManager.GetAvatarFlagColor(19))
	monster8A_commonLabelName.text = TableManager.GetAvatarShowName(20)
	monster8A_commonLabelName.SetColor(TableManager.GetAvatarFlagColor(20))
	monster9A_commonLabelName.text = TableManager.GetAvatarShowName(21)
	monster9A_commonLabelName.SetColor(TableManager.GetAvatarFlagColor(21))
	monster10A_commonLabelName.text = TableManager.GetAvatarShowName(22)
	monster10A_commonLabelName.SetColor(TableManager.GetAvatarFlagColor(22))
	monster11A_commonLabelName.text = TableManager.GetAvatarShowName(23)
	monster11A_commonLabelName.SetColor(TableManager.GetAvatarFlagColor(23))
	monster12A_commonLabelName.text = TableManager.GetAvatarShowName(24)
	monster12A_commonLabelName.SetColor(TableManager.GetAvatarFlagColor(24))
	kingA_commonLabelName.text = TableManager.GetAvatarShowName(25)
	kingA_commonLabelName.SetColor(TableManager.GetAvatarFlagColor(25))
	queenA_commonLabelName.text = TableManager.GetAvatarShowName(26)
	queenA_commonLabelName.SetColor(TableManager.GetAvatarFlagColor(26))
	sisterA_commonLabelName.text = TableManager.GetAvatarShowName(27)
	sisterA_commonLabelName.SetColor(TableManager.GetAvatarFlagColor(27))
	housekeeperA_commonLabelName.text = TableManager.GetAvatarShowName(28)
	housekeeperA_commonLabelName.SetColor(TableManager.GetAvatarFlagColor(28))
	butlerA_commonLabelName.text = TableManager.GetAvatarShowName(29)
	butlerA_commonLabelName.SetColor(TableManager.GetAvatarFlagColor(29))
	
	commonHeadPortrait1.SetHeadPortrait("HeadPortrait_Player1")
	
	commonButtonSkill1.SetTextureRectNormal("Skill_SkillConventionalFlatAttack")
	commonButtonSkill1.SetLeftText("U")
	commonButtonSkill1.SetCurrentCDValue(60.0)
	
	commonButtonItem1.SetTextureRectNormal("Item_ItemHP1")
	commonButtonItem1.SetLeftText("1")
	commonButtonItem1.SetRightText("10")
	commonButtonItem1.SetCurrentCDValue(60.0)
	
	commonButtonBuff1.SetTextureRectNormal("Skill_SkillLucky")
	commonButtonBuff1.SetRightText("11")
	commonButtonBuff1.SetCurrentCDValue(60.0)
	
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

func AddColorRect(labelObject: Label, color: Color) -> ColorRect:
	var colorRectObject:ColorRect = ColorRect.new()
	colorRectObject.color = color
	colorRectObject.rect_min_size.x = 240
	colorRectObject.rect_min_size.y = 29
	colorRectObject.add_child(labelObject)
	
	return colorRectObject

func GetColorPaletteString(keyString: String, color: Color) -> String:
	var colorString: String = color.to_html().to_upper()
	var colorSubString2: String = colorString.substr(0, 2)
	var colorStringShow: String = ""
	if "FF" == colorSubString2:
		colorStringShow = colorString.substr(2)
	else:
		colorStringShow = colorString
	
	return "%s(#%s)" % [keyString, colorStringShow]
