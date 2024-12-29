extends "res://Script/UI/CommonUI/CommonPanel.gd"

onready var controlDown = $controlDown

# JournalRecord
const JOURNALRECORD_LINE_MAX: int = 400 # 400
onready var commonRichTextLabelJournalRecord = $controlDown/controlJournalRecord/commonRichTextLabelJournalRecord
onready var commonTextureButtonBookJournalRecord = $controlDown/controlJournalRecord/commonTextureButtonBookJournalRecord
onready var commonTextureButtonClear1 = $controlDown/controlJournalRecord/commonTextureButtonClear1
onready var commonTextureButtonGoTop1 = $controlDown/controlJournalRecord/commonTextureButtonGoTop1
onready var commonTextureButtonGoBottom1 = $controlDown/controlJournalRecord/commonTextureButtonGoBottom1

# Bag
const BAG_LINE_MIN: int = 1
onready var controlBagButtonList = $controlDown/controlBag/controlBagButtonList
var m_ControlBagButtonListCurrentSelectIndex = -1 # -1: no bag button be selected. [0, controlBagButtonList.size()): selected bag button index.
onready var commonBG2Bag = $controlDown/commonBG1BG/commonBG2Bag
onready var commonPureColorBG1BagMask = $controlDown/commonBG1BG/commonPureColorBG1BagMask
onready var commonTextureButtonBag1 = $controlDown/controlBag/commonTextureButtonBag1
onready var textureRectBagSelected = $controlDown/controlBag/textureRectBagSelected
var m_IsShowDetailedBag: bool = false
var m_CommonBG2BagInitInfo: Dictionary = {
	"position": Vector2.ZERO,
	"rectSize": Vector2.ZERO,
}

# WrangleDialog
onready var controlWrangleDialog = $controlWrangleDialog
onready var controlWrangleDialogButton = $controlWrangleDialog/controlWrangleDialogButton
onready var commonTextureButtonWrangleDialog1 = $controlWrangleDialog/controlWrangleDialogButton/commonTextureButtonWrangleDialog1
onready var commonTextureButtonWrangleDialog2 = $controlWrangleDialog/controlWrangleDialogButton/commonTextureButtonWrangleDialog2
onready var commonTextureButtonWrangleDialog3 = $controlWrangleDialog/controlWrangleDialogButton/commonTextureButtonWrangleDialog3
onready var commonTextureButtonWrangleDialog4 = $controlWrangleDialog/controlWrangleDialogButton/commonTextureButtonWrangleDialog4
onready var commonTextureButtonWrangleDialog5 = $controlWrangleDialog/controlWrangleDialogButton/commonTextureButtonWrangleDialog5
onready var commonTextureButtonWrangleDialog6 = $controlWrangleDialog/controlWrangleDialogButton/commonTextureButtonWrangleDialog6
onready var commonTextureButtonWrangleDialog7 = $controlWrangleDialog/controlWrangleDialogButton/commonTextureButtonWrangleDialog7
onready var controlWrangleDialog_controlAvatar = $controlWrangleDialog/controlAvatar
onready var controlWrangleDialog_controlAvatar_commonHeadPortraitWrangleDialog = $controlWrangleDialog/controlAvatar/commonHeadPortraitWrangleDialog
onready var controlWrangleDialog_controlAvatar_colorRectAvatar = $controlWrangleDialog/controlAvatar/colorRectAvatar
onready var controlWrangleDialog_controlAvatar_commonLabelWrangleDialogName = $controlWrangleDialog/controlAvatar/commonLabelWrangleDialogName
onready var controlWrangleDialog_controlGoods = $controlWrangleDialog/controlGoods
onready var controlWrangleDialog_controlGoods_commonButtonBuffBag = $controlWrangleDialog/controlGoods/commonButtonBuffBag
onready var controlWrangleDialog_controlGoods_commonLabelWrangleDialogGoodsName = $controlWrangleDialog/controlGoods/commonLabelWrangleDialogGoodsName
onready var controlWrangleDialog_controlPicture = $controlWrangleDialog/controlPicture
onready var controlWrangleDialog_controlPicture_textureRectPicture = $controlWrangleDialog/controlPicture/textureRectPicture
onready var controlWrangleDialog_controlPicture_commonLabelWrangleDialogPictureName = $controlWrangleDialog/controlPicture/commonLabelWrangleDialogPictureName
onready var commonLabel18WrangleDialogContent = $controlWrangleDialog/commonLabel18WrangleDialogContent
onready var commonButtonWrangleDialogContinue = $controlWrangleDialog/commonButtonWrangleDialogContinue
var m_WrangleDialogIsNeedCheckAndSetPosition: bool = false
var m_WrangleDialogIsNeedCheckAndSetPosition_PastCount: int = 0
var m_ControlWrangleDialogButton_InitPosition: Vector2 = Vector2.ZERO
var m_ControlWrangleDialog_InitPosition: Vector2 = Vector2.ZERO
var m_ControlWrangleDialog_InitSize: Vector2 = Vector2.ZERO
var m_ControlWrangleDialog_controlAvatar_commonLabelWrangleDialogName_InitSize: Vector2 = Vector2.ZERO
var m_ControlWrangleDialog_controlGoods_commonLabelWrangleDialogGoodsName_InitSize: Vector2 = Vector2.ZERO
var m_ControlWrangleDialog_controlPicture_commonLabelWrangleDialogPictureName_InitSize: Vector2 = Vector2.ZERO
var m_CommonTextureButtonWrangleDialog_InitSize: Vector2 = Vector2.ZERO

