extends "res://Script/UI/CommonUI/CommonPanel.gd"

onready var commonLabel31Title = $commonLabel31Title
onready var commonButtonClose = $commonButtonClose
onready var commonHSliderPage = $commonHSliderPage
onready var commonLabel13PageNumberLeft = $commonLabel13PageNumberLeft
onready var commonLabel13PageNumberRight = $commonLabel13PageNumberRight
onready var commonTextureButtonJournalRecordTurnPageLeft1 = $commonTextureButtonJournalRecordTurnPageLeft1
onready var commonTextureButtonJournalRecordTurnPageRight1 = $commonTextureButtonJournalRecordTurnPageRight1

onready var controlPaging_titleButton20Avatar = $controlPaging/titleButton20Avatar
onready var controlPaging_titleButton20Bag = $controlPaging/titleButton20Bag
onready var controlPaging_titleButton20Scene = $controlPaging/titleButton20Scene
onready var controlPaging_titleButton20Task = $controlPaging/titleButton20Task

# Avatar
onready var controlPaging_controlPagingAvatar = $controlPaging/controlPagingAvatar
onready var controlPaging_controlPagingAvatar_controlPagingAvatarLeft = $controlPaging/controlPagingAvatar/controlPagingAvatarLeft
onready var controlPaging_controlPagingAvatar_controlPagingAvatarLeft_commonHeadPortraitAvatar = $controlPaging/controlPagingAvatar/controlPagingAvatarLeft/commonHeadPortraitAvatar
onready var controlPaging_controlPagingAvatar_controlPagingAvatarLeft_colorRectAvatar = $controlPaging/controlPagingAvatar/controlPagingAvatarLeft/colorRectAvatar
onready var controlPaging_controlPagingAvatar_controlPagingAvatarLeft_commonLabelAvatarName = $controlPaging/controlPagingAvatar/controlPagingAvatarLeft/commonLabelAvatarName
onready var controlPaging_controlPagingAvatar_controlPagingAvatarLeft_commonLabel18AvatarContent = $controlPaging/controlPagingAvatar/controlPagingAvatarLeft/commonLabel18AvatarContent
onready var controlPaging_controlPagingAvatar_controlPagingAvatarRight = $controlPaging/controlPagingAvatar/controlPagingAvatarRight
onready var controlPaging_controlPagingAvatar_controlPagingAvatarRight_commonHeadPortraitAvatar = $controlPaging/controlPagingAvatar/controlPagingAvatarRight/commonHeadPortraitAvatar
onready var controlPaging_controlPagingAvatar_controlPagingAvatarRight_colorRectAvatar = $controlPaging/controlPagingAvatar/controlPagingAvatarRight/colorRectAvatar
onready var controlPaging_controlPagingAvatar_controlPagingAvatarRight_commonLabelAvatarName = $controlPaging/controlPagingAvatar/controlPagingAvatarRight/commonLabelAvatarName
onready var controlPaging_controlPagingAvatar_controlPagingAvatarRight_commonLabel18AvatarContent = $controlPaging/controlPagingAvatar/controlPagingAvatarRight/commonLabel18AvatarContent

# Bag
onready var controlPaging_controlPagingBag = $controlPaging/controlPagingBag
onready var controlPaging_controlPagingBag_controlPagingBagLeft = $controlPaging/controlPagingBag/controlPagingBagLeft
onready var controlPaging_controlPagingBag_controlPagingBagLeft_commonButtonBuffBag = $controlPaging/controlPagingBag/controlPagingBagLeft/commonButtonBuffBag
onready var controlPaging_controlPagingBag_controlPagingBagLeft_textureRectPicture = $controlPaging/controlPagingBag/controlPagingBagLeft/textureRectPicture
onready var controlPaging_controlPagingBag_controlPagingBagLeft_commonLabelBagName = $controlPaging/controlPagingBag/controlPagingBagLeft/commonLabelBagName
onready var controlPaging_controlPagingBag_controlPagingBagLeft_commonLabel18BagContent = $controlPaging/controlPagingBag/controlPagingBagLeft/commonLabel18BagContent
onready var controlPaging_controlPagingBag_controlPagingBagRight = $controlPaging/controlPagingBag/controlPagingBagRight
onready var controlPaging_controlPagingBag_controlPagingBagRight_commonButtonBuffBag = $controlPaging/controlPagingBag/controlPagingBagRight/commonButtonBuffBag
onready var controlPaging_controlPagingBag_controlPagingBagRight_textureRectPicture = $controlPaging/controlPagingBag/controlPagingBagRight/textureRectPicture
onready var controlPaging_controlPagingBag_controlPagingBagRight_commonLabelBagName = $controlPaging/controlPagingBag/controlPagingBagRight/commonLabelBagName
onready var controlPaging_controlPagingBag_controlPagingBagRight_commonLabel18BagContent = $controlPaging/controlPagingBag/controlPagingBagRight/commonLabel18BagContent

