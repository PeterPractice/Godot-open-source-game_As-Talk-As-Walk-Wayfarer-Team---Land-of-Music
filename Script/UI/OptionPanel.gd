extends "res://Script/UI/CommonUI/CommonPanel.gd"

enum OPTIONPANEL_PAGING_TYPE {
	GENERAL,
	KEYBOARD,
	ABOUT,
}

onready var commonLabel31Title = $commonLabel31Title
onready var commonButtonOK = $commonButtonOK
onready var commonButtonCancel = $commonButtonCancel
onready var commonButtonDefault = $commonButtonDefault
onready var commonButtonReturnToHubScene = $commonButtonReturnToHubScene
onready var commonButtonExitGame = $commonButtonExitGame
onready var commonButtonReturnToGame = $commonButtonReturnToGame
onready var titleButton20General = $commonBG1BG1/titleButton20General
onready var titleButton20Keyboard = $commonBG1BG1/titleButton20Keyboard
onready var titleButton20About = $commonBG1BG1/titleButton20About

# General
onready var controlGeneral = $commonBG1BG1/controlGeneral
onready var commonLabelVideoResolutionRatio = $commonBG1BG1/controlGeneral/commonLabelVideoResolutionRatio
onready var commonOptionButtonVideoResolutionRatio = $commonBG1BG1/controlGeneral/commonOptionButtonVideoResolutionRatio
onready var commonLabelFullScreen = $commonBG1BG1/controlGeneral/commonLabelFullScreen
onready var commonCheckBoxFullScreen = $commonBG1BG1/controlGeneral/commonCheckBoxFullScreen
onready var commonLabelWindowStretch = $commonBG1BG1/controlGeneral/commonLabelWindowStretch
onready var commonCheckBoxWindowStretch = $commonBG1BG1/controlGeneral/commonCheckBoxWindowStretch
onready var commonButtonLanguage = $commonBG1BG1/controlGeneral/commonButtonLanguage
onready var commonLabelLanguage = $commonBG1BG1/controlGeneral/commonLabelLanguage
onready var commonLabelMusic = $commonBG1BG1/controlGeneral/commonLabelMusic
onready var commonLabelMusicValue = $commonBG1BG1/controlGeneral/commonHSliderMusic/commonLabelMusicValue
onready var commonHSliderMusic = $commonBG1BG1/controlGeneral/commonHSliderMusic
onready var commonCheckBoxMusic = $commonBG1BG1/controlGeneral/commonCheckBoxMusic
onready var commonLabelSoundEffect = $commonBG1BG1/controlGeneral/commonLabelSoundEffect
onready var commonLabelSoundEffectValue = $commonBG1BG1/controlGeneral/commonHSliderSoundEffect/commonLabelSoundEffectValue
onready var commonHSliderSoundEffect = $commonBG1BG1/controlGeneral/commonHSliderSoundEffect
onready var commonCheckBoxSoundEffect = $commonBG1BG1/controlGeneral/commonCheckBoxSoundEffect

