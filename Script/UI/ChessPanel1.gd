extends "res://Script/UI/CommonUI/CommonPanel.gd"

onready var colorRect1 = $colorRect1
onready var commonBlurBG1 = $commonBlurBG1
onready var commonLabelTargetNumber = $commonLabelTargetNumber
onready var commonLabel10TargetName = $commonLabel10TargetName

onready var control1 = $control1
onready var control1_colorRect1 = $control1/colorRect1
onready var control1_commonDiceLabel36A = $control1/commonDiceLabel36A

onready var controlResult = $controlResult
onready var controlResult_suanLaTang1 = $controlResult/suanLaTang1
onready var controlResult_titleLabel20Result = $controlResult/titleLabel20Result
onready var commonButtonContinue = $commonButtonContinue
onready var commonLabel8Continue = $commonLabel8Continue
onready var animationPlayer1 = $animationPlayer1

const UPDATETIMERSTEP_MIN: float = HQH.VIEW_PROCESS_FRAME_MIN_SECONDS_NUMBER + HQH.FLOAT_EPSILON # 0.033 # In seconds
const UPDATETIMERSTEP_MAX: float = UPDATETIMERSTEP_MIN * 10.0 # 0.33 # In seconds
var m_UpdateTimerStep: float = 0.1
var m_UpdateTimer: float = 0.0
var m_UpdateCount: int = 0
const STARTTIMERSTEP_MIN: float = 3.75 # 60 /16
const STARTTIMERSTEP_MAX: float = 10.0 # 60 / 12 * 2 
var m_StartTimerStep: float = 0.0
var m_StartTimer: float = 0.0
var m_AnimationPlayer1_IsPlaying: bool = false
var m_AnimationPlayer1_IsEnd: bool = false
var m_ResultIsWin: bool = false
const SHOW_DICE_MIN: int = 1
const SHOW_DICE_MAX: int = 20
var m_NPCShowDice: int = 0
var m_AvatarShowDice: int = 0

var m_IsInStartWait: bool = true
const STARTWAITTIMER_STEP: float = 2.5
var m_StartWaitTimer: float = 0.0

var m_ShowName: String = ""

func _ready():
	UIManager.DownPanel_AddJournalRecord(TableManager.GetLanguageString("DICE_STARTED") % SHOW_DICE_MAX)
	
	colorRect1.color = HQH.COLORPALETTE_UI.COLOR_BG_CHESSPANEL
	commonBlurBG1.material = commonBlurBG1.material.duplicate(true)
	commonBlurBG1.material.set_shader_param("amount", 5.0)
	controlResult.visible = false
	commonButtonContinue.visible = false
	commonButtonContinue.SetButtonText(TableManager.GetLanguageString("CHESSPANEL1_COMMONBUTTONCONTINUE"))
	commonLabel8Continue.visible = false
	commonLabel8Continue.text = TableManager.GetLanguageString("CHESSPANEL1_MOUSECLICKCONTINUE")
	SetWordColor(HQH.RandomBool())
	
	# Set m_UpdateTimerStep
	m_UpdateTimerStep = HQH.RandomModRangeFloat(UPDATETIMERSTEP_MIN, UPDATETIMERSTEP_MAX)
	m_UpdateTimer = m_UpdateTimerStep
	
	m_StartTimerStep = HQH.RandomModRangeFloat(STARTTIMERSTEP_MIN, STARTTIMERSTEP_MAX)
	
	var panelData: Dictionary = UIManager.ChessPanel1_GetPanelData()
	var isShowRealDice: bool = false
	if 0 == panelData.successRateIntDenominator:
		# Avatar failure
		if isShowRealDice:
			m_NPCShowDice = SHOW_DICE_MAX
		else:
			m_NPCShowDice = HQH.RandomModRange(SHOW_DICE_MAX / 2, SHOW_DICE_MAX)
	elif panelData.successRateIntDenominator == panelData.successRateIntNumerator:
		# Avatar success
		if isShowRealDice:
			m_NPCShowDice = SHOW_DICE_MIN
		else:
			m_NPCShowDice = HQH.RandomModRange(SHOW_DICE_MIN, SHOW_DICE_MAX / 2)
	else:
		if isShowRealDice:
			m_NPCShowDice = SHOW_DICE_MAX * (panelData.successRateIntDenominator - panelData.successRateIntNumerator) / panelData.successRateIntDenominator
			m_NPCShowDice = int(clamp(m_NPCShowDice, SHOW_DICE_MIN + 1, SHOW_DICE_MAX - 1))
		else:
			m_NPCShowDice = HQH.RandomModRange(SHOW_DICE_MIN + 1, SHOW_DICE_MAX - 1)
	
	HQH.CheckGreaterThanOrEqualToMinNumber("m_NPCShowDice", SHOW_DICE_MIN, m_NPCShowDice)
	HQH.CheckLessThanOrEqualToMaxNumber("m_NPCShowDice", SHOW_DICE_MAX, m_NPCShowDice)
	commonLabelTargetNumber.text = ""
	
	control1_commonDiceLabel36A.text = String(SHOW_DICE_MAX)
	
	var showJustName: String = ""
	if TableManager.NPC_TRIGGER_TYPE.NPC_AVATAR == panelData.npcTriggerType:
		var nPCTriggerInfo: Dictionary = TableManager.GetNPCTriggerInfo(panelData.npcTriggerTypeID)
		var avatarTypeID: int = SaveGameManager.GetSwallowPopAssignAvatarTypeID(nPCTriggerInfo.avatarTypeID)
		m_ShowName = UIManager.GetAvatarShowNameWithColor(avatarTypeID)
		showJustName = TableManager.GetAvatarShowName(avatarTypeID)
	else: # TableManager.NPC_TRIGGER_TYPE.NPC_ARTICLE
		var nPCArticleTriggerInfo: Dictionary = TableManager.GetNPCArticleTriggerInfo(panelData.npcTriggerTypeID)
		m_ShowName = TableManager.GetLanguageString(nPCArticleTriggerInfo.showNameKey)
		showJustName = m_ShowName
	
	commonLabel10TargetName.text = showJustName