# Scene
onready var controlPaging_controlPagingScene = $controlPaging/controlPagingScene
onready var controlPaging_controlPagingScene_controlPagingSceneLeft = $controlPaging/controlPagingScene/controlPagingSceneLeft
onready var controlPaging_controlPagingScene_controlPagingSceneLeft_commonLabelSceneName = $controlPaging/controlPagingScene/controlPagingSceneLeft/commonLabelSceneName
onready var controlPaging_controlPagingScene_controlPagingSceneLeft_commonLabel18SceneContent = $controlPaging/controlPagingScene/controlPagingSceneLeft/commonLabel18SceneContent
onready var controlPaging_controlPagingScene_controlPagingSceneRight = $controlPaging/controlPagingScene/controlPagingSceneRight
onready var controlPaging_controlPagingScene_controlPagingSceneRight_commonLabelSceneName = $controlPaging/controlPagingScene/controlPagingSceneRight/commonLabelSceneName
onready var controlPaging_controlPagingScene_controlPagingSceneRight_commonLabel18SceneContent = $controlPaging/controlPagingScene/controlPagingSceneRight/commonLabel18SceneContent

# Task
onready var controlPaging_controlPagingTask = $controlPaging/controlPagingTask
onready var controlPaging_controlPagingTask_controlPagingTaskLeft = $controlPaging/controlPagingTask/controlPagingTaskLeft
onready var controlPaging_controlPagingTask_controlPagingTaskLeft_commonLabelTaskName = $controlPaging/controlPagingTask/controlPagingTaskLeft/commonLabelTaskName
onready var controlPaging_controlPagingTask_controlPagingTaskLeft_colorRectAvatar = $controlPaging/controlPagingTask/controlPagingTaskLeft/colorRectAvatar
onready var controlPaging_controlPagingTask_controlPagingTaskLeft_commonLabelAvatarName = $controlPaging/controlPagingTask/controlPagingTaskLeft/commonLabelAvatarName
onready var controlPaging_controlPagingTask_controlPagingTaskLeft_commonLabel18TaskContent = $controlPaging/controlPagingTask/controlPagingTaskLeft/commonLabel18TaskContent
onready var controlPaging_controlPagingTask_controlPagingTaskRight = $controlPaging/controlPagingTask/controlPagingTaskRight
onready var controlPaging_controlPagingTask_controlPagingTaskRight_commonLabelTaskName = $controlPaging/controlPagingTask/controlPagingTaskRight/commonLabelTaskName
onready var controlPaging_controlPagingTask_controlPagingTaskRight_colorRectAvatar = $controlPaging/controlPagingTask/controlPagingTaskRight/colorRectAvatar
onready var controlPaging_controlPagingTask_controlPagingTaskRight_commonLabelAvatarName = $controlPaging/controlPagingTask/controlPagingTaskRight/commonLabelAvatarName
onready var controlPaging_controlPagingTask_controlPagingTaskRight_commonLabel18TaskContent = $controlPaging/controlPagingTask/controlPagingTaskRight/commonLabel18TaskContent

func _ready():
	UIManager.JournalRecordPanel_OnReady()
	
	commonLabel31Title.text = TableManager.GetLanguageString("JOURNALRECORDPANEL_COMMONLABEL31TITLE")
	controlPaging_titleButton20Avatar.SetButtonText(TableManager.GetLanguageString("JOURNALRECORDPANEL_CONTROLPAGING_TITLEBUTTON20AVATAR"))
	controlPaging_titleButton20Bag.SetButtonText(TableManager.GetLanguageString("JOURNALRECORDPANEL_CONTROLPAGING_TITLEBUTTON20BAG"))
	controlPaging_titleButton20Scene.SetButtonText(TableManager.GetLanguageString("JOURNALRECORDPANEL_CONTROLPAGING_TITLEBUTTON20SCENE"))
	controlPaging_titleButton20Task.SetButtonText(TableManager.GetLanguageString("JOURNALRECORDPANEL_CONTROLPAGING_TITLEBUTTON20TASK"))
	commonButtonClose.SetButtonText(TableManager.GetLanguageString("PANEL_BUTTON_CLOSE"))
	
	UpdateUI()