# Keyboard
onready var controlKeyboard = $commonBG1BG1/controlKeyboard
onready var controlKeyboard_commonLabelKeyboardMove = $commonBG1BG1/controlKeyboard/commonLabelKeyboardMove
onready var controlKeyboard_commonLabelKeyboardMoveContent = $commonBG1BG1/controlKeyboard/commonLabelKeyboardMoveContent
onready var controlKeyboard_CommonLabelKeyboardInteractionTalk = $commonBG1BG1/controlKeyboard/CommonLabelKeyboardInteractionTalk
onready var controlKeyboard_CommonLabelKeyboardInteractionTalkContent = $commonBG1BG1/controlKeyboard/CommonLabelKeyboardInteractionTalkContent
onready var controlKeyboard_commonLabelKeyboardPlayChess = $commonBG1BG1/controlKeyboard/commonLabelKeyboardPlayChess
onready var controlKeyboard_commonLabelKeyboardPlayChessContent = $commonBG1BG1/controlKeyboard/commonLabelKeyboardPlayChessContent
onready var controlKeyboard_commonLabelKeyboardSelectCharacter = $commonBG1BG1/controlKeyboard/commonLabelKeyboardSelectCharacter
onready var controlKeyboard_commonLabelKeyboardSelectCharacterContent = $commonBG1BG1/controlKeyboard/commonLabelKeyboardSelectCharacterContent
onready var controlKeyboard_commonLabelKeyboardBag = $commonBG1BG1/controlKeyboard/commonLabelKeyboardBag
onready var controlKeyboard_commonLabelKeyboardBagContent = $commonBG1BG1/controlKeyboard/commonLabelKeyboardBagContent
onready var controlKeyboard_commonLabelKeyboardJournalRecord = $commonBG1BG1/controlKeyboard/commonLabelKeyboardJournalRecord
onready var controlKeyboard_commonLabelKeyboardJournalRecordContent = $commonBG1BG1/controlKeyboard/commonLabelKeyboardJournalRecordContent
onready var controlKeyboard_commonLabelKeyboardOptionsScreen = $commonBG1BG1/controlKeyboard/commonLabelKeyboardOptionsScreen
onready var controlKeyboard_commonLabelKeyboardOptionsScreenContent = $commonBG1BG1/controlKeyboard/commonLabelKeyboardOptionsScreenContent

# About
onready var controlAbout = $commonBG1BG1/controlAbout
onready var controlAbout_commonLabelAboutName = $commonBG1BG1/controlAbout/commonLabelAboutName
onready var controlAbout_commonLabelAboutVersion = $commonBG1BG1/controlAbout/commonLabelAboutVersion
onready var controlAbout_commonLabelAboutCopyrightAndDevelopment = $commonBG1BG1/controlAbout/commonLabelAboutCopyrightAndDevelopment
onready var controlAbout_commonLabelContact = $commonBG1BG1/controlAbout/commonLabelContact
onready var controlAbout_commonLabelThanks = $commonBG1BG1/controlAbout/commonLabelThanks
onready var controlAbout_commonButton10Copy = $commonBG1BG1/controlAbout/commonButton10Copy
const COPYRIGHT_AND_DEVELOPMENT_STRING:String = "HeQingHill Game Studio - A Peter Game"
const CONTACT_EMIAL_STRING:String = "atawwt_lm@163.com"

var m_IsStartNoSignal: bool = false
var m_IsStartNoSignal_IsDebugPrint: bool = false

func _ready():
	UIManager.OptionPanel_OnReady()
	
	commonLabel31Title.text = TableManager.GetLanguageString("OPTIONPANEL_COMMONLABEL31TITLE")
	commonButtonOK.SetButtonText(TableManager.GetLanguageString("PANEL_BUTTON_OK"))
	commonButtonCancel.SetButtonText(TableManager.GetLanguageString("PANEL_BUTTON_CANCEL"))
	commonButtonDefault.SetButtonText(TableManager.GetLanguageString("OPTIONPANEL_COMMONBUTTONDEFAULT"))
	
	commonLabelVideoResolutionRatio.text = TableManager.GetLanguageString("OPTIONPANEL_COMMONLABELVIDEORESOLUTIONRATIO")
	commonLabelFullScreen.text = TableManager.GetLanguageString("OPTIONPANEL_COMMONLABELFULLSCREEN")
	commonLabelWindowStretch.text = TableManager.GetLanguageString("OPTIONPANEL_COMMONLABELWINDOWSTRETCH")
	commonLabelMusic.text = TableManager.GetLanguageString("OPTIONPANEL_COMMONLABELMUSIC")
	commonLabelSoundEffect.text = TableManager.GetLanguageString("OPTIONPANEL_COMMONLABELSOUNDEFFECT")
	commonButtonLanguage.SetButtonText(TableManager.GetLanguageString("OPTIONPANEL_COMMONBUTTONLANGUAGE"))
	commonLabelLanguage.text = TableManager.GetLanguageString("OPTIONPANEL_COMMONLABELLANGUAGE")
	commonButtonReturnToGame.text = TableManager.GetLanguageString("OPTIONPANEL_COMMONBUTTONRETURNTOGAME")
	
	commonButtonReturnToGame.visible = false
	
	titleButton20General.SetButtonText(TableManager.GetLanguageString("OPTIONPANEL_GENERAL"))
	titleButton20Keyboard.SetButtonText(TableManager.GetLanguageString("OPTIONPANEL_KEYBOARD"))
	titleButton20About.SetButtonText(TableManager.GetLanguageString("OPTIONPANEL_ABOUT"))
	controlAbout_commonButton10Copy.SetButtonText(TableManager.GetLanguageString("OPTIONPANEL_ABOUT_CONTACT_COPY"))
	
	if SceneManager.IsInHubScene():
		commonButtonReturnToHubScene.visible = false
		commonButtonExitGame.visible = false
	else:
		commonButtonReturnToHubScene.visible = true
		commonButtonExitGame.visible = true
		
		commonButtonReturnToHubScene.SetButtonText(TableManager.GetLanguageString("OPTIONPANEL_COMMONBUTTONRETURNTOHUBSCENE"))
		commonButtonExitGame.SetButtonText(TableManager.GetLanguageString("OPTIONPANEL_COMMONBUTTONEXITGAME"))
	
	SetVideoResolutionRatio()
	SetFullScreen()
	SetWindowStretch()
	
	SetMusicValue()
	SetSoundEffectValue()
	
	SetControlKeyboard()
	SetShowPaging(OPTIONPANEL_PAGING_TYPE.GENERAL)
	
	SetControlAbout()