# Interaction
onready var commonTextureButtonInteraction1 = $controlDown/controlInteraction/commonTextureButtonInteraction1
onready var commonTextureButtonPlayChess1 = $controlDown/controlInteraction/commonTextureButtonPlayChess1

#BagUse
onready var commonButton13BagUse = $controlDown/controlBagUse/commonButton13BagUse
onready var commonButton13Discard = $controlDown/controlBagUse/commonButton13Discard
onready var commonButton13Check = $controlDown/controlBagUse/commonButton13Check

var m_ControlWrangleDialog_controlPicture_textureRectPicture_rect_size_Init: Vector2 = Vector2.ZERO

func _ready():
	UIManager.DownPanel_OnReady()
	
	m_ControlWrangleDialog_controlPicture_textureRectPicture_rect_size_Init = controlWrangleDialog_controlPicture_textureRectPicture.rect_size
	
	m_CommonBG2BagInitInfo.position = commonBG2Bag.rect_position
	m_CommonBG2BagInitInfo.rectSize = commonBG2Bag.rect_size
	
	var firstString: String = TableManager.GetAffixKeyRandomString("SLOGAN_NEW_DAY_")
	commonRichTextLabelJournalRecord.AddText(firstString)
	
	commonTextureButtonBag1.SetLeftText(TableManager.INPUT_KEY_LETTER_MAP.KEY_B)
	commonTextureButtonBag1.SetPressedAudioType(AudioManager.BUTTON_PRESSED_AUDIO_TYPE.BAG)
	commonTextureButtonBookJournalRecord.SetLeftText(TableManager.INPUT_KEY_LETTER_MAP.KEY_J)
	commonTextureButtonBookJournalRecord.SetPressedAudioType(AudioManager.BUTTON_PRESSED_AUDIO_TYPE.JOURNALRECORD)
	for i in controlBagButtonList.get_child_count():
		var bagButton: CommonButtonBuff = controlBagButtonList.get_child(i)
		bagButton.SetUIInputActionEventType("COMMONBUTTONBUFF_TEXTUREBUTTON1_PRESSED_EVENT%s" % (i + 1))
	
	SetBag()
	SetCommonTextureButtonBag1Visible()
	SetCommonTextureButtonBookJournalRecordVisible()
	
	m_ControlWrangleDialogButton_InitPosition = controlWrangleDialogButton.rect_position
	m_ControlWrangleDialog_InitPosition = controlWrangleDialog.rect_position
	m_ControlWrangleDialog_InitSize = controlWrangleDialog.rect_size
	m_ControlWrangleDialog_controlAvatar_commonLabelWrangleDialogName_InitSize = controlWrangleDialog_controlAvatar_commonLabelWrangleDialogName.rect_size
	m_ControlWrangleDialog_controlGoods_commonLabelWrangleDialogGoodsName_InitSize = controlWrangleDialog_controlGoods_commonLabelWrangleDialogGoodsName.rect_size
	m_ControlWrangleDialog_controlPicture_commonLabelWrangleDialogPictureName_InitSize = controlWrangleDialog_controlPicture_commonLabelWrangleDialogPictureName.rect_size
	m_CommonTextureButtonWrangleDialog_InitSize = commonTextureButtonWrangleDialog1.rect_size
	
	WrangleDialogSetIsVisible(false)
	SetCommonTextureButtonInteraction1Visible(false)
	SetCommonTextureButtonPlayChess1Visible(false)
	
	commonTextureButtonInteraction1.SetPressedAudioType(AudioManager.BUTTON_PRESSED_AUDIO_TYPE.INTERACTION)
	commonTextureButtonPlayChess1.SetPressedAudioType(AudioManager.BUTTON_PRESSED_AUDIO_TYPE.PLAYCHESS)
	
	SetText()

