extends "res://Script/UI/CommonUI/CommonPanel.gd"

onready var commonLabel31Title = $commonLabel31Title
onready var commonButtonOK = $commonButtonOK
onready var commonButtonCancel = $commonButtonCancel
onready var commonItemList1 = $commonBG1BG1/commonItemList1

func _ready():
	UIManager.LanguagePanel_OnReady()
	
	UpdateUI()
	
	var allLanguageName: Array = TableManager.GetAllLanguageName()
	for i in allLanguageName.size():
		var languageDataInfo: Dictionary = TableManager.GetLanguageDataInfo(allLanguageName[i])
		commonItemList1.add_item(languageDataInfo.showName)
		commonItemList1.set_item_tooltip(i, allLanguageName[i])
	
	var currentSelectIndex: int = UIManager.LanguagePanel_GetCurrentSelectIndex()
	if 0 <= currentSelectIndex:
		commonItemList1.grab_focus()
		commonItemList1.SetInitSelect(currentSelectIndex)
	
	var isFirstTimeSaveGameData: bool = SaveGameManager.GetIsFirstTimeSaveGameData()
	if isFirstTimeSaveGameData:
		commonButtonCancel.visible = false

func _on_commonButtonOK_pressed():
	UIManager.LanguagePanel_on_commonButtonOK_pressed()

func _on_commonButtonCancel_pressed():
	UIManager.LanguagePanel_on_commonButtonCancel_pressed()

func _on_commonItemList1_item_selected(index):
	commonItemList1.Set_IsFirstObtainFocus_false()
	
	UIManager.LanguagePanel_on_commonItemList1_item_selected(index)

func UpdateUI():
	commonLabel31Title.text = TableManager.GetLanguageString("LANGUAGEPANEL_COMMONLABEL31TITLE")
	commonButtonOK.SetButtonText(TableManager.GetLanguageString("PANEL_BUTTON_OK"))
	commonButtonCancel.SetButtonText(TableManager.GetLanguageString("PANEL_BUTTON_CANCEL"))