func _exit_tree():
	UIManager.DownPanel_SetText()
	UIManager.DayNightPanel_SetText()

func _on_commonButtonOK_pressed():
	UIManager.OptionPanel_on_commonButtonOK_pressed()

func _on_commonButtonCancel_pressed():
	UIManager.OptionPanel_on_commonButtonCancel_pressed()

func _on_commonButtonDefault_pressed():
	UIManager.OptionPanel_on_commonButtonDefault_pressed()

func _on_commonButtonLanguage_pressed():
	UIManager.OptionPanel_on_commonButtonLanguage_pressed()

func _on_commonButtonReturnToHubScene_pressed():
	UIManager.OptionPanel_on_commonButtonReturnToHubScene_pressed()

func _on_commonButtonExitGame_pressed():
	UIManager.OptionPanel_on_commonButtonExitGame_pressed()

func _on_commonButtonReturnToGame_pressed():
	UIManager.OptionPanel_on_commonButtonReturnToGame_pressed()

func _on_commonOptionButtonVideoResolutionRatio_item_selected(index: int):
	UIManager.OptionPanel_on_commonOptionButtonVideoResolutionRatio_item_selected(index)

func _on_commonCheckBoxFullScreen_pressed():
	UIManager.OptionPanel_on_commonCheckBoxFullScreen_pressed(commonCheckBoxFullScreen.pressed)

func _on_commonCheckBoxWindowStretch_pressed():
	UIManager.OptionPanel_on_commonCheckBoxWindowStretch_pressed(commonCheckBoxWindowStretch.pressed)

func _on_commonCheckBoxMusic_pressed():
	if m_IsStartNoSignal:
		if m_IsStartNoSignal_IsDebugPrint:
			HQH.Log("m_IsStartNoSignal is true")
		
		return
	
	UIManager.OptionPanel_on_commonCheckBoxMusic_pressed(commonCheckBoxMusic.pressed)

func _on_commonHSliderMusic_value_changed(value: int):
	if m_IsStartNoSignal:
		if m_IsStartNoSignal_IsDebugPrint:
			HQH.Log("m_IsStartNoSignal is true")
		
		return
	
	UIManager.OptionPanel_on_commonHSliderMusic_value_changed(value)

func _on_commonHSliderMusic_mouse_entered():
	if not commonHSliderMusic.has_focus():
		AudioManager.PlayByName_ButtonHover()

func _on_commonCheckBoxSoundEffect_pressed():
	if m_IsStartNoSignal:
		if m_IsStartNoSignal_IsDebugPrint:
			HQH.Log("m_IsStartNoSignal is true")
		
		return
	
	UIManager.OptionPanel_on_commonCheckBoxSoundEffect_pressed(commonCheckBoxSoundEffect.pressed)

