extends "res://Script/UI/CommonUI/CommonPanel.gd"

onready var titleLabel38GameTitle = $titleLabel38GameTitle
onready var commonButton31StartGame = $commonButton31StartGame
onready var commonButton31LoadGame = $commonButton31LoadGame
onready var commonButton31Option = $commonButton31Option
onready var commonButton31ExitGame = $commonButton31ExitGame
onready var controlArchive = $controlArchive
onready var commonLabelArchive = $controlArchive/commonLabelArchive
onready var commonButtonArchive1 = $controlArchive/commonButtonArchive1
onready var commonButtonArchive2 = $controlArchive/commonButtonArchive2
onready var commonButtonArchive3 = $controlArchive/commonButtonArchive3
onready var commonButtonArchive4 = $controlArchive/commonButtonArchive4
onready var controlArchiveClear = $controlArchiveClear
onready var commonButton10ArchiveClear1 = $controlArchiveClear/commonButton10ArchiveClear1
onready var commonButton10ArchiveClear2 = $controlArchiveClear/commonButton10ArchiveClear2
onready var commonButton10ArchiveClear3 = $controlArchiveClear/commonButton10ArchiveClear3
onready var commonButton10ArchiveClear4 = $controlArchiveClear/commonButton10ArchiveClear4
onready var commonButton10ArchiveClearDoubleConfirmation = $commonButton10ArchiveClearDoubleConfirmation
onready var commonLabelVersion = $commonLabelVersion

onready var controlFirstAvatar = $controlFirstAvatar
onready var controlFirstAvatar_player1A = $controlFirstAvatar/player1A
onready var controlFirstAvatar_silverCarp1A = $controlFirstAvatar/silverCarp1A
onready var controlFirstAvatar_snake1A = $controlFirstAvatar/snake1A
onready var controlFirstAvatar_textureButton1 = $controlFirstAvatar/textureButton1

var m_FirstAvatarListCurrentSelectIndex: int = 0
onready var m_FirstAvatarList: Array = [
	{"avatarTypeID": TableManager.AVATARTYPEID_SNAKE1,			"sceneTypeID": TableManager.SCENETYPEID_1_HOME,		"controlFirstAvatarNode": controlFirstAvatar_snake1A},
	{"avatarTypeID": TableManager.AVATARTYPEID_PLAYER1,			"sceneTypeID": TableManager.SCENETYPEID_3_HOME,		"controlFirstAvatarNode": controlFirstAvatar_player1A},
	{"avatarTypeID": TableManager.AVATARTYPEID_SILVERCARP1,		"sceneTypeID": TableManager.SCENETYPEID_4_HOME,		"controlFirstAvatarNode": controlFirstAvatar_silverCarp1A},
]
var m_SpriteToLeft_flip_h_Timer: float = 0.0

func _ready():
	titleLabel38GameTitle.text = TableManager.GetLanguageString("STARTGAMEPANEL_TITLELABEL38GAMETITLE")
	commonButton31LoadGame.SetButtonText(TableManager.GetLanguageString("STARTGAMEPANEL_COMMONBUTTON31LOADGAME"))
	commonButton31Option.SetButtonText(TableManager.GetLanguageString("STARTGAMEPANEL_COMMONBUTTON31OPTION"))
	commonButton31ExitGame.SetButtonText(TableManager.GetLanguageString("STARTGAMEPANEL_COMMONBUTTON31EXITGAME"))
	commonLabelArchive.text = TableManager.GetLanguageString("STARTGAMEPANEL_COMMONLABELARCHIVE")
	commonButton10ArchiveClear1.SetButtonText(TableManager.GetLanguageString("STARTGAMEPANEL_ARCHIVE_CLEAR"))
	commonButton10ArchiveClear2.SetButtonText(TableManager.GetLanguageString("STARTGAMEPANEL_ARCHIVE_CLEAR"))
	commonButton10ArchiveClear3.SetButtonText(TableManager.GetLanguageString("STARTGAMEPANEL_ARCHIVE_CLEAR"))
	commonButton10ArchiveClear4.SetButtonText(TableManager.GetLanguageString("STARTGAMEPANEL_ARCHIVE_CLEAR"))
	commonLabelVersion.text = TableManager.GetLanguageString("STARTGAMEPANEL_COMMONLABELVERSION") % HQH.GetProjectVersionString()
	
	SetControlArchiveVisible(false)
	for i in SaveGameManager.SAVE_GAME_ARCHIVE_NUMBWE_MAX:
		var controlArchive_commonButton10ArchiveClear: CommonButton = self.get_node("controlArchiveClear/commonButton10ArchiveClear%s" % (i + 1))
		controlArchive_commonButton10ArchiveClear.SetButtonText(TableManager.GetLanguageString("STARTGAMEPANEL_ARCHIVE_CLEAR"))
	
	commonButton31StartGame.SetPlayAudio_Pressed_false()
	
	UpdateUI()
	
	UpdateFirstAvatarRandom()