func SetText():
	commonTextureButtonInteraction1.SetCenterText(TableManager.GetLanguageString("DOWNPANEL_CONTROLINTERACTION_COMMONTEXTUREBUTTONINTERACTION1"))
	commonTextureButtonInteraction1.SetLeftText(TableManager.INPUT_KEY_LETTER_MAP.KEY_E)
	commonTextureButtonPlayChess1.SetCenterText(TableManager.GetLanguageString("DOWNPANEL_CONTROLINTERACTION_COMMONTEXTUREBUTTONPLAYCHESS1"))
	commonTextureButtonPlayChess1.SetLeftText(TableManager.INPUT_KEY_LETTER_MAP.KEY_P)
	commonButton13BagUse.SetButtonText(TableManager.GetLanguageString("DOWNPANEL_CONTROLBAGUSE_COMMONBUTTON13BAGUSE"))
	commonButton13Discard.SetButtonText(TableManager.GetLanguageString("DOWNPANEL_CONTROLBAGUSE_COMMONBUTTON13DISCARD"))
	commonButton13Check.SetButtonText(TableManager.GetLanguageString("DOWNPANEL_CONTROLBAGUSE_COMMONBUTTON13CHECK"))
	commonButtonWrangleDialogContinue.SetButtonText(TableManager.GetLanguageString("DOWNPANEL_CONTROLWRANGLEDIALOG_COMMONBUTTONWRANGLEDIALOGCONTINUE"))

func _process(_delta: float):
	WrangleDialogCheckAndSetPosition()
	
	if WrangleDialogGetIsVisible():
		if controlWrangleDialog_controlPicture.visible:
			if (m_ControlWrangleDialog_controlPicture_textureRectPicture_rect_size_Init.x < controlWrangleDialog_controlPicture_textureRectPicture.rect_size.x) or (m_ControlWrangleDialog_controlPicture_textureRectPicture_rect_size_Init.y < controlWrangleDialog_controlPicture_textureRectPicture.rect_size.y):
				var xScale: float = controlWrangleDialog_controlPicture_textureRectPicture.rect_size.x / m_ControlWrangleDialog_controlPicture_textureRectPicture_rect_size_Init.x
				var yScale: float = controlWrangleDialog_controlPicture_textureRectPicture.rect_size.y / m_ControlWrangleDialog_controlPicture_textureRectPicture_rect_size_Init.y
				var scale: float = 1 / max(xScale, yScale)
				controlWrangleDialog_controlPicture_textureRectPicture.rect_scale = Vector2(scale, scale)
			else:
				controlWrangleDialog_controlPicture_textureRectPicture.rect_scale = Vector2.ONE

func _input(event: InputEvent):
	if SceneManager.GetIsInBootScene():
		return
	
	if SceneManager.GetIsBeginChangeToScene():
		return
	
	var panelRectangle: Rect2 = Rect2(commonBG2Bag.rect_position, commonBG2Bag.rect_size)
	UIManager.CheckAndSet_IsUIPanelHadConsumed_Event_FocusClick(event, self, panelRectangle)
	
	if GetCommonTextureButtonInteraction1Visible():
		panelRectangle = Rect2(commonTextureButtonInteraction1.rect_position, commonTextureButtonInteraction1.rect_size)
		UIManager.CheckAndSet_IsUIPanelHadConsumed_Event_FocusClick(event, self, panelRectangle)
	
	if GetCommonTextureButtonPlayChess1Visible():
		panelRectangle = Rect2(commonTextureButtonPlayChess1.rect_position, commonTextureButtonPlayChess1.rect_size)
		UIManager.CheckAndSet_IsUIPanelHadConsumed_Event_FocusClick(event, self, panelRectangle)
	
	if commonButton13BagUse.visible:
		panelRectangle = Rect2(commonButton13BagUse.rect_position, commonButton13BagUse.rect_size)
		UIManager.CheckAndSet_IsUIPanelHadConsumed_Event_FocusClick(event, self, panelRectangle)
	
	if commonButton13Discard.visible:
		panelRectangle = Rect2(commonButton13Discard.rect_position, commonButton13Discard.rect_size)
		UIManager.CheckAndSet_IsUIPanelHadConsumed_Event_FocusClick(event, self, panelRectangle)
	
	if commonButton13Check.visible:
		panelRectangle = Rect2(commonButton13Check.rect_position, commonButton13Check.rect_size)
		UIManager.CheckAndSet_IsUIPanelHadConsumed_Event_FocusClick(event, self, panelRectangle)
	
	panelRectangle = Rect2(controlWrangleDialog.rect_position, controlWrangleDialog.rect_size)
	UIManager.CheckAndSet_IsUIPanelHadConsumed_Event_FocusClick(event, self, panelRectangle)

func AddJournalRecord(s: String):
	commonRichTextLabelJournalRecord.AddNewLine()
	commonRichTextLabelJournalRecord.AddText(s)
	
	var lineCount: int = commonRichTextLabelJournalRecord.GetLineCount()
	if JOURNALRECORD_LINE_MAX < lineCount:
		commonRichTextLabelJournalRecord.RemoveLine(0)

func _on_commonTextureButtonBookJournalRecord_pressed():
	commonTextureButtonBookJournalRecord.release_focus()
	
	UIManager.DownPanel_on_commonTextureButtonBookJournalRecord_pressed()