func _on_commonButtonClose_pressed():
	UIManager.JournalRecordPanel_on_commonButtonClose_pressed()

func _on_commonTextureButtonJournalRecordTurnPageLeft1_pressed():
	UIManager.JournalRecordPanel_on_commonTextureButtonJournalRecordTurnPageLeft1_pressed()

func _on_commonTextureButtonJournalRecordTurnPageRight1_pressed():
	UIManager.JournalRecordPanel_on_commonTextureButtonJournalRecordTurnPageRight1_pressed()

func _on_commonHSliderPage_value_changed(value: int):
	UIManager.JournalRecordPanel_on_commonHSliderPage_value_changed(value)

func SetPagingAvatarInfo(pageInfo: Dictionary, controlPagingAvatarSide: Control, commonHeadPortraitAvatar: CommonHeadPortrait, colorRectAvatar: ColorRect, commonLabelAvatarName:CommonLabel, commonLabel18AvatarContent: CommonLabel):
	if UIManager.JOURNALRECORD_PANEL_PAGING_TYPE.JOURNALRECORD_PANEL_PAGING_NONE == pageInfo.pagingType:
		controlPagingAvatarSide.visible = false
	else:
		controlPagingAvatarSide.visible = true
		
		commonHeadPortraitAvatar.SetHeadPortrait(TableManager.GetAvatarHeadPortraitResourceName(pageInfo.typeID))
		colorRectAvatar.color = TableManager.GetAvatarFlagColor(pageInfo.typeID)
		commonLabelAvatarName.text = TableManager.GetAvatarShowName(pageInfo.typeID)
		commonLabel18AvatarContent.text = TableManager.GetAvatarDescription(pageInfo.typeID)
		
#		var powerMin: int = TableManager.GetAvatarPowerMin(pageInfo.typeID)
#		var powerMax: int = TableManager.GetAvatarPowerMax(pageInfo.typeID)
#		commonLabel18AvatarContent.text += TableManager.LINE_BREAK + (TableManager.GetLanguageString("JOURNALRECORDPANEL_PLAY_CHESS_POINTS") % [powerMin, powerMax])
		
		if pageInfo.typeID == AvatarManager.GetCurrentActiveAvatarTypeID():
			var avatarAttribute_VisualFieldDistance: int = SaveGameManager.GetSaveGameData_Archive_AvatarAttribute_VisualFieldDistance()
#			var avatarAttribute_VisualFieldSharpType: int = SaveGameManager.GetSaveGameData_Archive_AvatarAttribute_VisualFieldSharpType()
			var visualFieldDistance: int = SaveGameManager.GetSaveGameData_Archive_VisualFieldDistance()
			var visualFieldSharpType: int = SaveGameManager.GetSaveGameData_Archive_VisualFieldSharpType()
			if avatarAttribute_VisualFieldDistance != visualFieldDistance:
				commonLabel18AvatarContent.text += TableManager.LINE_BREAK + (TableManager.GetLanguageString("GOODS_TELESCOPE_VISUALFIELDDISTANCE2") % [String(visualFieldDistance), String(visualFieldDistance - avatarAttribute_VisualFieldDistance)])
			else:
				commonLabel18AvatarContent.text += TableManager.LINE_BREAK + (TableManager.GetLanguageString("GOODS_TELESCOPE_VISUALFIELDDISTANCE") % String(visualFieldDistance))
			
			match visualFieldSharpType:
				HQH.VISUAL_FIELD_SHARP_TYPE.RHOMBUS:
					commonLabel18AvatarContent.text += TableManager.LINE_BREAK + (TableManager.GetLanguageString("GOODS_TELESCOPE_VISUALFIELDSHARPTYPE") % TableManager.GetLanguageString("GOODS_TELESCOPE_VISUALFIELDSHARPTYPE_RHOMBUS"))
					
				HQH.VISUAL_FIELD_SHARP_TYPE.EGG:
					commonLabel18AvatarContent.text += TableManager.LINE_BREAK + (TableManager.GetLanguageString("GOODS_TELESCOPE_VISUALFIELDSHARPTYPE") % TableManager.GetLanguageString("GOODS_TELESCOPE_VISUALFIELDSHARPTYPE_EGG"))
		
		var equipTypeID: int = SaveGameManager.GetSaveGameData_Archive_AvatarListByAvatarTypeID_equipTypeID(pageInfo.typeID)
		if 0 < equipTypeID:
			var goodsInfo: Dictionary = TableManager.GetGoodsInfoByEquipTypeID(equipTypeID)
			if not goodsInfo.empty():
				var equipString: String = TableManager.GetLanguageString("AVATAR_HAD_EQUIP") % TableManager.GetLanguageString(goodsInfo.goodsName)
				commonLabel18AvatarContent.text += TableManager.LINE_BREAK + equipString