func _on_commonHSliderSoundEffect_value_changed(value):
	if m_IsStartNoSignal:
		if m_IsStartNoSignal_IsDebugPrint:
			HQH.Log("m_IsStartNoSignal is true")
		
		return
	
	commonHSliderSoundEffect.Set_IsFirstObtainFocus_false()
	
	UIManager.OptionPanel_on_commonHSliderSoundEffect_value_changed(value)

func _on_commonHSliderSoundEffect_mouse_entered():
	if not commonHSliderSoundEffect.has_focus():
		AudioManager.PlayByName_ButtonHover()

func SetMusicValue():
	m_IsStartNoSignal = true
	
	var musicValue: int = UIManager.OptionPanel_GetAudioInfoMusicValue()
	commonHSliderMusic.value = musicValue
	commonLabelMusicValue.text = "%s" % musicValue
	
	var musicisMute: bool = UIManager.OptionPanel_GetAudioInfoMusicIsMute()
	if musicisMute:
		commonCheckBoxMusic.pressed = false
	else:
		commonCheckBoxMusic.pressed = true
	
	m_IsStartNoSignal = false

func SetSoundEffectValue():
	m_IsStartNoSignal = true
	
	var soundEffectValue: int = UIManager.OptionPanel_GetAudioInfoSoundEffectValue()
	commonHSliderSoundEffect.value = soundEffectValue
	commonLabelSoundEffectValue.text = "%s" % soundEffectValue
	
	var soundEffectisMute: bool = UIManager.OptionPanel_GetAudioInfoSoundEffectIsMute()
	if soundEffectisMute:
		commonCheckBoxSoundEffect.pressed = false
	else:
		commonCheckBoxSoundEffect.pressed = true
	
	m_IsStartNoSignal = false

func SetVideoResolutionRatio():
	commonOptionButtonVideoResolutionRatio.clear()
	var isFullScreen: bool = UIManager.OptionPanel_GetVideoInfo_windowIsFullScreen()
	var isWindowStretch: bool = UIManager.OptionPanel_GetVideoInfo_windowIsWindowStretch()
	if isFullScreen and (not isWindowStretch):
		commonOptionButtonVideoResolutionRatio.add_item(TableManager.GetLanguageString("OPTIONPANEL_COMMONLABELVIDEORESOLUTIONRATIO_SCREEN_RESOLUTION"))
		commonOptionButtonVideoResolutionRatio.set_item_disabled(0, true)
	else:
		var videoResolutionRatioList: Array = UIManager.OptionPanel_GetVideoResolutionRatioList()
		for iv in videoResolutionRatioList:
			commonOptionButtonVideoResolutionRatio.add_item(TableManager.GetLanguageString(iv.showkey))
		
		var videoResolutionRatioListCurrentSelectIndex: int = UIManager.OptionPanel_GetVideoResolutionRatioListCurrentSelectIndex()
		commonOptionButtonVideoResolutionRatio.select(videoResolutionRatioListCurrentSelectIndex)

func SetFullScreen():
	var isFullScreen: bool = UIManager.OptionPanel_GetVideoInfo_windowIsFullScreen()
	if isFullScreen:
		commonCheckBoxFullScreen.pressed = true
	else:
		commonCheckBoxFullScreen.pressed = false

func SetWindowStretch():
	var isWindowStretch: bool = UIManager.OptionPanel_GetVideoInfo_windowIsWindowStretch()
	if isWindowStretch:
		commonCheckBoxWindowStretch.pressed = true
	else:
		commonCheckBoxWindowStretch.pressed = false

func SetShowPaging(pagingType: int):
	controlGeneral.visible = false
	controlKeyboard.visible = false
	controlAbout.visible = false
	match pagingType:
		OPTIONPANEL_PAGING_TYPE.GENERAL:
			controlGeneral.visible = true
		
		OPTIONPANEL_PAGING_TYPE.KEYBOARD:
			controlKeyboard.visible = true
		
		OPTIONPANEL_PAGING_TYPE.ABOUT:
			controlAbout.visible = true

func _on_titleButton20General_pressed():
	SetShowPaging(OPTIONPANEL_PAGING_TYPE.GENERAL)