func _on_commonTextureButtonBag1_pressed():
	HQH.Log("_on_commonTextureButtonBag1_pressed")
		
	if UIManager.GetIsInPlayChess():
		UIManager.DownPanel_AddJournalRecordWithStringKey("IT_IS_PLAY_CHESS_YOU_CAN_NOT_OPERATE")
		
		return
	
	m_IsShowDetailedBag = !m_IsShowDetailedBag
	SetBag()

func GetIsShowDetailedBag() -> bool:
	return m_IsShowDetailedBag

func SetCommonTextureButtonBag1Visible():
	if SaveGameManager.IsGoodsUsedHas_Bag():
		commonTextureButtonBag1.visible = true
	else:
		commonTextureButtonBag1.visible = false

func GetCommonTextureButtonBag1Visible() -> bool:
	return commonTextureButtonBag1.visible

func CommonTextureButtonBag1_SetPressedTrue():
	commonTextureButtonBag1.SetPressedTrue()

func SetCommonTextureButtonBookJournalRecordVisible():
	if SaveGameManager.IsGoodsUsedHas_JournalRecordBook():
		commonTextureButtonBookJournalRecord.visible = true
	else:
		commonTextureButtonBookJournalRecord.visible = false

func GetCommonTextureButtonBookJournalRecordVisible() -> bool:
	return commonTextureButtonBookJournalRecord.visible

func CommonTextureButtonBookJournalRecord_SetPressedTrue():
	commonTextureButtonBookJournalRecord.SetPressedTrue()

func CommonTextureButtonInteraction1_SetPressedTrue():
	commonTextureButtonInteraction1.SetPressedTrue()

func CommonTextureButtonPlayChess1_SetPressedTrue():
	commonTextureButtonPlayChess1.SetPressedTrue()

func SetBag():
	var currentBagDataLength: int = UIManager.DownPanel_GetBagDataLength()
	var bagButtonChildrenCount: int = controlBagButtonList.get_child_count()
	if bagButtonChildrenCount != currentBagDataLength:
		HQH.AssertLog("bagButtonChildrenCount: %s != currentBagDataLength: %s" % [bagButtonChildrenCount, currentBagDataLength])
		
		return
	
	var currentBagNumber: int = 0
	for i in bagButtonChildrenCount:
		var bag1Data: Dictionary = UIManager.DownPanel_GetBagDataByIndex(i)
		if bag1Data.isValidBag:
			currentBagNumber = currentBagNumber + 1
		else:
			break
	
	var showBagNumber: int = 0
	if m_IsShowDetailedBag:
		showBagNumber = currentBagNumber
	else:
		showBagNumber = int(min(UIManager.DOWN_PANEL_BAG_FIRST_LINE_NUMBER, currentBagNumber))
	
	for i in bagButtonChildrenCount:
		var bagButton: CommonButtonBuff = controlBagButtonList.get_child(i)
		if showBagNumber > i:
			bagButton.visible = true
			
			var bag1Data: Dictionary = UIManager.DownPanel_GetBagDataByIndex(i)
			bagButton.SetTextureRectNormal(bag1Data.bagResourceName)
			if 1 < bag1Data.bagNumber:
				bagButton.SetRightText(str(bag1Data.bagNumber))
			else:
				bagButton.SetRightText("")
			bagButton.SetCD(bag1Data.bagCDStartTimeInMilliseconds, bag1Data.bagCDLengthTimeInMilliseconds)
			bagButton.SetGoodsTypeID(bag1Data.goodsTypeID)
		else:
			bagButton.visible = false
	
	var bagLine: int = BAG_LINE_MIN
	if UIManager.DOWN_PANEL_BAG_FIRST_LINE_NUMBER >= showBagNumber:
		bagLine = BAG_LINE_MIN
	else:
		bagLine = int(ceil(float(showBagNumber - UIManager.DOWN_PANEL_BAG_FIRST_LINE_NUMBER) / UIManager.DOWN_PANEL_BAG_1LINE_NUMBER)) + BAG_LINE_MIN
	
#	HQH.Log("bagLine: %s" % bagLine)
	
	if BAG_LINE_MIN >= bagLine:
		if m_IsShowDetailedBag:
			SetCommonBG2Bag(bagLine)
		else:
			SetCommonBG2BagByInitData()
	else:
		SetCommonBG2Bag(bagLine)
	
	SetBagSelectedVisibleAndIndexFalse()

func SetCommonBG2BagByInitData():
	commonBG2Bag.rect_position.y = m_CommonBG2BagInitInfo.position.y
	commonBG2Bag.rect_size.y = m_CommonBG2BagInitInfo.rectSize.y
	
	commonPureColorBG1BagMask.visible = true

func SetCommonBG2Bag(bagLine: int):
	var YOFFSET: int = 10
	var HEIGHTOFFSET: int = 10 + (50 * (bagLine - BAG_LINE_MIN))
	commonBG2Bag.rect_position.y = -(YOFFSET + HEIGHTOFFSET) # -20
	commonBG2Bag.rect_size.y = m_CommonBG2BagInitInfo.position.y + m_CommonBG2BagInitInfo.rectSize.y + HEIGHTOFFSET # 198
	
	commonPureColorBG1BagMask.visible = false