func SetPagingBagInfo(pageInfo: Dictionary, controlPagingBagSide: Control, commonButtonBuffBag: CommonButtonBuff, textureRectPicture: TextureRect,commonLabelBagName:CommonLabel, commonLabel18BagContent: CommonLabel):
	if UIManager.JOURNALRECORD_PANEL_PAGING_TYPE.JOURNALRECORD_PANEL_PAGING_NONE == pageInfo.pagingType:
		controlPagingBagSide.visible = false
	else:
		controlPagingBagSide.visible = true
		
		var goodsInfo: Dictionary = TableManager.GetGoodsInfo(pageInfo.typeID)
		if not goodsInfo.empty():
			match int(pageInfo.typeID):
				TableManager.GOODSTYPEID_BAG, TableManager.GOODSTYPEID_JOURNALRECORDBOOK:
					commonButtonBuffBag.visible = false
					textureRectPicture.visible = true
					
					var textureResource: Resource = TableManager.Get_PRELOAD_RESOURCE_MAP(goodsInfo.goodsIcon)
					textureRectPicture.texture = textureResource
				
				_:
					commonButtonBuffBag.visible = true
					textureRectPicture.visible = false
					
					commonButtonBuffBag.SetTextureRectNormal(goodsInfo.goodsIcon)
					commonButtonBuffBag.SetTextureButton1DisabledTrue()
					commonButtonBuffBag.SetTextureButton1PlayAudio_Hover_false()
			
			commonLabelBagName.text = TableManager.DISPLAY_BAG_ITEM_NAME % TableManager.GetLanguageString(goodsInfo.goodsName)
			commonLabel18BagContent.text = TableManager.GetLanguageString(goodsInfo.goodsDescription)
			
			match int(pageInfo.typeID):
				TableManager.GOODSTYPEID_FOOT:
					if SaveGameManager.IsGoodsUsedHas_Foot():
						commonLabel18BagContent.text += TableManager.LINE_BREAK + TableManager.GetLanguageString("GOODS_IN_USE")
					else:
						commonLabel18BagContent.text += TableManager.LINE_BREAK + TableManager.GetLanguageString("GOODS_UNUSED")
				
				TableManager.GOODSTYPEID_TELESCOPE:
					if SaveGameManager.IsGoodsUsedHas_Telescope():
						commonLabel18BagContent.text += TableManager.LINE_BREAK + TableManager.GetLanguageString("GOODS_IN_USE")
						var visualFieldDistance: int = SaveGameManager.GetSaveGameData_Archive_VisualFieldDistance()
						var visualFieldSharpType: int = SaveGameManager.GetSaveGameData_Archive_VisualFieldSharpType()
						commonLabel18BagContent.text += TableManager.LINE_BREAK + (TableManager.GetLanguageString("GOODS_TELESCOPE_VISUALFIELDDISTANCE") % String(visualFieldDistance))
						
						match visualFieldSharpType:
							HQH.VISUAL_FIELD_SHARP_TYPE.RHOMBUS:
								commonLabel18BagContent.text += TableManager.LINE_BREAK + (TableManager.GetLanguageString("GOODS_TELESCOPE_VISUALFIELDSHARPTYPE") % TableManager.GetLanguageString("GOODS_TELESCOPE_VISUALFIELDSHARPTYPE_RHOMBUS"))
								
							HQH.VISUAL_FIELD_SHARP_TYPE.EGG:
								commonLabel18BagContent.text += TableManager.LINE_BREAK + (TableManager.GetLanguageString("GOODS_TELESCOPE_VISUALFIELDSHARPTYPE") % TableManager.GetLanguageString("GOODS_TELESCOPE_VISUALFIELDSHARPTYPE_EGG"))
					else:
						commonLabel18BagContent.text += TableManager.LINE_BREAK + TableManager.GetLanguageString("GOODS_UNUSED")
				
				TableManager.GOODSTYPEID_WIG_1, TableManager.GOODSTYPEID_WIG_2, TableManager.GOODSTYPEID_WIG_3, TableManager.GOODSTYPEID_WIG_4, TableManager.GOODSTYPEID_WIG_5, TableManager.GOODSTYPEID_WIG_6, TableManager.GOODSTYPEID_WIG_7, TableManager.GOODSTYPEID_WIG_8, TableManager.GOODSTYPEID_WIG_9, TableManager.GOODSTYPEID_WIG_10, TableManager.GOODSTYPEID_WIG_11, TableManager.GOODSTYPEID_WIG_12, TableManager.GOODSTYPEID_WIG_13, TableManager.GOODSTYPEID_WIG_14, TableManager.GOODSTYPEID_WIG_15:
					var avatarTypeID: int = TableManager.AVATARTYPEID_SILVERCARP1
					var equipTypeID: int = SaveGameManager.GetSaveGameData_Archive_AvatarListByAvatarTypeID_equipTypeID(avatarTypeID)
					if (0 < equipTypeID) and (goodsInfo.equipTypeID == equipTypeID):
						var avatarName: String = TableManager.GetAvatarShowName(avatarTypeID)
						commonLabel18BagContent.text += TableManager.LINE_BREAK + avatarName + TableManager.CHARACTER_SPACE + TableManager.GetLanguageString("AVATAR_HAD_EQUIP2")

