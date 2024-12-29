extends "res://Script/UI/CommonUI/CommonPanel.gd"

onready var commonTextureButtonSetting1 = $commonTextureButtonSetting1

func _ready():
	commonTextureButtonSetting1.SetLeftText(TableManager.INPUT_KEY_LETTER_MAP.KEY_O)

func _on_commonTextureButtonSetting1_pressed():
	commonTextureButtonSetting1.release_focus()
	
	UIManager.RightSettingPanel_on_commonTextureButtonSetting1_pressed()

func CommonTextureButtonSetting1_SetPressedTrue():
	commonTextureButtonSetting1.SetPressedTrue()

func _on_commonTextureButtonSetting1_mouse_entered():
	UIManager.UpNamePanel_ShowTipsWithStringKey("STARTGAMEPANEL_COMMONBUTTON31OPTION")

func _on_commonTextureButtonSetting1_mouse_exited():
	UIManager.UpNamePanel_HideTips()