func _process(delta: float):
	if m_IsInStartWait:
		m_StartWaitTimer += delta
		if STARTWAITTIMER_STEP < m_StartWaitTimer:
			m_IsInStartWait = false
			
			commonLabelTargetNumber.text = String(m_NPCShowDice)
			UIManager.DownPanel_AddJournalRecord(TableManager.GetLanguageString("CHESSPANEL1_POINTS") % [TableManager.AVATAR_PLAY_CHESS_POINTS_SHOW_NAME % m_ShowName, m_NPCShowDice])
		
		return
	
	if m_AnimationPlayer1_IsPlaying:
		return
	
	m_StartTimer += delta
	if (0 < m_UpdateCount) and (m_StartTimerStep < m_StartTimer):
		# Dice end
		animationPlayer1.play("ShowResult")
		m_AnimationPlayer1_IsPlaying = true
		
		SetControlResult()
		
		return
	
	m_UpdateTimer += delta
	if m_UpdateTimerStep < m_UpdateTimer:
		m_UpdateTimer = 0.0
		
		var control1_rect_position_x_Direction: int = 1
		if HQH.RandomBool():
			control1_rect_position_x_Direction = -1
		
		var control1_rect_position_y_Direction: int = 1
		if HQH.RandomBool():
			control1_rect_position_y_Direction = -1
		
		control1.rect_position.x = (self.rect_size.x * 0.5) + (control1_rect_position_x_Direction * HQH.RandomD10())
		control1.rect_position.y = (self.rect_size.y * 0.5) + (control1_rect_position_y_Direction * HQH.RandomD10())
		
		var panelData: Dictionary = UIManager.ChessPanel1_GetPanelData()
		var npcPower: int = HQH.RandomModRange(panelData.finalNPCPowerMin, panelData.finalNPCPowerMax)
		var avatarPower: int = HQH.RandomModRange(panelData.avatarPowerMin, panelData.avatarPowerMax)
		m_ResultIsWin = (npcPower <= avatarPower)
		if HQH.IS_DEBUG:
			var playChessDebugData: Dictionary = DebugManager.GetPlayChessDebugData()
			if playChessDebugData.isDebugResult:
				HQH.Log("PlayChess, DebugResult, playChessDebugData.isSuccess: %s" % playChessDebugData.isSuccess)
				if playChessDebugData.isSuccess:
					m_ResultIsWin = true
				else:
					m_ResultIsWin = false
		
		if m_ResultIsWin:
			m_AvatarShowDice = HQH.RandomModRange(m_NPCShowDice, SHOW_DICE_MAX)
		else:
			m_AvatarShowDice = HQH.RandomModRange(SHOW_DICE_MIN, int(max(SHOW_DICE_MIN, m_NPCShowDice - 1)))
		
		HQH.CheckGreaterThanOrEqualToMinNumber("m_AvatarShowDice", SHOW_DICE_MIN, m_AvatarShowDice)
		HQH.CheckLessThanOrEqualToMaxNumber("m_AvatarShowDice", SHOW_DICE_MAX, m_AvatarShowDice)
		control1_commonDiceLabel36A.text = String(m_AvatarShowDice)
		
		SetWordColor(0 == (m_UpdateCount % 2))
		
		m_UpdateCount += 1
		AudioManager.PlayByName_PlayChessDiceChange()