func SetPagingSceneInfo(pageInfo: Dictionary, controlPagingSceneSide: Control, commonLabelSceneName: CommonLabel, commonLabel18SceneContent: CommonLabel):
	if UIManager.JOURNALRECORD_PANEL_PAGING_TYPE.JOURNALRECORD_PANEL_PAGING_NONE == pageInfo.pagingType:
		controlPagingSceneSide.visible = false
	else:
		controlPagingSceneSide.visible = true
		
		var sceneInfo: Dictionary = TableManager.GetSceneInfo(pageInfo.typeID)
		if not sceneInfo.empty():
			commonLabelSceneName.text = TableManager.DISPLAY_SCENE_NAME % TableManager.GetLanguageString(sceneInfo.showNameKey)
			commonLabel18SceneContent.text = TableManager.GetLanguageString(sceneInfo.showContentKey)

func SetPagingTaskInfo_SetContent(wrangleDialogInfo_content: String, pageInfo_typeID: int, commonLabel18TaskContent: CommonLabel):
	commonLabel18TaskContent.text = TableManager.GetLanguageString(wrangleDialogInfo_content)
	var resultTaskInfo: Dictionary = SaveGameManager.GetSaveGameData_Archive_TaskList_TaskInfoByWrangleDialogTypeID(pageInfo_typeID)
	if resultTaskInfo.isHas:
		if pageInfo_typeID != resultTaskInfo.dataInfo.lastChoiceWrangleDialogTypeID:
			var lastWrangleDialogInfo: Dictionary = TableManager.GetWrangleDialogInfo(resultTaskInfo.dataInfo.lastChoiceWrangleDialogTypeID)
			if not lastWrangleDialogInfo.empty():
				commonLabel18TaskContent.text += TableManager.LINE_BREAK + TableManager.GetLanguageString(lastWrangleDialogInfo.content)

