extends Control

onready var colorRectBG = $colorRectBG
onready var textureRect1 = $textureRect1
onready var commonLabelStarting = $commonLabelStarting

const TEXTURERECT1_PROGRESS_TIME_IN_SECONDS: float = 3.2
var m_TextureRect1_Progress_TimeHadPassed_InSeconds: float = 0.0

const COMMONLABELSTARTING_MAXLOOPNUMBER: int = 4
var m_CommonLabelStarting_CurrentLoopNumber: int = COMMONLABELSTARTING_MAXLOOPNUMBER
const COMMONLABELSTARTING_LOOPUPDATESTEPTIME_IN_SECONDS: float = 0.6
var m_CommonLabelStarting_LoopUpdateTimeHadPassed_InSeconds: float = 0.0

func _ready():
	HQH.Log("Start BootScene._ready()")
	
	colorRectBG.color = HQH.COLORPALETTE_UI.BOOTSCENE_BG_COLOR
	
	commonLabelStarting.text = ""
	
	SceneManager.BootScene_OnReady()

func _exit_tree():
	SceneManager.BootScene_OnExitTree()
	
	HQH.Log("End BootScene._exit_tree()")

func _process(delta: float):
	m_TextureRect1_Progress_TimeHadPassed_InSeconds = m_TextureRect1_Progress_TimeHadPassed_InSeconds + delta
	var textureRect1_progress: float = m_TextureRect1_Progress_TimeHadPassed_InSeconds / TEXTURERECT1_PROGRESS_TIME_IN_SECONDS
	if 1.0 >= textureRect1_progress:
		textureRect1.material.set_shader_param("progress", textureRect1_progress)
	else:
		SceneManager.BootScene_SetRunFinished()
		
		if SceneManager.GetIsInBootScene():
			m_CommonLabelStarting_LoopUpdateTimeHadPassed_InSeconds = m_CommonLabelStarting_LoopUpdateTimeHadPassed_InSeconds + delta
			if COMMONLABELSTARTING_LOOPUPDATESTEPTIME_IN_SECONDS < m_CommonLabelStarting_LoopUpdateTimeHadPassed_InSeconds:
				m_CommonLabelStarting_LoopUpdateTimeHadPassed_InSeconds = 0.0
				
				m_CommonLabelStarting_CurrentLoopNumber = m_CommonLabelStarting_CurrentLoopNumber + 1
				if COMMONLABELSTARTING_MAXLOOPNUMBER <= m_CommonLabelStarting_CurrentLoopNumber:
					m_CommonLabelStarting_CurrentLoopNumber = 0
				
				commonLabelStarting.text = TableManager.GetLanguageString("BOOTSCENE_STARTING_STRING%s" % (m_CommonLabelStarting_CurrentLoopNumber + 1))