func _on_titleButton20Keyboard_pressed():
	SetShowPaging(OPTIONPANEL_PAGING_TYPE.KEYBOARD)
	
func _on_titleButton20About_pressed():
	SetShowPaging(OPTIONPANEL_PAGING_TYPE.ABOUT)

func SetControlKeyboard():
	controlKeyboard_commonLabelKeyboardMove.text = TableManager.GetLanguageString("OPTIONPANEL_KEYBOARD_MOVE")
	controlKeyboard_commonLabelKeyboardMoveContent.text = TableManager.GetLanguageString("OPTIONPANEL_KEYBOARD_MOVE_CONTENT")
	controlKeyboard_CommonLabelKeyboardInteractionTalk.text = TableManager.GetLanguageString("OPTIONPANEL_KEYBOARD_INTERACTION_TALK")
	controlKeyboard_CommonLabelKeyboardInteractionTalkContent.text = TableManager.GetLanguageString("OPTIONPANEL_KEYBOARD_INTERACTION_TALK_CONTENT")
	controlKeyboard_commonLabelKeyboardPlayChess.text = TableManager.GetLanguageString("OPTIONPANEL_KEYBOARD_PLAY_CHESS")
	controlKeyboard_commonLabelKeyboardPlayChessContent.text = TableManager.GetLanguageString("OPTIONPANEL_KEYBOARD_PLAY_CHESS_CONTENT")
	controlKeyboard_commonLabelKeyboardSelectCharacter.text = TableManager.GetLanguageString("OPTIONPANEL_KEYBOARD_SELECT_CHARACTER")
	controlKeyboard_commonLabelKeyboardSelectCharacterContent.text = TableManager.GetLanguageString("OPTIONPANEL_KEYBOARD_SELECT_CHARACTER_CONTENT")
	controlKeyboard_commonLabelKeyboardBag.text = TableManager.GetLanguageString("OPTIONPANEL_KEYBOARD_BAG")
	controlKeyboard_commonLabelKeyboardBagContent.text = TableManager.GetLanguageString("OPTIONPANEL_KEYBOARD_BAG_CONTENT")
	controlKeyboard_commonLabelKeyboardJournalRecord.text = TableManager.GetLanguageString("OPTIONPANEL_KEYBOARD_JOURNAL_RECORD")
	controlKeyboard_commonLabelKeyboardJournalRecordContent.text = TableManager.GetLanguageString("OPTIONPANEL_KEYBOARD_JOURNAL_RECORD_CONTENT")
	controlKeyboard_commonLabelKeyboardOptionsScreen.text = TableManager.GetLanguageString("OPTIONPANEL_KEYBOARD_OPTIONS_SCREEN")
	controlKeyboard_commonLabelKeyboardOptionsScreenContent.text = TableManager.GetLanguageString("OPTIONPANEL_KEYBOARD_OPTIONS_SCREEN_CONTENT")

func SetControlAbout():
	controlAbout_commonLabelAboutName.text = TableManager.GetLanguageString("OPTIONPANEL_ABOUT_NAME_OF_THE_GAME")
	controlAbout_commonLabelAboutVersion.text = TableManager.GetLanguageString("OPTIONPANEL_ABOUT_VERSION") % HQH.GetProjectVersionString()
	controlAbout_commonLabelAboutCopyrightAndDevelopment.text = TableManager.GetLanguageString("OPTIONPANEL_ABOUT_COPYRIGHT_AND_DEVELOPMENT") % COPYRIGHT_AND_DEVELOPMENT_STRING
	controlAbout_commonLabelContact.text = TableManager.GetLanguageString("OPTIONPANEL_ABOUT_CONTACT") % CONTACT_EMIAL_STRING
	controlAbout_commonLabelThanks.text = TableManager.GetLanguageString("OPTIONPANEL_ABOUT_THANKS")

func _on_commonButton10Copy_pressed():
	HQH.Log("_on_commonButton10Copy_pressed")
	OS.clipboard = CONTACT_EMIAL_STRING
	HQH.Log("copy: %s" % OS.clipboard)