func SetPagingTaskInfo(pageInfo: Dictionary, controlPagingTaskSide: Control, commonLabelTaskName: CommonLabel, colorRectAvatar: ColorRect, commonLabelAvatarName:CommonLabel, commonLabel18TaskContent: CommonLabel):
	if UIManager.JOURNALRECORD_PANEL_PAGING_TYPE.JOURNALRECORD_PANEL_PAGING_NONE == pageInfo.pagingType:
		controlPagingTaskSide.visible = false
	else:
		controlPagingTaskSide.visible = true
		
		var wrangleDialogInfo: Dictionary = TableManager.GetWrangleDialogInfo(pageInfo.typeID)
		if not wrangleDialogInfo.empty():
			var nPCTriggerInfo: Dictionary = TableManager.GetNPCTriggerInfoByWrangleDialogTypeID(pageInfo.typeID)
			if not nPCTriggerInfo.empty():
				commonLabelTaskName.visible = false
				colorRectAvatar.visible = true
				commonLabelAvatarName.visible = true
				
				colorRectAvatar.color = TableManager.GetAvatarFlagColor(nPCTriggerInfo.avatarTypeID)
				commonLabelAvatarName.text = TableManager.DISPLAY_TASK_NAME % TableManager.GetAvatarShowName(nPCTriggerInfo.avatarTypeID)
				
				SetPagingTaskInfo_SetContent(wrangleDialogInfo.content, pageInfo.typeID, commonLabel18TaskContent)
			else:
				var nPCArticleTriggerInfo: Dictionary = TableManager.GetNPCArticleTriggerInfoByWrangleDialogTypeID(pageInfo.typeID)
				if not nPCArticleTriggerInfo.empty():
					commonLabelTaskName.visible = true
					colorRectAvatar.visible = false
					commonLabelAvatarName.visible = false
					
					commonLabelTaskName.text = TableManager.DISPLAY_TASK_NAME % TableManager.GetLanguageString(nPCArticleTriggerInfo.showNameKey)
					
					SetPagingTaskInfo_SetContent(wrangleDialogInfo.content, pageInfo.typeID, commonLabel18TaskContent)