func WrangleDialogSetIsVisible(v: bool):
	controlWrangleDialog.visible = v
	if controlWrangleDialog.visible:
		commonButtonWrangleDialogContinue.grab_focus()

func WrangleDialogGetIsVisible() -> bool:
	return controlWrangleDialog.visible

func WrangleDialogSetDataForAvatar(avatarTypeID: int, contentString: String, wrangleDialogButtonStringArray: Array):
	controlWrangleDialog_controlAvatar.visible = true
	controlWrangleDialog_controlGoods.visible = false
	controlWrangleDialog_controlPicture.visible = false
	
	controlWrangleDialog_controlAvatar_commonHeadPortraitWrangleDialog.SetHeadPortrait(TableManager.GetAvatarHeadPortraitResourceName(avatarTypeID))
	controlWrangleDialog_controlAvatar_colorRectAvatar.color = TableManager.GetAvatarFlagColor(avatarTypeID)
	controlWrangleDialog_controlAvatar_commonLabelWrangleDialogName.text = TableManager.GetAvatarShowName(avatarTypeID)
	
	WrangleDialogSetDataForContentAndButton(contentString, wrangleDialogButtonStringArray)

func WrangleDialogSetDataForGoods(goodsTypeID: int, contentString: String, wrangleDialogButtonStringArray: Array):
	controlWrangleDialog_controlAvatar.visible = false
	controlWrangleDialog_controlGoods.visible = true
	controlWrangleDialog_controlPicture.visible = false
	
	var goodsInfo: Dictionary = TableManager.GetGoodsInfo(goodsTypeID)
	if not goodsInfo.empty():
		controlWrangleDialog_controlGoods_commonButtonBuffBag.SetTextureRectNormal(goodsInfo.goodsIcon)
		controlWrangleDialog_controlGoods_commonButtonBuffBag.SetTextureButton1DisabledTrue()
		controlWrangleDialog_controlGoods_commonButtonBuffBag.SetTextureButton1PlayAudio_Hover_false()
		controlWrangleDialog_controlGoods_commonLabelWrangleDialogGoodsName.text = TableManager.GetLanguageString(goodsInfo.goodsName)
	else:
		HQH.AssertLog("WrangleDialogSetDataForGoods, can not found goodsTypeID: %s info" % goodsTypeID)
	
	WrangleDialogSetDataForContentAndButton(contentString, wrangleDialogButtonStringArray)

func WrangleDialogSetDataForPicture(preloadResourceName: String, name: String, contentString: String, wrangleDialogButtonStringArray: Array):
	controlWrangleDialog_controlAvatar.visible = false
	controlWrangleDialog_controlGoods.visible = false
	controlWrangleDialog_controlPicture.visible = true
	
	var textureResource: Resource = TableManager.Get_PRELOAD_RESOURCE_MAP(preloadResourceName)
	controlWrangleDialog_controlPicture_textureRectPicture.texture = textureResource
	controlWrangleDialog_controlPicture_commonLabelWrangleDialogPictureName.text = name
	
	WrangleDialogSetDataForContentAndButton(contentString, wrangleDialogButtonStringArray)

func WrangleDialogSetDataForContentAndButton(contentString: String, wrangleDialogButtonStringArray: Array):
	if not controlWrangleDialog.visible:
		HQH.AssertLog("WrangleDialogSetDataForContentAndButton, not controlWrangleDialog.visible")
	
	commonLabel18WrangleDialogContent.text = contentString
	
	var controlWrangleDialogButtonCount: int = controlWrangleDialogButton.get_child_count()
	if UIManager.WRANGLEDIALOG_NUMBER_MAX != controlWrangleDialogButtonCount:
		HQH.AssertLog("WrangleDialogSetDataForContentAndButton, WRANGLEDIALOG_NUMBER_MAX: %s != controlWrangleDialogButtonCount: %s" % [UIManager.WRANGLEDIALOG_NUMBER_MAX, controlWrangleDialogButtonCount])
	
	var wrangleDialogButtonStringArraySize: int = wrangleDialogButtonStringArray.size()
	if controlWrangleDialogButtonCount < wrangleDialogButtonStringArraySize:
		HQH.AssertLog("WrangleDialogSetDataForContentAndButton, controlWrangleDialogButtonCount: %s < wrangleDialogButtonStringArraySize: %s" % [controlWrangleDialogButtonCount, wrangleDialogButtonStringArraySize])
	
	var wrangleDialogButton_StringFlag: String = TableManager.GetLanguageString("DOWNPANEL_WRANGLEDIALOGBUTTON_STRINGFLAG")
	for i in controlWrangleDialogButtonCount:
		var wrangleDialogButton: CommonTextureButtonWithLabel = controlWrangleDialogButton.get_child(i)
		if i < wrangleDialogButtonStringArraySize:
			wrangleDialogButton.visible = true
			
			var wrangleDialogButtonString: String = wrangleDialogButtonStringArray[i]
			wrangleDialogButton.SetLeftText("%s%s%s" % [(i + 1), wrangleDialogButton_StringFlag, wrangleDialogButtonString])
		else:
			wrangleDialogButton.visible = false
	
	if 0 == wrangleDialogButtonStringArraySize:
		commonButtonWrangleDialogContinue.visible = true
		commonButtonWrangleDialogContinue.grab_focus()
	else:
		commonButtonWrangleDialogContinue.visible = false
	
	m_WrangleDialogIsNeedCheckAndSetPosition = true