func _process(delta: float):
	SetFirstAvatar(delta)

func UpdateUI():
	if SaveGameManager.IsContinueGame():
		# Continue game
		commonButton31StartGame.SetButtonText(TableManager.GetLanguageString("STARTGAMEPANEL_CONTINUEGAME"))
	else:
		# New game
		commonButton31StartGame.SetButtonText(TableManager.GetLanguageString("STARTGAMEPANEL_STARTGAME"))
	
	var archive_currentUsedIndex: int = SaveGameManager.GetSaveData_archive_currentUsedIndex()
	for i in SaveGameManager.SAVE_GAME_ARCHIVE_NUMBWE_MAX:
		var isEmpty: bool = SaveGameManager.GetSaveGameArchiveByIndex_IsEmpty(i)
		var controlArchive_commonButtonArchive: CommonButton = self.get_node("controlArchive/commonButtonArchive%s" % (i + 1))
		if isEmpty:
			if archive_currentUsedIndex == i:
				controlArchive_commonButtonArchive.SetButtonText("%s: %s *" % [(i + 1), TableManager.GetLanguageString("STARTGAMEPANEL_ARCHIVE_NEW_GAME")])
			else:
				controlArchive_commonButtonArchive.SetButtonText("%s: %s" % [(i + 1), TableManager.GetLanguageString("STARTGAMEPANEL_ARCHIVE_NEW_GAME")])
		else:
			var lastSaveGameDataArchiveDateTime: String = SaveGameManager.GetSaveGameArchiveByIndex_lastSaveGameDataArchiveDateTime(i)
			if archive_currentUsedIndex == i:
				controlArchive_commonButtonArchive.SetButtonText("%s: %s *" % [(i + 1), lastSaveGameDataArchiveDateTime])
			else:
				controlArchive_commonButtonArchive.SetButtonText("%s: %s" % [(i + 1), lastSaveGameDataArchiveDateTime])

func _on_commonButton31StartGame_pressed():
	UIManager.StartGamePanel_on_commonButton31StartGame_pressed(m_FirstAvatarList[m_FirstAvatarListCurrentSelectIndex].avatarTypeID, m_FirstAvatarList[m_FirstAvatarListCurrentSelectIndex].sceneTypeID)

func SetControlArchiveVisible(v: bool):
	controlArchive.visible = v
	controlArchiveClear.visible = v
	if not v:
		SetCommonButton10ArchiveClearDoubleConfirmation(false, 0)

func _on_commonButton31LoadGame_pressed():
	if controlArchive.visible:
		SetControlArchiveVisible(false)
		
		commonButton31LoadGame.release_focus()
	else:
		SetControlArchiveVisible(true)

func _on_commonButton31Option_pressed():
	UIManager.StartGamePanel_on_commonButton31Option_pressed()

func _on_commonButton31ExitGame_pressed():
	UIManager.StartGamePanel_on_commonButton31ExitGame_pressed()

func _on_commonButtonArchive1_pressed():
	HQH.Log("_on_commonButtonArchive1_pressed")
	
	UIManager.StartGamePanel_on_commonButtonArchive1_pressed(0)

func _on_commonButtonArchive2_pressed():
	HQH.Log("_on_commonButtonArchive2_pressed")
	
	UIManager.StartGamePanel_on_commonButtonArchive1_pressed(1)

func _on_commonButtonArchive3_pressed():
	HQH.Log("_on_commonButtonArchive3_pressed")
	
	UIManager.StartGamePanel_on_commonButtonArchive1_pressed(2)