func UpdateUI():
	var currentData: Dictionary = UIManager.JournalRecordPanel_GetPanelData()
	var pageNumberLeftMin: int = UIManager.JOURNALRECORD_PANEL_PAGENUMBERLEFTMIN
	var pageNumberLeftMax: int = currentData.pageNumberLeftMax
	var pageNumberLeft: int = currentData.pageNumberLeft
	
	commonHSliderPage.min_value = pageNumberLeftMin
	commonHSliderPage.max_value = UIManager.JournalRecordPanel_GetHSlider1PageValue(pageNumberLeftMax)
	commonHSliderPage.value = UIManager.JournalRecordPanel_GetHSlider1PageValue(pageNumberLeft)
	
	commonLabel13PageNumberLeft.text = str(pageNumberLeft)
	commonLabel13PageNumberRight.text = str(pageNumberLeft + 1)
	
	if pageNumberLeftMin == pageNumberLeft:
		commonTextureButtonJournalRecordTurnPageLeft1.visible = false
	else:
		commonTextureButtonJournalRecordTurnPageLeft1.visible = true
	
	if pageNumberLeftMax == pageNumberLeft:
		commonTextureButtonJournalRecordTurnPageRight1.visible = false
	else:
		commonTextureButtonJournalRecordTurnPageRight1.visible = true
	
	var pagingDataInfo: Dictionary = UIManager.JournalRecordPanel_GetPanelData_pagingDataList_pagingDataInfoByCurrentPageNumberLeft()
	controlPaging_controlPagingAvatar.visible = false
	controlPaging_controlPagingBag.visible = false
	controlPaging_controlPagingScene.visible = false
	controlPaging_controlPagingTask.visible = false
	match pagingDataInfo.pageInfoLeft.pagingType:
		UIManager.JOURNALRECORD_PANEL_PAGING_TYPE.JOURNALRECORD_PANEL_PAGING_AVATAR:
			controlPaging_titleButton20Avatar.grab_focus()
			controlPaging_controlPagingAvatar.visible = true
			SetPagingAvatarInfo(pagingDataInfo.pageInfoLeft, controlPaging_controlPagingAvatar_controlPagingAvatarLeft, controlPaging_controlPagingAvatar_controlPagingAvatarLeft_commonHeadPortraitAvatar, controlPaging_controlPagingAvatar_controlPagingAvatarLeft_colorRectAvatar, controlPaging_controlPagingAvatar_controlPagingAvatarLeft_commonLabelAvatarName, controlPaging_controlPagingAvatar_controlPagingAvatarLeft_commonLabel18AvatarContent)
			SetPagingAvatarInfo(pagingDataInfo.pageInfoRight, controlPaging_controlPagingAvatar_controlPagingAvatarRight, controlPaging_controlPagingAvatar_controlPagingAvatarRight_commonHeadPortraitAvatar, controlPaging_controlPagingAvatar_controlPagingAvatarRight_colorRectAvatar, controlPaging_controlPagingAvatar_controlPagingAvatarRight_commonLabelAvatarName, controlPaging_controlPagingAvatar_controlPagingAvatarRight_commonLabel18AvatarContent)
		
		UIManager.JOURNALRECORD_PANEL_PAGING_TYPE.JOURNALRECORD_PANEL_PAGING_BAG:
			controlPaging_titleButton20Bag.grab_focus()
			controlPaging_controlPagingBag.visible = true
			SetPagingBagInfo(pagingDataInfo.pageInfoLeft, controlPaging_controlPagingBag_controlPagingBagLeft, controlPaging_controlPagingBag_controlPagingBagLeft_commonButtonBuffBag, controlPaging_controlPagingBag_controlPagingBagLeft_textureRectPicture, controlPaging_controlPagingBag_controlPagingBagLeft_commonLabelBagName, controlPaging_controlPagingBag_controlPagingBagLeft_commonLabel18BagContent)
			SetPagingBagInfo(pagingDataInfo.pageInfoRight, controlPaging_controlPagingBag_controlPagingBagRight, controlPaging_controlPagingBag_controlPagingBagRight_commonButtonBuffBag, controlPaging_controlPagingBag_controlPagingBagRight_textureRectPicture, controlPaging_controlPagingBag_controlPagingBagRight_commonLabelBagName, controlPaging_controlPagingBag_controlPagingBagRight_commonLabel18BagContent)
		
		UIManager.JOURNALRECORD_PANEL_PAGING_TYPE.JOURNALRECORD_PANEL_PAGING_SCENE:
			controlPaging_titleButton20Scene.grab_focus()
			controlPaging_controlPagingScene.visible = true
			SetPagingSceneInfo(pagingDataInfo.pageInfoLeft, controlPaging_controlPagingScene_controlPagingSceneLeft, controlPaging_controlPagingScene_controlPagingSceneLeft_commonLabelSceneName, controlPaging_controlPagingScene_controlPagingSceneLeft_commonLabel18SceneContent)
			SetPagingSceneInfo(pagingDataInfo.pageInfoRight, controlPaging_controlPagingScene_controlPagingSceneRight, controlPaging_controlPagingScene_controlPagingSceneRight_commonLabelSceneName, controlPaging_controlPagingScene_controlPagingSceneRight_commonLabel18SceneContent)
		
		UIManager.JOURNALRECORD_PANEL_PAGING_TYPE.JOURNALRECORD_PANEL_PAGING_TASK:
			controlPaging_titleButton20Task.grab_focus()
			controlPaging_controlPagingTask.visible = true
			SetPagingTaskInfo(pagingDataInfo.pageInfoLeft, controlPaging_controlPagingTask_controlPagingTaskLeft, controlPaging_controlPagingTask_controlPagingTaskLeft_commonLabelTaskName, controlPaging_controlPagingTask_controlPagingTaskLeft_colorRectAvatar, controlPaging_controlPagingTask_controlPagingTaskLeft_commonLabelAvatarName, controlPaging_controlPagingTask_controlPagingTaskLeft_commonLabel18TaskContent)
			SetPagingTaskInfo(pagingDataInfo.pageInfoRight, controlPaging_controlPagingTask_controlPagingTaskRight, controlPaging_controlPagingTask_controlPagingTaskRight_commonLabelTaskName, controlPaging_controlPagingTask_controlPagingTaskRight_colorRectAvatar, controlPaging_controlPagingTask_controlPagingTaskRight_commonLabelAvatarName, controlPaging_controlPagingTask_controlPagingTaskRight_commonLabel18TaskContent)

func _on_titleButton20Avatar_pressed():
	UIManager.JournalRecordPanel_on_titleButton20Avatar_pressed()

func _on_titleButton20Bag_pressed():
	UIManager.JournalRecordPanel_on_titleButton20Bag_pressed()

func _on_titleButton20Scene_pressed():
	UIManager.JournalRecordPanel_on_titleButton20Scene_pressed()

func _on_titleButton20Task_pressed():
	UIManager.JournalRecordPanel_on_titleButton20Task_pressed()

func CommonTextureButtonJournalRecordTurnPageLeft1_SetPressedTrue():
	if commonTextureButtonJournalRecordTurnPageLeft1.visible:
		commonTextureButtonJournalRecordTurnPageLeft1.SetPressedTrue()

func CommonTextureButtonJournalRecordTurnPageRight1_SetPressedTrue():
	if commonTextureButtonJournalRecordTurnPageRight1.visible:
		commonTextureButtonJournalRecordTurnPageRight1.SetPressedTrue()