func WrangleDialogCheckAndSetPosition():
	if m_WrangleDialogIsNeedCheckAndSetPosition:
		m_WrangleDialogIsNeedCheckAndSetPosition_PastCount = m_WrangleDialogIsNeedCheckAndSetPosition_PastCount + 1
		var WRANGLEDIALOGISNEEDCHECKANDSETPOSITION_PASTCOUNT_MAX: int = 2
		if WRANGLEDIALOGISNEEDCHECKANDSETPOSITION_PASTCOUNT_MAX < m_WrangleDialogIsNeedCheckAndSetPosition_PastCount:
			m_WrangleDialogIsNeedCheckAndSetPosition = false
			
			# Check
			if controlWrangleDialog_controlAvatar.visible:
				var COMMONLABELWRANGLEDIALOGNAME_WIDTH_MAX: int = int(m_ControlWrangleDialog_controlAvatar_commonLabelWrangleDialogName_InitSize.x) # 645
				HQH.CheckLessThanOrEqualToMaxNumber(controlWrangleDialog_controlAvatar_commonLabelWrangleDialogName.text, COMMONLABELWRANGLEDIALOGNAME_WIDTH_MAX, int(controlWrangleDialog_controlAvatar_commonLabelWrangleDialogName.rect_size.x))
			elif controlWrangleDialog_controlGoods.visible:
				var COMMONLABELWRANGLEDIALOGNAME_WIDTH_MAX: int = int(m_ControlWrangleDialog_controlGoods_commonLabelWrangleDialogGoodsName_InitSize.x) # 660
				HQH.CheckLessThanOrEqualToMaxNumber(controlWrangleDialog_controlGoods_commonLabelWrangleDialogGoodsName.text, COMMONLABELWRANGLEDIALOGNAME_WIDTH_MAX, int(controlWrangleDialog_controlGoods_commonLabelWrangleDialogGoodsName.rect_size.x))
			elif controlWrangleDialog_controlPicture.visible:
				var COMMONLABELWRANGLEDIALOGNAME_WIDTH_MAX: int = int(m_ControlWrangleDialog_controlPicture_commonLabelWrangleDialogPictureName_InitSize.x) # 660
				HQH.CheckLessThanOrEqualToMaxNumber(controlWrangleDialog_controlPicture_commonLabelWrangleDialogPictureName.text, COMMONLABELWRANGLEDIALOGNAME_WIDTH_MAX, int(controlWrangleDialog_controlPicture_commonLabelWrangleDialogPictureName.rect_size.x))
			
			var COMMONLABEL18WRANGLEDIALOGCONTENT_LINE_COUNT_MAX: int = 15
			var commonLabel18WrangleDialogContent_line_count: int = commonLabel18WrangleDialogContent.get_line_count()
			HQH.CheckLessThanOrEqualToMaxNumber(commonLabel18WrangleDialogContent.text, COMMONLABEL18WRANGLEDIALOGCONTENT_LINE_COUNT_MAX, commonLabel18WrangleDialogContent_line_count)
			
			var controlWrangleDialogButtonCount: int = controlWrangleDialogButton.get_child_count()
			for i in controlWrangleDialogButtonCount:
				var wrangleDialogButton: CommonTextureButtonWithLabel = controlWrangleDialogButton.get_child(i)
				if wrangleDialogButton.visible:
					var WRANGLEDIALOGBUTTON_WIDTH_MAX: int = int(m_CommonTextureButtonWrangleDialog_InitSize.x) # 660
					HQH.CheckLessThanOrEqualToMaxNumber(wrangleDialogButton.GetLeftText(), WRANGLEDIALOGBUTTON_WIDTH_MAX, int(wrangleDialogButton.GetLeftLabel().rect_size.x))
			
			# Set position
			var controlWrangleDialogButton_VisibleLineNumber: int = 0
			for i in controlWrangleDialogButtonCount:
				var wrangleDialogButton: CommonTextureButtonWithLabel = controlWrangleDialogButton.get_child(i)
				if wrangleDialogButton.visible:
					controlWrangleDialogButton_VisibleLineNumber += 1
				else:
					break
			
			var COMMONLABEL18WRANGLEDIALOGCONTENT_LINE_COUNT_VALVE: int = 1
			if COMMONLABEL18WRANGLEDIALOGCONTENT_LINE_COUNT_VALVE < commonLabel18WrangleDialogContent_line_count:
				var COMMONLABEL18WRANGLEDIALOGCONTENT_NEXTOFFSETY: int  = 15
				var COMMONLABEL18WRANGLEDIALOGCONTENT_NEXTOFFSETY_2: int  = 55
				var commonLabel18WrangleDialogContent_NextOffsetY_Value: int = 0
				if commonButtonWrangleDialogContinue.visible:
					commonLabel18WrangleDialogContent_NextOffsetY_Value = COMMONLABEL18WRANGLEDIALOGCONTENT_NEXTOFFSETY_2
				else:
					commonLabel18WrangleDialogContent_NextOffsetY_Value = COMMONLABEL18WRANGLEDIALOGCONTENT_NEXTOFFSETY
				
				controlWrangleDialogButton.rect_position.y = commonLabel18WrangleDialogContent.rect_position.y + commonLabel18WrangleDialogContent.rect_size.y + commonLabel18WrangleDialogContent_NextOffsetY_Value
			else:
				controlWrangleDialogButton.rect_position.y = m_ControlWrangleDialogButton_InitPosition.y
			
			var CONTROLWRANGLEDIALOGBUTTON_NEXTOFFSETY: int = 30
			controlWrangleDialog.rect_size.y = controlWrangleDialogButton.rect_position.y + (CONTROLWRANGLEDIALOGBUTTON_NEXTOFFSETY * controlWrangleDialogButton_VisibleLineNumber)
			var CONTROLWRANGLEDIALOGBUTTON_BOTTOMOFFSETY: int = 20
			controlWrangleDialog.rect_size.y += CONTROLWRANGLEDIALOGBUTTON_BOTTOMOFFSETY
			controlWrangleDialog.rect_size.y = max(controlWrangleDialog.rect_size.y, m_ControlWrangleDialog_InitSize.y)
			controlWrangleDialog.rect_position.y = m_ControlWrangleDialog_InitPosition.y + (m_ControlWrangleDialog_InitSize.y - controlWrangleDialog.rect_size.y)