func _on_commonButtonArchive4_pressed():
	HQH.Log("_on_commonButtonArchive4_pressed")
	
	UIManager.StartGamePanel_on_commonButtonArchive1_pressed(3)

func _on_commonButton10ArchiveClear1_pressed():
	HQH.Log("_on_commonButton10ArchiveClear1_pressed")
	
	UIManager.StartGamePanel_on_commonButton10ArchiveClear1_pressed(0)

func _on_commonButton10ArchiveClear2_pressed():
	HQH.Log("_on_commonButton10ArchiveClear2_pressed")
	
	UIManager.StartGamePanel_on_commonButton10ArchiveClear1_pressed(1)

func _on_commonButton10ArchiveClear3_pressed():
	HQH.Log("_on_commonButton10ArchiveClear3_pressed")
	
	UIManager.StartGamePanel_on_commonButton10ArchiveClear1_pressed(2)

func _on_commonButton10ArchiveClear4_pressed():
	HQH.Log("_on_commonButton10ArchiveClear4_pressed")
	
	UIManager.StartGamePanel_on_commonButton10ArchiveClear1_pressed(3)

func _on_commonButton10ArchiveClearDoubleConfirmation_pressed():
	UIManager.StartGamePanel_on_commonButton10ArchiveClearDoubleConfirmation_pressed()

func SetCommonButton10ArchiveClearDoubleConfirmation(v: bool, index: int):
	if v:
		commonButton10ArchiveClearDoubleConfirmation.visible = true
		commonButton10ArchiveClearDoubleConfirmation.SetButtonText(TableManager.GetLanguageString("STARTGAMEPANEL_ARCHIVE_CLEAR_DOUBLE_CONFIRMATION") % (TableManager.DISPLAY_BAG_ITEM_NAME % (index + 1)))
	else:
		commonButton10ArchiveClearDoubleConfirmation.visible = false

func UpdateFirstAvatarRandom():
	m_FirstAvatarListCurrentSelectIndex = HQH.Rand() % m_FirstAvatarList.size()
	UpdateFirstAvatar()

func UpdateFirstAvatar():
	var i: int = 0
	for iv in m_FirstAvatarList:
		if m_FirstAvatarListCurrentSelectIndex == i:
			iv.controlFirstAvatarNode.visible = true
		else:
			iv.controlFirstAvatarNode.visible = false
		
		i += 1

func _on_textureButton1_pressed():
	HQH.Log("_on_textureButton1_pressed")
	
	controlFirstAvatar_textureButton1.release_focus()
	
	m_FirstAvatarListCurrentSelectIndex += 1
	if(m_FirstAvatarList.size() <= m_FirstAvatarListCurrentSelectIndex):
		m_FirstAvatarListCurrentSelectIndex = 0
	
	UpdateFirstAvatar()

func _on_textureButton1_mouse_entered():
	HQH.Log("_on_textureButton1_mouse_entered")
	
	AudioManager.PlayByName_ButtonHover()
	for iv in m_FirstAvatarList:
		iv.controlFirstAvatarNode.ShowOutline()

func _on_textureButton1_mouse_exited():
	HQH.Log("_on_textureButton1_mouse_entered")
	for iv in m_FirstAvatarList:
		iv.controlFirstAvatarNode.HideOutline()

func SetFirstAvatar(delta: float):
	if SaveGameManager.IsContinueGame():
		# Continue game
		m_FirstAvatarList[m_FirstAvatarListCurrentSelectIndex].controlFirstAvatarNode.visible = false
	else:
		# New game
		m_FirstAvatarList[m_FirstAvatarListCurrentSelectIndex].controlFirstAvatarNode.visible = true
		
		m_SpriteToLeft_flip_h_Timer += delta
		var spriteToLeft_flip_h_TimerStep: float = 1.0
		if spriteToLeft_flip_h_TimerStep < m_SpriteToLeft_flip_h_Timer:
			m_SpriteToLeft_flip_h_Timer = 0.0
			
			m_FirstAvatarList[m_FirstAvatarListCurrentSelectIndex].controlFirstAvatarNode.SetSpriteIdleToLeft_flip_h(HQH.RandomBool())