func SetWordColor(isWhiteWord: bool):
	if isWhiteWord:
		control1_colorRect1.color = HQH.COLORPALETTE_UI.FONT_COLOR4
		control1_commonDiceLabel36A.SetColor(HQH.COLORPALETTE_UI.FONT_COLOR1)
	else:
		control1_colorRect1.color = HQH.COLORPALETTE_UI.FONT_COLOR1
		control1_commonDiceLabel36A.SetColor(HQH.COLORPALETTE_UI.FONT_COLOR4)

func _input(event: InputEvent):
	if SceneManager.GetIsInBootScene():
		return
	
	if SceneManager.GetIsBeginChangeToScene():
		return
	
	if m_AnimationPlayer1_IsEnd:
		if event.is_action_pressed("focus_click") or event.is_action_pressed("ui_accept"):
			UIManager.ChessPanel1_Terminate()
			AudioManager.PlayByName_ButtonPressed()

func SetControlResult():
	UIManager.DownPanel_AddJournalRecord(TableManager.GetLanguageString("CHESSPANEL1_POINTS") % [TableManager.AVATAR_PLAY_CHESS_POINTS_SHOW_NAME % UIManager.GetCurrentActiveAvatarShowNameWithColor(), m_AvatarShowDice])
	
	control1.rect_position.x = self.rect_size.x * 0.5
	control1.rect_position.y = self.rect_size.y * 0.5
	
#	controlResult.visible = true
#	commonButtonContinue.visible = true
#	commonLabel8Continue.visible = true
	commonButtonContinue.grab_focus()
	
	if m_ResultIsWin:
		controlResult_titleLabel20Result.text = TableManager.GetLanguageString("CHESSPANEL1_PLAYCHESS_SUCCESS")
	else:
		controlResult_titleLabel20Result.text = TableManager.GetLanguageString("CHESSPANEL1_PLAYCHESS_FAILURE")
	
	SetControlResult_suanLaTang1(m_ResultIsWin)

func SetControlResult_suanLaTang1(isWin: bool):
	# Set controlResult_suanLaTang1
	controlResult_suanLaTang1.tileSize = Vector2(60.0, 60.0)
	controlResult_suanLaTang1.offsetFactor = Vector2(20.0, 20.0)
	
	if isWin:
		# Win
		controlResult_suanLaTang1.isCircle = false
		controlResult_suanLaTang1.waterColor = HQH.COLORPALETTE_SCENE.COLOR_WATER
		controlResult_suanLaTang1.water2Color = HQH.COLORPALETTE_SCENE.COLOR_WATER2
		controlResult_suanLaTang1.foamColor = HQH.COLORPALETTE_SCENE.COLOR_WATER_FOAM
		controlResult_suanLaTang1.directionX = 1
	else:
		# Lost
		controlResult_suanLaTang1.isCircle = true
		controlResult_suanLaTang1.waterColor = HQH.COLORPALETTE_SCENE.COLOR_RED_WATER
		controlResult_suanLaTang1.water2Color = HQH.COLORPALETTE_SCENE.COLOR_RED_WATER2
		controlResult_suanLaTang1.foamColor = HQH.COLORPALETTE_SCENE.COLOR_RED_WATER_FOAM
		controlResult_suanLaTang1.directionX = -1
	
	controlResult_suanLaTang1.SetWater()

func _on_commonButtonContinue_pressed():
	UIManager.ChessPanel1_on_commonButtonContinue_pressed()

func GetAnimationPlayer1_IsEnd() -> bool:
	return m_AnimationPlayer1_IsEnd

func SetAnimationPlayer1_IsEndTrue():
	m_AnimationPlayer1_IsEnd = true
	
	var resultString: String = ""
	if m_ResultIsWin:
		AudioManager.PlayByName_PlayChessSuccess()
		
		resultString = TableManager.GetLanguageString("CHESSPANEL1_PLAYCHESS_SUCCESS")
	else:
		AudioManager.PlayByName_PlayChessFailure()
		
		resultString = TableManager.GetLanguageString("CHESSPANEL1_PLAYCHESS_FAILURE")
	
	UIManager.AddPlayChessCountListString(m_ResultIsWin)
	var resultCountString: String = UIManager.GetPlayChessCountListString()
	UIManager.DownPanel_AddJournalRecord(resultCountString + resultString)
	
	UIManager.ChessPanel1_End(m_ResultIsWin)