func _on_commonButtonWrangleDialogContinue_pressed():
	UIManager.DownPanel_on_commonButtonWrangleDialogContinue_pressed()

func GetCommonTextureButtonInteraction1Visible() -> bool:
	return commonTextureButtonInteraction1.visible

func SetCommonTextureButtonInteraction1Visible(v: bool):
	commonTextureButtonInteraction1.visible = v

func SetControlInteraction_commonTextureButtonInteraction1(isTalk: bool):
	if isTalk:
		commonTextureButtonInteraction1.SetCenterText(TableManager.GetLanguageString("DOWNPANEL_CONTROLINTERACTION_COMMONTEXTUREBUTTONINTERACTION1_TALK"))
	else:
		commonTextureButtonInteraction1.SetCenterText(TableManager.GetLanguageString("DOWNPANEL_CONTROLINTERACTION_COMMONTEXTUREBUTTONINTERACTION1"))

func GetCommonTextureButtonPlayChess1Visible() -> bool:
	return commonTextureButtonPlayChess1.visible

func SetCommonTextureButtonPlayChess1Visible(v: bool):
	commonTextureButtonPlayChess1.visible = v

func _on_commonTextureButtonClear1_pressed():
	commonRichTextLabelJournalRecord.clear()
	commonRichTextLabelJournalRecord.AddText(TableManager.GetAffixKeyRandomString("DOWNPANEL_COMMONRICHTEXTLABELJOURNALRECORD_CLEAR_"))

func _on_commonTextureButtonGoTop1_pressed():
	commonRichTextLabelJournalRecord.scroll_to_line(0)

func _on_commonTextureButtonGoBottom1_pressed():
	commonRichTextLabelJournalRecord.scroll_to_line(commonRichTextLabelJournalRecord.GetLineCount() - 1)

func _on_commonButton13BagUse_pressed():
	HQH.Log("_on_commonButton13BagUse_pressed")
	
	commonButton13BagUse.release_focus()
	UIManager.DownPanel_on_commonButton13BagUse_pressed(m_ControlBagButtonListCurrentSelectIndex)

func _on_commonButton13Discard_pressed():
	HQH.Log("_on_commonButton13Discard_pressed")
	
	commonButton13Discard.release_focus()
	UIManager.DownPanel_on_commonButton13Discard_pressed(m_ControlBagButtonListCurrentSelectIndex)

func _on_commonButton13Check_pressed():
	HQH.Log("_on_commonButton13Check_pressed")
	
	commonButton13Check.release_focus()
	UIManager.DownPanel_on_commonButton13Check_pressed(m_ControlBagButtonListCurrentSelectIndex)

func GetBagSelectedVisible() -> bool:
	return textureRectBagSelected.visible

func SetBagSelectedVisibleAndIndexFalse():
	SetBagSelectedVisibleAndIndex(false, -1)

func SetBagSelectedVisibleAndIndex(v: bool, index: int):
	textureRectBagSelected.visible = v
	commonButton13BagUse.visible = v
	commonButton13Discard.visible = v
	commonButton13Check.visible = v
	if textureRectBagSelected.visible:
		m_ControlBagButtonListCurrentSelectIndex = index
		
		var bagButton: CommonButtonBuff = controlBagButtonList.get_child(index)
		textureRectBagSelected.rect_global_position = bagButton.rect_global_position
	else:
		m_ControlBagButtonListCurrentSelectIndex = -1

func SetBagButtonListPressedTrue():
	SetBagButtonListPressed(m_ControlBagButtonListCurrentSelectIndex)

func SetBagButtonListPressed(index: int):
	HQH.Log("SetBagButtonListPressed, index: %s" % index)
	
	if (0 <= index) and (controlBagButtonList.get_child_count() > index):
		if index == m_ControlBagButtonListCurrentSelectIndex:
			SetBagSelectedVisibleAndIndexFalse()
		else:
			SetBagSelectedVisibleAndIndex(true, index)

func _on_commonTextureButtonBookJournalRecord_mouse_entered():
	UIManager.UpNamePanel_ShowTipsWithStringKey("NAME_AVATAR_31")

func _on_commonTextureButtonBookJournalRecord_mouse_exited():
	UIManager.UpNamePanel_HideTips()

func _on_commonTextureButtonClear1_mouse_entered():
	UIManager.UpNamePanel_ShowTipsWithStringKey("CLEAR_BUTTON")

func _on_commonTextureButtonClear1_mouse_exited():
	UIManager.UpNamePanel_HideTips()

func _on_commonTextureButtonGoTop1_mouse_entered():
	UIManager.UpNamePanel_ShowTipsWithStringKey("TOP_BUTTON")

func _on_commonTextureButtonGoTop1_mouse_exited():
	UIManager.UpNamePanel_HideTips()

func _on_commonTextureButtonGoBottom1_mouse_entered():
	UIManager.UpNamePanel_ShowTipsWithStringKey("BOTTOM_BUTTON")

func _on_commonTextureButtonGoBottom1_mouse_exited():
	UIManager.UpNamePanel_HideTips()

func _on_commonTextureButtonBag1_mouse_entered():
	UIManager.UpNamePanel_ShowTipsWithStringKey("NAME_AVATAR_30")

func _on_commonTextureButtonBag1_mouse_exited():
	UIManager.UpNamePanel_HideTips()

func _on_commonTextureButtonPlayChess1_pressed():
	HQH.Log("_on_commonTextureButtonPlayChess1_pressed")
	
	commonTextureButtonPlayChess1.release_focus()
	UIManager.DownPanel_on_commonTextureButtonPlayChess1_pressed()

func _on_commonTextureButtonInteraction1_pressed():
	HQH.Log("_on_commonTextureButtonInteraction1_pressed")
	
	commonTextureButtonInteraction1.release_focus()
	UIManager.DownPanel_on_commonTextureButtonInteraction1_pressed()

func _on_commonTextureButtonWrangleDialog1_pressed():
	UIManager.DownPanel_on_commonTextureButtonWrangleDialog_pressed(0)

func _on_commonTextureButtonWrangleDialog2_pressed():
	UIManager.DownPanel_on_commonTextureButtonWrangleDialog_pressed(1)

func _on_commonTextureButtonWrangleDialog3_pressed():
	UIManager.DownPanel_on_commonTextureButtonWrangleDialog_pressed(2)

func _on_commonTextureButtonWrangleDialog4_pressed():
	UIManager.DownPanel_on_commonTextureButtonWrangleDialog_pressed(3)

func _on_commonTextureButtonWrangleDialog5_pressed():
	UIManager.DownPanel_on_commonTextureButtonWrangleDialog_pressed(4)

func _on_commonTextureButtonWrangleDialog6_pressed():
	UIManager.DownPanel_on_commonTextureButtonWrangleDialog_pressed(5)

func _on_commonTextureButtonWrangleDialog7_pressed():
	UIManager.DownPanel_on_commonTextureButtonWrangleDialog_pressed(6)

func CommonTextureButtonWrangleDialog_SetPressedTrue(index: int):
	match index:
		0:
			commonTextureButtonWrangleDialog1.SetPressedTrue()
		
		1:
			commonTextureButtonWrangleDialog2.SetPressedTrue()
		
		2:
			commonTextureButtonWrangleDialog3.SetPressedTrue()
		
		3:
			commonTextureButtonWrangleDialog4.SetPressedTrue()
		
		4:
			commonTextureButtonWrangleDialog5.SetPressedTrue()
		
		5:
			commonTextureButtonWrangleDialog6.SetPressedTrue()
		
		6:
			commonTextureButtonWrangleDialog7.SetPressedTrue()
