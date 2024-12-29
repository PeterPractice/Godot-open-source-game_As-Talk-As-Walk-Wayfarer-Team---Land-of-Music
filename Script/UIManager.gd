extends Node

const PROGRESS_MIN_VALUE_0: float = 0.0
const PROGRESS_MAX_VALUE_100: float = 100.0

const BUTTON_PRESSED_TRUE_COUNT_STEP: int = 1

const WRANGLEDIALOG_NUMBER_MAX: int = 7

const COMMONBUTTON_STYLE: Dictionary = {
	"STYLEBOXFLAT_NORMAL_BG_COLOR": HQH.COLORPALETTE_UI.COLOR_BG1,
	"STYLEBOXFLAT_NORMAL_BORDER_WIDTH": 3,
	"STYLEBOXFLAT_NORMAL_BORDER_COLOR": HQH.COLORPALETTE_UI.COLOR_BG2,
	"STYLEBOXFLAT_NORMAL_CORNER_RADIUS": 5,
	"STYLEBOXFLAT_HOVER_BG_COLOR": HQH.COLORPALETTE_UI.COLOR_BG2,
	"STYLEBOXFLAT_HOVER_BORDER_WIDTH": 3,
	"STYLEBOXFLAT_HOVER_BORDER_COLOR": HQH.COLORPALETTE_UI.COLOR_BG1,
	"STYLEBOXFLAT_HOVER_CORNER_RADIUS": 5,
	"STYLEBOXFLAT_PRESSED_BG_COLOR": HQH.COLORPALETTE_UI.COLOR_BG3,
	"STYLEBOXFLAT_PRESSED_BORDER_WIDTH": 5,
	"STYLEBOXFLAT_PRESSED_BORDER_COLOR": HQH.COLORPALETTE_UI.COLOR_BG3,
	"STYLEBOXFLAT_PRESSED_CORNER_RADIUS": 1,
	"STYLEBOXFLAT_FOCUS_BG_COLOR": HQH.COLORPALETTE_UI.COLOR_BG4_TRANSLUCENCE,
	"STYLEBOXFLAT_FOCUS_BG_COLOR3": HQH.COLORPALETTE_UI.COLOR_BG4_3,
	"STYLEBOXFLAT_FOCUS_BORDER_WIDTH": 3,
	"STYLEBOXFLAT_FOCUS_BORDER_COLOR": HQH.COLORPALETTE_UI.COLOR_BG4_TRANSLUCENCE,
	"STYLEBOXFLAT_FOCUS_BORDER_COLOR3": HQH.COLORPALETTE_UI.COLOR_BG4_3,
	"STYLEBOXFLAT_FOCUS_CORNER_RADIUS": 5,
	"FONT_COLOR": HQH.COLORPALETTE_UI.FONT_COLOR1,
	"FONT_COLOR_HOVER": HQH.COLORPALETTE_UI.FONT_COLOR3,
	"FONT_COLOR_PRESSED": HQH.COLORPALETTE_UI.FONT_COLOR2,
}
const COMMONOPTIONBUTTON_STYLE: Dictionary = COMMONBUTTON_STYLE
const COMMONCHECKBOX_STYLE: Dictionary = COMMONBUTTON_STYLE
const COMMONHSLIDER_STYLE: Dictionary = COMMONBUTTON_STYLE

const COMMONPROGRESSBAR_STYLE: Dictionary = {
	"STYLEBOXFLAT_NORMAL_BG_COLOR": HQH.COLORPALETTE_UI.COLOR_BG1,
	"STYLEBOXFLAT_NORMAL_BORDER_WIDTH": 3,
	"STYLEBOXFLAT_NORMAL_BORDER_COLOR": HQH.COLORPALETTE_UI.COLOR_BG2,
	"STYLEBOXFLAT_NORMAL_CORNER_RADIUS": 5,
	"STYLEBOXFLAT_NORMAL_FG_COLOR1": HQH.COLORPALETTE_UI.COLOR_BG4,
	"STYLEBOXFLAT_NORMAL_FG_COLOR2": HQH.COLORPALETTE_UI.COLOR_BG2,
	"STYLEBOXFLAT_NORMAL_FG_COLOR3": HQH.COLORPALETTE_UI.COLOR_BG3,
	"STYLEBOXFLAT_NORMAL_FG_COLOR_HP": HQH.COLORPALETTE_UI.COLOR_HP,
	"STYLEBOXFLAT_NORMAL_FG_COLOR_MP": HQH.COLORPALETTE_UI.COLOR_MP,
	"STYLEBOXFLAT_NORMAL_FG_COLOR_EP": HQH.COLORPALETTE_UI.COLOR_EP,
	"FONT_COLOR_TRANSPARENT": HQH.COLORPALETTE_UI.COLOR_TRANSPARENT,
	"FONT_COLOR": HQH.COLORPALETTE_UI.FONT_COLOR1,
}

const COMMONITEMLIST_STYLE: Dictionary = {
	"STYLEBOXFLAT_SELECTED_FOCUS_BG_COLOR": HQH.COLORPALETTE_UI.COLOR_BG1,
	"STYLEBOXFLAT_SELECTED_FOCUS_BORDER_WIDTH": 1,
	"STYLEBOXFLAT_SELECTED_FOCUS_BORDER_COLOR": HQH.COLORPALETTE_UI.COLOR_BG4,
	"STYLEBOXFLAT_SELECTED_FOCUS_CORNER_RADIUS": 3,
	"STYLEBOXFLAT_BG_BG_COLOR": HQH.COLORPALETTE_UI.COLOR_BG2,
	"STYLEBOXFLAT_BG_BORDER_WIDTH": 0.1,
	"STYLEBOXFLAT_BG_BORDER_COLOR": HQH.COLORPALETTE_UI.COLOR_BG1,
	"STYLEBOXFLAT_BG_CORNER_RADIUS": 5,
	"FONT_COLOR": HQH.COLORPALETTE_UI.FONT_COLOR1,
	"FONT_COLOR_SELECTED": HQH.COLORPALETTE_UI.FONT_COLOR3,
}

const COMMONSCROLL_STYLE: Dictionary = {
	"STYLEBOXFLAT_GRABBER_BG_COLOR": HQH.COLORPALETTE_UI.COLOR_BG7,
	"STYLEBOXFLAT_GRABBER_BORDER_WIDTH": 0,
	"STYLEBOXFLAT_GRABBER_BORDER_COLOR": HQH.COLORPALETTE_UI.COLOR_BG7,
	"STYLEBOXFLAT_GRABBER_CORNER_RADIUS": 3,
	"STYLEBOXFLAT_GRABBER_HIGHLIGHT_BG_COLOR": HQH.COLORPALETTE_UI.COLOR_BG4,
	"STYLEBOXFLAT_GRABBER_HIGHLIGHT_BORDER_WIDTH": 0,
	"STYLEBOXFLAT_GRABBER_HIGHLIGHT_BORDER_COLOR": HQH.COLORPALETTE_UI.COLOR_BG4,
	"STYLEBOXFLAT_GRABBER_HIGHLIGHT_CORNER_RADIUS": 3,
	"STYLEBOXFLAT_GRABBER_PRESSED_BG_COLOR": HQH.COLORPALETTE_UI.COLOR_BG3,
	"STYLEBOXFLAT_GRABBER_PRESSED_BORDER_WIDTH": 0,
	"STYLEBOXFLAT_GRABBER_PRESSED_BORDER_COLOR": HQH.COLORPALETTE_UI.COLOR_BG3,
	"STYLEBOXFLAT_GRABBER_PRESSED_CORNER_RADIUS": 3,
	"STYLEBOXFLAT_SCROLL_BG_COLOR": HQH.COLORPALETTE_UI.COLOR_BG2,
	"STYLEBOXFLAT_SCROLL_BORDER_WIDTH": 4,
	"STYLEBOXFLAT_SCROLL_BORDER_COLOR": HQH.COLORPALETTE_UI.COLOR_BG1,
	"STYLEBOXFLAT_SCROLL_CORNER_RADIUS": 1,
}

const COMMONBG1_STYLE: Dictionary = {
	"STYLEBOXFLAT_PANEL_BG_COLOR": HQH.COLORPALETTE_UI.COLOR_BG5,
	"STYLEBOXFLAT_PANEL_BORDER_WIDTH": 3,
	"STYLEBOXFLAT_PANEL_BORDER_COLOR": HQH.COLORPALETTE_UI.COLOR_BG6,
	"STYLEBOXFLAT_PANEL_CORNER_RADIUS": 5,
}

const COMMONBG2_STYLE: Dictionary = {
	"STYLEBOXFLAT_PANEL_BG_COLOR": HQH.COLORPALETTE_UI.COLOR_BG6,
	"STYLEBOXFLAT_PANEL_BORDER_WIDTH": 3,
	"STYLEBOXFLAT_PANEL_BORDER_COLOR": HQH.COLORPALETTE_UI.COLOR_BG5,
	"STYLEBOXFLAT_PANEL_CORNER_RADIUS": 5,
}

const COMMONPURECOLORBG1_STYLE: Dictionary = {
	"STYLEBOXFLAT_PANEL_BG_COLOR": HQH.COLORPALETTE_UI.COLOR_BG5,
	"STYLEBOXFLAT_PANEL_BORDER_WIDTH": 3,
	"STYLEBOXFLAT_PANEL_BORDER_COLOR": HQH.COLORPALETTE_UI.COLOR_BG5,
	"STYLEBOXFLAT_PANEL_CORNER_RADIUS": 5,
}

const COMMONPURECOLORBG2_STYLE: Dictionary = {
	"STYLEBOXFLAT_PANEL_BG_COLOR": HQH.COLORPALETTE_UI.COLOR_BG6,
	"STYLEBOXFLAT_PANEL_BORDER_WIDTH": 3,
	"STYLEBOXFLAT_PANEL_BORDER_COLOR": HQH.COLORPALETTE_UI.COLOR_BG6,
	"STYLEBOXFLAT_PANEL_CORNER_RADIUS": 5,
}

const COMMONHSEPARATOR_STYLE: Dictionary = {
	"STYLEBOXLINE_SEPARATOR_COLOR": HQH.COLORPALETTE_UI.FONT_COLOR2,
	"STYLEBOXLINE_SEPARATOR_THICKNESS": 2,
}

const COMMONLINKBUTTON_STYLE: Dictionary = {
	"FONT_COLOR": HQH.COLORPALETTE_UI.FONT_COLOR1,
	"FONT_COLOR_HOVER": HQH.COLORPALETTE_UI.FONT_COLOR5,
	"FONT_COLOR_PRESSED": HQH.COLORPALETTE_UI.FONT_COLOR2,
}

const PANEL_INFO: Dictionary = {
	"preloadResource": null,
	"panelInstance": null,
	"panelData": null,
}
var m_DebugMenuPanelInfo = PANEL_INFO.duplicate()
var m_DebugInfoPanelInfo = PANEL_INFO.duplicate()
var m_StartGamePanelInfo = PANEL_INFO.duplicate()
var m_LoadingScenePanelInfo = PANEL_INFO.duplicate()
var m_LanguagePanelInfo = PANEL_INFO.duplicate()
var m_OptionPanelInfo = PANEL_INFO.duplicate()
var m_DownPanelInfo = PANEL_INFO.duplicate()
var m_TeamPanelInfo = PANEL_INFO.duplicate()
var m_DayNightPanelInfo = PANEL_INFO.duplicate()
var m_UpNamePanelInfo = PANEL_INFO.duplicate()
var m_RightSettingPanelInfo = PANEL_INFO.duplicate()
var m_JournalRecordPanelInfo = PANEL_INFO.duplicate()
var m_ChessPanel4Info = PANEL_INFO.duplicate()
var m_ChessPanel1Info = PANEL_INFO.duplicate()

const LANGUAGE_PANEL_1DATA_INFO: Dictionary = {
	"selectIndex": -1,
}
var LANGUAGE_PANEL_DATA_INFO: Dictionary = {
	"initData": {},
	"currentData": LANGUAGE_PANEL_1DATA_INFO.duplicate(true),
}

const VIDEORESOLUTIONRATIOID_1280X720: int = 2
const VIDEORESOLUTIONRATIOID_1920X1080: int = 3
const OPTION_PANEL_DATA_TABLE_INFO: Dictionary = {
	"videoResolutionRatioList": [
		{"videoResolutionRatioID": VIDEORESOLUTIONRATIOID_1280X720, 	"videoResolutionRatio": {"width": 1280, "height": 720}, 	"showkey": "OPTIONPANEL_COMMONLABELVIDEORESOLUTIONRATIO_2"},
		{"videoResolutionRatioID": VIDEORESOLUTIONRATIOID_1920X1080, 	"videoResolutionRatio": {"width": 1920, "height": 1080}, 	"showkey": "OPTIONPANEL_COMMONLABELVIDEORESOLUTIONRATIO_3"},
	],
}
var OPTION_PANEL_1DATA_INFO: Dictionary = {
	"videoInfo": {
		"videoResolutionRatioListSelectIndex": -1,
		"windowIsFullScreen": HQH.WINDOW_IS_FULL_SCREEN_DEFAULT,
		"windowIsWindowStretch": HQH.WINDOW_IS_WINDOW_STRETCH_DEFAULT,
	},
	"audioInfo": {
		"musicIsMute": HQH.MUSIC_IS_MUTE_DEFAULT,
		"lastMusicValue": 0,
		"musicValue": 0,
		"soundEffectIsMute": HQH.SOUND_EFFECT_IS_MUTE_DEFAULT,
		"lastSoundEffectValue": 0,
		"soundEffectValue": 0,
	},
}
var OPTION_PANEL_DEFAULT_DATA_INFO: Dictionary = {
	"videoInfo": {
		"videoResolutionRatioID": HQH.VIDEO_RESOLUTION_RATIO_ID_DEFAULT,
		"windowIsFullScreen": HQH.WINDOW_IS_FULL_SCREEN_DEFAULT,
		"windowIsWindowStretch": HQH.WINDOW_IS_WINDOW_STRETCH_DEFAULT,
	},
	"audioInfo": {
		"musicIsMute": HQH.MUSIC_IS_MUTE_DEFAULT,
		"musicValue": HQH.MUSIC_VALUE_DEFAULT,
		"soundEffectIsMute": HQH.SOUND_EFFECT_IS_MUTE_DEFAULT,
		"soundEffectValue": HQH.SOUND_EFFECT_VALUE_DEFAULT,
	},
}
var OPTION_PANEL_DATA_INFO: Dictionary = {
	"initData": {},
	"currentData": OPTION_PANEL_1DATA_INFO.duplicate(true),
}

const UI_INPUT_ACTION_EVENT_TYPE: Dictionary = {
	"COMMONRICHTEXTLABEL_META_CLICKED_EVENT1_COMMONRICHTEXTLABEL1": "COMMONRICHTEXTLABEL_META_CLICKED_EVENT1_COMMONRICHTEXTLABEL1",
	"COMMONRICHTEXTLABEL_META_CLICKED_EVENT2_COMMONRICHTEXTLABEL1": "COMMONRICHTEXTLABEL_META_CLICKED_EVENT2_COMMONRICHTEXTLABEL1",
	"COMMONBUTTONITEM_TEXTUREBUTTON1_PRESSED_EVENT1": "COMMONBUTTONITEM_TEXTUREBUTTON1_PRESSED_EVENT1",
	"COMMONBUTTONITEM_TEXTUREBUTTON1_PRESSED_EVENT2": "COMMONBUTTONITEM_TEXTUREBUTTON1_PRESSED_EVENT2",
	"COMMONBUTTONITEM_TEXTUREBUTTON1_PRESSED_EVENT3": "COMMONBUTTONITEM_TEXTUREBUTTON1_PRESSED_EVENT3",
	"COMMONBUTTONITEM_TEXTUREBUTTON1_PRESSED_EVENT4": "COMMONBUTTONITEM_TEXTUREBUTTON1_PRESSED_EVENT4",
	"COMMONBUTTONITEM_TEXTUREBUTTON1_PRESSED_EVENT5": "COMMONBUTTONITEM_TEXTUREBUTTON1_PRESSED_EVENT5",
	"COMMONBUTTONITEM_TEXTUREBUTTON1_PRESSED_EVENT6": "COMMONBUTTONITEM_TEXTUREBUTTON1_PRESSED_EVENT6",
	"COMMONBUTTONITEM_TEXTUREBUTTON1_PRESSED_EVENT7": "COMMONBUTTONITEM_TEXTUREBUTTON1_PRESSED_EVENT7",
	"COMMONBUTTONITEM_TEXTUREBUTTON1_PRESSED_EVENT8": "COMMONBUTTONITEM_TEXTUREBUTTON1_PRESSED_EVENT8",
	"COMMONBUTTONITEM_TEXTUREBUTTON1_PRESSED_EVENT9": "COMMONBUTTONITEM_TEXTUREBUTTON1_PRESSED_EVENT9",
	"COMMONBUTTONITEM_TEXTUREBUTTON1_PRESSED_EVENT10": "COMMONBUTTONITEM_TEXTUREBUTTON1_PRESSED_EVENT10",
	"COMMONBUTTONBUFF_TEXTUREBUTTON1_PRESSED_EVENT1": "COMMONBUTTONBUFF_TEXTUREBUTTON1_PRESSED_EVENT1",
	"COMMONBUTTONBUFF_TEXTUREBUTTON1_PRESSED_EVENT2": "COMMONBUTTONBUFF_TEXTUREBUTTON1_PRESSED_EVENT2",
	"COMMONBUTTONBUFF_TEXTUREBUTTON1_PRESSED_EVENT3": "COMMONBUTTONBUFF_TEXTUREBUTTON1_PRESSED_EVENT3",
	"COMMONBUTTONBUFF_TEXTUREBUTTON1_PRESSED_EVENT4": "COMMONBUTTONBUFF_TEXTUREBUTTON1_PRESSED_EVENT4",
	"COMMONBUTTONBUFF_TEXTUREBUTTON1_PRESSED_EVENT5": "COMMONBUTTONBUFF_TEXTUREBUTTON1_PRESSED_EVENT5",
	"COMMONBUTTONBUFF_TEXTUREBUTTON1_PRESSED_EVENT6": "COMMONBUTTONBUFF_TEXTUREBUTTON1_PRESSED_EVENT6",
	"COMMONBUTTONBUFF_TEXTUREBUTTON1_PRESSED_EVENT7": "COMMONBUTTONBUFF_TEXTUREBUTTON1_PRESSED_EVENT7",
	"COMMONBUTTONBUFF_TEXTUREBUTTON1_PRESSED_EVENT8": "COMMONBUTTONBUFF_TEXTUREBUTTON1_PRESSED_EVENT8",
	"COMMONBUTTONBUFF_TEXTUREBUTTON1_PRESSED_EVENT9": "COMMONBUTTONBUFF_TEXTUREBUTTON1_PRESSED_EVENT9",
	"COMMONBUTTONBUFF_TEXTUREBUTTON1_PRESSED_EVENT10": "COMMONBUTTONBUFF_TEXTUREBUTTON1_PRESSED_EVENT10",
	"COMMONBUTTONBUFF_TEXTUREBUTTON1_PRESSED_EVENT11": "COMMONBUTTONBUFF_TEXTUREBUTTON1_PRESSED_EVENT11",
	"COMMONBUTTONBUFF_TEXTUREBUTTON1_PRESSED_EVENT12": "COMMONBUTTONBUFF_TEXTUREBUTTON1_PRESSED_EVENT12",
	"COMMONBUTTONBUFF_TEXTUREBUTTON1_PRESSED_EVENT13": "COMMONBUTTONBUFF_TEXTUREBUTTON1_PRESSED_EVENT13",
	"COMMONBUTTONBUFF_TEXTUREBUTTON1_PRESSED_EVENT14": "COMMONBUTTONBUFF_TEXTUREBUTTON1_PRESSED_EVENT14",
	"COMMONBUTTONBUFF_TEXTUREBUTTON1_PRESSED_EVENT15": "COMMONBUTTONBUFF_TEXTUREBUTTON1_PRESSED_EVENT15",
	"COMMONBUTTONBUFF_TEXTUREBUTTON1_PRESSED_EVENT16": "COMMONBUTTONBUFF_TEXTUREBUTTON1_PRESSED_EVENT16",
	"COMMONBUTTONBUFF_TEXTUREBUTTON1_PRESSED_EVENT17": "COMMONBUTTONBUFF_TEXTUREBUTTON1_PRESSED_EVENT17",
	"COMMONBUTTONBUFF_TEXTUREBUTTON1_PRESSED_EVENT18": "COMMONBUTTONBUFF_TEXTUREBUTTON1_PRESSED_EVENT18",
	"COMMONBUTTONBUFF_TEXTUREBUTTON1_PRESSED_EVENT19": "COMMONBUTTONBUFF_TEXTUREBUTTON1_PRESSED_EVENT19",
	"COMMONBUTTONBUFF_TEXTUREBUTTON1_PRESSED_EVENT20": "COMMONBUTTONBUFF_TEXTUREBUTTON1_PRESSED_EVENT20",
	"COMMONBUTTONBUFF_TEXTUREBUTTON1_PRESSED_EVENT21": "COMMONBUTTONBUFF_TEXTUREBUTTON1_PRESSED_EVENT21",
	"EVENT_BAG": "EVENT_BAG",
	"EVENT_JOURNALRECORDBOOK": "EVENT_JOURNALRECORDBOOK",
	"EVENT_GOODS": "EVENT_GOODS",
	"EVENT_AVATAR": "EVENT_AVATAR",
}

enum JOURNALRECORD_PANEL_PAGING_TYPE {
	JOURNALRECORD_PANEL_PAGING_NONE = -1,
	
	JOURNALRECORD_PANEL_PAGING_BEGIN = 0,
	JOURNALRECORD_PANEL_PAGING_AVATAR = 0,
	JOURNALRECORD_PANEL_PAGING_BAG,
	JOURNALRECORD_PANEL_PAGING_SCENE,
	JOURNALRECORD_PANEL_PAGING_TASK,
	
	JOURNALRECORD_PANEL_PAGING_END,
}
const JOURNALRECORD_PANEL_PAGING_DATA_INFO: Dictionary = {
	"pagingType": JOURNALRECORD_PANEL_PAGING_TYPE.JOURNALRECORD_PANEL_PAGING_NONE,
	"typeID": 0,
}
const JOURNALRECORD_PANEL_PAGENUMBERLEFTMIN: int = 1
const JOURNALRECORD_PANEL_PAGESTEP: int = 2
var JOURNALRECORD_PANEL_DATA_INFO: Dictionary = {
	"pagingAvatarList": [], 	# pageNumber is always even number
	"pagingBagList": [], 		# pageNumber is always even number
	"pagingDataList": [], 		# list of JOURNALRECORD_PANEL_PAGING_DATA_INFO
	"pageNumberLeftMax": JOURNALRECORD_PANEL_PAGENUMBERLEFTMIN,	# pageNumberLeftMax is odd number
	"pageNumberLeft": JOURNALRECORD_PANEL_PAGENUMBERLEFTMIN,	# pageNumberLeft is odd number, and pageNumberRight is pageNumberLeft + 1
	"pageAssign": JOURNALRECORD_PANEL_PAGING_DATA_INFO.duplicate(true),
}

const DOWN_PANEL_BAG_FIRST_LINE_NUMBER: int = 1
const DOWN_PANEL_BAG_1LINE_NUMBER: int = 4
const DOWN_PANEL_BAG_NUMBER_MAX: int = DOWN_PANEL_BAG_FIRST_LINE_NUMBER + (DOWN_PANEL_BAG_1LINE_NUMBER * 6) # 25
const DOWN_PANEL_BAG_1DATA_INFO: Dictionary = {
	"isValidBag": false,
	"bagResourceName": "",
	"bagNumber": 0,
	"bagCDStartTimeInMilliseconds": 0,
	"bagCDLengthTimeInMilliseconds": 0,
	"goodsTypeID": 0
}
var WRANGLE_DIALOG_INFO: Dictionary = {
	"initWrangleDialogTypeID": 0,
	"currentWrangleDialogTypeID": 0,
}
var DOWN_PANEL_INTERACTION_INFO: Dictionary = {
	"isInInteraction": false,
	"npcTriggerType": TableManager.NPC_TRIGGER_TYPE.NONE,
	"npcTriggerTypeID": 0,
	"wrangleDialogInfo": WRANGLE_DIALOG_INFO.duplicate(true),
	"interactionNPC": null,
}
var DOWN_PANEL_DATA_INFO: Dictionary = {
	"bagData": [],				# Array of DOWN_PANEL_BAG_1DATA_INFO
	"bagButtonListCurrentSelectIndex_Discard": -1,
	"interactionInfo": DOWN_PANEL_INTERACTION_INFO.duplicate(true),
}

const TEAM_PANEL_ITEM_NUMBER_MAX: int = AvatarManager.AVATAR_FOLLOW_NUMBER_MAX # 10
const TEAM_PANEL_ITEM_1DATA_INFO: Dictionary = {
	"isValidItem": false,
	"itemResourceName": "",
	"itemInputKeyLetter": "",
	"itemNumber": 0,
	"itemCDStartTimeInMilliseconds": 0,
	"itemCDLengthTimeInMilliseconds": 0,
	"typeID": 0,
}
const TEAM_PANEL_DATA_INFO: Dictionary = {
	"itemData": [],				# Array of TEAM_PANEL_ITEM_1DATA_INFO
}

const START_GAME_PANEL_DATA_INFO: Dictionary = {
	"clearSaveGameArchiveIndex": -1,
}

const LOADING_SCENE_PANEL_DATA_INFO: Dictionary = {
}

const DAYTIMEDURATIONTIMEINSECONDS_DEFAULT: float = 3.0
const DAY_NIGHT_PANEL_DATA_INFO: Dictionary = {
	"isCurrentDayTime": true,	#  true: daytime. false: night.
	"daytimeDurationTimeInSeconds": DAYTIMEDURATIONTIMEINSECONDS_DEFAULT,
	"nightDurationTimeInSeconds": 10.0,
}

const UPNAMEPANEL_SHOWMIDDLESTRING_ANIMATIONLENGTHINSECONDS: float = 10.0
const UP_NAME_PANEL_DATA_INFO: Dictionary = {
	"tipsIDList": [],
}

const RIGHT_SETTING_PANEL_DATA_INFO: Dictionary = {
}

var CHESS_PANEL_4_DATA_INFO: Dictionary = {
	"isInPlayChess": false,
	"npcTriggerType": TableManager.NPC_TRIGGER_TYPE.NONE,
	"npcTriggerTypeID": 0,
	"npcPowerMin": 0,
	"npcPowerMax": 0,
}

var CHESS_PANEL_1_END_RESULT_INFO: Dictionary = {
	"wrangleDialogInfo": WRANGLE_DIALOG_INFO.duplicate(true),
}
var CHESS_PANEL_1_END_INFO: Dictionary = {
	"resultSuccess": CHESS_PANEL_1_END_RESULT_INFO.duplicate(true),
	"resultFailure": CHESS_PANEL_1_END_RESULT_INFO.duplicate(true),
}
var CHESS_PANEL_1_KING_INFO: Dictionary = {
	"conditionNPCArticleTriggerTypeID": 0,
	"successNPCArticleTriggerTypeIDList": [],
}
var CHESS_PANEL_1_DATA_INFO: Dictionary = {
	"isInPlayChess": false,
	"npcTriggerType": TableManager.NPC_TRIGGER_TYPE.NONE,
	"npcTriggerTypeID": 0,
	"finalNPCPowerMin": 0,
	"finalNPCPowerMax": 0,
	"avatarPowerMin": 0,
	"avatarPowerMax": 0,
	"successRateIntNumerator": 0,
	"successRateIntDenominator": 0,
	"endInfo": CHESS_PANEL_1_END_INFO.duplicate(true),
	
	"lastNPCTriggerType": TableManager.NPC_TRIGGER_TYPE.NONE,
	"lastNPCTriggerTypeID": 0,
	"playChessCountList": [], # true: win. false: not win.
	
	"kingInfo": CHESS_PANEL_1_KING_INFO.duplicate(true),
}

var m_IsUIPanelHadConsumed_Event_FocusClick: bool = false

const UI_INPUT_ACTION_EVENT_TYPE_COMMONBUTTONITEM_TEXTUREBUTTON1_PRESSED_EVENT_CD_MIN_SECONDS_NUMBER: float = HQH.PHYSICS_PROCESS_FRAME_MIN_SECONDS_NUMBER * AvatarManager.DELAYINDEXNUMBER_1_STEP # 0.5 seconds = 0.016 * 30 = (1 / 60frames) * 30delays
const UI_INPUT_ACTION_EVENT_TYPE_COMMONBUTTONITEM_TEXTUREBUTTON1_PRESSED_EVENT_CD_MIN_MILLISECONDS_NUMBER: int = int(UI_INPUT_ACTION_EVENT_TYPE_COMMONBUTTONITEM_TEXTUREBUTTON1_PRESSED_EVENT_CD_MIN_SECONDS_NUMBER * HQH.MILLISECOND_NUMBER) # 500 milliseconds
var m_UI_INPUT_ACTION_EVENT_TYPE_COMMONBUTTONITEM_TEXTUREBUTTON1_PRESSED_EVENT_IsStart: bool = false
var m_UI_INPUT_ACTION_EVENT_TYPE_COMMONBUTTONITEM_TEXTUREBUTTON1_PRESSED_EVENT_Index: int = 0
var m_UI_INPUT_ACTION_EVENT_TYPE_COMMONBUTTONITEM_TEXTUREBUTTON1_PRESSED_EVENT_MIN_NUMBER_IsStart: bool = false
var m_UI_INPUT_ACTION_EVENT_TYPE_COMMONBUTTONITEM_TEXTUREBUTTON1_PRESSED_EVENT_MIN_NUMBER_CD_StartMilliTime: int = 0

var SCENE_HALL_OF_MELODY_INFO: Dictionary = {
	"isHide_CLERGY1": false,
}
var m_SceneHallOfMelodyInfo: Dictionary = SCENE_HALL_OF_MELODY_INFO.duplicate(true)

var SCENE_CLINKER_VALLEY_INFO: Dictionary = {
	"isCloseEye": false,
}
var m_SceneClinkerValleyInfo: Dictionary = SCENE_CLINKER_VALLEY_INFO.duplicate(true)

const SWALLOW_ACTION_INFO: Dictionary = {
	"isSwallowActionStart": false,				# true: start. false: finish.
	"isNightDurationStart": false,				# true: start. false: finish.
	"isSloganStart": false,						# true: start. false: finish.
	
	"nightDurationTimeInSeconds": 0.0,
	"nightDurationTimeInSecondsTimer": 0.0,
	"initiatorAvatarTypeID": 0,
	"sloganTimer": 0.0,
}
var m_SwallowActionInfo: Dictionary = SWALLOW_ACTION_INFO.duplicate()

const CLINKERVALLEY_SISTER_INFO_COUNTING_NUMBER_MIN: int = 1
const CLINKERVALLEY_SISTER_INFO_COUNTING_NUMBER_MAX: int = 10
const CLINKERVALLEY_SISTER_INFO_COUNTING_TIME_STEP_MIN: float = 1.5
const CLINKERVALLEY_SISTER_INFO_COUNTING_TIME_STEP_MAX: float = 2.7
var CLINKERVALLEY_SISTER_INFO: Dictionary = {
	"isStartCounting": false,				# true: start. false: stop.
	"countingTimer": 0.0,
	"countingNumber": CLINKERVALLEY_SISTER_INFO_COUNTING_NUMBER_MIN,
	"countingtimeStep": 0.0,
}
var m_ClinkerValleySisterInfo: Dictionary = CLINKERVALLEY_SISTER_INFO.duplicate()

func _ready():
	m_StartGamePanelInfo.preloadResource = TableManager.Get_PRELOAD_RESOURCE_MAP("UI_StartGamePanel")
	m_StartGamePanelInfo.panelData = START_GAME_PANEL_DATA_INFO.duplicate(true)
	
	m_LoadingScenePanelInfo.preloadResource = TableManager.Get_PRELOAD_RESOURCE_MAP("UI_LoadingScenePanel")
	m_LoadingScenePanelInfo.panelData = LOADING_SCENE_PANEL_DATA_INFO.duplicate(true)
	
	m_LanguagePanelInfo.preloadResource = TableManager.Get_PRELOAD_RESOURCE_MAP("UI_LanguagePanel")
	m_LanguagePanelInfo.panelData = LANGUAGE_PANEL_DATA_INFO.duplicate(true)
	
	m_OptionPanelInfo.preloadResource = TableManager.Get_PRELOAD_RESOURCE_MAP("UI_OptionPanel")
	m_OptionPanelInfo.panelData = OPTION_PANEL_DATA_INFO.duplicate(true)
	
	m_DownPanelInfo.preloadResource = TableManager.Get_PRELOAD_RESOURCE_MAP("UI_DownPanel")
	m_DownPanelInfo.panelData = DOWN_PANEL_DATA_INFO.duplicate(true)
	
	m_TeamPanelInfo.preloadResource = TableManager.Get_PRELOAD_RESOURCE_MAP("UI_TeamPanel")
	m_TeamPanelInfo.panelData = TEAM_PANEL_DATA_INFO.duplicate(true)
	
	m_DayNightPanelInfo.preloadResource = TableManager.Get_PRELOAD_RESOURCE_MAP("UI_DayNightPanel")
	m_DayNightPanelInfo.panelData = DAY_NIGHT_PANEL_DATA_INFO.duplicate(true)
	
	m_UpNamePanelInfo.preloadResource = TableManager.Get_PRELOAD_RESOURCE_MAP("UI_UpNamePanel")
	m_UpNamePanelInfo.panelData = UP_NAME_PANEL_DATA_INFO.duplicate(true)
	
	m_RightSettingPanelInfo.preloadResource = TableManager.Get_PRELOAD_RESOURCE_MAP("UI_RightSettingPanel")
	m_RightSettingPanelInfo.panelData = RIGHT_SETTING_PANEL_DATA_INFO.duplicate(true)
	
	m_JournalRecordPanelInfo.preloadResource = TableManager.Get_PRELOAD_RESOURCE_MAP("UI_JournalRecordPanel")
	m_JournalRecordPanelInfo.panelData = JOURNALRECORD_PANEL_DATA_INFO.duplicate(true)
	
#	m_ChessPanel4Info.preloadResource = TableManager.Get_PRELOAD_RESOURCE_MAP("UI_ChessPanel4")
#	m_ChessPanel4Info.panelData = CHESS_PANEL_4_DATA_INFO.duplicate(true)
	
	m_ChessPanel1Info.preloadResource = TableManager.Get_PRELOAD_RESOURCE_MAP("UI_ChessPanel1")
	m_ChessPanel1Info.panelData = CHESS_PANEL_1_DATA_INFO.duplicate(true)
	
	# TeamPanel item data fixed length
	for i in TEAM_PANEL_ITEM_NUMBER_MAX:
		var item1Data: Dictionary = TEAM_PANEL_ITEM_1DATA_INFO.duplicate(true)
		if 0 == i:
			item1Data.itemInputKeyLetter = TableManager.INPUT_KEY_LETTER_MAP.KEY_1 # "1"
		elif 1 == i:
			item1Data.itemInputKeyLetter = TableManager.INPUT_KEY_LETTER_MAP.KEY_2 # "2"
		elif 2 == i:
			item1Data.itemInputKeyLetter = TableManager.INPUT_KEY_LETTER_MAP.KEY_3 # "3"
		elif 3 == i:
			item1Data.itemInputKeyLetter = TableManager.INPUT_KEY_LETTER_MAP.KEY_4 # "4"
		elif 4 == i:
			item1Data.itemInputKeyLetter = TableManager.INPUT_KEY_LETTER_MAP.KEY_5 # "5"
		elif 5 == i:
			item1Data.itemInputKeyLetter = TableManager.INPUT_KEY_LETTER_MAP.KEY_6 # "6"
		elif 6 == i:
			item1Data.itemInputKeyLetter = TableManager.INPUT_KEY_LETTER_MAP.KEY_7 # "7"
		elif 7 == i:
			item1Data.itemInputKeyLetter = TableManager.INPUT_KEY_LETTER_MAP.KEY_8 # "8"
		elif 8 == i:
			item1Data.itemInputKeyLetter = TableManager.INPUT_KEY_LETTER_MAP.KEY_9 # "9"
		elif 9 == i:
			item1Data.itemInputKeyLetter = TableManager.INPUT_KEY_LETTER_MAP.KEY_0 # "0"
		
		m_TeamPanelInfo.panelData.itemData.append(item1Data)
	
	# DownPanel bag data fixed length
	for i in DOWN_PANEL_BAG_NUMBER_MAX:
		var bag1Data: Dictionary = DOWN_PANEL_BAG_1DATA_INFO.duplicate(true)
		m_DownPanelInfo.panelData.bagData.append(bag1Data)
	
	if HQH.IS_DEBUG:
		m_DebugInfoPanelInfo.preloadResource = TableManager.Get_PRELOAD_RESOURCE_MAP("UI_DebugInfoPanel")
		m_DebugMenuPanelInfo.preloadResource = TableManager.Get_PRELOAD_RESOURCE_MAP("UI_DebugMenuPanel")
		
		DebugInfoPanel_Show()

func _process(delta: float):
	if m_UI_INPUT_ACTION_EVENT_TYPE_COMMONBUTTONITEM_TEXTUREBUTTON1_PRESSED_EVENT_MIN_NUMBER_IsStart:
		var passMilliTime: int = HQH.MilliTime() - m_UI_INPUT_ACTION_EVENT_TYPE_COMMONBUTTONITEM_TEXTUREBUTTON1_PRESSED_EVENT_MIN_NUMBER_CD_StartMilliTime
		if UI_INPUT_ACTION_EVENT_TYPE_COMMONBUTTONITEM_TEXTUREBUTTON1_PRESSED_EVENT_CD_MIN_MILLISECONDS_NUMBER < passMilliTime:
			m_UI_INPUT_ACTION_EVENT_TYPE_COMMONBUTTONITEM_TEXTUREBUTTON1_PRESSED_EVENT_MIN_NUMBER_IsStart = false
			
			SetUI_INPUT_ACTION_EVENT_TYPE_COMMONBUTTONITEM_TEXTUREBUTTON1_PRESSED_EVENT_Stop()
	
	SwallowActionProcess(delta)
	ClinkerValleySisterProcess(delta)

func DisposeInput(event: InputEvent):
	if event.is_action_pressed("ui_cancel"):
		OnEscButtonPressed()
	
	if SceneManager.IsInGameScene():
		if JournalRecordPanel_IsVisible():
			if event.is_action_pressed("ui_page_up"):
				JournalRecordPanel_CommonTextureButtonJournalRecordTurnPageLeft1_SetPressedTrue()
				JournalRecordPanel_on_commonTextureButtonJournalRecordTurnPageLeft1_pressed()
			
			if event.is_action_pressed("ui_page_down"):
				JournalRecordPanel_CommonTextureButtonJournalRecordTurnPageRight1_SetPressedTrue()
				JournalRecordPanel_on_commonTextureButtonJournalRecordTurnPageRight1_pressed()
		
		if IsNoFullScreenPanelVisible():
			if event.is_action_pressed("ui_interaction"):
				DownPanel_OnKeyPressed_Interaction()
			
			if event.is_action_pressed("ui_playchess"):
				DownPanel_OnKeyPressed_PlayChess()
			
			if event.is_action_pressed("ui_bag"):
				DownPanel_OnKeyPressed_Bag()
			
			if event.is_action_pressed("ui_journal"):
				DownPanel_OnKeyPressed_Journal()
			
			if event.is_action_pressed("ui_option"):
				DownPanel_OnKeyPressed_Option()
			
			if not DownPanel_WrangleDialogGetIsVisible():
				for i in TEAM_PANEL_ITEM_NUMBER_MAX:
					if event.is_action_pressed("ui_%s" % (i + 1)):
						TeamPanel_OnControlItemButtonListCommonButtonItemPressed(i)
						
						break
			
			if DownPanel_WrangleDialogGetIsVisible():
				for i in WRANGLEDIALOG_NUMBER_MAX:
					if event.is_action_pressed("ui_%s" % (i + 1)):
						DownPanel_WrangleDialog_OnKeyPressed(i)
						
						break

func RemoveAllPanel():
	StartGamePanel_Hide()
	LanguagePanel_Hide()
	OptionPanel_Hide()
	JournalRecordPanel_Hide()

func BeginChangeToScene(changeToSceneTypeID: int):
	RemoveAllPanel()
	if SceneManager.IsCanShowDownPanelAndOtherHangPanels(changeToSceneTypeID):
		if not DayNightPanel_IsVisible():
			DayNightPanel_Show()
		
		if not DownPanel_IsVisible():
			DownPanel_Show()
		
		if not TeamPanel_IsVisible():
			TeamPanel_Show()
		
		if not UpNamePanel_IsVisible():
			UpNamePanel_Show()
		
		if not RightSettingPanel_IsVisible():
			RightSettingPanel_Show()
	else:
		DownPanel_Hide()
		TeamPanel_Hide()
		DayNightPanel_Hide()
		UpNamePanel_Hide()
		RightSettingPanel_Hide()
#		ChessPanel4_Hide()
		ChessPanel1_Hide()
	
	m_ChessPanel1Info.panelData.lastNPCTriggerType = TableManager.NPC_TRIGGER_TYPE.NONE
	m_ChessPanel1Info.panelData.lastNPCTriggerTypeID = 0
	m_ChessPanel1Info.panelData.playChessCountList.clear()
	
	m_SceneClinkerValleyInfo.isCloseEye = false
	
	if SceneManager.IsHubSceneTypeID(changeToSceneTypeID):
		m_SwallowActionInfo = SWALLOW_ACTION_INFO.duplicate()
		m_ChessPanel1Info.panelData.kingInfo.conditionNPCArticleTriggerTypeID = 0
		m_ChessPanel1Info.panelData.kingInfo.successNPCArticleTriggerTypeIDList.clear()

func DebugUIAddChild(panelInstance, preloadResource):
	if not is_instance_valid(panelInstance):
		panelInstance = preloadResource.instance()
		Layout.CanvasLayerDebugUIAddChild(panelInstance)
	
	return panelInstance

func DebugUIRemoveChild(panelInstance):
	if is_instance_valid(panelInstance):
		Layout.CanvasLayerDebugUIRemoveChild(panelInstance)
		panelInstance.queue_free()
	
	return null

func UILoadingAddChild(panelInstance, preloadResource):
	if not is_instance_valid(panelInstance):
		panelInstance = preloadResource.instance()
		Layout.CanvasLayerUILoadingAddChild(panelInstance)
	
	return panelInstance

func UILoadingRemoveChild(panelInstance):
	if is_instance_valid(panelInstance):
		Layout.CanvasLayerUILoadingRemoveChild(panelInstance)
		panelInstance.queue_free()
	
	return null

func UIAddChild(panelInstance, preloadResource):
	if not is_instance_valid(panelInstance):
		panelInstance = preloadResource.instance()
		Layout.CanvasLayerUIAddChild(panelInstance)
	
	return panelInstance

func FullScreenPanel_Show():
	SceneManager.HideAllAvatarOutlineAndTips()

func UIRemoveChild(panelInstance):
	if is_instance_valid(panelInstance):
		Layout.CanvasLayerUIRemoveChild(panelInstance)
		panelInstance.queue_free()
	
	return null

func DebugInfoPanel_Show():
	m_DebugInfoPanelInfo.panelInstance = DebugUIAddChild(m_DebugInfoPanelInfo.panelInstance, m_DebugInfoPanelInfo.preloadResource)

func DebugInfoPanel_Hide():
	m_DebugInfoPanelInfo.panelInstance = DebugUIRemoveChild(m_DebugInfoPanelInfo.panelInstance)

func DebugMenuPanel_IsVisible() -> bool:
	return is_instance_valid(m_DebugMenuPanelInfo.panelInstance)

func DebugMenuPanel_Show():
	HQH.Log("DebugMenuPanel_Show")
	
	FullScreenPanel_Show()
	
	m_DebugMenuPanelInfo.panelInstance = DebugUIAddChild(m_DebugMenuPanelInfo.panelInstance, m_DebugMenuPanelInfo.preloadResource)

func DebugMenuPanel_Hide():
	HQH.Log("DebugMenuPanel_Hide")
	
	m_DebugMenuPanelInfo.panelInstance = DebugUIRemoveChild(m_DebugMenuPanelInfo.panelInstance)

func DebugMenuPanel_OnEscButtonPressed() -> bool:
	if DebugMenuPanel_IsVisible():
		DebugMenuPanel_Hide()
		
		return true
	
	return false

func DebugMenuPanel_ShowHide():
	if DebugMenuPanel_IsVisible():
		DebugMenuPanel_Hide()
	else:
		DebugMenuPanel_Show()

func StartGamePanel_Show():
	m_StartGamePanelInfo.panelInstance = UIAddChild(m_StartGamePanelInfo.panelInstance, m_StartGamePanelInfo.preloadResource)

func StartGamePanel_Hide():
	m_StartGamePanelInfo.panelInstance = UIRemoveChild(m_StartGamePanelInfo.panelInstance)

func StartGamePanel_UpdateUI():
	m_StartGamePanelInfo.panelInstance.UpdateUI()
	
func StartGamePanel_UpdateFirstAvatarRandom():
	m_StartGamePanelInfo.panelInstance.UpdateFirstAvatarRandom()

func StartGamePanel_SetControlArchiveVisible(v: bool):
	m_StartGamePanelInfo.panelInstance.SetControlArchiveVisible(v)

func StartGamePanel_StartGame(index: int, isContinueGame: bool, avatarTypeID: int, sceneTypeID: int):
	HQH.Log("StartGamePanel_StartGame, index: %s, isContinueGame: %s, avatarTypeID: %s, sceneTypeID: %s" % [index, isContinueGame, avatarTypeID, sceneTypeID])
	
	var currentSceneTypeID: int = 0
	SaveGameManager.SetSaveData_archive_currentUsedIndex(index)
	if isContinueGame:
		# Continue game
		var teamLeaderAvatarInfo: Dictionary = SaveGameManager.GetSaveGameData_Archive_AvatarList_TeamLeaderAvatarInfo()
		currentSceneTypeID = teamLeaderAvatarInfo.avatarSceneTypeID
	else:
		# New Game
		currentSceneTypeID = sceneTypeID
		
#		var avatarTypeID: int = avatarTypeID
		var avatarPositionX: float = 0.0
		var avatarPositionY: float = 0.0
		var equipTypeID: int = 0
		SaveGameManager.AddSaveGameData_Archive_AvatarList(avatarTypeID, sceneTypeID, avatarPositionX, avatarPositionY, equipTypeID)
		SaveGameManager.SetSaveGameData_Archive_Info_InitAvatarTypeID(avatarTypeID)
	
	if HQH.IS_DEBUG:
		var avatarPositionDebugData: Dictionary = DebugManager.GetAvatarPositionDebugData()
		if 0 < avatarPositionDebugData.sceneTypeID:
			currentSceneTypeID = avatarPositionDebugData.sceneTypeID
	
	SceneManager.ChangeToSceneBySceneTypeID(currentSceneTypeID)

func StartGamePanel_on_commonButton31StartGame_pressed(avatarTypeID: int, sceneTypeID: int):
	HQH.Log("StartGamePanel_on_commonButton31StartGame_pressed, avatarTypeID: %s, sceneTypeID: %s" % [avatarTypeID, sceneTypeID])
	
	var isContinueGame: bool = false
	var index: int = 0
	if SaveGameManager.IsContinueGame():
		# Continue game
		isContinueGame = true
		
		AudioManager.PlayByName("Audio_heavy-beam-weapon-7052_2")
		
		var archive_currentUsedIndex: int = SaveGameManager.GetSaveData_archive_currentUsedIndex()
		index = archive_currentUsedIndex
	else:
		# New game
		isContinueGame = false
		
		AudioManager.PlayByName("Audio_big-impact-7054")
		
		var archive_currentUsedIndex: int = SaveGameManager.GetSaveData_archive_currentUsedIndex()
		if 0 > archive_currentUsedIndex:
			index = 0 # New game from index 0 to start
		else:
			index = archive_currentUsedIndex
	
	StartGamePanel_StartGame(index, isContinueGame, avatarTypeID, sceneTypeID)

func StartGamePanel_on_commonButton31Option_pressed():
	HQH.Log("StartGamePanel_on_commonButton31Option_pressed")
	
	StartGamePanel_Hide()
	
	OptionPanel_Show()

func StartGamePanel_on_commonButton31ExitGame_pressed():
	HQH.Log("StartGamePanel_on_commonButton31ExitGame_pressed")
	
	HQH.KillCurrentProcess()

func StartGamePanel_on_commonButtonArchive1_pressed(index: int):
	HQH.Log("StartGamePanel_on_commonButtonArchive1_pressed, index: %s" % index)
	
	StartGamePanel_SetControlArchiveVisible(false)
	SaveGameManager.SetSaveData_archive_currentUsedIndex(index, false) # IsEmpty is also empty
	StartGamePanel_UpdateUI()
	
	if SaveGameManager.IsContinueGame():
		AvatarManager.SpawnAvatar(true)
	else:
		AvatarManager.SpawnAvatarTransparent()
		StartGamePanel_UpdateFirstAvatarRandom()
	
	SceneManager.UpdateCurrentScene()

func StartGamePanel_ClearSaveGameArchive(index: int):
	var isEmpty: bool = SaveGameManager.GetSaveGameArchiveByIndex_IsEmpty(index)
	if not isEmpty:
		SaveGameManager.ClearSaveGameArchive(index)
		
		StartGamePanel_UpdateUI()
		
		if SaveGameManager.IsContinueGame():
			AvatarManager.SpawnAvatar(true)
		else:
			AvatarManager.SpawnAvatarTransparent()
		
		SceneManager.UpdateCurrentScene()

func StartGamePanel_SetCommonButton10ArchiveClearDoubleConfirmation(v: bool):
	 m_StartGamePanelInfo.panelInstance.SetCommonButton10ArchiveClearDoubleConfirmation(v, m_StartGamePanelInfo.panelData.clearSaveGameArchiveIndex)

func StartGamePanel_on_commonButton10ArchiveClear1_pressed(index: int):
	HQH.Log("StartGamePanel_on_commonButton10ArchiveClear1_pressed, index: %s" % index)
	
	m_StartGamePanelInfo.panelData.clearSaveGameArchiveIndex = index
	StartGamePanel_SetCommonButton10ArchiveClearDoubleConfirmation(true)

func StartGamePanel_on_commonButton10ArchiveClearDoubleConfirmation_pressed():
	HQH.Log("StartGamePanel_on_commonButton10ArchiveClearDoubleConfirmation_pressed")
	
	StartGamePanel_ClearSaveGameArchive(m_StartGamePanelInfo.panelData.clearSaveGameArchiveIndex)
	m_StartGamePanelInfo.panelData.clearSaveGameArchiveIndex = -1
	StartGamePanel_SetCommonButton10ArchiveClearDoubleConfirmation(false)

func LoadingScenePanel_IsVisible() -> bool:
	return is_instance_valid(m_LoadingScenePanelInfo.panelInstance)

func LoadingScenePanel_Show():
	m_LoadingScenePanelInfo.panelInstance = UILoadingAddChild(m_LoadingScenePanelInfo.panelInstance, m_LoadingScenePanelInfo.preloadResource)

func LoadingScenePanel_Hide():
	m_LoadingScenePanelInfo.panelInstance = UILoadingRemoveChild(m_LoadingScenePanelInfo.panelInstance)

func LoadingScenePanel_SetMax(n: int):
	if LoadingScenePanel_IsVisible():
		m_LoadingScenePanelInfo.panelInstance.SetMax(n)

func LoadingScenePanel_SetValue(n: int):
	if LoadingScenePanel_IsVisible():
		m_LoadingScenePanelInfo.panelInstance.SetValue(n)

func SetDynamicFontProperties(controlObject: Control):
	var currentFont: DynamicFont = controlObject.get_font("font")
	if 0 < currentFont.outline_size:
		currentFont.outline_color = HQH.COLORPALETTE_UI.FONT_COLOR2

func SetNewStyleBoxFlat(controlObject: Control, name: String, bg_color: Color, border_width: int, border_color: Color, corner_radius: int):
	var newStyleBoxFlat: StyleBoxFlat = StyleBoxFlat.new()
	newStyleBoxFlat.bg_color = bg_color
	newStyleBoxFlat.border_width_left = border_width
	newStyleBoxFlat.border_width_top = border_width
	newStyleBoxFlat.border_width_right = border_width
	newStyleBoxFlat.border_width_bottom = border_width
	newStyleBoxFlat.border_color = border_color
	newStyleBoxFlat.corner_radius_top_left = corner_radius
	newStyleBoxFlat.corner_radius_top_right = corner_radius
	newStyleBoxFlat.corner_radius_bottom_left = corner_radius
	newStyleBoxFlat.corner_radius_bottom_right = corner_radius
	controlObject.add_stylebox_override(name, newStyleBoxFlat)

func SetNewStyleBoxLine(controlObject: Control, name: String, color: Color, thickness: int):
	var newStyleBoxLine: StyleBoxLine = StyleBoxLine.new()
	newStyleBoxLine.color = color
	newStyleBoxLine.thickness = thickness
	controlObject.add_stylebox_override(name, newStyleBoxLine)

func LanguagePanel_OnReady():
	var allLanguageName: Array = TableManager.GetAllLanguageName()
	var currentLanguageName: String = TableManager.GetCurrentLanguageName()
	var languageNameIndex: int = 0
	for iv in allLanguageName:
		if currentLanguageName == iv:
			m_LanguagePanelInfo.panelData.currentData.selectIndex = languageNameIndex
			
			break
		
		languageNameIndex = languageNameIndex + 1
	
	m_LanguagePanelInfo.panelData.initData = m_LanguagePanelInfo.panelData.currentData.duplicate(true)

func LanguagePanel_IsVisible() -> bool:
	return is_instance_valid(m_LanguagePanelInfo.panelInstance)

func LanguagePanel_Show():
	FullScreenPanel_Show()
	
	m_LanguagePanelInfo.panelInstance = UIAddChild(m_LanguagePanelInfo.panelInstance, m_LanguagePanelInfo.preloadResource)

func LanguagePanel_Hide():
	m_LanguagePanelInfo.panelInstance = UIRemoveChild(m_LanguagePanelInfo.panelInstance)

func LanguagePanel_UpdateUI():
	m_LanguagePanelInfo.panelInstance.UpdateUI()

func LanguagePanel_on_commonButtonOK_pressed():
	HQH.Log("LanguagePanel_on_commonButtonOK_pressed")
	
	SaveGameManager.SetNeedSaveGame()
	
	LanguagePanel_Hide()
	
	var isFirstTimeSaveGameData: bool = SaveGameManager.GetIsFirstTimeSaveGameData()
	if isFirstTimeSaveGameData:
		StartGamePanel_Show()
	else:
		OptionPanel_Show()
	
	SaveGameManager.SetIsFirstTimeSaveGameData_false()

func LanguagePanel_on_commonButtonCancel_pressed():
	HQH.Log("LanguagePanel_on_commonButtonCancel_pressed")
	
	LanguagePanel_SetLanguage(m_LanguagePanelInfo.panelData.initData.selectIndex)
	
	LanguagePanel_Hide()
	
	OptionPanel_Show()

func LanguagePanel_OnEscButtonPressed() -> bool:
	if LanguagePanel_IsVisible():
		LanguagePanel_on_commonButtonCancel_pressed()
		
		return true
	
	return false

func LanguagePanel_on_commonItemList1_item_selected(index: int):
	HQH.Log("LanguagePanel_on_commonItemList1_item_selected, index: %s" % index)
	
	var isNeedUpdateUI: bool = LanguagePanel_SetLanguage(index)
	if isNeedUpdateUI:
		LanguagePanel_UpdateUI()
		
		HQH.SetWindowTitle()

func LanguagePanel_SetLanguage(index: int) -> bool:
	var isNeedUpdateUI: bool = false
	if index != m_LanguagePanelInfo.panelData.currentData.selectIndex:
		var allLanguageName: Array = TableManager.GetAllLanguageName()
		if (0 <= index) and (allLanguageName.size() > index):
			isNeedUpdateUI = true
			
			m_LanguagePanelInfo.panelData.currentData.selectIndex = index
			var languageName: String = allLanguageName[index]
			TableManager.SetLanguage(languageName, true)
		
	return isNeedUpdateUI

func LanguagePanel_GetCurrentSelectIndex() -> int:
	return m_LanguagePanelInfo.panelData.currentData.selectIndex

func OptionPanel_IsVisible() -> bool:
	return is_instance_valid(m_OptionPanelInfo.panelInstance)

func OptionPanel_Show():
	if SceneManager.IsInGameScene():
		if GetIsInPlayChess():
			DownPanel_AddJournalRecordWithStringKey("IT_IS_PLAY_CHESS_YOU_CAN_NOT_OPERATE")
			
			return
	
	FullScreenPanel_Show()
	
	m_OptionPanelInfo.panelInstance = UIAddChild(m_OptionPanelInfo.panelInstance, m_OptionPanelInfo.preloadResource)

func OptionPanel_Hide():
	m_OptionPanelInfo.panelInstance = UIRemoveChild(m_OptionPanelInfo.panelInstance)

func OptionPanel_ShowHide():
	if OptionPanel_IsVisible():
		OptionPanel_Hide()
	else:
		OptionPanel_Show()

func OptionPanel_on_commonButtonOK_pressed():
	HQH.Log("OptionPanel_on_commonButtonOK_pressed")
	
	OptionPanel_SaveAllValue()
	
	OptionPanel_Hide()
	
	if SceneManager.IsInHubScene():
		StartGamePanel_Show()

func OptionPanel_on_commonButtonCancel_pressed(isOpenStartGamePanel: bool = true):
	HQH.Log("OptionPanel_on_commonButtonCancel_pressed")
	
	OptionPanel_SetAllValue(m_OptionPanelInfo.panelData.initData.videoInfo.videoResolutionRatioListSelectIndex, m_OptionPanelInfo.panelData.initData.videoInfo.windowIsFullScreen, m_OptionPanelInfo.panelData.initData.videoInfo.windowIsWindowStretch, m_OptionPanelInfo.panelData.initData.audioInfo)
	OptionPanel_SaveAllValue()
	
	OptionPanel_Hide()
	
	if SceneManager.IsInHubScene():
		if isOpenStartGamePanel:
			StartGamePanel_Show()

func OptionPanel_OnEscButtonPressed() -> bool:
	if OptionPanel_IsVisible():
		OptionPanel_on_commonButtonCancel_pressed()
		
		return true
	else:
		if not SceneManager.IsInHubScene():
			OptionPanel_Show()
			
			return true
	
	return false

func OptionPanel_on_commonButtonDefault_pressed():
	HQH.Log("OptionPanel_on_commonButtonDefault_pressed")
	
	var videoResolutionRatioListSelectIndex: int = OptionPanel_GetIndex_OPTION_PANEL_DATA_TABLE_INFO_videoResolutionRatioList(OPTION_PANEL_DEFAULT_DATA_INFO.videoInfo.videoResolutionRatioID)
	OptionPanel_SetAllValue(videoResolutionRatioListSelectIndex, OPTION_PANEL_DEFAULT_DATA_INFO.videoInfo.windowIsFullScreen, OPTION_PANEL_DEFAULT_DATA_INFO.videoInfo.windowIsWindowStretch, OPTION_PANEL_DEFAULT_DATA_INFO.audioInfo)
	
	OptionPanel_UpdateUI_SetVideoResolutionRatio()
	OptionPanel_UpdateUI_SetFullScreen()
	OptionPanel_UpdateUI_SetWindowStretch()

func OptionPanel_SetAllValue(videoResolutionRatioListSelectIndex: int, isFullScreen: bool, isWindowStretch: bool, audioInfo: Dictionary):
	OptionPanel_SetVideoResolutionRatio(videoResolutionRatioListSelectIndex)
	OptionPanel_SetWindowFullScreen(isFullScreen)
	OptionPanel_SetWindowStretch(isWindowStretch)
	OptionPanel_SetMusicValue(audioInfo.musicIsMute, audioInfo.musicValue)
	OptionPanel_SetSoundEffectValue(audioInfo.soundEffectIsMute, audioInfo.soundEffectValue)

func OptionPanel_SaveAllValue():
	var videoInfo: Dictionary = OptionPanel_GetInfo_OPTION_PANEL_DATA_TABLE_INFO_videoResolutionRatioList(m_OptionPanelInfo.panelData.currentData.videoInfo.videoResolutionRatioListSelectIndex)
	SaveGameManager.SetSaveData_option_videoResolutionRatioID(videoInfo.videoResolutionRatioID)
	SaveGameManager.SetSaveData_option_windowIsFullScreen(m_OptionPanelInfo.panelData.currentData.videoInfo.windowIsFullScreen)
	SaveGameManager.SetSaveData_option_windowIsWindowStretch(m_OptionPanelInfo.panelData.currentData.videoInfo.windowIsWindowStretch)
	SaveGameManager.SetSaveData_option_musicIsMute(m_OptionPanelInfo.panelData.currentData.audioInfo.musicIsMute)
	SaveGameManager.SetSaveData_option_musicValue(m_OptionPanelInfo.panelData.currentData.audioInfo.musicValue)
	SaveGameManager.SetSaveData_option_soundEffectIsMute(m_OptionPanelInfo.panelData.currentData.audioInfo.soundEffectIsMute)
	SaveGameManager.SetSaveData_option_soundEffectValue(m_OptionPanelInfo.panelData.currentData.audioInfo.soundEffectValue)

func OptionPanel_on_commonButtonLanguage_pressed():
	HQH.Log("OptionPanel_on_commonButtonLanguage_pressed")
	
	OptionPanel_on_commonButtonCancel_pressed(false)
	
	LanguagePanel_Show()

func OptionPanel_on_commonButtonReturnToHubScene_pressed():
	HQH.Log("OptionPanel_on_commonButtonReturnToHubScene_pressed")
	
	OptionPanel_on_commonButtonCancel_pressed()
	
	SceneManager.ChangeToSceneBySceneTypeID(TableManager.SCENETYPEID_HUB)

func OptionPanel_on_commonButtonExitGame_pressed():
	HQH.Log("OptionPanel_on_commonButtonExitGame_pressed")
	
	HQH.KillCurrentProcess()

func OptionPanel_on_commonButtonReturnToGame_pressed():
	HQH.Log("OptionPanel_on_commonButtonReturnToGame_pressed")
	
	OptionPanel_on_commonButtonCancel_pressed()

func OptionPanel_SetVideoResolutionRatio(index: int):
	var videoInfo: Dictionary = OptionPanel_GetInfo_OPTION_PANEL_DATA_TABLE_INFO_videoResolutionRatioList(index)
	if not videoInfo.empty():
		if index != m_OptionPanelInfo.panelData.currentData.videoInfo.videoResolutionRatioListSelectIndex:
			m_OptionPanelInfo.panelData.currentData.videoInfo.videoResolutionRatioListSelectIndex = index
			
			HQH.SetVideoResolutionRatio(m_OptionPanelInfo.panelData.currentData.videoInfo.windowIsFullScreen, videoInfo.videoResolutionRatio.width, videoInfo.videoResolutionRatio.height)			
			SceneManager.SetWindowStretch(m_OptionPanelInfo.panelData.currentData.videoInfo.windowIsWindowStretch)

func OptionPanel_on_commonOptionButtonVideoResolutionRatio_item_selected(index: int):
	HQH.Log("OptionPanel_on_commonOptionButtonVideoResolutionRatio_item_selected, index: %s" % index)
	
	OptionPanel_SetVideoResolutionRatio(index)

func OptionPanel_on_commonCheckBoxFullScreen_pressed(button_pressed: bool):
	HQH.Log("OptionPanel_on_commonCheckBoxFullScreen_pressed, button_pressed: %s" % button_pressed)
	
	OptionPanel_SetWindowFullScreen(button_pressed)
	
	OptionPanel_UpdateUI_SetVideoResolutionRatio()

func OptionPanel_SetWindowFullScreen(isFullScreen: bool):
	if isFullScreen != m_OptionPanelInfo.panelData.currentData.videoInfo.windowIsFullScreen:
		m_OptionPanelInfo.panelData.currentData.videoInfo.windowIsFullScreen = isFullScreen
		
		var videoInfo: Dictionary = OptionPanel_GetInfo_OPTION_PANEL_DATA_TABLE_INFO_videoResolutionRatioList(m_OptionPanelInfo.panelData.currentData.videoInfo.videoResolutionRatioListSelectIndex)
		HQH.SetVideoResolutionRatio(m_OptionPanelInfo.panelData.currentData.videoInfo.windowIsFullScreen, videoInfo.videoResolutionRatio.width, videoInfo.videoResolutionRatio.height)
		SceneManager.SetWindowStretch(m_OptionPanelInfo.panelData.currentData.videoInfo.windowIsWindowStretch)

func OptionPanel_on_commonCheckBoxWindowStretch_pressed(button_pressed: bool):
	HQH.Log("OptionPanel_on_commonCheckBoxWindowStretch_pressed, button_pressed: %s" % button_pressed)
	
	OptionPanel_SetWindowStretch(button_pressed)
	
	OptionPanel_UpdateUI_SetVideoResolutionRatio()

func OptionPanel_SetWindowStretch(isWindowStretch: bool):
	if isWindowStretch != m_OptionPanelInfo.panelData.currentData.videoInfo.windowIsWindowStretch:
		m_OptionPanelInfo.panelData.currentData.videoInfo.windowIsWindowStretch = isWindowStretch
		
		SceneManager.SetWindowStretch(isWindowStretch)

func OptionPanel_UpdateUI_SetMusicValue():
	if OptionPanel_IsVisible():
		m_OptionPanelInfo.panelInstance.SetMusicValue()

func OptionPanel_UpdateUI_SetSoundEffectValue():
	if OptionPanel_IsVisible():
		m_OptionPanelInfo.panelInstance.SetSoundEffectValue()

func OptionPanel_UpdateUI_SetVideoResolutionRatio():
	if OptionPanel_IsVisible():
		m_OptionPanelInfo.panelInstance.SetVideoResolutionRatio()

func OptionPanel_UpdateUI_SetFullScreen():
	if OptionPanel_IsVisible():
		m_OptionPanelInfo.panelInstance.SetFullScreen()

func OptionPanel_UpdateUI_SetWindowStretch():
	if OptionPanel_IsVisible():
		m_OptionPanelInfo.panelInstance.SetWindowStretch()

func OptionPanel_SetMusicValue(musicIsMute: bool, musicValue: int):
	var musicValueTemp: int = AudioManager.GetClampVolumeSize(musicValue)
	if (musicIsMute != m_OptionPanelInfo.panelData.currentData.audioInfo.musicIsMute) or (musicValueTemp != m_OptionPanelInfo.panelData.currentData.audioInfo.musicValue):
		m_OptionPanelInfo.panelData.currentData.audioInfo.musicIsMute = musicIsMute
		m_OptionPanelInfo.panelData.currentData.audioInfo.lastMusicValue = m_OptionPanelInfo.panelData.currentData.audioInfo.musicValue
		m_OptionPanelInfo.panelData.currentData.audioInfo.musicValue = musicValueTemp
		
		AudioManager.SetVolumeSize_Music(musicValueTemp)
		
		OptionPanel_UpdateUI_SetMusicValue()

func OptionPanel_SetSoundEffectValue(soundEffectIsMute: bool, soundEffectValue: int):
	var soundEffectValueTemp: int = AudioManager.GetClampVolumeSize(soundEffectValue)
	if (soundEffectIsMute != m_OptionPanelInfo.panelData.currentData.audioInfo.soundEffectIsMute) or (soundEffectValueTemp != m_OptionPanelInfo.panelData.currentData.audioInfo.soundEffectValue):
		m_OptionPanelInfo.panelData.currentData.audioInfo.soundEffectIsMute = soundEffectIsMute
		m_OptionPanelInfo.panelData.currentData.audioInfo.lastSoundEffectValue = m_OptionPanelInfo.panelData.currentData.audioInfo.soundEffectValue
		m_OptionPanelInfo.panelData.currentData.audioInfo.soundEffectValue = soundEffectValueTemp
		
		AudioManager.SetVolumeSize_SoundEffect(soundEffectValueTemp)
		
		OptionPanel_UpdateUI_SetSoundEffectValue()

func OptionPanel_on_commonCheckBoxMusic_pressed(button_pressed: bool):
	HQH.Log("OptionPanel_on_commonCheckBoxMusic_pressed, button_pressed: %s" % button_pressed)
	
	if button_pressed:
		var musicValue: int = m_OptionPanelInfo.panelData.currentData.audioInfo.lastMusicValue
		if HQH.AUDIO_MIN_VALUE >= musicValue:
			musicValue = HQH.MUSIC_VALUE_DEFAULT
		
		OptionPanel_SetMusicValue(false, musicValue)
	else:
		OptionPanel_SetMusicValue(true, HQH.AUDIO_MIN_VALUE)

func OptionPanel_on_commonHSliderMusic_value_changed(value: int):
	HQH.Log("OptionPanel_on_commonHSliderMusic_value_changed, value: %s" % value)
	
	var musicIsMute: bool = 0 >= value
	OptionPanel_SetMusicValue(musicIsMute, value)

func OptionPanel_on_commonCheckBoxSoundEffect_pressed(button_pressed: bool):
	HQH.Log("OptionPanel_on_commonCheckBoxSoundEffect_pressed, button_pressed: %s" % button_pressed)
	
	if button_pressed:
		var soundEffectValue: int = m_OptionPanelInfo.panelData.currentData.audioInfo.lastSoundEffectValue
		if HQH.AUDIO_MIN_VALUE >= soundEffectValue:
			soundEffectValue = HQH.SOUND_EFFECT_VALUE_DEFAULT
		
		OptionPanel_SetSoundEffectValue(false, soundEffectValue)
	else:
		OptionPanel_SetSoundEffectValue(true, HQH.AUDIO_MIN_VALUE)

func OptionPanel_on_commonHSliderSoundEffect_value_changed(value: int):
	HQH.Log("OptionPanel_on_commonHSliderSoundEffect_value_changed, value: %s" % value)
	
	var soundEffectIsMute: bool = 0 >= value
	OptionPanel_SetSoundEffectValue(soundEffectIsMute, value)

func OptionPanel_GetInfo_OPTION_PANEL_DATA_TABLE_INFO_videoResolutionRatioList(index: int) -> Dictionary:
	if (0 <= index) and (OPTION_PANEL_DATA_TABLE_INFO.videoResolutionRatioList.size() > index):
		return OPTION_PANEL_DATA_TABLE_INFO.videoResolutionRatioList[index]
	
	return {}

func OptionPanel_GetIndex_OPTION_PANEL_DATA_TABLE_INFO_videoResolutionRatioList(currentSelectVideoResolutionRatioID: int) -> int:
	var isFound: bool = false
	var index: int = 0
	for iv in OPTION_PANEL_DATA_TABLE_INFO.videoResolutionRatioList:
		if currentSelectVideoResolutionRatioID == iv.videoResolutionRatioID:
			isFound = true
			
			break
		
		index = index + 1
	
	if not isFound:
		HQH.AssertLog("OptionPanel_GetIndex_OPTION_PANEL_DATA_TABLE_INFO_videoResolutionRatioList, not found currentSelectVideoResolutionRatioID: %s" % currentSelectVideoResolutionRatioID)
		
		index = 0
	
	return index

func GetVideoResolutionRatioInfoBase(videoResolutionRatioID: int) -> Dictionary:
	var videoResolutionRatioInfo: Dictionary = {}
	for iv in OPTION_PANEL_DATA_TABLE_INFO.videoResolutionRatioList:
		if videoResolutionRatioID == iv.videoResolutionRatioID:
			videoResolutionRatioInfo = iv
			
			break
	
	return videoResolutionRatioInfo

func GetVideoResolutionRatioInfo() -> Dictionary:
	var currentVideoResolutionRatioID: int = SaveGameManager.GetSaveData_option_videoResolutionRatioID()
	var videoResolutionRatioInfo: Dictionary = GetVideoResolutionRatioInfoBase(currentVideoResolutionRatioID)
	if videoResolutionRatioInfo.empty():
		HQH.AssertLog("GetVideoResolutionRatioInfo, not found currentVideoResolutionRatioID: %s" % [currentVideoResolutionRatioID])
		currentVideoResolutionRatioID = OPTION_PANEL_DEFAULT_DATA_INFO.videoInfo.videoResolutionRatioID
		videoResolutionRatioInfo = GetVideoResolutionRatioInfoBase(currentVideoResolutionRatioID)
	
	return videoResolutionRatioInfo

func OptionPanel_OnReady():
	var currentSelectVideoResolutionRatioID: int = SaveGameManager.GetSaveData_option_videoResolutionRatioID()
	m_OptionPanelInfo.panelData.currentData.videoInfo.videoResolutionRatioListSelectIndex = OptionPanel_GetIndex_OPTION_PANEL_DATA_TABLE_INFO_videoResolutionRatioList(currentSelectVideoResolutionRatioID)
	
	m_OptionPanelInfo.panelData.currentData.videoInfo.windowIsFullScreen = SaveGameManager.GetSaveData_option_windowIsFullScreen()
	m_OptionPanelInfo.panelData.currentData.videoInfo.windowIsWindowStretch = SaveGameManager.GetSaveData_option_windowIsWindowStretch()
	
	var musicIsMute: bool = SaveGameManager.GetSaveData_option_musicIsMute()
	m_OptionPanelInfo.panelData.currentData.audioInfo.musicIsMute = musicIsMute
	if musicIsMute:
		m_OptionPanelInfo.panelData.currentData.audioInfo.lastMusicValue = 0
		m_OptionPanelInfo.panelData.currentData.audioInfo.musicValue = 0
	else:
		var musicValue: int = SaveGameManager.GetSaveData_option_musicValue()
		m_OptionPanelInfo.panelData.currentData.audioInfo.lastMusicValue = AudioManager.GetClampVolumeSize(musicValue)
		m_OptionPanelInfo.panelData.currentData.audioInfo.musicValue = AudioManager.GetClampVolumeSize(musicValue)
	
	var soundEffectIsMute: bool = SaveGameManager.GetSaveData_option_soundEffectIsMute()
	m_OptionPanelInfo.panelData.currentData.audioInfo.soundEffectIsMute = soundEffectIsMute
	if soundEffectIsMute:
		m_OptionPanelInfo.panelData.currentData.audioInfo.lastSoundEffectValue = 0
		m_OptionPanelInfo.panelData.currentData.audioInfo.soundEffectValue = 0
	else:
		var soundEffectValue: int = SaveGameManager.GetSaveData_option_soundEffectValue()
		m_OptionPanelInfo.panelData.currentData.audioInfo.lastSoundEffectValue = AudioManager.GetClampVolumeSize(soundEffectValue)
		m_OptionPanelInfo.panelData.currentData.audioInfo.soundEffectValue = AudioManager.GetClampVolumeSize(soundEffectValue)
	
	m_OptionPanelInfo.panelData.initData = m_OptionPanelInfo.panelData.currentData.duplicate(true)

func OptionPanel_GetVideoResolutionRatioList() -> Array:
	return OPTION_PANEL_DATA_TABLE_INFO.videoResolutionRatioList

func OptionPanel_GetVideoResolutionRatioListCurrentSelectIndex() -> int:
	return m_OptionPanelInfo.panelData.currentData.videoInfo.videoResolutionRatioListSelectIndex

func OptionPanel_GetVideoInfo_windowIsFullScreen() -> bool:
	return m_OptionPanelInfo.panelData.currentData.videoInfo.windowIsFullScreen

func OptionPanel_GetVideoInfo_windowIsWindowStretch() -> bool:
	return m_OptionPanelInfo.panelData.currentData.videoInfo.windowIsWindowStretch

func OptionPanel_GetAudioInfoMusicIsMute() -> int:
	return m_OptionPanelInfo.panelData.currentData.audioInfo.musicIsMute

func OptionPanel_GetAudioInfoMusicValue() -> int:
	return m_OptionPanelInfo.panelData.currentData.audioInfo.musicValue

func OptionPanel_GetAudioInfoSoundEffectIsMute() -> int:
	return m_OptionPanelInfo.panelData.currentData.audioInfo.soundEffectIsMute

func OptionPanel_GetAudioInfoSoundEffectValue() -> int:
	return m_OptionPanelInfo.panelData.currentData.audioInfo.soundEffectValue

func OnEscButtonPressed():
	HQH.Log("OnEscButtonPressed")
	
	var isBeUsed: bool = DebugMenuPanel_OnEscButtonPressed()
	if not isBeUsed:
		isBeUsed = ChessPanel1_OnEscButtonPressed()
	
	if not isBeUsed:
		isBeUsed = LanguagePanel_OnEscButtonPressed()
	
	if not isBeUsed:
		isBeUsed = JournalRecordPanel_OnEscButtonPressed()
	
	if not isBeUsed:
		isBeUsed = DownPanel_OnEscButtonPressed()
	
	if not isBeUsed:
		isBeUsed = OptionPanel_OnEscButtonPressed()

func GetIsUIPanelHadConsumed_Event_FocusClick() -> bool:
	return m_IsUIPanelHadConsumed_Event_FocusClick

func CheckAndSet_IsUIPanelHadConsumed_Event_FocusClick(event: InputEvent, panelInstance: CanvasItem, panelRectangle: Rect2):
#	HQH.Log("CheckAndSet_IsUIPanelHadConsumed_Event_FocusClick")
	if not GetIsUIPanelHadConsumed_Event_FocusClick():
		if event.is_action_pressed("focus_click"):
			if panelInstance.is_inside_tree(): # To avoid Error: make_input_local: Condition "!is_inside_tree()" is true. Returned: p_event
				var eventLocal: InputEvent = panelInstance.make_input_local(event)
	#			var panelRectangle: Rect2 = Rect2(panel.rect_position, panel.rect_size)
				if panelRectangle.has_point(eventLocal.position):
					HQH.Log("CheckAndSet_IsUIPanelHadConsumed_Event_FocusClick, SetIsUIPanelHadConsumed_Event_FocusClick, panelInstance.name: %s" % panelInstance.name)
					SetIsUIPanelHadConsumed_Event_FocusClick(true)

func SetIsUIPanelHadConsumed_Event_FocusClick(isUIPanelHadConsumed: bool):
	m_IsUIPanelHadConsumed_Event_FocusClick = isUIPanelHadConsumed

func DownPanel_Show():
	m_DownPanelInfo.panelInstance = UIAddChild(m_DownPanelInfo.panelInstance, m_DownPanelInfo.preloadResource)

func DownPanel_Hide():
	m_DownPanelInfo.panelInstance = UIRemoveChild(m_DownPanelInfo.panelInstance)

func DownPanel_IsVisible() -> bool:
	return is_instance_valid(m_DownPanelInfo.panelInstance)

func DownPanel_OnReady():
	DownPanel_SetBagFromSaveGameData_Archive()

func TeamPanel_SetCurrentAvatar(avatarTypeID: int):
	if TeamPanel_IsVisible():
		m_TeamPanelInfo.panelInstance.SetCurrentAvatar(avatarTypeID)

func DownPanel_SetText():
	if DownPanel_IsVisible():
		m_DownPanelInfo.panelInstance.SetText()

func DownPanel_AddJournalRecordWithStringKey(stringKey: String):
	DownPanel_AddJournalRecord(TableManager.GetLanguageString(stringKey))

func DownPanel_AddJournalRecord(s: String):
	if DownPanel_IsVisible():
		m_DownPanelInfo.panelInstance.AddJournalRecord(s)

func DownPanel_WrangleDialogSetIsVisible(v: bool):
	if DownPanel_IsVisible():
		m_DownPanelInfo.panelInstance.WrangleDialogSetIsVisible(v)

func DownPanel_WrangleDialogGetIsVisible() -> bool:
	if DownPanel_IsVisible():
		return m_DownPanelInfo.panelInstance.WrangleDialogGetIsVisible()
	
	return false

func DownPanel_WrangleDialogSetDataForAvatar(avatarTypeID: int, contentString: String, wrangleDialogButtonStringArray: Array):
	m_DownPanelInfo.panelInstance.WrangleDialogSetDataForAvatar(avatarTypeID, contentString, wrangleDialogButtonStringArray)

func DownPanel_WrangleDialogSetDataForGoods(goodsTypeID: int, contentString: String, wrangleDialogButtonStringArray: Array):
	m_DownPanelInfo.panelInstance.WrangleDialogSetDataForGoods(goodsTypeID, contentString, wrangleDialogButtonStringArray)

func DownPanel_WrangleDialogSetDataForPicture(preloadResourceName: String, name: String, contentString: String, wrangleDialogButtonStringArray: Array):
	m_DownPanelInfo.panelInstance.WrangleDialogSetDataForPicture(preloadResourceName, name, contentString, wrangleDialogButtonStringArray)

func DownPanel_SetBag():
	if DownPanel_IsVisible():
		m_DownPanelInfo.panelInstance.SetBag()

func DownPanel_SetBagDataByIndex_CD(index: int):
	var bagDataSize: int = DownPanel_GetBagDataLength()
	if (0 <= index) and (bagDataSize > index):
		var bag1Data: Dictionary = DownPanel_GetBagDataByIndex(index)
		if bag1Data.isValidBag:
			bag1Data.bagCDStartTimeInMilliseconds = HQH.MilliTime()
			var BAGCDLENGTHTIMEINMILLISECONDS_MAX: int = 1000 # In milliseconds
			bag1Data.bagCDLengthTimeInMilliseconds = BAGCDLENGTHTIMEINMILLISECONDS_MAX
		else:
			HQH.AssertLog("DownPanel_SetBagDataByIndex, index: %s bag1Data.isValidBag is false" % [index])
	else:
		HQH.AssertLog("DownPanel_SetBagDataByIndex, index: %s is out of range: [0, %s)" % [index, bagDataSize])

func DownPanel_SetBagDataByIndex(index: int, isValidBag: bool, bagResourceName: String, bagNumber: int, bagCDStartTimeInMilliseconds: int, bagCDLengthTimeInMilliseconds: int, goodsTypeID: int):
	var bagDataSize: int = DownPanel_GetBagDataLength()
	if (0 <= index) and (bagDataSize > index):
		var bag1Data: Dictionary = DownPanel_GetBagDataByIndex(index)
		bag1Data.isValidBag = isValidBag
		if bag1Data.isValidBag:
			bag1Data.bagResourceName = bagResourceName
			bag1Data.bagNumber = bagNumber
			bag1Data.bagCDStartTimeInMilliseconds = bagCDStartTimeInMilliseconds
			bag1Data.bagCDLengthTimeInMilliseconds = bagCDLengthTimeInMilliseconds
			bag1Data.goodsTypeID = goodsTypeID
		else:
			bag1Data.bagResourceName = ""
			bag1Data.bagNumber = 0
			bag1Data.bagCDStartTimeInMilliseconds = 0
			bag1Data.bagCDLengthTimeInMilliseconds = 0
			bag1Data.goodsTypeID = 0
	else:
		HQH.AssertLog("DownPanel_SetBagDataByIndex, index: %s is out of range: [0, %s)" % [index, bagDataSize])

func DownPanel_GetBagDataByIndex(index: int) -> Dictionary:
	var bag1Data: Dictionary = {}
	var bagDataSize: int = DownPanel_GetBagDataLength()
	if (0 <= index) and (bagDataSize > index):
		bag1Data = m_DownPanelInfo.panelData.bagData[index]
	else:
		HQH.AssertLog("DownPanel_GetBagDataByIndex, index: %s is out of range: [0, %s)" % [index, bagDataSize])
	
	return bag1Data

func DownPanel_GetBagDataLength() -> int:
	return m_DownPanelInfo.panelData.bagData.size()

func DownPanel_SetBagFromSaveGameData_Archive():
	var archive_BagList: Array = SaveGameManager.GetSaveGameData_Archive_BagList()
	var currentBagNumber: int = DownPanel_GetBagDataLength()
	for i in currentBagNumber:
		var isValidBag: bool = false
		var bagResourceName: String = ""
		var bagNumber: int = 0
		var bagCDStartTimeInMilliseconds: int = 0
		var bagCDLengthTimeInMilliseconds: int = 0
		var goodsTypeID: int = 0
		if archive_BagList.size() > i:
			isValidBag = true
			var bagInfo: Dictionary = SaveGameManager.GetSaveGameData_Archive_BagList_BagInfoByIndex(i)
			if not bagInfo.empty():
				goodsTypeID = bagInfo.bagGoodsTypeID
				var goodsInfo: Dictionary = TableManager.GetGoodsInfo(bagInfo.bagGoodsTypeID)
				if not goodsInfo.empty():
					bagResourceName = goodsInfo.goodsIcon
		
		DownPanel_SetBagDataByIndex(i, isValidBag, bagResourceName, bagNumber, bagCDStartTimeInMilliseconds, bagCDLengthTimeInMilliseconds, goodsTypeID)
	
	DownPanel_SetBag()

func DownPanel_Bag_Get(goodsTypeID: int) -> Dictionary:
	return SaveGameManager.GetSaveGameData_Archive_BagList_BagInfoByGoodsTypeID(goodsTypeID)

func BagAddGoodsRunFunction(goodsAddFunction: String, goodsTypeID: int):
	if not goodsAddFunction.empty():
		HQH.Log("BagAddGoodsRunFunction, call(goodsAddFunction: %s, goodsTypeID: %s)" % [goodsAddFunction, goodsTypeID])
		call(goodsAddFunction, goodsTypeID)

func DownPanel_Bag_Add(goodsTypeID: int):
	var bagCurrentSize: int = SaveGameManager.GetSaveGameData_Archive_BagList().size()
	if SaveGameManager.IsGoodsUsedHas_Bag():
		if DOWN_PANEL_BAG_NUMBER_MAX <= bagCurrentSize:
			DownPanel_AddJournalRecordWithStringKey("BAG_IS_FULL")
			
			return
	else:
		if DOWN_PANEL_BAG_FIRST_LINE_NUMBER <= bagCurrentSize:
			DownPanel_AddJournalRecordWithStringKey("NO_BAG_NO_MORE_ITEMS")
			
			return
	
	var bagGoodsData: int = 0
	var goodsInfo: Dictionary = TableManager.GetGoodsInfo(goodsTypeID)
	if not goodsInfo.empty():
		bagGoodsData = goodsInfo.goodsUseMaxNumber
	else:
		HQH.AssertLog("DownPanel_Bag_Add, goodsInfo.empty() is true, invalid goodsTypeID: %s" % goodsTypeID)
		
		return
	
	var isSuccess: bool = SaveGameManager.AddSaveGameData_Archive_BagList(goodsTypeID, bagGoodsData)
	if isSuccess:
		DownPanel_AddJournalRecord(TableManager.GetLanguageString("BAG_ADD") % RichTextLabel_GetStringWithClickEvent(TableManager.GetLanguageString(goodsInfo.goodsName), "%s%s" % [UI_INPUT_ACTION_EVENT_TYPE.EVENT_GOODS, goodsTypeID]))
		BagAddGoodsRunFunction(goodsInfo.goodsAddFunction, goodsTypeID)
		DownPanel_SetBagFromSaveGameData_Archive()

func BagRemoveGoodsRunFunction(goodsRemoveFunction: String, goodsTypeID: int):
	if not goodsRemoveFunction.empty():
		HQH.Log("BagRemoveGoodsRunFunction, call(goodsRemoveFunction: %s, goodsTypeID: %s)" % [goodsRemoveFunction, goodsTypeID])
		call(goodsRemoveFunction, goodsTypeID)

func DownPanel_Bag_Remove(goodsTypeID: int):
	var isSuccess: bool = SaveGameManager.RemoveSaveGameData_Archive_BagList(goodsTypeID)
	if isSuccess:
		DownPanel_SetBagFromSaveGameData_Archive()

func DownPanel_Bag_RemoveByIndex(index: int):
	var goodsRemoveFunction: String = ""
	var goodsTypeID: int = 0
	var bagInfo: Dictionary = SaveGameManager.GetSaveGameData_Archive_BagList_BagInfoByIndex(index)
	var goodsInfo: Dictionary = {}
	if not bagInfo.empty():
		goodsTypeID = bagInfo.bagGoodsTypeID
		goodsInfo = TableManager.GetGoodsInfo(bagInfo.bagGoodsTypeID)
		if not goodsInfo.empty():
			goodsRemoveFunction = goodsInfo.goodsRemoveFunction
	
	var isSuccess: bool = SaveGameManager.RemoveSaveGameData_Archive_BagListByIndex(index)
	if isSuccess:
		DownPanel_AddJournalRecord(TableManager.GetLanguageString("BAG_REMOVE") % TableManager.GetLanguageString(goodsInfo.goodsName))
		BagRemoveGoodsRunFunction(goodsRemoveFunction, goodsTypeID)
		DownPanel_SetBagFromSaveGameData_Archive()

func DownPanel_Bag_Update(goodsTypeID: int, bagGoodsData: int):
	var isSuccess: bool = SaveGameManager.UpdateSaveGameData_Archive_BagListByGoodsTypeID(goodsTypeID, bagGoodsData)
	if isSuccess:
		DownPanel_SetBagFromSaveGameData_Archive()

func BagUseGoodsRunFunction(goodsUseFunction: String, goodsTypeID: int):
	if not goodsUseFunction.empty():
		HQH.Log("BagUseGoodsRunFunction, call(goodsUseFunction: %s, goodsTypeID: %s)" % [goodsUseFunction, goodsTypeID])
		call(goodsUseFunction, goodsTypeID)

func GetAvatarShowNameWithColor(avatarTypeID: int) -> String:
	return RichTextLabel_GetStringWithFlagColor(TableManager.GetAvatarShowName(avatarTypeID), TableManager.GetAvatarFlagColor(avatarTypeID).to_html())

func GetCurrentActiveAvatarShowNameWithColor() -> String:
	return GetAvatarShowNameWithColor(AvatarManager.GetCurrentActiveAvatarTypeID())

func Avatar_AddJournalRecord(avatarTypeID: int, contentStringKey: String):
	Avatar_AddJournalRecordString(avatarTypeID, TableManager.GetLanguageString(contentStringKey))

func Avatar_AddJournalRecordString(avatarTypeID: int, contentString: String):
	DownPanel_AddJournalRecord("%s: %s" % [GetAvatarShowNameWithColor(avatarTypeID), contentString])

func CurrentActiveAvatar_AddJournalRecord(contentStringKey: String):
	CurrentActiveAvatar_AddJournalRecordString(TableManager.GetLanguageString(contentStringKey))

func CurrentActiveAvatar_AddJournalRecordString(contentString: String):
	Avatar_AddJournalRecordString(AvatarManager.GetCurrentActiveAvatarTypeID(), contentString)

func NPCArticle_AddJournalRecord(nPCArticleTriggerTypeID: int, contentStringKey: String):
	NPCArticle_AddJournalRecordString(nPCArticleTriggerTypeID, TableManager.GetLanguageString(contentStringKey))

func NPCArticle_AddJournalRecordString(nPCArticleTriggerTypeID: int, contentString: String):
	DownPanel_AddJournalRecord("%s: %s" % [TableManager.GetLanguageString(TableManager.GetNPCArticleTriggerInfoShowNameKey(nPCArticleTriggerTypeID)), contentString])

func Goods_AddJournalRecord(goodsTypeID: int, contentStringKey: String):
	Goods_AddJournalRecordString(goodsTypeID, TableManager.GetLanguageString(contentStringKey))

func Goods_AddJournalRecordString(goodsTypeID: int, contentString: String):
	DownPanel_AddJournalRecord("%s: %s" % [TableManager.GetLanguageString(TableManager.GetGoodsInfoGoodsName(goodsTypeID)), contentString])

func Avatar_AddJournalRecordByAffixKeyRandom(avatarTypeID: int, affixKey: String):
	var affixKeyRandom: String = TableManager.GetAffixKeyRandom(affixKey)
	Avatar_AddJournalRecord(avatarTypeID, affixKeyRandom)

func CurrentActiveAvatar_AddJournalRecordByAffixKeyRandom(affixKey: String):
	var affixKeyRandom: String = TableManager.GetAffixKeyRandom(affixKey)
	CurrentActiveAvatar_AddJournalRecord(affixKeyRandom)

func GoodsAddFunction_Foot(_goodsTypeID: int):
	CurrentActiveAvatar_AddJournalRecordByAffixKeyRandom("GOODSADDFUNCTION_FOOT_")

func GoodsRemoveFunction_Foot(goodsTypeID: int):
	CurrentActiveAvatar_AddJournalRecordByAffixKeyRandom("GOODSREMOVEFUNCTION_FOOT_")
	SaveGameManager.RemoveSaveGameData_Archive_GoodsUsedListByGoodsTypeID(goodsTypeID)
	NavigationManager.CheckIsAStarCanRun()

func GoodsUseFunction_Foot(goodsTypeID: int):
	CurrentActiveAvatar_AddJournalRecordByAffixKeyRandom("GOODSUSEFUNCTION_PUTONEQUIP_FOOT_")
	SaveGameManager.AddSaveGameData_Archive_GoodsUsedList(goodsTypeID)
	NavigationManager.CheckIsAStarCanRun()

func GoodsAddFunction_Wig(_goodsTypeID: int):
	var currentActiveAvatar: KinematicBody2DAvatar = AvatarManager.GetCurrentActiveAvatarInstance()
	if TableManager.AVATARTYPEID_SILVERCARP1 == currentActiveAvatar.GetAvatarTypeID():
		CurrentActiveAvatar_AddJournalRecordByAffixKeyRandom("GOODSADDFUNCTION_WIG_")
	else:
		CurrentActiveAvatar_AddJournalRecordByAffixKeyRandom("GOODSADDFUNCTION_WIG_OTHER_")

func GoodsRemoveFunction_Wig(_goodsTypeID: int):
	for iv in SceneManager.GetCurrentSceneNode2DAvatarChildren():
		var isRemoveSuccess: bool = iv.RemoveEquip()
		if isRemoveSuccess:
			SaveGameManager.UpdateSaveGameData_Archive_AvatarListByAvatarTypeID_equipTypeID(iv.GetAvatarTypeID(), 0)
			Avatar_AddJournalRecordByAffixKeyRandom(iv.GetAvatarTypeID(), "GOODSREMOVEFUNCTION_WIG_")

func GoodsUseFunction_Wig(goodsTypeID: int):
	var goodsInfo: Dictionary = TableManager.GetGoodsInfo(goodsTypeID)
	if goodsInfo.empty():
		return
	
	var equipTypeID: int = goodsInfo.equipTypeID
	var currentActiveAvatar: KinematicBody2DAvatar = AvatarManager.GetCurrentActiveAvatarInstance()
	if TableManager.AVATARTYPEID_SILVERCARP1 == currentActiveAvatar.GetAvatarTypeID():
		currentActiveAvatar.PutOnEquip(equipTypeID)
		SaveGameManager.UpdateSaveGameData_Archive_AvatarListByAvatarTypeID_equipTypeID(AvatarManager.GetCurrentActiveAvatarTypeID(), goodsInfo.equipTypeID)
		
		CurrentActiveAvatar_AddJournalRecordByAffixKeyRandom("GOODSUSEFUNCTION_PUTONEQUIP_WIG_")
	else:
		CurrentActiveAvatar_AddJournalRecordByAffixKeyRandom("CANNOT_WEAR_IT_LOBBYIST_WIG_")

func GoodsAddFunction_Telescope(_goodsTypeID: int):
	CurrentActiveAvatar_AddJournalRecordByAffixKeyRandom("GOODSADDFUNCTION_TELESCOPE_")

func GoodsRemoveFunction_Telescope(goodsTypeID: int):
	CurrentActiveAvatar_AddJournalRecordByAffixKeyRandom("GOODSREMOVEFUNCTION_TELESCOPE_")
	SaveGameManager.RemoveSaveGameData_Archive_GoodsUsedListByGoodsTypeID(goodsTypeID)
	SceneManager.TileMapWarFog_SetAvatarVisualFieldSharpType_AvatarVisualFieldSharpType_FromSaveGameData_Archive()

func Avatar_AddJournalRecord_Telescope(avatarTyepID: int):
	var avatarAttribute_VisualFieldDistance: int = SaveGameManager.GetSaveGameData_Archive_AvatarAttribute_VisualFieldDistance()
	var visualFieldDistance: int = SaveGameManager.GetSaveGameData_Archive_VisualFieldDistance()
	var visualFieldSharpType: int = SaveGameManager.GetSaveGameData_Archive_VisualFieldSharpType()
	var visualFieldString: String = ""
	if avatarAttribute_VisualFieldDistance != visualFieldDistance:
		visualFieldString = TableManager.GetLanguageString("GOODS_TELESCOPE_VISUALFIELDDISTANCE2") % [String(visualFieldDistance), String(visualFieldDistance - avatarAttribute_VisualFieldDistance)]
	else:
		visualFieldString = TableManager.GetLanguageString("GOODS_TELESCOPE_VISUALFIELDDISTANCE") % String(visualFieldDistance)
		
	match visualFieldSharpType:
		HQH.VISUAL_FIELD_SHARP_TYPE.RHOMBUS:
			visualFieldString += TableManager.GetLanguageString("GOODS_TELESCOPE_VISUALFIELDSHARPTYPE") % TableManager.GetLanguageString("GOODS_TELESCOPE_VISUALFIELDSHARPTYPE_RHOMBUS")
			
		HQH.VISUAL_FIELD_SHARP_TYPE.EGG:
			visualFieldString += TableManager.GetLanguageString("GOODS_TELESCOPE_VISUALFIELDSHARPTYPE") % TableManager.GetLanguageString("GOODS_TELESCOPE_VISUALFIELDSHARPTYPE_EGG")
	
	Avatar_AddJournalRecordString(avatarTyepID, visualFieldString)
	if HQH.VISUAL_FIELD_DISTANCE_MAX == visualFieldDistance:
		Avatar_AddJournalRecord(avatarTyepID, "VISUAL_RANGE_IS_AT_MAXIMUM")

func GetTelescopeVisualFieldDistanceNew(visualFieldDistanceOld: int) -> int:
	return HQH.RandomModRange(int(min(HQH.VISUAL_FIELD_DISTANCE_MAX, visualFieldDistanceOld + 1)), HQH.VISUAL_FIELD_DISTANCE_MAX)

func SetTelescope(avatarTyepID: int, isAdd: bool):
	var visualFieldDistanceOld: int = SaveGameManager.GetSaveGameData_Archive_VisualFieldDistance()
	var visualFieldDistanceNew: int = GetTelescopeVisualFieldDistanceNew(visualFieldDistanceOld)
	if isAdd:
		SaveGameManager.AddSaveGameData_Archive_GoodsUsedList(TableManager.GOODSTYPEID_TELESCOPE, visualFieldDistanceNew, HQH.RandomD2())
	else:
		SaveGameManager.UpdateSaveGameData_Archive_GoodsUsedList(TableManager.GOODSTYPEID_TELESCOPE, visualFieldDistanceNew, HQH.RandomD2())
	
	SceneManager.TileMapWarFog_SetAvatarVisualFieldSharpType_AvatarVisualFieldSharpType_FromSaveGameData_Archive()
	SceneManager.TileMapWarFog_ResetLastActiveAvatarPositionInMap()
	
	Avatar_AddJournalRecord_Telescope(avatarTyepID)

func GoodsUseFunction_Telescope(_goodsTypeID: int):
	var avatarAttribute_VisualFieldDistance: int = SaveGameManager.GetSaveGameData_Archive_AvatarAttribute_VisualFieldDistance()
	var visualFieldDistanceOld: int = SaveGameManager.GetSaveGameData_Archive_VisualFieldDistance()
	if avatarAttribute_VisualFieldDistance == visualFieldDistanceOld:
		CurrentActiveAvatar_AddJournalRecordByAffixKeyRandom("GOODSUSEFUNCTION_PUTONEQUIP_TELESCOPE_")
		SetTelescope(AvatarManager.GetCurrentActiveAvatarTypeID(), true)
	else:
		CurrentActiveAvatar_AddJournalRecord("HAVE_ALREADY_USED")

func GoodsAddFunction_Bag():
	var goodsTypeID: int = TableManager.GOODSTYPEID_BAG
	var goodsInfo: Dictionary = TableManager.GetGoodsInfo(goodsTypeID)
	DownPanel_AddJournalRecord(TableManager.GetLanguageString("BAG_ADD") % RichTextLabel_GetStringWithClickEvent(TableManager.GetLanguageString(goodsInfo.goodsName), UI_INPUT_ACTION_EVENT_TYPE.EVENT_BAG))
	SaveGameManager.AddSaveGameData_Archive_GoodsUsedList(goodsTypeID)
	DownPanel_SetCommonTextureButtonBag1Visible()

func GoodsAddFunction_JournalRecordBook():
	var goodsTypeID: int = TableManager.GOODSTYPEID_JOURNALRECORDBOOK
	var goodsInfo: Dictionary = TableManager.GetGoodsInfo(goodsTypeID)
	DownPanel_AddJournalRecord(TableManager.GetLanguageString("BAG_ADD") % RichTextLabel_GetStringWithClickEvent(TableManager.GetLanguageString(goodsInfo.goodsName), UI_INPUT_ACTION_EVENT_TYPE.EVENT_JOURNALRECORDBOOK))
	SaveGameManager.AddSaveGameData_Archive_GoodsUsedList(goodsTypeID)
	DownPanel_SetCommonTextureButtonBookJournalRecordVisible()

func GoodsUseFunction_Letter3(goodsTypeID: int):
	Goods_AddJournalRecord(goodsTypeID, "GOODS_DESCRIPTION_13")

func GoodsUseFunction_HousekeeperKey(goodsTypeID: int):
	Goods_AddJournalRecord(goodsTypeID, "GOODS_DESCRIPTION_HOUSEKEEPERKEY")

func GoodsUseFunction_ButlerKey(goodsTypeID: int):
	Goods_AddJournalRecord(goodsTypeID, "GOODS_DESCRIPTION_BUTLERKEY")

func GoodsUseFunction_QueenKey(goodsTypeID: int):
	Goods_AddJournalRecord(goodsTypeID, "GOODS_DESCRIPTION_QUEENKEY")

func GoodsUseFunction_ThreeHeadsDragon3(goodsTypeID: int):
	Goods_AddJournalRecord(goodsTypeID, "GOODS_DESCRIPTION_17")

func DownPanel_Bag_UseByIndex(index: int):
	var bagInfo: Dictionary = SaveGameManager.GetSaveGameData_Archive_BagList_BagInfoByIndex(index)
	if bagInfo.empty():
		return
	
	var goodsTypeID: int = bagInfo.bagGoodsTypeID
	var goodsInfo: Dictionary = TableManager.GetGoodsInfo(goodsTypeID)
	if goodsInfo.empty():
		return
	
	if 0 < goodsInfo.goodsUseMaxNumber:
		# Limit on use number 
		var bagGoodsData: int = SaveGameManager.GetSaveGameData_Archive_BagList_BagGoodsDataByIndex(index)
		if 0 >= bagGoodsData:
			HQH.Log("DownPanel_Bag_UseByIndex, 0 >= bagGoodsData: %s" % bagGoodsData)
			
			return
		
		var isSuccess: bool = SaveGameManager.UpdateSaveGameData_Archive_BagListByIndex(index, bagGoodsData - 1)
		if not isSuccess:
			return
	
	DownPanel_AddJournalRecord(TableManager.GetLanguageString("BAG_USE") % TableManager.GetLanguageString(goodsInfo.goodsName))
	BagUseGoodsRunFunction(goodsInfo.goodsUseFunction, goodsTypeID)
	DownPanel_SetBagDataByIndex_CD(index)
	DownPanel_SetBag()

func DownPanel_Bag_UpdateByIndex(index: int, bagGoodsData: int) -> bool:
	var isSuccess: bool = SaveGameManager.UpdateSaveGameData_Archive_BagListByIndex(index, bagGoodsData)
	if isSuccess:
		DownPanel_SetBagFromSaveGameData_Archive()
	
	return isSuccess

func DownPanel_GetIsShowDetailedBag() -> bool:
	if DownPanel_IsVisible():
		return m_DownPanelInfo.panelInstance.GetIsShowDetailedBag()
	
	return false

func DownPanel_GetBagSelectedVisible() -> bool:
	if DownPanel_IsVisible():
		return m_DownPanelInfo.panelInstance.GetBagSelectedVisible()
	
	return false

func DownPanel_GetCommonTextureButtonBag1Visible() -> bool:
	if DownPanel_IsVisible():
		return m_DownPanelInfo.panelInstance.GetCommonTextureButtonBag1Visible()
	
	return false

func DownPanel_SetCommonTextureButtonBag1Visible():
	if DownPanel_IsVisible():
		return m_DownPanelInfo.panelInstance.SetCommonTextureButtonBag1Visible()
	
	return false

func DownPanel_CommonTextureButtonBag1_SetPressedTrue():
	if DownPanel_GetCommonTextureButtonBag1Visible():
		m_DownPanelInfo.panelInstance.CommonTextureButtonBag1_SetPressedTrue()

func DownPanel_GetCommonTextureButtonBookJournalRecordVisible() -> bool:
	if DownPanel_IsVisible():
		return m_DownPanelInfo.panelInstance.GetCommonTextureButtonBookJournalRecordVisible()
	
	return false

func DownPanel_SetCommonTextureButtonBookJournalRecordVisible():
	if DownPanel_IsVisible():
		return m_DownPanelInfo.panelInstance.SetCommonTextureButtonBookJournalRecordVisible()
	
	return false

func DownPanel_CommonTextureButtonBookJournalRecord_SetPressedTrue():
	if DownPanel_GetCommonTextureButtonBookJournalRecordVisible():
		m_DownPanelInfo.panelInstance.CommonTextureButtonBookJournalRecord_SetPressedTrue()

func DownPanel_CommonTextureButtonInteraction1_SetPressedTrue():
	if DownPanel_IsVisible():
		m_DownPanelInfo.panelInstance.CommonTextureButtonInteraction1_SetPressedTrue()

func DownPanel_CommonTextureButtonPlayChess1_SetPressedTrue():
	if DownPanel_IsVisible():
		m_DownPanelInfo.panelInstance.CommonTextureButtonPlayChess1_SetPressedTrue()

func TeamPanel_SetItem():
	if TeamPanel_IsVisible():
		m_TeamPanelInfo.panelInstance.SetItem()

func TeamPanel_SetItemDataByIndex(index: int, isValidItem: bool, itemResourceName: String, itemNumber: int, itemCDStartTimeInMilliseconds: int, itemCDLengthTimeInMilliseconds: int, typeID: int):
	var itemDataSize: int = TeamPanel_GetItemDataLength()
	if (0 <= index) and (itemDataSize > index):
		var item1Data: Dictionary = TeamPanel_GetItemDataByIndex(index)
		item1Data.isValidItem = isValidItem
		if item1Data.isValidItem:
			item1Data.itemResourceName = itemResourceName
			item1Data.itemNumber = itemNumber
			item1Data.itemCDStartTimeInMilliseconds = itemCDStartTimeInMilliseconds
			item1Data.itemCDLengthTimeInMilliseconds = itemCDLengthTimeInMilliseconds
			item1Data.typeID = typeID
		else:
			item1Data.itemResourceName = ""
			item1Data.itemNumber = 0
			item1Data.itemCDStartTimeInMilliseconds = 0
			item1Data.itemCDLengthTimeInMilliseconds = 0
			item1Data.typeID = 0
	else:
		HQH.AssertLog("TeamPanel_SetItemDataByIndex, index: %s is out of range: [0, %s)" % [index, itemDataSize])

func TeamPanel_SetItemDataCDByIndex(index: int, itemCDStartTimeInMilliseconds: int, itemCDLengthTimeInMilliseconds: int):
	var isValidItem: bool = false
	var itemDataSize: int = TeamPanel_GetItemDataLength()
	if (0 <= index) and (itemDataSize > index):
		var item1Data: Dictionary = TeamPanel_GetItemDataByIndex(index)
		isValidItem = item1Data.isValidItem
		if item1Data.isValidItem:
			item1Data.itemCDStartTimeInMilliseconds = itemCDStartTimeInMilliseconds
			item1Data.itemCDLengthTimeInMilliseconds = itemCDLengthTimeInMilliseconds
	else:
		HQH.AssertLog("TeamPanel_SetItemDataCDByIndex, index: %s is out of range: [0, %s)" % [index, itemDataSize])
	
	return isValidItem

func TeamPanel_SetItemAvatarIcon():
	if not TeamPanel_IsVisible():
		return
	
	var i: int = 0
	var currentActiveIndex: int = AvatarManager.GetActiveAvatarIndexInCreateAvatarInfoList()
	for iv in AvatarManager.GetCreateAvatarInfoList():
		var headIconResourceName: String = TableManager.GetAvatarHeadIconResourceName(iv.avatarTypeID)
		var isCurrentActive: bool = (currentActiveIndex == i)
		if not isCurrentActive:
			var isValidItem: bool = true
			var itemResourceName: String = headIconResourceName
			var itemNumber: int = 0
			var itemCDStartTimeInMilliseconds: int = 0
			var itemCDLengthTimeInMilliseconds: int = 0
			var typeID: int = iv.avatarTypeID
			TeamPanel_SetItemDataByIndex(currentActiveIndex - AvatarManager.ACTIVEAVATAR_NUMBER - i, isValidItem, itemResourceName, itemNumber, itemCDStartTimeInMilliseconds, itemCDLengthTimeInMilliseconds, typeID)
		else:
			TeamPanel_SetCurrentAvatar(iv.avatarTypeID)
		
		i = i + 1
	
	var itemDataSize: int = TeamPanel_GetItemDataLength()
	var beginIndex = i - AvatarManager.ACTIVEAVATAR_NUMBER
	if itemDataSize > beginIndex:
		for index in range(beginIndex, itemDataSize):
			var isValidItem: bool = false
			var itemResourceName: String = ""
			var itemNumber: int = 0
			var itemCDStartTimeInMilliseconds: int = 0
			var itemCDLengthTimeInMilliseconds: int = 0
			var typeID: int = 0
			TeamPanel_SetItemDataByIndex(index, isValidItem, itemResourceName, itemNumber, itemCDStartTimeInMilliseconds, itemCDLengthTimeInMilliseconds, typeID)
	
	TeamPanel_SetItem()

func TeamPanel_SetItemAvatarIconCD(isIncrease: bool):
	var itemCDStartTimeInMilliseconds: int = HQH.MilliTime()
	var itemDataSize: int = TeamPanel_GetItemDataLength()
	for i in itemDataSize:
		var itemCDLengthTimeInMilliseconds: int = UI_INPUT_ACTION_EVENT_TYPE_COMMONBUTTONITEM_TEXTUREBUTTON1_PRESSED_EVENT_CD_MIN_MILLISECONDS_NUMBER
		if isIncrease:
			itemCDLengthTimeInMilliseconds = (i + 1) * UI_INPUT_ACTION_EVENT_TYPE_COMMONBUTTONITEM_TEXTUREBUTTON1_PRESSED_EVENT_CD_MIN_MILLISECONDS_NUMBER
		
		var isValidItem: bool = TeamPanel_SetItemDataCDByIndex(i, itemCDStartTimeInMilliseconds, itemCDLengthTimeInMilliseconds)
		if not isValidItem:
			break
	
	TeamPanel_SetItem()

func TeamPanel_GetItemDataByIndex(index: int) -> Dictionary:
	var item1Data: Dictionary = {}
	var itemDataSize: int = TeamPanel_GetItemDataLength()
	if (0 <= index) and (itemDataSize > index):
		item1Data = m_TeamPanelInfo.panelData.itemData[index]
	else:
		HQH.AssertLog("TeamPanel_GetItemDataByIndex, index: %s is out of range: [0, %s)" % [index, itemDataSize])
	
	return item1Data

func TeamPanel_GetItemDataLength() -> int:
	return m_TeamPanelInfo.panelData.itemData.size()

func DownPanel_GetCommonTextureButtonInteraction1Visible() -> bool:
	var isVisible: bool = false
	if DownPanel_IsVisible():
		isVisible = m_DownPanelInfo.panelInstance.GetCommonTextureButtonInteraction1Visible()
	
	return isVisible

func DownPanel_SetCommonTextureButtonInteraction1Visible(v: bool):
	if DownPanel_IsVisible():
		m_DownPanelInfo.panelInstance.SetCommonTextureButtonInteraction1Visible(v)

func DownPanel_SetControlInteraction_commonTextureButtonInteraction1(isTalk: bool):
	m_DownPanelInfo.panelInstance.SetControlInteraction_commonTextureButtonInteraction1(isTalk)

func DownPanel_GetCommonTextureButtonPlayChess1Visible() -> bool:
	var isVisible: bool = false
	if DownPanel_IsVisible():
		isVisible = m_DownPanelInfo.panelInstance.GetCommonTextureButtonPlayChess1Visible()
	
	return isVisible

func DownPanel_SetCommonTextureButtonPlayChess1Visible(v: bool):
	if DownPanel_IsVisible():
		m_DownPanelInfo.panelInstance.SetCommonTextureButtonPlayChess1Visible(v)

func DownPanel_on_commonTextureButtonBookJournalRecord_pressed():
	HQH.Log("DownPanel_on_commonTextureButtonBookJournalRecord_pressed")
	
	JournalRecordPanel_Show()

func DownPanel_on_commonTextureButtonBag1_pressed():
	m_DownPanelInfo.panelInstance._on_commonTextureButtonBag1_pressed()

func DownPanel_SetBagButtonListPressedTrue():
	m_DownPanelInfo.panelInstance.SetBagButtonListPressedTrue()

func SaveTask(initWrangleDialogTypeID: int , currentWrangleDialogTypeID: int):
	HQH.Log("SaveTask, initWrangleDialogTypeID: %s, currentWrangleDialogTypeID: %s" % [initWrangleDialogTypeID, currentWrangleDialogTypeID])
	
	SaveGameManager.AddSaveGameData_Archive_TaskList(initWrangleDialogTypeID, currentWrangleDialogTypeID)

func SaveCurrentTask(currentWrangleDialogTypeID: int):
	HQH.Log("SaveCurrentTask, currentWrangleDialogTypeID: %s" % currentWrangleDialogTypeID)
	
	if GetIsInInteraction():
		SaveTask(m_DownPanelInfo.panelData.interactionInfo.wrangleDialogInfo.initWrangleDialogTypeID, currentWrangleDialogTypeID)
	else:
		HQH.AssertLog("SaveCurrentTask, not GetIsInInteraction()")

func DownPanel_CheckWrangleDialogTerminate(index: int):
	HQH.Log("DownPanel_CheckWrangleDialogTerminate, index: %s" % index)
	
	if DownPanel_WrangleDialogGetIsVisible():
		if GetIsInInteraction():
			var choiceWrangleDialogTypeID: int = TableManager.GetWrangleDialogInfoChoiceWrangleDialogTypeID(m_DownPanelInfo.panelData.interactionInfo.wrangleDialogInfo.currentWrangleDialogTypeID, index)
			if 0 == choiceWrangleDialogTypeID:
				DownPanel_WrangleDialogTerminate()
			else:
				var isSaveChoice: bool = TableManager.GetWrangleDialogInfoIsSaveChoice(m_DownPanelInfo.panelData.interactionInfo.wrangleDialogInfo.currentWrangleDialogTypeID)
				m_DownPanelInfo.panelData.interactionInfo.wrangleDialogInfo.currentWrangleDialogTypeID = choiceWrangleDialogTypeID
				if isSaveChoice:
					SaveCurrentTask(m_DownPanelInfo.panelData.interactionInfo.wrangleDialogInfo.currentWrangleDialogTypeID)
				
				DownPanel_UpdateWrangleDialog()

func DownPanel_on_commonTextureButtonWrangleDialog_pressed(index: int):
	HQH.Log("DownPanel_on_commonTextureButtonWrangleDialog_pressed, index: %s" % index)
	
	if DownPanel_WrangleDialogGetIsVisible():
		if 0 <= m_DownPanelInfo.panelData.bagButtonListCurrentSelectIndex_Discard:
			var contentStringKey: String = ""
			if 0 == index:
				contentStringKey = "DOWNPANEL_WRANGLEDIALOG_ASK_DISCARD_YES"
				DownPanel_Bag_RemoveByIndex(m_DownPanelInfo.panelData.bagButtonListCurrentSelectIndex_Discard)
			else:
				contentStringKey = "DOWNPANEL_WRANGLEDIALOG_ASK_DISCARD_NO"
			
			CurrentActiveAvatar_AddJournalRecord(contentStringKey)
			m_DownPanelInfo.panelData.bagButtonListCurrentSelectIndex_Discard = -1
			DownPanel_WrangleDialogSetIsVisible(false)
		elif GetIsInInteraction():
			var wrangleDialogInfo_buttonFunction: String = TableManager.GetWrangleDialogInfoButtonFunction(m_DownPanelInfo.panelData.interactionInfo.wrangleDialogInfo.currentWrangleDialogTypeID, index)
			if not wrangleDialogInfo_buttonFunction.empty():
				var wrangleDialogInfo_buttonString: String = TableManager.GetWrangleDialogInfoButtonString(m_DownPanelInfo.panelData.interactionInfo.wrangleDialogInfo.currentWrangleDialogTypeID, index)
				AvatarManager.CurrentActiveAvatarPlayTalk(wrangleDialogInfo_buttonString.length())
				CurrentActiveAvatar_AddJournalRecordString(wrangleDialogInfo_buttonString)
				
				HQH.Log("DownPanel_on_commonTextureButtonWrangleDialog_pressed, call(wrangleDialogInfo_buttonFunction: %s)" % wrangleDialogInfo_buttonFunction)
				call(wrangleDialogInfo_buttonFunction)
				
				DownPanel_CheckWrangleDialogTerminate(index)

func DownPanel_WrangleDialog_OnKeyPressed(index: int):
	HQH.Log("DownPanel_WrangleDialog_OnKeyPressed, index: %s" % index)
	
	if DownPanel_WrangleDialogGetIsVisible():
		var isButtonValid: bool = false
		if 0 <= m_DownPanelInfo.panelData.bagButtonListCurrentSelectIndex_Discard:
			isButtonValid = true
		elif GetIsInInteraction():
			var wrangleDialogInfo_buttonFunction: String = TableManager.GetWrangleDialogInfoButtonFunction(m_DownPanelInfo.panelData.interactionInfo.wrangleDialogInfo.currentWrangleDialogTypeID, index)
			if not wrangleDialogInfo_buttonFunction.empty():
				isButtonValid = true
		
		if isButtonValid:
			DownPanel_WrangleDialog_CommonTextureButtonWrangleDialog_SetPressedTrue(index)
			DownPanel_WrangleDialog_on_commonTextureButtonWrangleDialog_pressed(index)

func DownPanel_WrangleDialog_CommonTextureButtonWrangleDialog_SetPressedTrue(index: int):
	if DownPanel_WrangleDialogGetIsVisible():
		m_DownPanelInfo.panelInstance.CommonTextureButtonWrangleDialog_SetPressedTrue(index)

func DownPanel_WrangleDialog_on_commonTextureButtonWrangleDialog_pressed(index: int):
	match index:
		0:
			m_DownPanelInfo.panelInstance._on_commonTextureButtonWrangleDialog1_pressed()
		
		1:
			m_DownPanelInfo.panelInstance._on_commonTextureButtonWrangleDialog2_pressed()
		
		2:
			m_DownPanelInfo.panelInstance._on_commonTextureButtonWrangleDialog3_pressed()
		
		3:
			m_DownPanelInfo.panelInstance._on_commonTextureButtonWrangleDialog4_pressed()
		
		4:
			m_DownPanelInfo.panelInstance._on_commonTextureButtonWrangleDialog5_pressed()
		
		5:
			m_DownPanelInfo.panelInstance._on_commonTextureButtonWrangleDialog6_pressed()
		
		6:
			m_DownPanelInfo.panelInstance._on_commonTextureButtonWrangleDialog7_pressed()

func DownPanel_on_commonButtonWrangleDialogContinue_pressed():
	HQH.Log("DownPanel_on_commonButtonWrangleDialogContinue_pressed")
	
	DownPanel_CheckWrangleDialogTerminate(0)

func IsNoFullScreenPanelVisible() -> bool:
	return (not DebugMenuPanel_IsVisible()) and (not JournalRecordPanel_IsVisible()) and (not LanguagePanel_IsVisible()) and (not OptionPanel_IsVisible()) and (not ChessPanel1_IsVisible())

func DownPanel_OnEscButtonPressed() -> bool:
	if DownPanel_IsVisible():
		if IsNoFullScreenPanelVisible():
			if DownPanel_WrangleDialogGetIsVisible():
				DownPanel_WrangleDialogClose()
				
				return true
			else:
				if DownPanel_GetIsShowDetailedBag():
					DownPanel_on_commonTextureButtonBag1_pressed()
					
					return true
				else:
					if DownPanel_GetBagSelectedVisible():
						DownPanel_SetBagButtonListPressedTrue()
						
						return true
	
	return false

func TeamPanel_OnControlItemButtonListCommonButtonItemPressed(index: int):
	if TeamPanel_IsVisible():
		m_TeamPanelInfo.panelInstance.OnControlItemButtonListCommonButtonItemPressed(index)

func DownPanel_WrangleDialog_GetContentAndButton(wrangleDialogTypeID: int, wrangleDialogButtonStringArray: Array) -> String:
	var wrangleDialogInfo: Dictionary = TableManager.GetWrangleDialogInfo(wrangleDialogTypeID)
	for i in WRANGLEDIALOG_NUMBER_MAX:
		var wrangleDialogInfo_buttonString: String = TableManager.GetWrangleDialogInfoButtonString(wrangleDialogTypeID, i)
		if not wrangleDialogInfo_buttonString.empty():
			wrangleDialogButtonStringArray.append(wrangleDialogInfo_buttonString)
	
	return TableManager.GetLanguageString(wrangleDialogInfo.content)

func DownPanel_UpdateWrangleDialog():
	if DownPanel_WrangleDialogGetIsVisible():
		if GetIsInInteraction():
			var wrangleDialogButtonStringArray: Array = []
			var contentString: String = ""
			var showName: String = ""
			if TableManager.NPC_TRIGGER_TYPE.NPC_AVATAR == m_DownPanelInfo.panelData.interactionInfo.npcTriggerType:
				var nPCTriggerInfo: Dictionary = TableManager.GetNPCTriggerInfo(m_DownPanelInfo.panelData.interactionInfo.npcTriggerTypeID)
				contentString = DownPanel_WrangleDialog_GetContentAndButton(m_DownPanelInfo.panelData.interactionInfo.wrangleDialogInfo.currentWrangleDialogTypeID, wrangleDialogButtonStringArray)
				var avatarTypeID: int = SaveGameManager.GetSwallowPopAssignAvatarTypeID(nPCTriggerInfo.avatarTypeID)
				showName = GetAvatarShowNameWithColor(avatarTypeID)
				DownPanel_WrangleDialogSetDataForAvatar(avatarTypeID, contentString, wrangleDialogButtonStringArray)
			else: # TableManager.NPC_TRIGGER_TYPE.NPC_ARTICLE
				var nPCArticleTriggerInfo: Dictionary = TableManager.GetNPCArticleTriggerInfo(m_DownPanelInfo.panelData.interactionInfo.npcTriggerTypeID)
				contentString = DownPanel_WrangleDialog_GetContentAndButton(m_DownPanelInfo.panelData.interactionInfo.wrangleDialogInfo.currentWrangleDialogTypeID, wrangleDialogButtonStringArray)
				showName = TableManager.GetLanguageString(nPCArticleTriggerInfo.showNameKey)
				DownPanel_WrangleDialogSetDataForPicture(nPCArticleTriggerInfo.preloadResource, showName, contentString, wrangleDialogButtonStringArray)
			
			if m_DownPanelInfo.panelData.interactionInfo.wrangleDialogInfo.initWrangleDialogTypeID == m_DownPanelInfo.panelData.interactionInfo.wrangleDialogInfo.currentWrangleDialogTypeID:
				AvatarManager.InteractionNPCPlayTalk(contentString.length())
			
			DownPanel_AddJournalRecord("%s: %s" % [showName, contentString])

func DownPanel_on_commonTextureButtonInteraction1_pressed():
	if DownPanel_GetCommonTextureButtonInteraction1Visible():
		if GetIsInInteraction():
			HQH.Log("DownPanel_on_commonTextureButtonInteraction1_pressed")
			
			m_DownPanelInfo.panelData.bagButtonListCurrentSelectIndex_Discard = -1
			DownPanel_WrangleDialogOpen()
			
			var resultTaskInfo: Dictionary = SaveGameManager.GetSaveGameData_Archive_TaskList_TaskInfoByWrangleDialogTypeID(m_DownPanelInfo.panelData.interactionInfo.wrangleDialogInfo.initWrangleDialogTypeID)
			if resultTaskInfo.isHas:
				m_DownPanelInfo.panelData.interactionInfo.wrangleDialogInfo.currentWrangleDialogTypeID = resultTaskInfo.dataInfo.lastChoiceWrangleDialogTypeID
			else:
				m_DownPanelInfo.panelData.interactionInfo.wrangleDialogInfo.currentWrangleDialogTypeID = m_DownPanelInfo.panelData.interactionInfo.wrangleDialogInfo.initWrangleDialogTypeID
				SaveCurrentTask(m_DownPanelInfo.panelData.interactionInfo.wrangleDialogInfo.currentWrangleDialogTypeID)
			
			DownPanel_UpdateWrangleDialog()

func PlayChessStart(endInfo: Dictionary = CHESS_PANEL_1_END_INFO.duplicate(true)):
	if GetIsSwallowActionStart():
		if (TableManager.NPC_TRIGGER_TYPE.NONE != m_DownPanelInfo.panelData.interactionInfo.npcTriggerType) and (0 < m_DownPanelInfo.panelData.interactionInfo.npcTriggerTypeID):
			if TableManager.NPC_TRIGGER_TYPE.NPC_AVATAR == m_DownPanelInfo.panelData.interactionInfo.npcTriggerType:
				var nPCTriggerInfo: Dictionary = TableManager.GetNPCTriggerInfo(m_DownPanelInfo.panelData.interactionInfo.npcTriggerTypeID)
				Avatar_AddJournalRecord(nPCTriggerInfo.avatarTypeID, "IT_IS_GETTING_DARK_YOU_CAN_NOT_PLAY_CHESS")
			else: # TableManager.NPC_TRIGGER_TYPE.NPC_ARTICLE
				NPCArticle_AddJournalRecord(m_DownPanelInfo.panelData.interactionInfo.npcTriggerTypeID, "IT_IS_GETTING_DARK_YOU_CAN_NOT_PLAY_CHESS")
		else:
			DownPanel_AddJournalRecordWithStringKey("IT_IS_GETTING_DARK_YOU_CAN_NOT_PLAY_CHESS")
		
		return
	
	if GetIsInInteraction():
		HQH.Log("PlayChessStart")
		
		if (m_DownPanelInfo.panelData.interactionInfo.npcTriggerType == m_ChessPanel1Info.panelData.lastNPCTriggerType) and (m_DownPanelInfo.panelData.interactionInfo.npcTriggerTypeID == m_ChessPanel1Info.panelData.lastNPCTriggerTypeID):
			pass
		else:
			m_ChessPanel1Info.panelData.playChessCountList.clear()
		
		m_ChessPanel1Info.panelData.isInPlayChess = true
		m_ChessPanel1Info.panelData.npcTriggerType = m_DownPanelInfo.panelData.interactionInfo.npcTriggerType
		m_ChessPanel1Info.panelData.npcTriggerTypeID = m_DownPanelInfo.panelData.interactionInfo.npcTriggerTypeID
		m_ChessPanel1Info.panelData.endInfo = endInfo.duplicate(true)
		
		m_ChessPanel1Info.panelData.lastNPCTriggerType = m_ChessPanel1Info.panelData.npcTriggerType
		m_ChessPanel1Info.panelData.lastNPCTriggerTypeID = m_ChessPanel1Info.panelData.npcTriggerTypeID
		
		var startString: String = TableManager.GetLanguageString("CHESSPANEL1_PLAYCHESS_START")
		var playChessCountString: String = GetPlayChessCountListString(TableManager.PLAY_CHESS_COUNT_FLAG_START)
		playChessCountString += TableManager.PLAY_CHESS_COUNT_FLAG_START
		DownPanel_AddJournalRecord(startString + playChessCountString)
		
		var allAvatarPower: Dictionary = AvatarManager.GetAllAvatarPower()
		var npcPowerMin: int = 0
		var npcPowerMax: int = 0
		var conditionFalsePowerMin: int = 0
		var conditionFalsePowerMax: int = 0
		var showName: String = ""
		var playChessStartWordsKey: String = ""
		if TableManager.NPC_TRIGGER_TYPE.NPC_AVATAR == m_ChessPanel1Info.panelData.npcTriggerType:
			var nPCTriggerInfo: Dictionary = TableManager.GetNPCTriggerInfo(m_ChessPanel1Info.panelData.npcTriggerTypeID)
			var avatarTypeID: int = SaveGameManager.GetSwallowPopAssignAvatarTypeID(nPCTriggerInfo.avatarTypeID)
			if TableManager.GetAvatarIsSameAsAvatarPower(avatarTypeID):
				npcPowerMin = allAvatarPower.avatarPowerMin
				npcPowerMax = allAvatarPower.avatarPowerMax
				conditionFalsePowerMin = 0
				conditionFalsePowerMax = 0
			else:
				npcPowerMin = TableManager.GetAvatarPowerMin(avatarTypeID)
				npcPowerMax = TableManager.GetAvatarPowerMax(avatarTypeID)
				var checkConditionFunction: String = TableManager.GetAvatarCheckConditionFunction(avatarTypeID)
				if not checkConditionFunction.empty():
					var isOK: bool = call(checkConditionFunction)
					if not isOK:
						conditionFalsePowerMin = TableManager.GetAvatarConditionFalsePowerMin(avatarTypeID)
						conditionFalsePowerMax = TableManager.GetAvatarConditionFalsePowerMax(avatarTypeID)
			
			showName = GetAvatarShowNameWithColor(avatarTypeID)
			playChessStartWordsKey = TableManager.GetAvatarPlayChessStartWordsKey(avatarTypeID)
		else: # TableManager.NPC_TRIGGER_TYPE.NPC_ARTICLE
			var nPCArticleTriggerInfo: Dictionary = TableManager.GetNPCArticleTriggerInfo(m_ChessPanel1Info.panelData.npcTriggerTypeID)
			npcPowerMin = nPCArticleTriggerInfo.powerMin
			npcPowerMax = nPCArticleTriggerInfo.powerMax
			if not nPCArticleTriggerInfo.checkConditionFunction.empty():
				var isOK: bool = call(nPCArticleTriggerInfo.checkConditionFunction)
				if not isOK:
					conditionFalsePowerMin = nPCArticleTriggerInfo.conditionFalsePowerMin
					conditionFalsePowerMax = nPCArticleTriggerInfo.conditionFalsePowerMax
			
			showName = TableManager.GetLanguageString(nPCArticleTriggerInfo.showNameKey)
			playChessStartWordsKey = nPCArticleTriggerInfo.playChessStartWordsKey
		
		DownPanel_AddJournalRecord("%s: %s" % [showName, TableManager.GetAffixKeyRandomString(playChessStartWordsKey)])
		CurrentActiveAvatar_AddJournalRecordString(TableManager.GetAffixKeyRandomString(TableManager.GetAvatarPlayChessStartWordsKey(AvatarManager.GetCurrentActiveAvatarTypeID())))
		
		m_ChessPanel1Info.panelData.finalNPCPowerMin = npcPowerMin + conditionFalsePowerMin
		HQH.CheckLessThanOrEqualToMaxNumber("finalNPCPowerMin", TableManager.POWER_MAX, m_ChessPanel1Info.panelData.finalNPCPowerMin)
		HQH.CheckGreaterThanOrEqualToMinNumber("finalNPCPowerMin", TableManager.POWER_MIN, m_ChessPanel1Info.panelData.finalNPCPowerMin)
		m_ChessPanel1Info.panelData.finalNPCPowerMax = npcPowerMax + conditionFalsePowerMax
		HQH.CheckLessThanOrEqualToMaxNumber("finalNPCPowerMax", TableManager.POWER_MAX, m_ChessPanel1Info.panelData.finalNPCPowerMax)
		HQH.CheckGreaterThanOrEqualToMinNumber("finalNPCPowerMax", TableManager.POWER_MIN, m_ChessPanel1Info.panelData.finalNPCPowerMax)
		
		m_ChessPanel1Info.panelData.avatarPowerMin = allAvatarPower.avatarPowerMin
		HQH.CheckLessThanOrEqualToMaxNumber("avatarPowerMin", TableManager.POWER_MAX, m_ChessPanel1Info.panelData.avatarPowerMin)
		HQH.CheckGreaterThanOrEqualToMinNumber("avatarPowerMin", TableManager.POWER_MIN, m_ChessPanel1Info.panelData.avatarPowerMin)
		m_ChessPanel1Info.panelData.avatarPowerMax = allAvatarPower.avatarPowerMax
		HQH.CheckLessThanOrEqualToMaxNumber("avatarPowerMax", TableManager.POWER_MAX, m_ChessPanel1Info.panelData.avatarPowerMax)
		HQH.CheckGreaterThanOrEqualToMinNumber("avatarPowerMax", TableManager.POWER_MIN, m_ChessPanel1Info.panelData.avatarPowerMax)
		
		var isDebugDice: bool = false
		if HQH.IS_DEBUG and isDebugDice:
			HQH.Log("Debug Dice")
			m_ChessPanel1Info.panelData.finalNPCPowerMin = 3
			m_ChessPanel1Info.panelData.finalNPCPowerMax = 4
			m_ChessPanel1Info.panelData.avatarPowerMin = 10
			m_ChessPanel1Info.panelData.avatarPowerMax = 20
		
		var successRate: Dictionary = PlayChessCalculateSuccessRate(m_ChessPanel1Info.panelData.avatarPowerMin, m_ChessPanel1Info.panelData.avatarPowerMax, m_ChessPanel1Info.panelData.finalNPCPowerMin, m_ChessPanel1Info.panelData.finalNPCPowerMax)
		m_ChessPanel1Info.panelData.successRateIntNumerator = successRate.successRateIntNumerator
		m_ChessPanel1Info.panelData.successRateIntDenominator = successRate.successRateIntDenominator
		
		if HQH.IS_DEBUG:
			HQH.Log("avatarPower[%s, %s], finalNPCPower[%s(%s + %s), %s(%s + %s)]" % [m_ChessPanel1Info.panelData.avatarPowerMin, m_ChessPanel1Info.panelData.avatarPowerMax, m_ChessPanel1Info.panelData.finalNPCPowerMin, npcPowerMin, conditionFalsePowerMin, m_ChessPanel1Info.panelData.finalNPCPowerMax, npcPowerMax, conditionFalsePowerMax])
			if (0 == successRate.successRateIntNumerator) and (0 == successRate.successRateIntDenominator):
				HQH.Log("successRateFloat: 0.0, me is too low")
			else:
				var successRateFloat: float = float(successRate.successRateIntNumerator) / float(successRate.successRateIntDenominator)
				var successRateFloat100: float = successRateFloat * 100.0
				HQH.Log("successRateFloat: %s (%s%%), successRateFractions: %s / %s." % [successRateFloat, successRateFloat100, successRate.successRateIntNumerator, successRate.successRateIntDenominator])
			
			var successRateByLoop: Dictionary = PlayChessCalculateSuccessRateByLoop(m_ChessPanel1Info.panelData.avatarPowerMin, m_ChessPanel1Info.panelData.avatarPowerMax, m_ChessPanel1Info.panelData.finalNPCPowerMin, m_ChessPanel1Info.panelData.finalNPCPowerMax)
			if not ((successRate.successRateIntNumerator == successRateByLoop.successRateIntNumerator) and (successRate.successRateIntDenominator == successRateByLoop.successRateIntDenominator)):
				HQH.AssertLog("PlayChessStart, not ((successRate.successRateIntNumerator: %s == successRateByLoop.successRateIntNumerator: %s) and (successRate.successRateIntDenominator: %s == successRateByLoop.successRateIntDenominator: %s))" % [successRate.successRateIntNumerator, successRateByLoop.successRateIntNumerator, successRate.successRateIntDenominator, successRateByLoop.successRateIntDenominator])
		
		DownPanel_WrangleDialogSetButtonVisible(false)
		AvatarManager.InteractionNPCPlayAttack()
		AvatarManager.CurrentActiveAvatarPlayAttack()

func PlayChessStart_WrangleDialogInfo(success_InitWrangleDialogTypeID: int, success_CurrentWrangleDialogTypeID: int, failure_InitWrangleDialogTypeID: int, failure_CurrentWrangleDialogTypeID: int):
	var endInfo: Dictionary = CHESS_PANEL_1_END_INFO.duplicate(true)
	endInfo.resultSuccess.wrangleDialogInfo.initWrangleDialogTypeID = success_InitWrangleDialogTypeID
	endInfo.resultSuccess.wrangleDialogInfo.currentWrangleDialogTypeID  = success_CurrentWrangleDialogTypeID
	endInfo.resultFailure.wrangleDialogInfo.initWrangleDialogTypeID = failure_InitWrangleDialogTypeID
	endInfo.resultFailure.wrangleDialogInfo.currentWrangleDialogTypeID  = failure_CurrentWrangleDialogTypeID
	PlayChessStart(endInfo)

func DownPanel_on_commonTextureButtonPlayChess1_pressed():
	if DownPanel_GetCommonTextureButtonPlayChess1Visible():
		PlayChessStart()

func DownPanel_on_commonTextureButtonPlayChess1_pressed_PlayAttackStop():
	HQH.Log("DownPanel_on_commonTextureButtonPlayChess1_pressed_PlayAttackStop")
	
	DownPanel_WrangleDialogTerminate()
	
	ChessPanel1_Show()

func DownPanel_on_commonButton13BagUse_pressed(controlBagButtonListCurrentSelectIndex: int):
	HQH.Log("DownPanel_on_commonButton13BagUse_pressed, controlBagButtonListCurrentSelectIndex: %s" % controlBagButtonListCurrentSelectIndex)
	
	DownPanel_Bag_UseByIndex(controlBagButtonListCurrentSelectIndex)

func DownPanel_on_commonButton13Discard_pressed(controlBagButtonListCurrentSelectIndex: int):
	HQH.Log("DownPanel_on_commonButton13Discard_pressed, controlBagButtonListCurrentSelectIndex: %s" % controlBagButtonListCurrentSelectIndex)
	
	DownPanel_WrangleDialogSetIsVisible(true)
	
	m_DownPanelInfo.panelData.bagButtonListCurrentSelectIndex_Discard = controlBagButtonListCurrentSelectIndex

	var goodsTypeID: int = 0
	var goodsName: String = ""
	var contentString: String = ""
	var wrangleDialogButtonStringArray: Array = []
	
	var bagInfo: Dictionary = SaveGameManager.GetSaveGameData_Archive_BagList_BagInfoByIndex(controlBagButtonListCurrentSelectIndex)
	if not bagInfo.empty():
		goodsTypeID = bagInfo.bagGoodsTypeID
		var goodsInfo: Dictionary = TableManager.GetGoodsInfo(bagInfo.bagGoodsTypeID)
		if not goodsInfo.empty():
			goodsName = goodsInfo.goodsName
	
	var goodsNameString: String = TableManager.GetLanguageString(goodsName)
	contentString = TableManager.GetLanguageString("DOWNPANEL_WRANGLEDIALOG_ASK_DISCARD") % (TableManager.DISPLAY_BAG_ITEM_NAME % goodsNameString)
	DownPanel_AddJournalRecord("%s: %s" % [goodsNameString, contentString])
	wrangleDialogButtonStringArray.append(TableManager.GetLanguageString("DOWNPANEL_WRANGLEDIALOG_ASK_DISCARD_YES"))
	wrangleDialogButtonStringArray.append(TableManager.GetLanguageString("DOWNPANEL_WRANGLEDIALOG_ASK_DISCARD_NO"))
	DownPanel_WrangleDialogSetDataForGoods(goodsTypeID, contentString, wrangleDialogButtonStringArray)

func DownPanel_on_commonButton13Check_pressed(controlBagButtonListCurrentSelectIndex: int):
	HQH.Log("DownPanel_on_commonButton13Check_pressed, controlBagButtonListCurrentSelectIndex: %s" % controlBagButtonListCurrentSelectIndex)
	
	if not SaveGameManager.IsGoodsUsedHas_JournalRecordBook():
		DownPanel_AddJournalRecordWithStringKey("NO_JOURNALRECORDBOOK_CAN_NOT_VIEW")
		
		return
	
	var bagInfo: Dictionary = SaveGameManager.GetSaveGameData_Archive_BagList_BagInfoByIndex(controlBagButtonListCurrentSelectIndex)
	if bagInfo.empty():
		return
	
	JournalRecordPanel_ShowByPagingType(JOURNALRECORD_PANEL_PAGING_TYPE.JOURNALRECORD_PANEL_PAGING_BAG, bagInfo.bagGoodsTypeID)

func DownPanel_OnKeyPressed_Interaction():
	HQH.Log("DownPanel_OnKeyPressed_Interaction")
	if DownPanel_GetCommonTextureButtonInteraction1Visible():
		if GetIsInInteraction():
			DownPanel_CommonTextureButtonInteraction1_SetPressedTrue()
			DownPanel_on_commonTextureButtonInteraction1_pressed()

func DownPanel_OnKeyPressed_PlayChess():
	HQH.Log("DownPanel_OnKeyPressed_PlayChess")
	if DownPanel_GetCommonTextureButtonPlayChess1Visible():
		if GetIsInInteraction():
			DownPanel_CommonTextureButtonPlayChess1_SetPressedTrue()
			DownPanel_on_commonTextureButtonPlayChess1_pressed()

func DownPanel_OnKeyPressed_Bag():
	HQH.Log("DownPanel_OnKeyPressed_Bag")
	if SaveGameManager.IsGoodsUsedHas_Bag():
		DownPanel_CommonTextureButtonBag1_SetPressedTrue()
		DownPanel_on_commonTextureButtonBag1_pressed()
	else:
		DownPanel_AddJournalRecordWithStringKey("NO_BAG")

func DownPanel_OnKeyPressed_Journal():
	HQH.Log("DownPanel_OnKeyPressed_Journal")
	if SaveGameManager.IsGoodsUsedHas_JournalRecordBook():
		if not JournalRecordPanel_IsVisible():
			DownPanel_CommonTextureButtonBookJournalRecord_SetPressedTrue()
			DownPanel_on_commonTextureButtonBookJournalRecord_pressed()
	else:
		DownPanel_AddJournalRecordWithStringKey("NO_JOURNALRECORDBOOK")

func DownPanel_OnKeyPressed_Option():
	HQH.Log("DownPanel_OnKeyPressed_Option")
	if not OptionPanel_IsVisible():
		RightSettingPanel_CommonTextureButtonSetting1_SetPressedTrue()
		RightSettingPanel_on_commonTextureButtonSetting1_pressed()

func TeamPanel_Show():
	m_TeamPanelInfo.panelInstance = UIAddChild(m_TeamPanelInfo.panelInstance, m_TeamPanelInfo.preloadResource)

func TeamPanel_Hide():
	m_TeamPanelInfo.panelInstance = UIRemoveChild(m_TeamPanelInfo.panelInstance)

func TeamPanel_IsVisible() -> bool:
	return is_instance_valid(m_TeamPanelInfo.panelInstance)

func DayNightPanel_Show():
	m_DayNightPanelInfo.panelInstance = UIAddChild(m_DayNightPanelInfo.panelInstance, m_DayNightPanelInfo.preloadResource)

func DayNightPanel_Hide():
	m_DayNightPanelInfo.panelInstance = UIRemoveChild(m_DayNightPanelInfo.panelInstance)

func DayNightPanel_IsVisible() -> bool:
	return is_instance_valid(m_DayNightPanelInfo.panelInstance)

func DayNightPanel_SetText():
	if DayNightPanel_IsVisible():
		m_DayNightPanelInfo.panelInstance.SetText()

func DayNightPanel_SetCommonLabelDaysNumber(daysNumber: int):
	m_DayNightPanelInfo.panelInstance.SetCommonLabelDaysNumber(daysNumber)

func DayNightPanel_GetData() -> Dictionary:
	return m_DayNightPanelInfo.panelData

func DayNightPanel_SetData_Daytime(daytimeDurationTimeInSeconds: float = DAYTIMEDURATIONTIMEINSECONDS_DEFAULT):
	m_DayNightPanelInfo.panelData.isCurrentDayTime = true
	m_DayNightPanelInfo.panelData.daytimeDurationTimeInSeconds = daytimeDurationTimeInSeconds

func DayNightPanel_SetData_Night(nightDurationTimeInSeconds: float):
	m_DayNightPanelInfo.panelData.isCurrentDayTime = false
	m_DayNightPanelInfo.panelData.nightDurationTimeInSeconds = nightDurationTimeInSeconds

func UpNamePanel_Show():
	m_UpNamePanelInfo.panelInstance = UIAddChild(m_UpNamePanelInfo.panelInstance, m_UpNamePanelInfo.preloadResource)

func UpNamePanel_Hide():
	m_UpNamePanelInfo.panelInstance = UIRemoveChild(m_UpNamePanelInfo.panelInstance)

func UpNamePanel_IsVisible() -> bool:
	return is_instance_valid(m_UpNamePanelInfo.panelInstance)

func UpNamePanel_ShowUpName(nameString: String):
	m_UpNamePanelInfo.panelInstance.ShowUpName(nameString)

func UpNamePanel_ShowTipsWithStringKey(stringKey: String):
	UpNamePanel_ShowTips(TableManager.GetLanguageString(stringKey))

func UpNamePanel_IsTipsVisible() -> bool:
	return m_UpNamePanelInfo.panelInstance.IsTipsVisible()

func UpNamePanel_ShowTips(tipsString: String):
	m_UpNamePanelInfo.panelInstance.ShowTips(tipsString)

func UpNamePanel_HideTips():
	m_UpNamePanelInfo.panelInstance.HideTips()

func UpNamePanel_TipsIDList_sort_custom_Function(a, b):
	var aAvatarInfo: Dictionary = AvatarManager.GetCreateAvatarInfoListOneElementByAvatarTypeID(a)
	if aAvatarInfo.empty():
		return false
	
	var bAvatarInfo: Dictionary = AvatarManager.GetCreateAvatarInfoListOneElementByAvatarTypeID(b)
	if bAvatarInfo.empty():
		return true
	
	return aAvatarInfo.index > bAvatarInfo.index

func UpNamePanel_ShowTipsUpdate():
	if 0 < m_UpNamePanelInfo.panelData.tipsIDList.size():
		var currentAvatarShowNameList: String = ""
		if 1 == m_UpNamePanelInfo.panelData.tipsIDList.size():
			var currentAvatarShowName: String = TableManager.GetAvatarShowName(m_UpNamePanelInfo.panelData.tipsIDList[0])
			currentAvatarShowNameList = currentAvatarShowName
		else:
			var tipsStringAndFlag: String = TableManager.GetLanguageString("TIPS_STRING_AND_FLAG")
			m_UpNamePanelInfo.panelData.tipsIDList.sort_custom(self, "UpNamePanel_TipsIDList_sort_custom_Function")
			var i: int = 0
			for iv in m_UpNamePanelInfo.panelData.tipsIDList:
				var currentAvatarShowName: String = TableManager.GetAvatarShowName(iv)
				if 0 == i:
					currentAvatarShowNameList = currentAvatarShowName
				else:
					var createAvatarInfo: Dictionary = AvatarManager.GetCreateAvatarInfoListOneElementByAvatarTypeID(iv)
					if createAvatarInfo.empty():
						currentAvatarShowNameList = "%s%s" % [currentAvatarShowNameList, tipsStringAndFlag]
					
					currentAvatarShowNameList = "%s %s" % [currentAvatarShowNameList, currentAvatarShowName]
				
				i += 1
		
		UpNamePanel_ShowTips(currentAvatarShowNameList)

func UpNamePanel_ShowTipsByAvatarTypeID(avatarTypeID: int):
	if UpNamePanel_IsVisible():
		if 0 < avatarTypeID:
			m_UpNamePanelInfo.panelData.tipsIDList.append(avatarTypeID)
			UpNamePanel_ShowTipsUpdate()

func UpNamePanel_HideTipsByAvatarTypeID(isClearAll: bool, avatarTypeID: int):
	if UpNamePanel_IsVisible():
		if isClearAll:
			m_UpNamePanelInfo.panelData.tipsIDList.clear()
			UpNamePanel_HideTips()
		else:
			m_UpNamePanelInfo.panelData.tipsIDList.erase(avatarTypeID)
			if 0 < m_UpNamePanelInfo.panelData.tipsIDList.size():
				UpNamePanel_ShowTipsUpdate()
			else:
				UpNamePanel_HideTips()

func UpNamePanel_ShowMiddleString(middleString: String):
	DownPanel_AddJournalRecord(middleString)
	
	m_UpNamePanelInfo.panelInstance.ShowMiddleString(middleString)

func UpNamePanel_HideMiddleString():
	m_UpNamePanelInfo.panelInstance.HideMiddleString()

func ShowSlogan_AvatarDead_UpNamePanel_ShowMiddleString():
	var affixKeyRandomString: String = TableManager.GetAffixKeyRandomString("SLOGAN_AVATAR_DEAD_")
	var middleString: String = affixKeyRandomString
	UpNamePanel_ShowMiddleString(middleString)

func ShowSlogan_AvatarDead_But_UpNamePanel_ShowMiddleString():
	var middleString: String = TableManager.GetLanguageString("HOWEVER_SOME_MEMBERS_OF_THE_TEAM_STUBBORNLY_SURVIVED")
	UpNamePanel_ShowMiddleString(middleString)

func ShowSlogan_HomeSafe_UpNamePanel_ShowMiddleString():
	var affixKeyRandomString: String = TableManager.GetAffixKeyRandomString("HOME_SAFE_")
	var middleString: String = affixKeyRandomString
	UpNamePanel_ShowMiddleString(middleString)

func RightSettingPanel_Show():
	m_RightSettingPanelInfo.panelInstance = UIAddChild(m_RightSettingPanelInfo.panelInstance, m_RightSettingPanelInfo.preloadResource)

func RightSettingPanel_Hide():
	m_RightSettingPanelInfo.panelInstance = UIRemoveChild(m_RightSettingPanelInfo.panelInstance)

func RightSettingPanel_IsVisible() -> bool:
	return is_instance_valid(m_RightSettingPanelInfo.panelInstance)

func RightSettingPanel_on_commonTextureButtonSetting1_pressed():
	HQH.Log("RightSettingPanel_on_commonTextureButtonSetting1_pressed")
	
	OptionPanel_Show()

func RightSettingPanel_CommonTextureButtonSetting1_SetPressedTrue():
	if RightSettingPanel_IsVisible():
		m_RightSettingPanelInfo.panelInstance.CommonTextureButtonSetting1_SetPressedTrue()

func ChessPanel4_Show():
	m_ChessPanel4Info.panelInstance = UIAddChild(m_ChessPanel4Info.panelInstance, m_ChessPanel4Info.preloadResource)

func ChessPanel4_Hide():
	m_ChessPanel4Info.panelInstance = UIRemoveChild(m_ChessPanel4Info.panelInstance)

func ChessPanel4_IsVisible() -> bool:
	return is_instance_valid(m_ChessPanel4Info.panelInstance)

func ChessPanel1_Show():
	m_ChessPanel1Info.panelInstance = UIAddChild(m_ChessPanel1Info.panelInstance, m_ChessPanel1Info.preloadResource)

func ChessPanel1_Hide():
	m_ChessPanel1Info.panelInstance = UIRemoveChild(m_ChessPanel1Info.panelInstance)

func ChessPanel1_IsVisible() -> bool:
	return is_instance_valid(m_ChessPanel1Info.panelInstance)

func ChessPanel1_IsEnd() -> bool:
	var isEnd: bool = false
	if ChessPanel1_IsVisible():
		isEnd = m_ChessPanel1Info.panelInstance.GetAnimationPlayer1_IsEnd()
	
	return isEnd

func ChessPanel1_GetPanelData() -> Dictionary:
	return m_ChessPanel1Info.panelData

func GetIsInPlayChess() -> bool:
	return m_ChessPanel1Info.panelData.isInPlayChess

func AddPlayChessCountListString(isWin: bool):
	m_ChessPanel1Info.panelData.playChessCountList.append(isWin)

func GetPlayChessCountListString(flag: String = "") -> String:
	var playChessCountString: String = ""
	for iv in m_ChessPanel1Info.panelData.playChessCountList:
		if not flag.empty():
			playChessCountString += flag
		else:
			if iv:
				playChessCountString += TableManager.PLAY_CHESS_COUNT_FLAG_SUCCESS
			else:
				playChessCountString += TableManager.PLAY_CHESS_COUNT_FLAG_FAILURE
	
	return playChessCountString

func AccumulationByLoop(n: int) -> int:
	var accumulationLoopResult: int = 0
	for i in n:
		accumulationLoopResult += (i + 1)
	
	return accumulationLoopResult

func Accumulation(n: int) -> int:
	if 0 >= n:
		return 0
	
	var accumulationResult: int = (1 + n) * n / 2
#	if HQH.IS_DEBUG:
#		var accumulationLoopResult: int = AccumulationByLoop(n)
#		if accumulationResult != accumulationLoopResult:
#			HQH.AssertLog("Accumulation, accumulationResult: %s != accumulationLoopResult: %s" % [accumulationResult, accumulationLoopResult])
	
	return accumulationResult

#描述：
#我们的对弈点数范围为[1，2]，即对弈点数为1或2，概率各50%。
#对方的对弈点数范围为[1，2]，概率相同也是各50%。
#如果我们的对弈点数“大于或等于”对方的对弈点数，则我们对弈成功。
#问题：
#我们对弈成功的概率是百分之多少？
#回答：
#我们对弈成功的概率为：
#超出对方部分 + 累加部分 / 我们的长度 * 对方的长度
#（超出对方对弈点数的最大值的部分 * 对方的长度） + 累加（对方对弈点数的最小值 - 我们对弈点数的最大值 + 1） - 累加（我们对弈点数的最小值 - 对方对弈点数的最小值） / （（我们对弈点数的最大值 - 我们对弈点数的最小值 + 1） * （对方对弈点数的最大值 - 对方对弈点数的最小值 + 1））
#说明：
#最大值和最小值是可以相等的。
func PlayChessCalculateSuccessRate(meMin: int, meMax: int, opMin: int, opMax: int) -> Dictionary:
#	HQH.Log("PlayChessCalculateSuccessRate, meMin: %s, meMax: %s, opMin: %s, opMax: %s" % [meMin, meMax, opMin, opMax])
	
	if not (meMin <= meMax):
		HQH.AssertLog("PlayChessCalculateSuccessRate, not(meMin: %s <= meMax: %s)" % [meMin, meMax])
		
		return {}
	
	if not (opMin <= opMax):
		HQH.AssertLog("PlayChessCalculateSuccessRate, not(opMin: %s <= opMax: %s)" % [opMin, opMax])
		
		return {}
	
	var meMax_opMin: int = meMax - opMin
	if 0 > meMax_opMin:
		return {"successRateIntNumerator": 0, "successRateIntDenominator": 0}
	
	var meLength: int = meMax - meMin + 1
	var opLength: int = opMax - opMin + 1
	var successRateIntDenominator: int = meLength * opLength
	
	var meMin_opMax: int = meMin - opMax
	if 0 < meMin_opMax:
		return {"successRateIntNumerator": successRateIntDenominator, "successRateIntDenominator": successRateIntDenominator}
	
	var secondMax: int = opMax
	var meMax_opMax: int = meMax - opMax
	if 0 > meMax_opMax:
		meMax_opMax = 0
		secondMax = meMax
	
	var secondLength: int = secondMax - opMin + 1
	
	var meMin_opMin: int = meMin - opMin
	if 0 > meMin_opMin:
		meMin_opMin = 0
	
	var successRateIntNumerator: int = (meMax_opMax * opLength) + Accumulation(secondLength) - Accumulation(meMin_opMin)
	
	return {"successRateIntNumerator": successRateIntNumerator, "successRateIntDenominator": successRateIntDenominator}

func PlayChessCalculateSuccessRateByLoop(meMin: int, meMax: int, opMin: int, opMax: int) -> Dictionary:
#	HQH.Log("PlayChessCalculateSuccessRateByLoop, meMin: %s, meMax: %s, opMin: %s, opMax: %s" % [meMin, meMax, opMin, opMax])
	
	if not (meMin <= meMax):
		HQH.AssertLog("PlayChessCalculateSuccessRateByLoop, not(meMin: %s <= meMax: %s)" % [meMin, meMax])
		
		return {}
	
	if not (opMin <= opMax):
		HQH.AssertLog("PlayChessCalculateSuccessRateByLoop, not(opMin: %s <= opMax: %s)" % [opMin, opMax])
		
		return {}
	
	var meMax_opMin: int = meMax - opMin
	if 0 > meMax_opMin:
		return {"successRateIntNumerator": 0, "successRateIntDenominator": 0}
	
	var meLength: int = meMax - meMin + 1
	var opLength: int = opMax - opMin + 1
	var successRateIntDenominator: int = meLength * opLength
	
	var meMin_opMax: int = meMin - opMax
	if 0 < meMin_opMax:
		return {"successRateIntNumerator": successRateIntDenominator, "successRateIntDenominator": successRateIntDenominator}
	
	var successRateIntNumerator: int = 0
	for i in range(meMin, meMax + 1):
		for j in range(opMin, opMax + 1):
			if i >= j:
				successRateIntNumerator += 1
	
	return {"successRateIntNumerator": successRateIntNumerator, "successRateIntDenominator": successRateIntDenominator}

func ChessPanel1_Terminate():
	m_ChessPanel1Info.panelData.isInPlayChess = false
	m_ChessPanel1Info.panelData.npcTriggerType = TableManager.NPC_TRIGGER_TYPE.NONE
	m_ChessPanel1Info.panelData.npcTriggerTypeID = 0
	m_ChessPanel1Info.panelData.finalNPCPowerMin = 0
	m_ChessPanel1Info.panelData.finalNPCPowerMax = 0
	m_ChessPanel1Info.panelData.avatarPowerMin = 0
	m_ChessPanel1Info.panelData.avatarPowerMax = 0
	m_ChessPanel1Info.panelData.successRateIntNumerator = 0
	m_ChessPanel1Info.panelData.successRateIntDenominator = 0
	m_ChessPanel1Info.panelData.endInfo = CHESS_PANEL_1_END_INFO.duplicate(true)
	
	ChessPanel1_Hide()

func ChessPanel1_End(isWin: bool):
	HQH.Log("ChessPanel1_End, isWin: %s" % isWin)
	
	var playChessEndFunction: String = ""
	if TableManager.NPC_TRIGGER_TYPE.NPC_AVATAR == m_ChessPanel1Info.panelData.npcTriggerType:
		var nPCTriggerInfo: Dictionary = TableManager.GetNPCTriggerInfo(m_ChessPanel1Info.panelData.npcTriggerTypeID)
		if isWin:
			playChessEndFunction = TableManager.GetAvatarPlayChessSuccessFunction(nPCTriggerInfo.avatarTypeID)
		else:
			playChessEndFunction = TableManager.GetAvatarPlayChessFailureFunction(nPCTriggerInfo.avatarTypeID)
	else: # TableManager.NPC_TRIGGER_TYPE.NPC_ARTICLE
		var nPCArticleTriggerInfo: Dictionary = TableManager.GetNPCArticleTriggerInfo(m_ChessPanel1Info.panelData.npcTriggerTypeID)
		if isWin:
			playChessEndFunction = nPCArticleTriggerInfo.playChessSuccessFunction
		else:
			playChessEndFunction = nPCArticleTriggerInfo.playChessFailureFunction
	
	var initWrangleDialogTypeID: int = 0
	var currentWrangleDialogTypeID: int = 0
	if isWin:
		initWrangleDialogTypeID = m_ChessPanel1Info.panelData.endInfo.resultSuccess.wrangleDialogInfo.initWrangleDialogTypeID
		currentWrangleDialogTypeID = m_ChessPanel1Info.panelData.endInfo.resultSuccess.wrangleDialogInfo.currentWrangleDialogTypeID
	else:
		initWrangleDialogTypeID = m_ChessPanel1Info.panelData.endInfo.resultFailure.wrangleDialogInfo.initWrangleDialogTypeID
		currentWrangleDialogTypeID = m_ChessPanel1Info.panelData.endInfo.resultFailure.wrangleDialogInfo.currentWrangleDialogTypeID
	
	if not playChessEndFunction.empty():
		HQH.Log("ChessPanel1_End, call(playChessEndFunction: %s), initWrangleDialogTypeID: %s, currentWrangleDialogTypeID: %s" % [playChessEndFunction, initWrangleDialogTypeID, currentWrangleDialogTypeID])
		call(playChessEndFunction, initWrangleDialogTypeID, currentWrangleDialogTypeID)
	
	if (0 < initWrangleDialogTypeID) and (0 < currentWrangleDialogTypeID):
		SaveTask(initWrangleDialogTypeID, currentWrangleDialogTypeID)

func ChessPanel1_on_commonButtonContinue_pressed():
	HQH.Log("ChessPanel1_on_commonButtonContinue_pressed")
	
	ChessPanel1_Terminate()

func ChessPanel1_OnEscButtonPressed() -> bool:
	if GetIsInPlayChess():
		if ChessPanel1_IsEnd():
			ChessPanel1_Terminate()
			AudioManager.PlayByName_ButtonPressed()
		
		return true
	
	return false

func ControlSetCommonScroll(controlObject: Control):
	var vScrollBarObject: VScrollBar = controlObject.get_v_scroll()
	SetNewStyleBoxFlat(vScrollBarObject, "grabber", COMMONSCROLL_STYLE.STYLEBOXFLAT_GRABBER_BG_COLOR, COMMONSCROLL_STYLE.STYLEBOXFLAT_GRABBER_BORDER_WIDTH, COMMONSCROLL_STYLE.STYLEBOXFLAT_GRABBER_BORDER_COLOR, COMMONSCROLL_STYLE.STYLEBOXFLAT_GRABBER_CORNER_RADIUS)
	SetNewStyleBoxFlat(vScrollBarObject, "grabber_highlight", COMMONSCROLL_STYLE.STYLEBOXFLAT_GRABBER_HIGHLIGHT_BG_COLOR, COMMONSCROLL_STYLE.STYLEBOXFLAT_GRABBER_HIGHLIGHT_BORDER_WIDTH, COMMONSCROLL_STYLE.STYLEBOXFLAT_GRABBER_HIGHLIGHT_BORDER_COLOR, COMMONSCROLL_STYLE.STYLEBOXFLAT_GRABBER_HIGHLIGHT_CORNER_RADIUS)
	SetNewStyleBoxFlat(vScrollBarObject, "grabber_pressed", COMMONSCROLL_STYLE.STYLEBOXFLAT_GRABBER_PRESSED_BG_COLOR, COMMONSCROLL_STYLE.STYLEBOXFLAT_GRABBER_PRESSED_BORDER_WIDTH, COMMONSCROLL_STYLE.STYLEBOXFLAT_GRABBER_PRESSED_BORDER_COLOR, COMMONSCROLL_STYLE.STYLEBOXFLAT_GRABBER_PRESSED_CORNER_RADIUS)
	SetNewStyleBoxFlat(vScrollBarObject, "scroll", COMMONSCROLL_STYLE.STYLEBOXFLAT_SCROLL_BG_COLOR, COMMONSCROLL_STYLE.STYLEBOXFLAT_SCROLL_BORDER_WIDTH, COMMONSCROLL_STYLE.STYLEBOXFLAT_SCROLL_BORDER_COLOR, COMMONSCROLL_STYLE.STYLEBOXFLAT_SCROLL_CORNER_RADIUS)

func UIInputActionEventHandle(eventType: String):
	HQH.Log("UIInputActionEventHandle, eventType: %s" % eventType)
	
	var EVENT_GOODS_length: int = UI_INPUT_ACTION_EVENT_TYPE.EVENT_GOODS.length()
	var eventTypeSubstring_EVENT_GOODS: String = eventType.substr(0, EVENT_GOODS_length)
	if eventTypeSubstring_EVENT_GOODS == UI_INPUT_ACTION_EVENT_TYPE.EVENT_GOODS:
		var eventTypeSubstring_GoodsTypeID: String = eventType.substr(EVENT_GOODS_length)
#		HQH.Log("eventTypeSubstring_GoodsTypeID: %s" % eventTypeSubstring_GoodsTypeID)
		UI_INPUT_ACTION_EVENT_TYPE_EVENT_GOODS_Function(int(eventTypeSubstring_GoodsTypeID))
		
		return
	
	var EVENT_AVATAR_length: int = UI_INPUT_ACTION_EVENT_TYPE.EVENT_AVATAR.length()
	var eventTypeSubstring_EVENT_AVATAR: String = eventType.substr(0, EVENT_AVATAR_length)
	if eventTypeSubstring_EVENT_AVATAR == UI_INPUT_ACTION_EVENT_TYPE.EVENT_AVATAR:
		var eventTypeSubstring_AvatarTypeID: String = eventType.substr(EVENT_AVATAR_length)
		UI_INPUT_ACTION_EVENT_TYPE_EVENT_AVATAR_Function(int(eventTypeSubstring_AvatarTypeID))
		
		return
	
	match eventType:
		UI_INPUT_ACTION_EVENT_TYPE.COMMONRICHTEXTLABEL_META_CLICKED_EVENT1_COMMONRICHTEXTLABEL1:
			HQH.Log("COMMONRICHTEXTLABEL_META_CLICKED_EVENT1_COMMONRICHTEXTLABEL1")
		
		UI_INPUT_ACTION_EVENT_TYPE.COMMONRICHTEXTLABEL_META_CLICKED_EVENT2_COMMONRICHTEXTLABEL1:
			HQH.Log("COMMONRICHTEXTLABEL_META_CLICKED_EVENT2_COMMONRICHTEXTLABEL1")
		
		UI_INPUT_ACTION_EVENT_TYPE.COMMONBUTTONITEM_TEXTUREBUTTON1_PRESSED_EVENT1:
			UI_INPUT_ACTION_EVENT_TYPE_COMMONBUTTONITEM_TEXTUREBUTTON1_PRESSED_EVENT_Function(1)
		
		UI_INPUT_ACTION_EVENT_TYPE.COMMONBUTTONITEM_TEXTUREBUTTON1_PRESSED_EVENT2:
			UI_INPUT_ACTION_EVENT_TYPE_COMMONBUTTONITEM_TEXTUREBUTTON1_PRESSED_EVENT_Function(2)
		
		UI_INPUT_ACTION_EVENT_TYPE.COMMONBUTTONITEM_TEXTUREBUTTON1_PRESSED_EVENT3:
			UI_INPUT_ACTION_EVENT_TYPE_COMMONBUTTONITEM_TEXTUREBUTTON1_PRESSED_EVENT_Function(3)
		
		UI_INPUT_ACTION_EVENT_TYPE.COMMONBUTTONITEM_TEXTUREBUTTON1_PRESSED_EVENT4:
			UI_INPUT_ACTION_EVENT_TYPE_COMMONBUTTONITEM_TEXTUREBUTTON1_PRESSED_EVENT_Function(4)
		
		UI_INPUT_ACTION_EVENT_TYPE.COMMONBUTTONITEM_TEXTUREBUTTON1_PRESSED_EVENT5:
			UI_INPUT_ACTION_EVENT_TYPE_COMMONBUTTONITEM_TEXTUREBUTTON1_PRESSED_EVENT_Function(5)
		
		UI_INPUT_ACTION_EVENT_TYPE.COMMONBUTTONITEM_TEXTUREBUTTON1_PRESSED_EVENT6:
			UI_INPUT_ACTION_EVENT_TYPE_COMMONBUTTONITEM_TEXTUREBUTTON1_PRESSED_EVENT_Function(6)
		
		UI_INPUT_ACTION_EVENT_TYPE.COMMONBUTTONITEM_TEXTUREBUTTON1_PRESSED_EVENT7:
			UI_INPUT_ACTION_EVENT_TYPE_COMMONBUTTONITEM_TEXTUREBUTTON1_PRESSED_EVENT_Function(7)
		
		UI_INPUT_ACTION_EVENT_TYPE.COMMONBUTTONITEM_TEXTUREBUTTON1_PRESSED_EVENT8:
			UI_INPUT_ACTION_EVENT_TYPE_COMMONBUTTONITEM_TEXTUREBUTTON1_PRESSED_EVENT_Function(8)
		
		UI_INPUT_ACTION_EVENT_TYPE.COMMONBUTTONITEM_TEXTUREBUTTON1_PRESSED_EVENT9:
			UI_INPUT_ACTION_EVENT_TYPE_COMMONBUTTONITEM_TEXTUREBUTTON1_PRESSED_EVENT_Function(9)
		
		UI_INPUT_ACTION_EVENT_TYPE.COMMONBUTTONITEM_TEXTUREBUTTON1_PRESSED_EVENT10:
			UI_INPUT_ACTION_EVENT_TYPE_COMMONBUTTONITEM_TEXTUREBUTTON1_PRESSED_EVENT_Function(10)
		
		UI_INPUT_ACTION_EVENT_TYPE.COMMONBUTTONBUFF_TEXTUREBUTTON1_PRESSED_EVENT1:
			UI_INPUT_ACTION_EVENT_TYPE_COMMONBUTTONBUFF_TEXTUREBUTTON1_PRESSED_EVENT_Function(1)
		
		UI_INPUT_ACTION_EVENT_TYPE.COMMONBUTTONBUFF_TEXTUREBUTTON1_PRESSED_EVENT2:
			UI_INPUT_ACTION_EVENT_TYPE_COMMONBUTTONBUFF_TEXTUREBUTTON1_PRESSED_EVENT_Function(2)
		
		UI_INPUT_ACTION_EVENT_TYPE.COMMONBUTTONBUFF_TEXTUREBUTTON1_PRESSED_EVENT3:
			UI_INPUT_ACTION_EVENT_TYPE_COMMONBUTTONBUFF_TEXTUREBUTTON1_PRESSED_EVENT_Function(3)
		
		UI_INPUT_ACTION_EVENT_TYPE.COMMONBUTTONBUFF_TEXTUREBUTTON1_PRESSED_EVENT4:
			UI_INPUT_ACTION_EVENT_TYPE_COMMONBUTTONBUFF_TEXTUREBUTTON1_PRESSED_EVENT_Function(4)
		
		UI_INPUT_ACTION_EVENT_TYPE.COMMONBUTTONBUFF_TEXTUREBUTTON1_PRESSED_EVENT5:
			UI_INPUT_ACTION_EVENT_TYPE_COMMONBUTTONBUFF_TEXTUREBUTTON1_PRESSED_EVENT_Function(5)
		
		UI_INPUT_ACTION_EVENT_TYPE.COMMONBUTTONBUFF_TEXTUREBUTTON1_PRESSED_EVENT6:
			UI_INPUT_ACTION_EVENT_TYPE_COMMONBUTTONBUFF_TEXTUREBUTTON1_PRESSED_EVENT_Function(6)
		
		UI_INPUT_ACTION_EVENT_TYPE.COMMONBUTTONBUFF_TEXTUREBUTTON1_PRESSED_EVENT7:
			UI_INPUT_ACTION_EVENT_TYPE_COMMONBUTTONBUFF_TEXTUREBUTTON1_PRESSED_EVENT_Function(7)
		
		UI_INPUT_ACTION_EVENT_TYPE.COMMONBUTTONBUFF_TEXTUREBUTTON1_PRESSED_EVENT8:
			UI_INPUT_ACTION_EVENT_TYPE_COMMONBUTTONBUFF_TEXTUREBUTTON1_PRESSED_EVENT_Function(8)
		
		UI_INPUT_ACTION_EVENT_TYPE.COMMONBUTTONBUFF_TEXTUREBUTTON1_PRESSED_EVENT9:
			UI_INPUT_ACTION_EVENT_TYPE_COMMONBUTTONBUFF_TEXTUREBUTTON1_PRESSED_EVENT_Function(9)
		
		UI_INPUT_ACTION_EVENT_TYPE.COMMONBUTTONBUFF_TEXTUREBUTTON1_PRESSED_EVENT10:
			UI_INPUT_ACTION_EVENT_TYPE_COMMONBUTTONBUFF_TEXTUREBUTTON1_PRESSED_EVENT_Function(10)
		
		UI_INPUT_ACTION_EVENT_TYPE.COMMONBUTTONBUFF_TEXTUREBUTTON1_PRESSED_EVENT11:
			UI_INPUT_ACTION_EVENT_TYPE_COMMONBUTTONBUFF_TEXTUREBUTTON1_PRESSED_EVENT_Function(11)
		
		UI_INPUT_ACTION_EVENT_TYPE.COMMONBUTTONBUFF_TEXTUREBUTTON1_PRESSED_EVENT12:
			UI_INPUT_ACTION_EVENT_TYPE_COMMONBUTTONBUFF_TEXTUREBUTTON1_PRESSED_EVENT_Function(12)
		
		UI_INPUT_ACTION_EVENT_TYPE.COMMONBUTTONBUFF_TEXTUREBUTTON1_PRESSED_EVENT13:
			UI_INPUT_ACTION_EVENT_TYPE_COMMONBUTTONBUFF_TEXTUREBUTTON1_PRESSED_EVENT_Function(13)
		
		UI_INPUT_ACTION_EVENT_TYPE.COMMONBUTTONBUFF_TEXTUREBUTTON1_PRESSED_EVENT14:
			UI_INPUT_ACTION_EVENT_TYPE_COMMONBUTTONBUFF_TEXTUREBUTTON1_PRESSED_EVENT_Function(14)
		
		UI_INPUT_ACTION_EVENT_TYPE.COMMONBUTTONBUFF_TEXTUREBUTTON1_PRESSED_EVENT15:
			UI_INPUT_ACTION_EVENT_TYPE_COMMONBUTTONBUFF_TEXTUREBUTTON1_PRESSED_EVENT_Function(15)
		
		UI_INPUT_ACTION_EVENT_TYPE.COMMONBUTTONBUFF_TEXTUREBUTTON1_PRESSED_EVENT16:
			UI_INPUT_ACTION_EVENT_TYPE_COMMONBUTTONBUFF_TEXTUREBUTTON1_PRESSED_EVENT_Function(16)
		
		UI_INPUT_ACTION_EVENT_TYPE.COMMONBUTTONBUFF_TEXTUREBUTTON1_PRESSED_EVENT17:
			UI_INPUT_ACTION_EVENT_TYPE_COMMONBUTTONBUFF_TEXTUREBUTTON1_PRESSED_EVENT_Function(17)
		
		UI_INPUT_ACTION_EVENT_TYPE.COMMONBUTTONBUFF_TEXTUREBUTTON1_PRESSED_EVENT18:
			UI_INPUT_ACTION_EVENT_TYPE_COMMONBUTTONBUFF_TEXTUREBUTTON1_PRESSED_EVENT_Function(18)
		
		UI_INPUT_ACTION_EVENT_TYPE.COMMONBUTTONBUFF_TEXTUREBUTTON1_PRESSED_EVENT19:
			UI_INPUT_ACTION_EVENT_TYPE_COMMONBUTTONBUFF_TEXTUREBUTTON1_PRESSED_EVENT_Function(19)
		
		UI_INPUT_ACTION_EVENT_TYPE.COMMONBUTTONBUFF_TEXTUREBUTTON1_PRESSED_EVENT20:
			UI_INPUT_ACTION_EVENT_TYPE_COMMONBUTTONBUFF_TEXTUREBUTTON1_PRESSED_EVENT_Function(20)
		
		UI_INPUT_ACTION_EVENT_TYPE.COMMONBUTTONBUFF_TEXTUREBUTTON1_PRESSED_EVENT21:
			UI_INPUT_ACTION_EVENT_TYPE_COMMONBUTTONBUFF_TEXTUREBUTTON1_PRESSED_EVENT_Function(21)
		
		UI_INPUT_ACTION_EVENT_TYPE.EVENT_BAG:
			UI_INPUT_ACTION_EVENT_TYPE_EVENT_BAG_Function()
		
		UI_INPUT_ACTION_EVENT_TYPE.EVENT_JOURNALRECORDBOOK:
			UI_INPUT_ACTION_EVENT_TYPE_EVENT_JOURNALRECORDBOOK_Function()

func UI_INPUT_ACTION_EVENT_TYPE_COMMONBUTTONITEM_TEXTUREBUTTON1_PRESSED_EVENT_Function(index: int):
	if GetIsSwallowActionStart():
		DownPanel_AddJournalRecordWithStringKey("IT_IS_GETTING_DARK_YOU_CAN_NOT_OPERATE")
		
		return
	
	if GetIsInPlayChess():
		DownPanel_AddJournalRecordWithStringKey("IT_IS_PLAY_CHESS_YOU_CAN_NOT_OPERATE")
		
		return
	
	if m_UI_INPUT_ACTION_EVENT_TYPE_COMMONBUTTONITEM_TEXTUREBUTTON1_PRESSED_EVENT_IsStart:
		HQH.Log("m_UI_INPUT_ACTION_EVENT_TYPE_COMMONBUTTONITEM_TEXTUREBUTTON1_PRESSED_EVENT_IsStart is true")
		
		DownPanel_AddJournalRecordWithStringKey("UI_INPUT_ACTION_EVENT_TYPE_COMMONBUTTONITEM_TEXTUREBUTTON1_PRESSED_EVENT_IN_CD")
		
		return
	
	SetUI_INPUT_ACTION_EVENT_TYPE_COMMONBUTTONITEM_TEXTUREBUTTON1_PRESSED_EVENT_Start(index)
	
	if 0 < AvatarManager.GetCurrentActiveAvatarInfoListCount():
		TeamPanel_SetItemAvatarIconCD(true)
		
		var node2DAvatarChildren: Array = SceneManager.GetCurrentSceneNode2DAvatarChildren()
		for iv in node2DAvatarChildren:
			var avatarObjectID: int = iv.GetAvatarObjectID()
			var isCurrentActive: bool = (avatarObjectID == AvatarManager.GetCurrentActiveAvatarObjectID())
			if isCurrentActive:
				AvatarManager.SetIsNeedCompleteAll_FOLLOW_WALK(avatarObjectID, false)
			else:
				AvatarManager.SetIsNeedCompleteAll_FOLLOW_WALK(avatarObjectID, true)
			
			AvatarManager.ResetNeedCompleteAll_FOLLOW_WALK_DelayIndexNumber(avatarObjectID)
	else:
		TeamPanel_SetItemAvatarIconCD(false)
		
		m_UI_INPUT_ACTION_EVENT_TYPE_COMMONBUTTONITEM_TEXTUREBUTTON1_PRESSED_EVENT_MIN_NUMBER_IsStart = true
		m_UI_INPUT_ACTION_EVENT_TYPE_COMMONBUTTONITEM_TEXTUREBUTTON1_PRESSED_EVENT_MIN_NUMBER_CD_StartMilliTime = HQH.MilliTime()

func SetUI_INPUT_ACTION_EVENT_TYPE_COMMONBUTTONITEM_TEXTUREBUTTON1_PRESSED_EVENT_Start(index: int):
	m_UI_INPUT_ACTION_EVENT_TYPE_COMMONBUTTONITEM_TEXTUREBUTTON1_PRESSED_EVENT_IsStart = true
	SceneManager.SetIsCanHandleCurrentInputMotionDirection(false)
	m_UI_INPUT_ACTION_EVENT_TYPE_COMMONBUTTONITEM_TEXTUREBUTTON1_PRESSED_EVENT_Index = index

func SetUI_INPUT_ACTION_EVENT_TYPE_COMMONBUTTONITEM_TEXTUREBUTTON1_PRESSED_EVENT_Stop():
	if not m_UI_INPUT_ACTION_EVENT_TYPE_COMMONBUTTONITEM_TEXTUREBUTTON1_PRESSED_EVENT_IsStart:
		HQH.AssertLog("m_UI_INPUT_ACTION_EVENT_TYPE_COMMONBUTTONITEM_TEXTUREBUTTON1_PRESSED_EVENT_IsStart is false")
	
	# Reset m_CreateAvatarInfoList, TeamPanel AvatarIcon, and Current Active AvatarInstance
	AvatarManager.ResetCreateAvatarInfoListAndTeamPanelItemAvatarIcon(m_UI_INPUT_ACTION_EVENT_TYPE_COMMONBUTTONITEM_TEXTUREBUTTON1_PRESSED_EVENT_Index)
	AvatarManager.ResetCurrentActiveAvatarInstance(m_UI_INPUT_ACTION_EVENT_TYPE_COMMONBUTTONITEM_TEXTUREBUTTON1_PRESSED_EVENT_Index)
	
	# Save
	SaveGameManager.ReorderSaveGameData_Archive_AvatarList()
	
	m_UI_INPUT_ACTION_EVENT_TYPE_COMMONBUTTONITEM_TEXTUREBUTTON1_PRESSED_EVENT_Index = 0
	SceneManager.SetIsCanHandleCurrentInputMotionDirection(true)
	m_UI_INPUT_ACTION_EVENT_TYPE_COMMONBUTTONITEM_TEXTUREBUTTON1_PRESSED_EVENT_IsStart = false
	
	CurrentActiveAvatar_AddJournalRecord("NOW_I_AM_THE_TEAM_LEADER")

func UI_INPUT_ACTION_EVENT_TYPE_COMMONBUTTONBUFF_TEXTUREBUTTON1_PRESSED_EVENT_Function(eventID: int):
	HQH.Log("UI_INPUT_ACTION_EVENT_TYPE_COMMONBUTTONBUFF_TEXTUREBUTTON1_PRESSED_EVENT_Function, eventID: %s" % eventID)
	
	if GetIsInPlayChess():
		DownPanel_AddJournalRecordWithStringKey("IT_IS_PLAY_CHESS_YOU_CAN_NOT_OPERATE")
		
		return
	
	if DownPanel_IsVisible():
		m_DownPanelInfo.panelInstance.SetBagButtonListPressed(eventID - 1)

func UI_INPUT_ACTION_EVENT_TYPE_EVENT_BAG_Function():
	UI_INPUT_ACTION_EVENT_TYPE_EVENT_GOODS_Function(TableManager.GOODSTYPEID_BAG)

func UI_INPUT_ACTION_EVENT_TYPE_EVENT_JOURNALRECORDBOOK_Function():
	UI_INPUT_ACTION_EVENT_TYPE_EVENT_GOODS_Function(TableManager.GOODSTYPEID_JOURNALRECORDBOOK)

func UI_INPUT_ACTION_EVENT_TYPE_EVENT_GOODS_Function(goodsTypeID: int):
	if SaveGameManager.IsGoodsUsedHas_JournalRecordBook():
		JournalRecordPanel_ShowByPagingType(JOURNALRECORD_PANEL_PAGING_TYPE.JOURNALRECORD_PANEL_PAGING_BAG, goodsTypeID)
	else:
		DownPanel_AddJournalRecordWithStringKey("NO_JOURNALRECORDBOOK_CAN_NOT_VIEW")

func UI_INPUT_ACTION_EVENT_TYPE_EVENT_AVATAR_Function(avatarTypeID: int):
	if SaveGameManager.IsGoodsUsedHas_JournalRecordBook():
		JournalRecordPanel_ShowByPagingType(JOURNALRECORD_PANEL_PAGING_TYPE.JOURNALRECORD_PANEL_PAGING_AVATAR, avatarTypeID)
	else:
		DownPanel_AddJournalRecordWithStringKey("NO_JOURNALRECORDBOOK_CAN_NOT_VIEW")

func JournalRecordPanel_IsVisible() -> bool:
	return is_instance_valid(m_JournalRecordPanelInfo.panelInstance)

func JournalRecordPanel_ShowByPagingType(pagingType: int, typeID: int):
	JournalRecordPanel_SetPageAssign(pagingType, typeID)
	JournalRecordPanel_Show()

func JournalRecordPanel_Show():
	if GetIsInPlayChess():
		DownPanel_AddJournalRecordWithStringKey("IT_IS_PLAY_CHESS_YOU_CAN_NOT_OPERATE")
		
		return
	
	FullScreenPanel_Show()
	
	m_JournalRecordPanelInfo.panelInstance = UIAddChild(m_JournalRecordPanelInfo.panelInstance, m_JournalRecordPanelInfo.preloadResource)

func JournalRecordPanel_Hide():
	m_JournalRecordPanelInfo.panelInstance = UIRemoveChild(m_JournalRecordPanelInfo.panelInstance)

func JournalRecordPanel_on_commonButtonClose_pressed():
	HQH.Log("JournalRecordPanel_on_commonButtonClose_pressed")
	
	JournalRecordPanel_Hide()

func JournalRecordPanel_SetPageNumberLeft(newPageNumberLeft: int):
	var pageNumberLeft: int = int(clamp(newPageNumberLeft, JOURNALRECORD_PANEL_PAGENUMBERLEFTMIN, m_JournalRecordPanelInfo.panelData.pageNumberLeftMax))
	if pageNumberLeft != m_JournalRecordPanelInfo.panelData.pageNumberLeft:
		m_JournalRecordPanelInfo.panelData.pageNumberLeft = pageNumberLeft
		
		JournalRecordPanel_UpdateUI()

func JournalRecordPanel_on_commonTextureButtonJournalRecordTurnPageLeft1_pressed():
	HQH.Log("JournalRecordPanel_on_commonTextureButtonJournalRecordTurnPageLeft1_pressed")
	
	var pageNumberLeft: int = m_JournalRecordPanelInfo.panelData.pageNumberLeft - JOURNALRECORD_PANEL_PAGESTEP
	JournalRecordPanel_SetPageNumberLeft(pageNumberLeft)

func JournalRecordPanel_on_commonTextureButtonJournalRecordTurnPageRight1_pressed():
	HQH.Log("JournalRecordPanel_on_commonTextureButtonJournalRecordTurnPageRight1_pressed")
	
	var pageNumberLeft: int = m_JournalRecordPanelInfo.panelData.pageNumberLeft + JOURNALRECORD_PANEL_PAGESTEP
	JournalRecordPanel_SetPageNumberLeft(pageNumberLeft)

func JournalRecordPanel_on_commonHSliderPage_value_changed(value: int):
	HQH.Log("JournalRecordPanel_on_commonHSliderPage_value_changed, value: %s" % value)
	
	var pageNumberLeft: int = (value * JOURNALRECORD_PANEL_PAGESTEP) - JOURNALRECORD_PANEL_PAGENUMBERLEFTMIN
	JournalRecordPanel_SetPageNumberLeft(pageNumberLeft)

func JournalRecordPanel_FindPagingType_PageNumberLeft(pagingType: int) -> int:
	var pageNumberLeft: int = JOURNALRECORD_PANEL_PAGENUMBERLEFTMIN
	for iv in m_JournalRecordPanelInfo.panelData.pagingDataList:
		if pagingType == iv.pagingType:
			break
		
		pageNumberLeft += 1
	
	return pageNumberLeft

func JournalRecordPanel_on_titleButton20Avatar_pressed():
	HQH.Log("JournalRecordPanel_on_titleButton20Avatar_pressed")
	
	var pageNumberLeft: int = JournalRecordPanel_FindPagingType_PageNumberLeft(JOURNALRECORD_PANEL_PAGING_TYPE.JOURNALRECORD_PANEL_PAGING_AVATAR)
	JournalRecordPanel_SetPageNumberLeft(pageNumberLeft)

func JournalRecordPanel_on_titleButton20Bag_pressed():
	HQH.Log("JournalRecordPanel_on_titleButton20Bag_pressed")
	
	var pageNumberLeft: int = JournalRecordPanel_FindPagingType_PageNumberLeft(JOURNALRECORD_PANEL_PAGING_TYPE.JOURNALRECORD_PANEL_PAGING_BAG)
	JournalRecordPanel_SetPageNumberLeft(pageNumberLeft)

func JournalRecordPanel_on_titleButton20Scene_pressed():
	HQH.Log("JournalRecordPanel_on_titleButton20Scene_pressed")
	
	var pageNumberLeft: int = JournalRecordPanel_FindPagingType_PageNumberLeft(JOURNALRECORD_PANEL_PAGING_TYPE.JOURNALRECORD_PANEL_PAGING_SCENE)
	JournalRecordPanel_SetPageNumberLeft(pageNumberLeft)

func JournalRecordPanel_on_titleButton20Task_pressed():
	HQH.Log("JournalRecordPanel_on_titleButton20Task_pressed")
	
	var pageNumberLeft: int = JournalRecordPanel_FindPagingType_PageNumberLeft(JOURNALRECORD_PANEL_PAGING_TYPE.JOURNALRECORD_PANEL_PAGING_TASK)
	JournalRecordPanel_SetPageNumberLeft(pageNumberLeft)

func JournalRecordPanel_GetHSlider1PageValue(pageNumber: int) -> float:
	return ceil(float(pageNumber) / JOURNALRECORD_PANEL_PAGESTEP)

func JournalRecordPanel_SetPageAssign(pagingType: int, typeID: int):
	m_JournalRecordPanelInfo.panelData.pageAssign.pagingType = pagingType
	m_JournalRecordPanelInfo.panelData.pageAssign.typeID = typeID

func JournalRecordPanel_OnReady():
	m_JournalRecordPanelInfo.panelData.pagingAvatarList = SaveGameManager.GetSaveGameData_Archive_AvatarList().duplicate(true)
	m_JournalRecordPanelInfo.panelData.pagingAvatarList.invert()
	
	m_JournalRecordPanelInfo.panelData.pagingBagList = SaveGameManager.GetSaveGameData_Archive_BagList().duplicate(true)
	if SaveGameManager.IsGoodsUsedHas_Bag():
		var archive_bag: Dictionary = SaveGameManager.SAVEGAMEDATA_ARCHIVE_BAG.duplicate(true)
		archive_bag.bagGoodsTypeID = TableManager.GOODSTYPEID_BAG
		archive_bag.bagGoodsData = 0
		m_JournalRecordPanelInfo.panelData.pagingBagList.insert(0, archive_bag)
	
	if SaveGameManager.IsGoodsUsedHas_JournalRecordBook():
		var archive_bag: Dictionary = SaveGameManager.SAVEGAMEDATA_ARCHIVE_BAG.duplicate(true)
		archive_bag.bagGoodsTypeID = TableManager.GOODSTYPEID_JOURNALRECORDBOOK
		archive_bag.bagGoodsData = 0
		m_JournalRecordPanelInfo.panelData.pagingBagList.insert(0, archive_bag)
	
	m_JournalRecordPanelInfo.panelData.pagingDataList = []
	for i in JOURNALRECORD_PANEL_PAGING_TYPE.JOURNALRECORD_PANEL_PAGING_END:
		var pagingList: Array = JournalRecordPanel_GetPanelData_pagingList(i)
		if pagingList.empty():
			m_JournalRecordPanelInfo.panelData.pagingDataList.append(JOURNALRECORD_PANEL_PAGING_DATA_INFO.duplicate(true))
			m_JournalRecordPanelInfo.panelData.pagingDataList.append(JOURNALRECORD_PANEL_PAGING_DATA_INFO.duplicate(true))
		else:
			for iv in pagingList:
				var pagingDataInfo: Dictionary = JOURNALRECORD_PANEL_PAGING_DATA_INFO.duplicate(true)
				pagingDataInfo.pagingType = i
				match i:
					JOURNALRECORD_PANEL_PAGING_TYPE.JOURNALRECORD_PANEL_PAGING_AVATAR:
						pagingDataInfo.typeID = iv.avatarTypeID
					
					JOURNALRECORD_PANEL_PAGING_TYPE.JOURNALRECORD_PANEL_PAGING_BAG:
						pagingDataInfo.typeID = iv.bagGoodsTypeID
					
					JOURNALRECORD_PANEL_PAGING_TYPE.JOURNALRECORD_PANEL_PAGING_SCENE:
						pagingDataInfo.typeID = iv.sceneTypeID
					
					JOURNALRECORD_PANEL_PAGING_TYPE.JOURNALRECORD_PANEL_PAGING_TASK:
						pagingDataInfo.typeID = iv.wrangleDialogTypeID
				
				m_JournalRecordPanelInfo.panelData.pagingDataList.append(pagingDataInfo)
			
			if 1 == (m_JournalRecordPanelInfo.panelData.pagingDataList.size() % 2):
				m_JournalRecordPanelInfo.panelData.pagingDataList.append(JOURNALRECORD_PANEL_PAGING_DATA_INFO.duplicate(true))
	
	var pageNumberMax: int = m_JournalRecordPanelInfo.panelData.pagingDataList.size()
	var pageNumberLeftMax: int = pageNumberMax - 1
	m_JournalRecordPanelInfo.panelData.pageNumberLeftMax = max(JOURNALRECORD_PANEL_PAGENUMBERLEFTMIN, pageNumberLeftMax)
	HQH.CheckIsOddNumber(m_JournalRecordPanelInfo.panelData.pageNumberLeftMax)
	var pageNumberLeft: int = JOURNALRECORD_PANEL_PAGENUMBERLEFTMIN
	if JOURNALRECORD_PANEL_PAGING_TYPE.JOURNALRECORD_PANEL_PAGING_NONE != m_JournalRecordPanelInfo.panelData.pageAssign.pagingType:
		pageNumberLeft = JournalRecordPanel_GetPageNumberLeftByPagingTypeAndTypeID(m_JournalRecordPanelInfo.panelData.pageAssign.pagingType, m_JournalRecordPanelInfo.panelData.pageAssign.typeID)
		m_JournalRecordPanelInfo.panelData.pageAssign = JOURNALRECORD_PANEL_PAGING_DATA_INFO.duplicate(true)
	
	m_JournalRecordPanelInfo.panelData.pageNumberLeft = int(clamp(pageNumberLeft, JOURNALRECORD_PANEL_PAGENUMBERLEFTMIN, m_JournalRecordPanelInfo.panelData.pageNumberLeftMax))
	HQH.CheckIsOddNumber(m_JournalRecordPanelInfo.panelData.pageNumberLeft)

func JournalRecordPanel_GetPanelData_pagingList(pagingType: int) -> Array:
	var pagingList: Array = []
	match pagingType:
		JOURNALRECORD_PANEL_PAGING_TYPE.JOURNALRECORD_PANEL_PAGING_AVATAR:
			pagingList = m_JournalRecordPanelInfo.panelData.pagingAvatarList
		
		JOURNALRECORD_PANEL_PAGING_TYPE.JOURNALRECORD_PANEL_PAGING_BAG:
			pagingList = m_JournalRecordPanelInfo.panelData.pagingBagList
		
		JOURNALRECORD_PANEL_PAGING_TYPE.JOURNALRECORD_PANEL_PAGING_SCENE:
			pagingList = SaveGameManager.GetSaveGameData_Archive_SceneList()
		
		JOURNALRECORD_PANEL_PAGING_TYPE.JOURNALRECORD_PANEL_PAGING_TASK:
			pagingList = SaveGameManager.GetSaveGameData_Archive_TaskList()
	
	return pagingList

func JournalRecordPanel_GetPanelData_pagingDataList_pagingDataInfoByCurrentPageNumberLeft() -> Dictionary:
	return JournalRecordPanel_GetPanelData_pagingDataList_pagingDataInfoByPageNumberLeft(m_JournalRecordPanelInfo.panelData.pageNumberLeft)

func JournalRecordPanel_GetPanelData_pagingDataList_pagingDataInfoByPageNumberLeft(pageNumberLeft: int) -> Dictionary:
	var pageNumberLeftIndex: int = pageNumberLeft - 1
	var pageInfoLeft: Dictionary = {}
	var pageInfoRight: Dictionary = {}
	if (0 <= pageNumberLeftIndex) and (m_JournalRecordPanelInfo.panelData.pagingDataList.size() > pageNumberLeftIndex):
		pageInfoLeft = m_JournalRecordPanelInfo.panelData.pagingDataList[pageNumberLeftIndex]
		pageInfoRight = m_JournalRecordPanelInfo.panelData.pagingDataList[pageNumberLeftIndex + 1]
	
	return {"pageInfoLeft": pageInfoLeft, "pageInfoRight": pageInfoRight}

func JournalRecordPanel_GetPageNumberLeftByPagingTypeAndTypeID(pagingType: int, typeID: int) -> int:
	var pageNumberLeft: int = JOURNALRECORD_PANEL_PAGENUMBERLEFTMIN
	var i: int = 0
	for iv in m_JournalRecordPanelInfo.panelData.pagingDataList:
		if (pagingType == iv.pagingType) and (typeID == iv.typeID):
			if 0 == (i % 2):
				# i is Left Page
				pageNumberLeft = i + 1
			else:
				# i is Right Page
				pageNumberLeft = i
			
			break
		
		i += 1
	
	return pageNumberLeft

func JournalRecordPanel_GetPanelData() -> Dictionary:
	return m_JournalRecordPanelInfo.panelData

func JournalRecordPanel_UpdateUI():
	if JournalRecordPanel_IsVisible():
		m_JournalRecordPanelInfo.panelInstance.UpdateUI()

func JournalRecordPanel_OnEscButtonPressed() -> bool:
	if JournalRecordPanel_IsVisible():
		JournalRecordPanel_on_commonButtonClose_pressed()
		
		return true
	
	return false

func JournalRecordPanel_CommonTextureButtonJournalRecordTurnPageLeft1_SetPressedTrue():
	if JournalRecordPanel_IsVisible():
		m_JournalRecordPanelInfo.panelInstance.CommonTextureButtonJournalRecordTurnPageLeft1_SetPressedTrue()

func JournalRecordPanel_CommonTextureButtonJournalRecordTurnPageRight1_SetPressedTrue():
	if JournalRecordPanel_IsVisible():
		m_JournalRecordPanelInfo.panelInstance.CommonTextureButtonJournalRecordTurnPageRight1_SetPressedTrue()

func ApplyFontColorType(controlInstance: Control, colorOverrideName: String, fontColorType: int):
	var fontColor: Color = HQH.COLORPALETTE_UI.FONT_COLOR1
	var fontColorTypeString: String = "FONT_COLOR%d" % fontColorType
	if HQH.COLORPALETTE_UI.has(fontColorTypeString):
		fontColor = HQH.COLORPALETTE_UI.get(fontColorTypeString)
	else:
		HQH.AssertLog("HQH.COLORPALETTE_UI not has fontColorType: %s" % fontColorType)
	
	controlInstance.add_color_override(colorOverrideName, fontColor)

func RichTextLabel_GetStringWithFlagColor(s: String, colorString: String) -> String:
	return "[color=#{colorString}]{s}[/color]".format({"s": s, "colorString": colorString})

func RichTextLabel_GetStringWithColor(s: String, colorString: String) -> String:
	return "[color={colorString}]{s}[/color]".format({"s": s, "colorString": colorString})

func RichTextLabel_GetStringWithClickEvent(s: String, clickEventString: String) -> String:
	return "[url={clickEventString}]{s}[/url]".format({"s": s, "clickEventString": clickEventString})

func RichTextLabel_GetStringWithUnderline(s: String) -> String:
	return "[u]{s}[/u]".format({"s": s})

func RichTextLabel_GetStringWithFlagColorAndClickEvent(s: String, colorString: String, clickEventString: String) -> String:
	return "[color=#{colorString}][url={clickEventString}]{s}[/url][/color]".format({"s": s, "colorString": colorString, "clickEventString": clickEventString})

func RichTextLabel_GetStringWithColorAndClickEvent(s: String, colorString: String, clickEventString: String) -> String:
	return "[color={colorString}][url={clickEventString}]{s}[/url][/color]".format({"s": s, "colorString": colorString, "clickEventString": clickEventString})

func RichTextLabel_GetStringWithColorAndUnderline(s: String, colorString: String) -> String:
	return "[color={colorString}][u]{s}[/u][/color]".format({"s": s, "colorString": colorString})

func GetInteractionInfo() -> Dictionary:
	return {"npcTriggerType": m_DownPanelInfo.panelData.interactionInfo.npcTriggerType, "interactionNPC" : m_DownPanelInfo.panelData.interactionInfo.interactionNPC}

func NPCTrigger_on_area2D1_body_entered(body: Node2D, nPCAvatarInstance: Node2D, npcTriggerType: int, npcTriggerTypeID: int):
	if body.has_method("GetAvatarObjectID"):
		if AvatarManager.IsCurrentActiveAvatar(body.GetAvatarObjectID()):
			HQH.Log("NPCTrigger entered")
			
			AudioManager.PlayByName_ButtonHover()
			
			m_DownPanelInfo.panelData.interactionInfo.isInInteraction = true
			m_DownPanelInfo.panelData.interactionInfo.npcTriggerType = npcTriggerType
			m_DownPanelInfo.panelData.interactionInfo.npcTriggerTypeID = npcTriggerTypeID
			if TableManager.NPC_TRIGGER_TYPE.NPC_AVATAR == m_DownPanelInfo.panelData.interactionInfo.npcTriggerType:
				var nPCTriggerInfo: Dictionary = TableManager.GetNPCTriggerInfo(m_DownPanelInfo.panelData.interactionInfo.npcTriggerTypeID)
				m_DownPanelInfo.panelData.interactionInfo.wrangleDialogInfo.initWrangleDialogTypeID = nPCTriggerInfo.wrangleDialogTypeID
			else: # TableManager.NPC_TRIGGER_TYPE.NPC_ARTICLE
				var nPCArticleTriggerInfo: Dictionary = TableManager.GetNPCArticleTriggerInfo(m_DownPanelInfo.panelData.interactionInfo.npcTriggerTypeID)
				m_DownPanelInfo.panelData.interactionInfo.wrangleDialogInfo.initWrangleDialogTypeID = nPCArticleTriggerInfo.wrangleDialogTypeID
			
			AvatarManager.SetCurrentActiveAvatarInstanceInInteraction(true)
			m_DownPanelInfo.panelData.interactionInfo.interactionNPC = nPCAvatarInstance
			m_DownPanelInfo.panelData.interactionInfo.interactionNPC.SetInInteraction(true)
			
			DownPanel_SetCommonTextureButtonInteraction1Visible(true)
			var isTalk: bool = false
			if TableManager.NPC_TRIGGER_TYPE.NPC_AVATAR == npcTriggerType:
				isTalk = true
			
			DownPanel_SetControlInteraction_commonTextureButtonInteraction1(isTalk)
			
			var resultTaskInfo: Dictionary = SaveGameManager.GetSaveGameData_Archive_TaskList_TaskInfoByWrangleDialogTypeID(m_DownPanelInfo.panelData.interactionInfo.wrangleDialogInfo.initWrangleDialogTypeID)
			if resultTaskInfo.isHas:
				DownPanel_SetCommonTextureButtonPlayChess1Visible(true)
			else:
				DownPanel_SetCommonTextureButtonPlayChess1Visible(false)

func NPCTrigger_on_area2D1_body_exited(body: Node2D, _nPCAvatarInstance: Node2D):
	if body.has_method("GetAvatarObjectID"):
		if AvatarManager.IsCurrentActiveAvatar(body.GetAvatarObjectID()):
			HQH.Log("NPCTrigger exited")
			
			DownPanel_WrangleDialogTerminate()

func GetIsInInteraction() -> bool:
	return m_DownPanelInfo.panelData.interactionInfo.isInInteraction

func DownPanel_WrangleDialogSetButtonVisible(isVisible: bool):
	DownPanel_SetCommonTextureButtonInteraction1Visible(isVisible)
	DownPanel_SetCommonTextureButtonPlayChess1Visible(isVisible)

func DownPanel_WrangleDialogSetVisible(isVisible: bool):
	DownPanel_WrangleDialogSetIsVisible(isVisible)
	DownPanel_WrangleDialogSetButtonVisible(not isVisible)

func DownPanel_WrangleDialogOpen():
	DownPanel_WrangleDialogSetVisible(true)

func DownPanel_WrangleDialogClose():
	DownPanel_WrangleDialogSetVisible(false)

func DownPanel_WrangleDialogTerminate():
	m_DownPanelInfo.panelData.interactionInfo.isInInteraction = false
	m_DownPanelInfo.panelData.interactionInfo.npcTriggerType = TableManager.NPC_TRIGGER_TYPE.NONE
	m_DownPanelInfo.panelData.interactionInfo.npcTriggerTypeID = 0
	m_DownPanelInfo.panelData.interactionInfo.wrangleDialogInfo.initWrangleDialogTypeID = 0
	m_DownPanelInfo.panelData.interactionInfo.wrangleDialogInfo.currentWrangleDialogTypeID = 0
	
	AvatarManager.SetCurrentActiveAvatarInstanceInInteraction(false)
	if is_instance_valid(m_DownPanelInfo.panelData.interactionInfo.interactionNPC):
		m_DownPanelInfo.panelData.interactionInfo.interactionNPC.SetInInteraction(false)
		if m_DownPanelInfo.panelData.interactionInfo.interactionNPC.has_method("AvatarStop_TALK"):
			if not m_DownPanelInfo.panelData.interactionInfo.interactionNPC.IsAvatarInState_FOLLOW():
				m_DownPanelInfo.panelData.interactionInfo.interactionNPC.AvatarStop_TALK()
		
		m_DownPanelInfo.panelData.interactionInfo.interactionNPC = null
	
	DownPanel_WrangleDialogSetIsVisible(false)
	DownPanel_WrangleDialogSetButtonVisible(false)

func WrangleDialog_Pass():
	HQH.Log("WrangleDialog_Pass")

func Scene_PickBag():
	HQH.Log("Scene_PickBag")
	
	GoodsAddFunction_Bag()
	SceneManager.UpdateCurrentScene()

func WrangleDialog_1_Function_1():
	Scene_PickBag()

func Scene_PickJournalRecordBook():
	HQH.Log("Scene_PickJournalRecordBook")
	
	GoodsAddFunction_JournalRecordBook()
	SceneManager.UpdateCurrentScene()

func WrangleDialog_2_Function_1():
	Scene_PickJournalRecordBook()

func Scene_OpenDoorBase(nPCArticleTriggerTypeID: int):
	SceneManager.Add_DoorOpened_NPCArticleTriggerTypeIDList(nPCArticleTriggerTypeID)
	SceneManager.UpdateCurrentScene()
	
	DownPanel_AddJournalRecordWithStringKey("WRANGLEDIALOG_3_FUNCTION_1")

func Scene_OpenHomeDoor(nPCArticleTriggerTypeID: int):
	HQH.Log("Scene_OpenHomeDoor, nPCArticleTriggerTypeID: %s" % nPCArticleTriggerTypeID)
	
	Scene_OpenDoorBase(nPCArticleTriggerTypeID)
	
	AudioManager.PlayByName_OpenHomeDoor()

func Scene_OpenDoor(nPCArticleTriggerTypeID: int):
	HQH.Log("Scene_OpenDoor, nPCArticleTriggerTypeID: %s" % nPCArticleTriggerTypeID)
	
	Scene_OpenDoorBase(nPCArticleTriggerTypeID)
	
	AudioManager.PlayByName_OpenDoor()

func WrangleDialog_3_Function_1():
	Scene_OpenHomeDoor(m_DownPanelInfo.panelData.interactionInfo.npcTriggerTypeID)

func WrangleDialog_13_Function_1():
	PlayChessStart_WrangleDialogInfo(m_DownPanelInfo.panelData.interactionInfo.wrangleDialogInfo.initWrangleDialogTypeID, TableManager.WRANGLEDIALOGTYPEID_DOOR, m_DownPanelInfo.panelData.interactionInfo.wrangleDialogInfo.initWrangleDialogTypeID, TableManager.WRANGLEDIALOGTYPEID_DOOR)

func WrangleDialog_19_Function_1():
	HQH.Log("WrangleDialog_19_Function_1")
	
	PlayChessStart()

func WrangleDialog_21_Function_1():
	PlayChessStart()

func WrangleDialog_23_Function_1():
	PlayChessStart()

func CheckConditionFunction_Avatar_2() -> bool:
	var isOK: bool = false
	if TableManager.AVATARTYPEID_PLAYER1 == AvatarManager.GetCurrentActiveAvatarTypeID():
		isOK = true
	else:
		isOK = false
	
	return isOK

func WrangleDialog_25_Function_1():
	PlayChessStart()

func PlayChessSuccessFunction_NPCArticle_1(_initWrangleDialogTypeID: int, _currentWrangleDialogTypeID: int):
	Scene_PickBag()

func PlayChessFailureFunction_NPCArticle_1(_initWrangleDialogTypeID: int, _currentWrangleDialogTypeID: int):
	pass

func PlayChessSuccessFunction_NPCArticle_2(_initWrangleDialogTypeID: int, _currentWrangleDialogTypeID: int):
	Scene_PickJournalRecordBook()

func PlayChessFailureFunction_NPCArticle_2(_initWrangleDialogTypeID: int, _currentWrangleDialogTypeID: int):
	pass

func PlayChessSuccessFunction_NPCArticle_3(_initWrangleDialogTypeID: int, _currentWrangleDialogTypeID: int):
	Scene_OpenHomeDoor(m_ChessPanel1Info.panelData.npcTriggerTypeID)

func PlayChessFailureFunction_NPCArticle_3(_initWrangleDialogTypeID: int, _currentWrangleDialogTypeID: int):
	pass

func PlayChessSuccessFunction_Avatar_1(_initWrangleDialogTypeID: int, _currentWrangleDialogTypeID: int):
	AvatarManager.AddAvatarFromScene(TableManager.AVATARTYPEID_SNAKE1)
	
	SaveTask(TableManager.WRANGLEDIALOGTYPEID_SNAKE1_INIT, TableManager.WRANGLEDIALOGTYPEID_SNAKE1_SUCCESS)

func PlayChessFailureFunction_Avatar_1(_initWrangleDialogTypeID: int, _currentWrangleDialogTypeID: int):
	pass

func PlayChessSuccessFunction_Avatar_2(_initWrangleDialogTypeID: int, _currentWrangleDialogTypeID: int):
	AvatarManager.AddAvatarFromScene(TableManager.AVATARTYPEID_DOG1)
	
	SaveTask(TableManager.WRANGLEDIALOGTYPEID_DOG1_INIT, TableManager.WRANGLEDIALOGTYPEID_DOG1_SUCCESS)

func PlayChessFailureFunction_Avatar_2(_initWrangleDialogTypeID: int, _currentWrangleDialogTypeID: int):
	if not CheckConditionFunction_Avatar_2():
		Avatar_AddJournalRecord(TableManager.AVATARTYPEID_DOG1, "I_DONOT_HAVE_MY_BEST_FRIEND_HERE")

func PlayChessSuccessFunction_Avatar_3(_initWrangleDialogTypeID: int, _currentWrangleDialogTypeID: int):
	AvatarManager.AddAvatarFromScene(TableManager.AVATARTYPEID_PLAYER1)
	
	SaveTask(TableManager.WRANGLEDIALOGTYPEID_PLAYER1_INIT, TableManager.WRANGLEDIALOGTYPEID_PLAYER1_SUCCESS)

func PlayChessFailureFunction_Avatar_3(_initWrangleDialogTypeID: int, _currentWrangleDialogTypeID: int):
	pass

func PlayChessSuccessFunction_Avatar_4(_initWrangleDialogTypeID: int, _currentWrangleDialogTypeID: int):
	AvatarManager.AddAvatarFromScene(TableManager.AVATARTYPEID_SILVERCARP1)
	
	SaveTask(TableManager.WRANGLEDIALOGTYPEID_SILVERCARP1_INIT, TableManager.WRANGLEDIALOGTYPEID_SILVERCARP1_SUCCESS)

func PlayChessFailureFunction_Avatar_4(_initWrangleDialogTypeID: int, _currentWrangleDialogTypeID: int):
	pass

func PlayChessSuccessFunction_Avatar_5(_initWrangleDialogTypeID: int, _currentWrangleDialogTypeID: int):
	Avatar_AddJournalRecord(TableManager.AVATARTYPEID_TORTOISE1, "YOU_ARE_A_TALL_FELLOW")

func PlayChessFailureFunction_Avatar_5(_initWrangleDialogTypeID: int, _currentWrangleDialogTypeID: int):
	Avatar_AddJournalRecordByAffixKeyRandom(TableManager.AVATARTYPEID_TORTOISE1, "WINS_AND_LOSSES_ARE_COMMON_")

func PlayChessSuccessFunction_Avatar_6(_initWrangleDialogTypeID: int, _currentWrangleDialogTypeID: int):
	AvatarManager.AddAvatarFromScene(TableManager.AVATARTYPEID_SNAKE2)
	
	SaveTask(TableManager.WRANGLEDIALOGTYPEID_SNAKE2_INIT, TableManager.WRANGLEDIALOGTYPEID_SNAKE2_SUCCESS)

func PlayChessFailureFunction_Avatar_6(_initWrangleDialogTypeID: int, _currentWrangleDialogTypeID: int):
	pass

func PlayChessSuccessFunction_Avatar_7(_initWrangleDialogTypeID: int, _currentWrangleDialogTypeID: int):
	AvatarManager.AddAvatarFromScene(TableManager.AVATARTYPEID_SNAKE3)
	
	SaveTask(TableManager.WRANGLEDIALOGTYPEID_SNAKE3_INIT, TableManager.WRANGLEDIALOGTYPEID_SNAKE3_SUCCESS)

func PlayChessFailureFunction_Avatar_7(_initWrangleDialogTypeID: int, _currentWrangleDialogTypeID: int):
	pass

func PlayChessSuccessFunction_Avatar_8(_initWrangleDialogTypeID: int, _currentWrangleDialogTypeID: int):
	AvatarManager.AddAvatarFromScene(TableManager.AVATARTYPEID_TURTLE1)
	
	SaveTask(TableManager.WRANGLEDIALOGTYPEID_TURTLE1_INIT, TableManager.WRANGLEDIALOGTYPEID_TURTLE1_SUCCESS)

func CheckConditionFunction_Avatar_8() -> bool:
	var isOK: bool = false
	if TableManager.AVATARTYPEID_SILVERCARP1 == AvatarManager.GetCurrentActiveAvatarTypeID():
		isOK = true
	else:
		isOK = false
	
	return isOK

func PlayChessFailureFunction_Avatar_8(_initWrangleDialogTypeID: int, _currentWrangleDialogTypeID: int):
	if not CheckConditionFunction_Avatar_8():
		Avatar_AddJournalRecord(TableManager.AVATARTYPEID_TURTLE1, "I_LIKE_LOBBYIST")

func PlayChessSuccessFunction_Avatar_9(_initWrangleDialogTypeID: int, _currentWrangleDialogTypeID: int):
	Avatar_AddJournalRecord(TableManager.AVATARTYPEID_ANGEL1, "PLAYCHESSSUCCESSFUNCTION_AVATAR_9_STRING")

func PlayChessFailureFunction_Avatar_9(_initWrangleDialogTypeID: int, _currentWrangleDialogTypeID: int):
	Avatar_AddJournalRecord(TableManager.AVATARTYPEID_ANGEL1, "PLAYCHESSFAILUREFUNCTION_AVATAR_9_STRING")

func PlayChessSuccessFunction_Avatar_10(_initWrangleDialogTypeID: int, _currentWrangleDialogTypeID: int):
	AvatarManager.AddAvatarFromScene(TableManager.AVATARTYPEID_DONKEY1)
	
	SaveTask(TableManager.WRANGLEDIALOGTYPEID_DONKEY1_INIT, TableManager.WRANGLEDIALOGTYPEID_DONKEY1_SUCCESS)

func CheckConditionFunction_Avatar_10() -> bool:
	var isOK: bool = false
	if TableManager.AVATARTYPEID_DOG1 == AvatarManager.GetCurrentActiveAvatarTypeID():
		isOK = true
	else:
		isOK = false
	
	return isOK

func PlayChessFailureFunction_Avatar_10(_initWrangleDialogTypeID: int, _currentWrangleDialogTypeID: int):
	if not CheckConditionFunction_Avatar_10():
		Avatar_AddJournalRecord(TableManager.AVATARTYPEID_DONKEY1, "IS_DOG1")

func WrangleDialog_227_Function_1():
	PlayChessSuccessFunction_Avatar_11(0, 0)

func GetSceneClinkerValleyInfo() -> Dictionary:
	return m_SceneClinkerValleyInfo

func PlayChessSuccessFunction_Avatar_11(_initWrangleDialogTypeID: int, _currentWrangleDialogTypeID: int):
	var lastAvatarTypeID: int = SaveGameManager.GetSwallowPopLastAvatarTypeID()
	if 0 < lastAvatarTypeID:
		AvatarManager.AddAvatarFromScene(lastAvatarTypeID)
		if lastAvatarTypeID == TableManager.SWALLOW_POP_LAST_AVATARTYPEID:
			m_SceneClinkerValleyInfo.isCloseEye = true
			SaveTask(TableManager.WRANGLEDIALOGTYPEID_CLINKERVALLEY_SISTER_INIT, TableManager.WRANGLEDIALOGTYPEID_SISTER_5_SUCCESS)
			CurrentActiveAvatar_AddJournalRecord("WE_FINALLY_FOUND")
			Avatar_AddJournalRecord(TableManager.AVATARTYPEID_QIUYU1, "WE_WILL_TOGETHER")
			SceneManager.UpdateCurrentScene()
			AudioManager.PlayByName("Audio_endless-beauty-main-11545")
		else:
			SaveGameManager.InvalidSaveGameData_Archive_TaskList_SwallowLastAvatarTypeID()

func PlayChessFailureFunction_Avatar_11(_initWrangleDialogTypeID: int, _currentWrangleDialogTypeID: int):
	pass

func WrangleDialog_228_Function_1():
	SaveTask(TableManager.WRANGLEDIALOGTYPEID_CLINKERVALLEY_SISTER_INIT, TableManager.WRANGLEDIALOGTYPEID_SISTER_6_SUCCESS)
	SceneManager.UpdateCurrentScene()

func GetSceneHallOfMelodyInfo() -> Dictionary:
	return m_SceneHallOfMelodyInfo

func WrangleDialog_173_Function_1():
	PlayChessStart()

func PlayChessSuccessFunction_Avatar_12(_initWrangleDialogTypeID: int, _currentWrangleDialogTypeID: int):
	var goodsTypeID: int = TableManager.GOODSTYPEID_WIG_CHANGING_COLOR
	if not SaveGameManager.IsBagHas(goodsTypeID):
		DownPanel_Bag_Add(goodsTypeID)
	
#	m_SceneHallOfMelodyInfo.isHide_CLERGY1 = true
	SceneManager.UpdateCurrentScene()

func PlayChessFailureFunction_Avatar_12(_initWrangleDialogTypeID: int, _currentWrangleDialogTypeID: int):
	if HQH.RandomBool():
		Avatar_AddJournalRecord(TableManager.AVATARTYPEID_CLERGY1, "YOU_CAN_NOT_FOUND_QIU_YU")
	else:
		Avatar_AddJournalRecord(TableManager.AVATARTYPEID_CLERGY1, "YOU_WILL_BE_SORRY")
	
	SceneManager.UpdateCurrentScene()

func PlayChessSuccessFunction_Avatar_13(_initWrangleDialogTypeID: int, _currentWrangleDialogTypeID: int):
	PlayChessSuccessFunction_Monster(TableManager.AVATARTYPEID_MONSTER1, "WRANGLEDIALOG_179_1_CONTENT", TableManager.WRANGLEDIALOGTYPEID_MONSTER1_INIT, TableManager.WRANGLEDIALOGTYPEID_MONSTER1_SUCCESS)

const PLAYCHESSFAILUREFUNCTION_MONSTER_NIGHTDURATIONTIMEINSECONDS_DEVIATION: float = 5.0
const PLAYCHESSFAILUREFUNCTION_MONSTER_NIGHTDURATIONTIMEINSECONDS: float = 40.0
const PLAYCHESSFAILUREFUNCTION_MONSTER_NIGHTDURATIONTIMEINSECONDS_BASE: float = PLAYCHESSFAILUREFUNCTION_MONSTER_NIGHTDURATIONTIMEINSECONDS + PLAYCHESSFAILUREFUNCTION_MONSTER_NIGHTDURATIONTIMEINSECONDS_DEVIATION
func PlayChessFailureFunction_Avatar_13(_initWrangleDialogTypeID: int, _currentWrangleDialogTypeID: int):
	PlayChessFailureFunction_Monster(TableManager.AVATARTYPEID_MONSTER1, PLAYCHESSFAILUREFUNCTION_MONSTER_NIGHTDURATIONTIMEINSECONDS_BASE + 0)

func PlayChessSuccessFunction_Avatar_14(_initWrangleDialogTypeID: int, _currentWrangleDialogTypeID: int):
	PlayChessSuccessFunction_Monster(TableManager.AVATARTYPEID_MONSTER2, "WRANGLEDIALOG_179_2_CONTENT", TableManager.WRANGLEDIALOGTYPEID_MONSTER2_INIT, TableManager.WRANGLEDIALOGTYPEID_MONSTER2_SUCCESS)

func PlayChessFailureFunction_Avatar_14(_initWrangleDialogTypeID: int, _currentWrangleDialogTypeID: int):
	PlayChessFailureFunction_Monster(TableManager.AVATARTYPEID_MONSTER2, PLAYCHESSFAILUREFUNCTION_MONSTER_NIGHTDURATIONTIMEINSECONDS_BASE + 10)

func PlayChessSuccessFunction_Avatar_15(_initWrangleDialogTypeID: int, _currentWrangleDialogTypeID: int):
	PlayChessSuccessFunction_Monster(TableManager.AVATARTYPEID_MONSTER3, "WRANGLEDIALOG_179_3_CONTENT", TableManager.WRANGLEDIALOGTYPEID_MONSTER3_INIT, TableManager.WRANGLEDIALOGTYPEID_MONSTER3_SUCCESS)

func PlayChessFailureFunction_Avatar_15(_initWrangleDialogTypeID: int, _currentWrangleDialogTypeID: int):
	PlayChessFailureFunction_Monster(TableManager.AVATARTYPEID_MONSTER3, PLAYCHESSFAILUREFUNCTION_MONSTER_NIGHTDURATIONTIMEINSECONDS_BASE + 20)

func PlayChessSuccessFunction_Avatar_16(_initWrangleDialogTypeID: int, _currentWrangleDialogTypeID: int):
	PlayChessSuccessFunction_Monster(TableManager.AVATARTYPEID_MONSTER4, "WRANGLEDIALOG_179_4_CONTENT", TableManager.WRANGLEDIALOGTYPEID_MONSTER4_INIT, TableManager.WRANGLEDIALOGTYPEID_MONSTER4_SUCCESS)

func PlayChessFailureFunction_Avatar_16(_initWrangleDialogTypeID: int, _currentWrangleDialogTypeID: int):
	PlayChessFailureFunction_Monster(TableManager.AVATARTYPEID_MONSTER4, PLAYCHESSFAILUREFUNCTION_MONSTER_NIGHTDURATIONTIMEINSECONDS_BASE + 15)

func PlayChessSuccessFunction_Avatar_17(_initWrangleDialogTypeID: int, _currentWrangleDialogTypeID: int):
	PlayChessSuccessFunction_Monster(TableManager.AVATARTYPEID_MONSTER5, "WRANGLEDIALOG_179_5_CONTENT", TableManager.WRANGLEDIALOGTYPEID_MONSTER5_INIT, TableManager.WRANGLEDIALOGTYPEID_MONSTER5_SUCCESS)

func PlayChessFailureFunction_Avatar_17(_initWrangleDialogTypeID: int, _currentWrangleDialogTypeID: int):
	PlayChessFailureFunction_Monster(TableManager.AVATARTYPEID_MONSTER5, PLAYCHESSFAILUREFUNCTION_MONSTER_NIGHTDURATIONTIMEINSECONDS_BASE + 25)

func PlayChessSuccessFunction_Avatar_18(_initWrangleDialogTypeID: int, _currentWrangleDialogTypeID: int):
	PlayChessSuccessFunction_Monster(TableManager.AVATARTYPEID_MONSTER6, "WRANGLEDIALOG_179_6_CONTENT", TableManager.WRANGLEDIALOGTYPEID_MONSTER6_INIT, TableManager.WRANGLEDIALOGTYPEID_MONSTER6_SUCCESS)

func PlayChessFailureFunction_Avatar_18(_initWrangleDialogTypeID: int, _currentWrangleDialogTypeID: int):
	PlayChessFailureFunction_Monster(TableManager.AVATARTYPEID_MONSTER6, PLAYCHESSFAILUREFUNCTION_MONSTER_NIGHTDURATIONTIMEINSECONDS_BASE + 30)

func PlayChessSuccessFunction_Avatar_19(_initWrangleDialogTypeID: int, _currentWrangleDialogTypeID: int):
	PlayChessSuccessFunction_Monster(TableManager.AVATARTYPEID_MONSTER7, "WRANGLEDIALOG_179_7_CONTENT", TableManager.WRANGLEDIALOGTYPEID_MONSTER7_INIT, TableManager.WRANGLEDIALOGTYPEID_MONSTER7_SUCCESS)

func PlayChessFailureFunction_Avatar_19(_initWrangleDialogTypeID: int, _currentWrangleDialogTypeID: int):
	PlayChessFailureFunction_Monster(TableManager.AVATARTYPEID_MONSTER7, PLAYCHESSFAILUREFUNCTION_MONSTER_NIGHTDURATIONTIMEINSECONDS_BASE + 20)

func PlayChessSuccessFunction_Avatar_20(_initWrangleDialogTypeID: int, _currentWrangleDialogTypeID: int):
	PlayChessSuccessFunction_Monster(TableManager.AVATARTYPEID_MONSTER8, "WRANGLEDIALOG_179_8_CONTENT", TableManager.WRANGLEDIALOGTYPEID_MONSTER8_INIT, TableManager.WRANGLEDIALOGTYPEID_MONSTER8_SUCCESS)

func PlayChessFailureFunction_Avatar_20(_initWrangleDialogTypeID: int, _currentWrangleDialogTypeID: int):
	PlayChessFailureFunction_Monster(TableManager.AVATARTYPEID_MONSTER8, PLAYCHESSFAILUREFUNCTION_MONSTER_NIGHTDURATIONTIMEINSECONDS_BASE + 10)

func PlayChessSuccessFunction_Avatar_21(_initWrangleDialogTypeID: int, _currentWrangleDialogTypeID: int):
	PlayChessSuccessFunction_Monster(TableManager.AVATARTYPEID_MONSTER9, "WRANGLEDIALOG_179_9_CONTENT", TableManager.WRANGLEDIALOGTYPEID_MONSTER9_INIT, TableManager.WRANGLEDIALOGTYPEID_MONSTER9_SUCCESS)

func PlayChessFailureFunction_Avatar_21(_initWrangleDialogTypeID: int, _currentWrangleDialogTypeID: int):
	PlayChessFailureFunction_Monster(TableManager.AVATARTYPEID_MONSTER9, PLAYCHESSFAILUREFUNCTION_MONSTER_NIGHTDURATIONTIMEINSECONDS_BASE + 25)

func PlayChessSuccessFunction_Avatar_22(_initWrangleDialogTypeID: int, _currentWrangleDialogTypeID: int):
	PlayChessSuccessFunction_Monster(TableManager.AVATARTYPEID_MONSTER10, "WRANGLEDIALOG_179_10_CONTENT", TableManager.WRANGLEDIALOGTYPEID_MONSTER10_INIT, TableManager.WRANGLEDIALOGTYPEID_MONSTER10_SUCCESS)

func PlayChessFailureFunction_Avatar_22(_initWrangleDialogTypeID: int, _currentWrangleDialogTypeID: int):
	PlayChessFailureFunction_Monster(TableManager.AVATARTYPEID_MONSTER10, PLAYCHESSFAILUREFUNCTION_MONSTER_NIGHTDURATIONTIMEINSECONDS_BASE + 18)

func WrangleDialog_191_Function_1():
	PlayChessStart()

func CheckConditionFunction_Avatar_23() -> bool:
	var isOK: bool = false
	if TableManager.AVATARTYPEID_PLAYER1 == AvatarManager.GetCurrentActiveAvatarTypeID():
		isOK = true
	else:
		isOK = false
	
	return isOK

func PlayChessSuccessFunction_Avatar_23(_initWrangleDialogTypeID: int, _currentWrangleDialogTypeID: int):
	AvatarManager.AddAvatarFromScene(TableManager.AVATARTYPEID_MONSTER11)
	
	PlayChessSuccessFunction_Monster(TableManager.AVATARTYPEID_MONSTER11, "WRANGLEDIALOG_179_11_CONTENT", TableManager.WRANGLEDIALOGTYPEID_MONSTER11_INIT, TableManager.WRANGLEDIALOGTYPEID_MONSTER11_SUCCESS)

func PlayChessFailureFunction_Avatar_23(_initWrangleDialogTypeID: int, _currentWrangleDialogTypeID: int):
	if not CheckConditionFunction_Avatar_23():
		Avatar_AddJournalRecord(TableManager.AVATARTYPEID_MONSTER11, "WE_LOOK_FORWARD_TO_LEARNING_PARTNERS")

func WrangleDialog_192_Function_1():
	PlayChessStart()

func CheckConditionFunction_Avatar_24() -> bool:
	var isOK: bool = false
	if TableManager.AVATARTYPEID_PLAYER1 == AvatarManager.GetCurrentActiveAvatarTypeID():
		isOK = true
	else:
		isOK = false
	
	return isOK

func PlayChessSuccessFunction_Avatar_24(_initWrangleDialogTypeID: int, _currentWrangleDialogTypeID: int):
	AvatarManager.AddAvatarFromScene(TableManager.AVATARTYPEID_MONSTER12)
	
	PlayChessSuccessFunction_Monster(TableManager.AVATARTYPEID_MONSTER12, "WRANGLEDIALOG_179_12_CONTENT", TableManager.WRANGLEDIALOGTYPEID_MONSTER12_INIT, TableManager.WRANGLEDIALOGTYPEID_MONSTER12_SUCCESS)

func PlayChessFailureFunction_Monster(avatarTypeID: int, nightDurationTimeInSeconds: float = PLAYCHESSFAILUREFUNCTION_MONSTER_NIGHTDURATIONTIMEINSECONDS_BASE):
	StartSwallowAction(nightDurationTimeInSeconds, avatarTypeID)
	
	var affixKeyRandom: String = TableManager.GetAffixKeyRandom("WAY_HOME_")
	Avatar_AddJournalRecord(avatarTypeID, affixKeyRandom)

func PlayChessSuccessFunction_Monster(avatarTypeID: int, wordKey: String, initWrangleDialogTypeID: int, successWrangleDialogTypeID: int):
	Avatar_AddJournalRecord(avatarTypeID, wordKey)
	SaveTask(initWrangleDialogTypeID, successWrangleDialogTypeID)
	SceneManager.UpdateCurrentScene()
	
	if SaveGameManager.Is12MonsterSuccess():
		CurrentActiveAvatar_AddJournalRecord("WE_HAVE_FOUND_THE_TWELVE_GOO")

func PlayChessFailureFunction_Avatar_24(_initWrangleDialogTypeID: int, _currentWrangleDialogTypeID: int):
	if not CheckConditionFunction_Avatar_24():
		Avatar_AddJournalRecord(TableManager.AVATARTYPEID_MONSTER12, "WE_LOOK_FORWARD_TO_LEARNING_PARTNERS")

func WrangleDialog_194_Function_1():
	PlayChessStart()

func PlayChessSuccessFunction_Avatar_25(_initWrangleDialogTypeID: int, _currentWrangleDialogTypeID: int):
	Avatar_AddJournalRecord(TableManager.AVATARTYPEID_KING, "WIN_THE_KING")

func PlayChessFailureFunction_Avatar_25(_initWrangleDialogTypeID: int, _currentWrangleDialogTypeID: int):
	pass

func PlayChessSuccessFunction_Avatar_26(_initWrangleDialogTypeID: int = 0, currentWrangleDialogTypeID: int = 0):
	var currentWrangleDialogTypeIDTemp: int = currentWrangleDialogTypeID
	if 0 == currentWrangleDialogTypeIDTemp:
		if not SaveGameManager.IsBagHas(TableManager.GOODSTYPEID_QUEENKEY):
			currentWrangleDialogTypeIDTemp = 158
		else:
			if not SaveGameManager.IsBagHas(TableManager.GOODSTYPEID_TELESCOPE):
				currentWrangleDialogTypeIDTemp = 156
			else:
				currentWrangleDialogTypeIDTemp = 157
	
	match currentWrangleDialogTypeIDTemp:
		156:
			if not SaveGameManager.IsBagHas(TableManager.GOODSTYPEID_TELESCOPE):
				DownPanel_Bag_Add(TableManager.GOODSTYPEID_TELESCOPE)
			else:
				Avatar_AddJournalRecord(TableManager.AVATARTYPEID_QUEEN, "YOU_ALREADY_HAVE_A_TELESCOPE")
		
		157:
			if SaveGameManager.IsBagHas(TableManager.GOODSTYPEID_TELESCOPE):
				var avatarAttribute_VisualFieldDistance: int = SaveGameManager.GetSaveGameData_Archive_AvatarAttribute_VisualFieldDistance()
				var visualFieldDistanceOld: int = SaveGameManager.GetSaveGameData_Archive_VisualFieldDistance()
				if avatarAttribute_VisualFieldDistance == visualFieldDistanceOld:
					var visualFieldDistanceNew: int = GetTelescopeVisualFieldDistanceNew(visualFieldDistanceOld)
					SaveGameManager.AddSaveGameData_Archive_GoodsUsedList(TableManager.GOODSTYPEID_TELESCOPE, visualFieldDistanceNew, HQH.RandomD2())
				
				SetTelescope(TableManager.AVATARTYPEID_QUEEN, false)
			else:
				Avatar_AddJournalRecord(TableManager.AVATARTYPEID_QUEEN, "YOU_NEED_A_TELESCOPE_FIRST")
		
		158:
			if not SaveGameManager.IsBagHas(TableManager.GOODSTYPEID_QUEENKEY):
				DownPanel_Bag_Add(TableManager.GOODSTYPEID_QUEENKEY)
			else:
				Avatar_AddJournalRecord(TableManager.AVATARTYPEID_QUEEN, "YOU_ALREADY_HAVE_THIS_KEY")

func CheckConditionFunction_Avatar_26() -> bool:
	var isOK: bool = false
	if TableManager.AVATARTYPEID_PLAYER1 == AvatarManager.GetCurrentActiveAvatarTypeID():
		isOK = true
	else:
		isOK = false
	
	return isOK

func PlayChessFailureFunction_Avatar_26(_initWrangleDialogTypeID: int, _currentWrangleDialogTypeID: int):
	if not CheckConditionFunction_Avatar_26():
		Avatar_AddJournalRecord(TableManager.AVATARTYPEID_HOUSEKEEPER, "TRUSTED_CLASSMATE")

func WrangleDialog_153_Function_1():
	if not SaveGameManager.IsBagHas(TableManager.GOODSTYPEID_TELESCOPE):
		PlayChessStart_WrangleDialogInfo(0, 156, 0, 0)
	else:
		Avatar_AddJournalRecord(TableManager.AVATARTYPEID_QUEEN, "YOU_ALREADY_HAVE_A_TELESCOPE")

func WrangleDialog_154_Function_1():
	if SaveGameManager.IsBagHas(TableManager.GOODSTYPEID_TELESCOPE):
		PlayChessStart_WrangleDialogInfo(0, 157, 0, 0)
	else:
		Avatar_AddJournalRecord(TableManager.AVATARTYPEID_QUEEN, "YOU_NEED_A_TELESCOPE_FIRST")

func WrangleDialog_155_Function_1():
	if not SaveGameManager.IsBagHas(TableManager.GOODSTYPEID_QUEENKEY):
		PlayChessStart_WrangleDialogInfo(0, 158, 0, 0)
	else:
		Avatar_AddJournalRecord(TableManager.AVATARTYPEID_QUEEN, "YOU_ALREADY_HAVE_THIS_KEY")

func GetClinkerValleySisterInfo_IsStartCounting() -> bool:
	return m_ClinkerValleySisterInfo.isStartCounting

func PlayChessSuccessFunction_Avatar_27(_initWrangleDialogTypeID: int, _currentWrangleDialogTypeID: int):
	var isHasSuccess_WRANGLEDIALOGTYPEID_SISTER_4_SUCCESS: bool = SaveGameManager.IsHasSaveGameData_Archive_TaskList_TaskInfoByWrangleDialogTypeIDAndlastChoiceWrangleDialogTypeID(TableManager.WRANGLEDIALOGTYPEID_CLINKERVALLEY_SISTER_INIT, TableManager.WRANGLEDIALOGTYPEID_SISTER_4_SUCCESS)
	if isHasSuccess_WRANGLEDIALOGTYPEID_SISTER_4_SUCCESS:
		Avatar_AddJournalRecord(TableManager.AVATARTYPEID_SISTER, "I_AM_GOING_TO_START_COUNTING")
		
		if not m_ClinkerValleySisterInfo.isStartCounting:
			m_ClinkerValleySisterInfo.isStartCounting = true
			m_ClinkerValleySisterInfo.countingTimer = 0.0
			m_ClinkerValleySisterInfo.countingNumber = CLINKERVALLEY_SISTER_INFO_COUNTING_NUMBER_MIN
			m_ClinkerValleySisterInfo.countingtimeStep = HQH.RandomModRangeFloat(CLINKERVALLEY_SISTER_INFO_COUNTING_TIME_STEP_MIN, CLINKERVALLEY_SISTER_INFO_COUNTING_TIME_STEP_MAX)
			HQH.Log("PlayChessSuccessFunction_Avatar_27, m_ClinkerValleySisterInfo.isStartCounting = true, countingtimeStep: %s" % m_ClinkerValleySisterInfo.countingtimeStep)
		else:
			Avatar_AddJournalRecord(TableManager.AVATARTYPEID_SISTER, "THE_LAST_COUNT_IS_NOT_OVER")

func PlayChessFailureFunction_Avatar_27(_initWrangleDialogTypeID: int, _currentWrangleDialogTypeID: int):
	var isHasSuccess_WRANGLEDIALOGTYPEID_SISTER_4_SUCCESS: bool = SaveGameManager.IsHasSaveGameData_Archive_TaskList_TaskInfoByWrangleDialogTypeIDAndlastChoiceWrangleDialogTypeID(TableManager.WRANGLEDIALOGTYPEID_CLINKERVALLEY_SISTER_INIT, TableManager.WRANGLEDIALOGTYPEID_SISTER_4_SUCCESS)
	if isHasSuccess_WRANGLEDIALOGTYPEID_SISTER_4_SUCCESS:
		Avatar_AddJournalRecord(TableManager.AVATARTYPEID_SISTER, "THE_GAME_HAS_NOT_STARTED_YET")

func PlayChessSuccessFunction_Avatar_28(_initWrangleDialogTypeID: int, _currentWrangleDialogTypeID: int):
	if SaveGameManager.IsBagHas(TableManager.GOODSTYPEID_HOUSEKEEPERKEY):
		Avatar_AddJournalRecord(TableManager.AVATARTYPEID_HOUSEKEEPER, "YOU_HAD_THE_KEY")
	else:
		DownPanel_Bag_Add(TableManager.GOODSTYPEID_HOUSEKEEPERKEY)

func CheckConditionFunction_Avatar_28() -> bool:
	var isOK: bool = false
	if TableManager.AVATARTYPEID_PLAYER1 == AvatarManager.GetCurrentActiveAvatarTypeID():
		isOK = true
	else:
		isOK = false
	
	return isOK

func PlayChessFailureFunction_Avatar_28(_initWrangleDialogTypeID: int, _currentWrangleDialogTypeID: int):
	if not CheckConditionFunction_Avatar_28():
		Avatar_AddJournalRecord(TableManager.AVATARTYPEID_HOUSEKEEPER, "TRUSTED_CLASSMATE")

func PlayChessSuccessFunction_Avatar_29(_initWrangleDialogTypeID: int, _currentWrangleDialogTypeID: int):
	if SaveGameManager.IsBagHas(TableManager.GOODSTYPEID_BUTLERKEY):
		Avatar_AddJournalRecord(TableManager.AVATARTYPEID_BUTLER, "YOU_HAD_THE_KEY")
	else:
		DownPanel_Bag_Add(TableManager.GOODSTYPEID_BUTLERKEY)

func CheckConditionFunction_Avatar_29() -> bool:
	var isOK: bool = false
	if TableManager.AVATARTYPEID_PLAYER1 == AvatarManager.GetCurrentActiveAvatarTypeID():
		isOK = true
	else:
		isOK = false
	
	return isOK

func PlayChessFailureFunction_Avatar_29(_initWrangleDialogTypeID: int, _currentWrangleDialogTypeID: int):
	if not CheckConditionFunction_Avatar_29():
		Avatar_AddJournalRecord(TableManager.AVATARTYPEID_BUTLER, "TRUSTED_CLASSMATE")

func PlayChessSuccessFunction_Avatar_30(_initWrangleDialogTypeID: int, _currentWrangleDialogTypeID: int):
	pass

func PlayChessFailureFunction_Avatar_30(_initWrangleDialogTypeID: int, _currentWrangleDialogTypeID: int):
	pass

func WrangleDialog_52_Function_1():
	PlayChessStart()

func WrangleDialog_55_Function_1():
	PlayChessStart()

func WrangleDialog_57_Function_1():
	PlayChessStart()

func WrangleDialog_76_7_Function_1():
	PlayChessStart()

func WrangleDialog_84_Function_1():
	PlayChessStart()

func WrangleDialog_94_Function_1():
	PlayChessStart()

func WrangleDialog_103_Function_1():
	Avatar_AddJournalRecordByAffixKeyRandom(TableManager.AVATARTYPEID_ANGEL1, "WRANGLEDIALOG_103_FUNCTION_1_")

func WrangleDialog_106_Function_1():
	PlayChessStart()

func CheckConditionFunction_NPCArticle_9() -> bool:
	var isOK: bool = false
	if TableManager.AVATARTYPEID_SILVERCARP1 == AvatarManager.GetCurrentActiveAvatarTypeID():
		isOK = true
	else:
		isOK = false
	
	return isOK

func PlayChessSuccessFunction_NPCArticle_9(_initWrangleDialogTypeID: int, _currentWrangleDialogTypeID: int):
	DownPanel_Bag_Add(TableManager.GOODSTYPEID_FOOT)
	
	SaveTask(TableManager.WRANGLEDIALOGTYPEID_FOOT_INIT, TableManager.WRANGLEDIALOGTYPEID_FOOT_SUCCESS)
	SceneManager.UpdateCurrentScene()

func PlayChessFailureFunction_NPCArticle_9(_initWrangleDialogTypeID: int, _currentWrangleDialogTypeID: int):
	if not CheckConditionFunction_NPCArticle_9():
		Goods_AddJournalRecord(TableManager.GOODSTYPEID_FOOT, "WHERE_ARE_THE_LOBBYISTS")

func PlayChessSuccessFunction_NPCArticle_10(_initWrangleDialogTypeID: int, _currentWrangleDialogTypeID: int):
	DownPanel_Bag_Add(TableManager.GOODSTYPEID_LETTER3)
	
	SaveTask(TableManager.WRANGLEDIALOGTYPEID_LETTER3_INIT, TableManager.WRANGLEDIALOGTYPEID_LETTER3_SUCCESS)
	SceneManager.UpdateCurrentScene()

func CheckConditionFunction_NPCArticle_10() -> bool:
	var isOK: bool = false
	if TableManager.AVATARTYPEID_PLAYER1 == AvatarManager.GetCurrentActiveAvatarTypeID():
		isOK = true
	else:
		isOK = false
	
	return isOK

func PlayChessFailureFunction_NPCArticle_10(_initWrangleDialogTypeID: int, _currentWrangleDialogTypeID: int):
	if not CheckConditionFunction_NPCArticle_10():
		Goods_AddJournalRecord(TableManager.GOODSTYPEID_LETTER3, "TO_NAME_AVATAR_3_LETTER")

func WrangleDialog_107_Function_1():
	PlayChessStart()

func WrangleDialog_108_Function_1():
	PlayChessStart()

func WrangleDialog_109_Function_1():
	PlayChessStart()

func WrangleDialog_110_Function_1():
	PlayChessStart()

func WrangleDialog_111_Function_1():
	PlayChessStart()

func WrangleDialog_112_Function_1():
	PlayChessStart()

func WrangleDialog_113_Function_1():
	PlayChessStart()

func WrangleDialog_114_Function_1():
	PlayChessStart()

func WrangleDialog_115_Function_1():
	PlayChessStart()

func WrangleDialog_116_Function_1():
	PlayChessStart()

func WrangleDialog_117_Function_1():
	PlayChessStart()

func WrangleDialog_118_Function_1():
	PlayChessStart()

func WrangleDialog_119_Function_1():
	PlayChessStart()

func WrangleDialog_120_Function_1():
	PlayChessStart()

func WrangleDialog_121_Function_1():
	PlayChessStart()

func WrangleDialog_126_Function_1():
	SaveTask(TableManager.WRANGLEDIALOGTYPEID_KING_INIT, 127)

func WrangleDialog_132_Function_1():
	SaveTask(TableManager.WRANGLEDIALOGTYPEID_KING_INIT, 133)

func GetBagNotHasWigGoodsTypeIDList() -> Array:
	var bagNotHasWigGoodsTypeIDList: Array = []
	for i in range(TableManager.GOODSTYPEID_WIG_BEGIN, TableManager.GOODSTYPEID_WIG_END + 1):
		var isBagHas: bool = SaveGameManager.IsBagHas(i)
		if not isBagHas:
			bagNotHasWigGoodsTypeIDList.append(i)
	
	return bagNotHasWigGoodsTypeIDList

func GetOdeToJoyGoodsTypeIDByNPCArticleTriggerTypeID(nPCArticleTriggerTypeID: int) -> int:
	return TableManager.GOODSTYPEID_WIG_BEGIN + (nPCArticleTriggerTypeID - TableManager.NPCARTICLETRIGGERTYPEID_ODETOJOY_BEGIN)

func GetOdeToJoyNPCArticleTriggerTypeIDByGoodsTypeID(goodsTypeID: int) -> int:
	return TableManager.NPCARTICLETRIGGERTYPEID_ODETOJOY_BEGIN + (goodsTypeID - TableManager.GOODSTYPEID_WIG_BEGIN)

func WrangleDialog_135_Function_1():
	HQH.Log("WrangleDialog_135_Function_1")
	
	var bagNotHasWigGoodsTypeIDList: Array = GetBagNotHasWigGoodsTypeIDList()
	if bagNotHasWigGoodsTypeIDList.empty():
		Avatar_AddJournalRecord(TableManager.AVATARTYPEID_KING, "ALL_GIFTS_HAD_GIVE_YOU")
	else:
		var randomIndex: int = HQH.RandomModRange(0, bagNotHasWigGoodsTypeIDList.size() - 1)
		var randomGoodsTypeID: int = bagNotHasWigGoodsTypeIDList[randomIndex]
		m_ChessPanel1Info.panelData.kingInfo.conditionNPCArticleTriggerTypeID = GetOdeToJoyNPCArticleTriggerTypeIDByGoodsTypeID(randomGoodsTypeID)
		HQH.Log("m_ChessPanel1Info.panelData.kingInfo.conditionNPCArticleTriggerTypeID: %s" % m_ChessPanel1Info.panelData.kingInfo.conditionNPCArticleTriggerTypeID)
		var nPCArticleTriggerInfo: Dictionary = TableManager.GetNPCArticleTriggerInfo(m_ChessPanel1Info.panelData.kingInfo.conditionNPCArticleTriggerTypeID)
		var goodsInfo: Dictionary = TableManager.GetGoodsInfo(randomGoodsTypeID)
		var colorString: String = TableManager.TableGetValue_EquipTable1_ColorString(String(goodsInfo.equipTypeID))
		var showCondition: String = RichTextLabel_GetStringWithFlagColor(TableManager.GetLanguageString(nPCArticleTriggerInfo.showNameKey), colorString)
		Avatar_AddJournalRecordString(TableManager.AVATARTYPEID_KING, TableManager.GetLanguageString("KING_LOW_VOICE") % showCondition)

func WrangleDialog_136_Function_1():
	HQH.Log("WrangleDialog_136_Function_1")
	
	if m_ChessPanel1Info.panelData.kingInfo.successNPCArticleTriggerTypeIDList.empty():
		Avatar_AddJournalRecord(TableManager.AVATARTYPEID_KING, "YOU_NEED_TO_PROVE")
	else:
		var isAddGoods: bool = false
		for i in m_ChessPanel1Info.panelData.kingInfo.successNPCArticleTriggerTypeIDList:
			var goodsTypeID: int = GetOdeToJoyGoodsTypeIDByNPCArticleTriggerTypeID(i)
			var isBagHas: bool = SaveGameManager.IsBagHas(goodsTypeID)
			if not isBagHas:
				isAddGoods = true
				DownPanel_Bag_Add(goodsTypeID)
		
		if isAddGoods:
			Avatar_AddJournalRecord(TableManager.AVATARTYPEID_KING, "WHEN_I_WAS_YOUNG")
		else:
			Avatar_AddJournalRecord(TableManager.AVATARTYPEID_KING, "I_CAN_NOT_HAVE_MY_LITTLE_GIFT_AGAIN")
	
	m_ChessPanel1Info.panelData.kingInfo.successNPCArticleTriggerTypeIDList.clear()

func CheckConditionFunction_NPCArticle_OdeToJoy(npcTriggerTypeID: int) -> bool:
	var isOK: bool = false
	if npcTriggerTypeID == m_ChessPanel1Info.panelData.kingInfo.conditionNPCArticleTriggerTypeID:
		isOK = true
	else:
		isOK = false
	
	return isOK

func CheckConditionFunction_NPCArticle_11() -> bool:
	return CheckConditionFunction_NPCArticle_OdeToJoy(TableManager.NPCARTICLETRIGGERTYPEID_ODETOJOY_BEGIN)

func CheckConditionFunction_NPCArticle_12() -> bool:
	return CheckConditionFunction_NPCArticle_OdeToJoy(TableManager.NPCARTICLETRIGGERTYPEID_ODETOJOY_BEGIN + 1)

func CheckConditionFunction_NPCArticle_13() -> bool:
	return CheckConditionFunction_NPCArticle_OdeToJoy(TableManager.NPCARTICLETRIGGERTYPEID_ODETOJOY_BEGIN + 2)

func CheckConditionFunction_NPCArticle_14() -> bool:
	return CheckConditionFunction_NPCArticle_OdeToJoy(TableManager.NPCARTICLETRIGGERTYPEID_ODETOJOY_BEGIN + 3)

func CheckConditionFunction_NPCArticle_15() -> bool:
	return CheckConditionFunction_NPCArticle_OdeToJoy(TableManager.NPCARTICLETRIGGERTYPEID_ODETOJOY_BEGIN + 4)

func CheckConditionFunction_NPCArticle_16() -> bool:
	return CheckConditionFunction_NPCArticle_OdeToJoy(TableManager.NPCARTICLETRIGGERTYPEID_ODETOJOY_BEGIN + 5)

func CheckConditionFunction_NPCArticle_17() -> bool:
	return CheckConditionFunction_NPCArticle_OdeToJoy(TableManager.NPCARTICLETRIGGERTYPEID_ODETOJOY_BEGIN + 6)

func CheckConditionFunction_NPCArticle_18() -> bool:
	return CheckConditionFunction_NPCArticle_OdeToJoy(TableManager.NPCARTICLETRIGGERTYPEID_ODETOJOY_BEGIN + 7)

func CheckConditionFunction_NPCArticle_19() -> bool:
	return CheckConditionFunction_NPCArticle_OdeToJoy(TableManager.NPCARTICLETRIGGERTYPEID_ODETOJOY_BEGIN + 8)

func CheckConditionFunction_NPCArticle_20() -> bool:
	return CheckConditionFunction_NPCArticle_OdeToJoy(TableManager.NPCARTICLETRIGGERTYPEID_ODETOJOY_BEGIN + 9)

func CheckConditionFunction_NPCArticle_21() -> bool:
	return CheckConditionFunction_NPCArticle_OdeToJoy(TableManager.NPCARTICLETRIGGERTYPEID_ODETOJOY_BEGIN + 10)

func CheckConditionFunction_NPCArticle_22() -> bool:
	return CheckConditionFunction_NPCArticle_OdeToJoy(TableManager.NPCARTICLETRIGGERTYPEID_ODETOJOY_BEGIN + 11)

func CheckConditionFunction_NPCArticle_23() -> bool:
	return CheckConditionFunction_NPCArticle_OdeToJoy(TableManager.NPCARTICLETRIGGERTYPEID_ODETOJOY_BEGIN + 12)

func CheckConditionFunction_NPCArticle_24() -> bool:
	return CheckConditionFunction_NPCArticle_OdeToJoy(TableManager.NPCARTICLETRIGGERTYPEID_ODETOJOY_BEGIN + 13)

func CheckConditionFunction_NPCArticle_25() -> bool:
	return CheckConditionFunction_NPCArticle_OdeToJoy(TableManager.NPCARTICLETRIGGERTYPEID_ODETOJOY_BEGIN + 14)

func AddSuccessNPCArticleTriggerTypeIDList(successNPCArticleTriggerTypeID):
	if not (successNPCArticleTriggerTypeID in m_ChessPanel1Info.panelData.kingInfo.successNPCArticleTriggerTypeIDList):
		m_ChessPanel1Info.panelData.kingInfo.successNPCArticleTriggerTypeIDList.append(successNPCArticleTriggerTypeID)

func PlayChessSuccessFunction_NPCArticle_11(_initWrangleDialogTypeID: int, _currentWrangleDialogTypeID: int):
	AddSuccessNPCArticleTriggerTypeIDList(TableManager.NPCARTICLETRIGGERTYPEID_ODETOJOY_BEGIN)

func PlayChessSuccessFunction_NPCArticle_12(_initWrangleDialogTypeID: int, _currentWrangleDialogTypeID: int):
	AddSuccessNPCArticleTriggerTypeIDList(TableManager.NPCARTICLETRIGGERTYPEID_ODETOJOY_BEGIN + 1)

func PlayChessSuccessFunction_NPCArticle_13(_initWrangleDialogTypeID: int, _currentWrangleDialogTypeID: int):
	AddSuccessNPCArticleTriggerTypeIDList(TableManager.NPCARTICLETRIGGERTYPEID_ODETOJOY_BEGIN + 2)

func PlayChessSuccessFunction_NPCArticle_14(_initWrangleDialogTypeID: int, _currentWrangleDialogTypeID: int):
	AddSuccessNPCArticleTriggerTypeIDList(TableManager.NPCARTICLETRIGGERTYPEID_ODETOJOY_BEGIN + 3)

func PlayChessSuccessFunction_NPCArticle_15(_initWrangleDialogTypeID: int, _currentWrangleDialogTypeID: int):
	AddSuccessNPCArticleTriggerTypeIDList(TableManager.NPCARTICLETRIGGERTYPEID_ODETOJOY_BEGIN + 4)

func PlayChessSuccessFunction_NPCArticle_16(_initWrangleDialogTypeID: int, _currentWrangleDialogTypeID: int):
	AddSuccessNPCArticleTriggerTypeIDList(TableManager.NPCARTICLETRIGGERTYPEID_ODETOJOY_BEGIN + 5)

func PlayChessSuccessFunction_NPCArticle_17(_initWrangleDialogTypeID: int, _currentWrangleDialogTypeID: int):
	AddSuccessNPCArticleTriggerTypeIDList(TableManager.NPCARTICLETRIGGERTYPEID_ODETOJOY_BEGIN + 6)

func PlayChessSuccessFunction_NPCArticle_18(_initWrangleDialogTypeID: int, _currentWrangleDialogTypeID: int):
	AddSuccessNPCArticleTriggerTypeIDList(TableManager.NPCARTICLETRIGGERTYPEID_ODETOJOY_BEGIN + 7)

func PlayChessSuccessFunction_NPCArticle_19(_initWrangleDialogTypeID: int, _currentWrangleDialogTypeID: int):
	AddSuccessNPCArticleTriggerTypeIDList(TableManager.NPCARTICLETRIGGERTYPEID_ODETOJOY_BEGIN + 8)

func PlayChessSuccessFunction_NPCArticle_20(_initWrangleDialogTypeID: int, _currentWrangleDialogTypeID: int):
	AddSuccessNPCArticleTriggerTypeIDList(TableManager.NPCARTICLETRIGGERTYPEID_ODETOJOY_BEGIN + 9)

func PlayChessSuccessFunction_NPCArticle_21(_initWrangleDialogTypeID: int, _currentWrangleDialogTypeID: int):
	AddSuccessNPCArticleTriggerTypeIDList(TableManager.NPCARTICLETRIGGERTYPEID_ODETOJOY_BEGIN + 10)

func PlayChessSuccessFunction_NPCArticle_22(_initWrangleDialogTypeID: int, _currentWrangleDialogTypeID: int):
	AddSuccessNPCArticleTriggerTypeIDList(TableManager.NPCARTICLETRIGGERTYPEID_ODETOJOY_BEGIN + 11)

func PlayChessSuccessFunction_NPCArticle_23(_initWrangleDialogTypeID: int, _currentWrangleDialogTypeID: int):
	AddSuccessNPCArticleTriggerTypeIDList(TableManager.NPCARTICLETRIGGERTYPEID_ODETOJOY_BEGIN + 12)

func PlayChessSuccessFunction_NPCArticle_24(_initWrangleDialogTypeID: int, _currentWrangleDialogTypeID: int):
	AddSuccessNPCArticleTriggerTypeIDList(TableManager.NPCARTICLETRIGGERTYPEID_ODETOJOY_BEGIN + 13)

func PlayChessSuccessFunction_NPCArticle_25(_initWrangleDialogTypeID: int, _currentWrangleDialogTypeID: int):
	AddSuccessNPCArticleTriggerTypeIDList(TableManager.NPCARTICLETRIGGERTYPEID_ODETOJOY_BEGIN + 14)

func PlayChessFailureFunction_NPCArticle_11(_initWrangleDialogTypeID: int, _currentWrangleDialogTypeID: int):
	if not CheckConditionFunction_NPCArticle_11():
		NPCArticle_AddJournalRecord(TableManager.NPCARTICLETRIGGERTYPEID_ODETOJOY_BEGIN, "PLAYCHESSFAILUREFUNCTION_NPCARTICLE_ODETOJOY")

func PlayChessFailureFunction_NPCArticle_12(_initWrangleDialogTypeID: int, _currentWrangleDialogTypeID: int):
	if not CheckConditionFunction_NPCArticle_12():
		NPCArticle_AddJournalRecord(TableManager.NPCARTICLETRIGGERTYPEID_ODETOJOY_BEGIN + 1, "PLAYCHESSFAILUREFUNCTION_NPCARTICLE_ODETOJOY")

func PlayChessFailureFunction_NPCArticle_13(_initWrangleDialogTypeID: int, _currentWrangleDialogTypeID: int):
	if not CheckConditionFunction_NPCArticle_13():
		NPCArticle_AddJournalRecord(TableManager.NPCARTICLETRIGGERTYPEID_ODETOJOY_BEGIN + 2, "PLAYCHESSFAILUREFUNCTION_NPCARTICLE_ODETOJOY")

func PlayChessFailureFunction_NPCArticle_14(_initWrangleDialogTypeID: int, _currentWrangleDialogTypeID: int):
	if not CheckConditionFunction_NPCArticle_14():
		NPCArticle_AddJournalRecord(TableManager.NPCARTICLETRIGGERTYPEID_ODETOJOY_BEGIN + 3, "PLAYCHESSFAILUREFUNCTION_NPCARTICLE_ODETOJOY")

func PlayChessFailureFunction_NPCArticle_15(_initWrangleDialogTypeID: int, _currentWrangleDialogTypeID: int):
	if not CheckConditionFunction_NPCArticle_15():
		NPCArticle_AddJournalRecord(TableManager.NPCARTICLETRIGGERTYPEID_ODETOJOY_BEGIN + 4, "PLAYCHESSFAILUREFUNCTION_NPCARTICLE_ODETOJOY")

func PlayChessFailureFunction_NPCArticle_16(_initWrangleDialogTypeID: int, _currentWrangleDialogTypeID: int):
	if not CheckConditionFunction_NPCArticle_16():
		NPCArticle_AddJournalRecord(TableManager.NPCARTICLETRIGGERTYPEID_ODETOJOY_BEGIN + 5, "PLAYCHESSFAILUREFUNCTION_NPCARTICLE_ODETOJOY")

func PlayChessFailureFunction_NPCArticle_17(_initWrangleDialogTypeID: int, _currentWrangleDialogTypeID: int):
	if not CheckConditionFunction_NPCArticle_17():
		NPCArticle_AddJournalRecord(TableManager.NPCARTICLETRIGGERTYPEID_ODETOJOY_BEGIN + 6, "PLAYCHESSFAILUREFUNCTION_NPCARTICLE_ODETOJOY")

func PlayChessFailureFunction_NPCArticle_18(_initWrangleDialogTypeID: int, _currentWrangleDialogTypeID: int):
	if not CheckConditionFunction_NPCArticle_18():
		NPCArticle_AddJournalRecord(TableManager.NPCARTICLETRIGGERTYPEID_ODETOJOY_BEGIN + 7, "PLAYCHESSFAILUREFUNCTION_NPCARTICLE_ODETOJOY")

func PlayChessFailureFunction_NPCArticle_19(_initWrangleDialogTypeID: int, _currentWrangleDialogTypeID: int):
	if not CheckConditionFunction_NPCArticle_19():
		NPCArticle_AddJournalRecord(TableManager.NPCARTICLETRIGGERTYPEID_ODETOJOY_BEGIN + 8, "PLAYCHESSFAILUREFUNCTION_NPCARTICLE_ODETOJOY")

func PlayChessFailureFunction_NPCArticle_20(_initWrangleDialogTypeID: int, _currentWrangleDialogTypeID: int):
	if not CheckConditionFunction_NPCArticle_20():
		NPCArticle_AddJournalRecord(TableManager.NPCARTICLETRIGGERTYPEID_ODETOJOY_BEGIN + 9, "PLAYCHESSFAILUREFUNCTION_NPCARTICLE_ODETOJOY")

func PlayChessFailureFunction_NPCArticle_21(_initWrangleDialogTypeID: int, _currentWrangleDialogTypeID: int):
	if not CheckConditionFunction_NPCArticle_21():
		NPCArticle_AddJournalRecord(TableManager.NPCARTICLETRIGGERTYPEID_ODETOJOY_BEGIN + 10, "PLAYCHESSFAILUREFUNCTION_NPCARTICLE_ODETOJOY")

func PlayChessFailureFunction_NPCArticle_22(_initWrangleDialogTypeID: int, _currentWrangleDialogTypeID: int):
	if not CheckConditionFunction_NPCArticle_22():
		NPCArticle_AddJournalRecord(TableManager.NPCARTICLETRIGGERTYPEID_ODETOJOY_BEGIN + 11, "PLAYCHESSFAILUREFUNCTION_NPCARTICLE_ODETOJOY")

func PlayChessFailureFunction_NPCArticle_23(_initWrangleDialogTypeID: int, _currentWrangleDialogTypeID: int):
	if not CheckConditionFunction_NPCArticle_23():
		NPCArticle_AddJournalRecord(TableManager.NPCARTICLETRIGGERTYPEID_ODETOJOY_BEGIN + 12, "PLAYCHESSFAILUREFUNCTION_NPCARTICLE_ODETOJOY")

func PlayChessFailureFunction_NPCArticle_24(_initWrangleDialogTypeID: int, _currentWrangleDialogTypeID: int):
	if not CheckConditionFunction_NPCArticle_24():
		NPCArticle_AddJournalRecord(TableManager.NPCARTICLETRIGGERTYPEID_ODETOJOY_BEGIN + 13, "PLAYCHESSFAILUREFUNCTION_NPCARTICLE_ODETOJOY")

func PlayChessFailureFunction_NPCArticle_25(_initWrangleDialogTypeID: int, _currentWrangleDialogTypeID: int):
	if not CheckConditionFunction_NPCArticle_25():
		NPCArticle_AddJournalRecord(TableManager.NPCARTICLETRIGGERTYPEID_ODETOJOY_BEGIN + 14, "PLAYCHESSFAILUREFUNCTION_NPCARTICLE_ODETOJOY")

func WrangleDialog_137_Function_1():
	if SaveGameManager.IsBagHas(TableManager.GOODSTYPEID_HOUSEKEEPERKEY):
		Scene_OpenDoor(TableManager.NPCARTICLETRIGGERTYPEID_DOOR6)
	else:
		PlayChessStart()

func CheckConditionFunction_NPCArticle_26() -> bool:
	var isOK: bool = false
	if TableManager.AVATARTYPEID_DONKEY1 == AvatarManager.GetCurrentActiveAvatarTypeID():
		isOK = true
	else:
		isOK = false
	
	return isOK

func PlayChessSuccessFunction_NPCArticle_26(_initWrangleDialogTypeID: int, _currentWrangleDialogTypeID: int):
	Scene_OpenDoor(TableManager.NPCARTICLETRIGGERTYPEID_DOOR6)

func PlayChessFailureFunction_NPCArticle_26(_initWrangleDialogTypeID: int, _currentWrangleDialogTypeID: int):
	if not CheckConditionFunction_NPCArticle_26():
		if HQH.RandomBool():
			NPCArticle_AddJournalRecord(TableManager.NPCARTICLETRIGGERTYPEID_DOOR6, "GUARD_THE_ROYAL_FAMILY")
		else:
			NPCArticle_AddJournalRecord(TableManager.NPCARTICLETRIGGERTYPEID_DOOR6, "NOT_EASY_OPEN_THE_DOOR_WITHOUT_THE_KEY")

func WrangleDialog_138_Function_1():
	if SaveGameManager.IsBagHas(TableManager.GOODSTYPEID_BUTLERKEY):
		Scene_OpenDoor(TableManager.NPCARTICLETRIGGERTYPEID_DOOR7)
	else:
		PlayChessStart()

func CheckConditionFunction_NPCArticle_27() -> bool:
	var isOK: bool = false
	if TableManager.AVATARTYPEID_DONKEY1 == AvatarManager.GetCurrentActiveAvatarTypeID():
		isOK = true
	else:
		isOK = false
	
	return isOK

func PlayChessSuccessFunction_NPCArticle_27(_initWrangleDialogTypeID: int, _currentWrangleDialogTypeID: int):
	Scene_OpenDoor(TableManager.NPCARTICLETRIGGERTYPEID_DOOR7)

func PlayChessFailureFunction_NPCArticle_27(_initWrangleDialogTypeID: int, _currentWrangleDialogTypeID: int):
	if not CheckConditionFunction_NPCArticle_27():
		if HQH.RandomBool():
			NPCArticle_AddJournalRecord(TableManager.NPCARTICLETRIGGERTYPEID_DOOR7, "GUARD_THE_ROYAL_FAMILY")
		else:
			NPCArticle_AddJournalRecord(TableManager.NPCARTICLETRIGGERTYPEID_DOOR7, "NOT_EASY_OPEN_THE_DOOR_WITHOUT_THE_KEY")

func WrangleDialog_145_Function_1():
	PlayChessStart()

func WrangleDialog_150_Function_1():
	PlayChessStart()

func WrangleDialog_159_Function_1():
	SceneManager.SaveAvatarPositionByCurrentActiveAvatarPosition()
	
	if SaveGameManager.IsBagHas(TableManager.GOODSTYPEID_QUEENKEY):
		Scene_OpenDoor(m_DownPanelInfo.panelData.interactionInfo.npcTriggerTypeID)
	else:
		PlayChessStart()

func WrangleDialog_159_Function_2():
	SceneManager.SaveAvatarPositionByCurrentActiveAvatarPosition()

func PlayChessFailureFunction_NPCArticle_28(_initWrangleDialogTypeID: int, _currentWrangleDialogTypeID: int):
	SceneManager.SaveAvatarPositionByCurrentActiveAvatarPosition()
	
	if not CheckConditionFunction_NPCArticle_28():
		if HQH.RandomBool():
			NPCArticle_AddJournalRecord(TableManager.NPCARTICLETRIGGERTYPEID_DOOR_HALL_OF_MELODY_MIN, "GUARD_THE_ROYAL_FAMILY")
		else:
			NPCArticle_AddJournalRecord(TableManager.NPCARTICLETRIGGERTYPEID_DOOR_HALL_OF_MELODY_MIN, "NOT_EASY_OPEN_THE_DOOR_WITHOUT_THE_KEY")

func CheckConditionFunction_NPCArticle_28() -> bool:
	var isOK: bool = false
	if TableManager.AVATARTYPEID_DONKEY1 == AvatarManager.GetCurrentActiveAvatarTypeID():
		isOK = true
	else:
		isOK = false
	
	return isOK

func PlayChessSuccessFunction_NPCArticle_28(_initWrangleDialogTypeID: int, _currentWrangleDialogTypeID: int):
	SceneManager.SaveAvatarPositionByCurrentActiveAvatarPosition()
	
	Scene_OpenDoor(m_ChessPanel1Info.panelData.npcTriggerTypeID)

func WrangleDialog_163_Function_1():
	SaveTask(TableManager.WRANGLEDIALOGTYPEID_SISTER_1_SUCCESS, TableManager.WRANGLEDIALOGTYPEID_SISTER_1_SUCCESS)

func WrangleDialog_165_Function_1():
	var isHasSuccess_WRANGLEDIALOGTYPEID_SISTER_6_SUCCESS: bool = SaveGameManager.IsHasSaveGameData_Archive_TaskList_TaskInfoByWrangleDialogTypeIDAndlastChoiceWrangleDialogTypeID(TableManager.WRANGLEDIALOGTYPEID_CLINKERVALLEY_SISTER_INIT, TableManager.WRANGLEDIALOGTYPEID_SISTER_6_SUCCESS)
	if isHasSuccess_WRANGLEDIALOGTYPEID_SISTER_6_SUCCESS:
		Avatar_AddJournalRecord(TableManager.AVATARTYPEID_KING, "WRANGLEDIALOG_230_CONTENT")
		
		return

	var isHasSuccess_WRANGLEDIALOGTYPEID_SISTER_5_SUCCESS: bool = SaveGameManager.IsHasSaveGameData_Archive_TaskList_TaskInfoByWrangleDialogTypeIDAndlastChoiceWrangleDialogTypeID(TableManager.WRANGLEDIALOGTYPEID_CLINKERVALLEY_SISTER_INIT, TableManager.WRANGLEDIALOGTYPEID_SISTER_5_SUCCESS)
	if isHasSuccess_WRANGLEDIALOGTYPEID_SISTER_5_SUCCESS:
		Avatar_AddJournalRecord(TableManager.AVATARTYPEID_KING, "WRANGLEDIALOG_230_CONTENT")
		
		return
	
	var is12MonsterSuccess: bool = SaveGameManager.Is12MonsterSuccess()
	if is12MonsterSuccess:
		Avatar_AddJournalRecord(TableManager.AVATARTYPEID_KING, "WILL_FINAL")
		SaveTask(TableManager.WRANGLEDIALOGTYPEID_SISTER_3_SUCCESS, TableManager.WRANGLEDIALOGTYPEID_SISTER_3_SUCCESS)
		
		return
	
	var isHasSuccess_WRANGLEDIALOGTYPEID_SISTER_1_SUCCESS: bool = SaveGameManager.IsHasSaveGameData_Archive_TaskList_TaskInfoByWrangleDialogTypeIDAndlastChoiceWrangleDialogTypeID(TableManager.WRANGLEDIALOGTYPEID_SISTER_1_SUCCESS, TableManager.WRANGLEDIALOGTYPEID_SISTER_1_SUCCESS)
	if isHasSuccess_WRANGLEDIALOGTYPEID_SISTER_1_SUCCESS:
		Avatar_AddJournalRecord(TableManager.AVATARTYPEID_KING, "WRANGLEDIALOGTYPEID_SISTER_1_SUCCESS_1")
		SaveTask(TableManager.WRANGLEDIALOGTYPEID_SISTER_2_SUCCESS, TableManager.WRANGLEDIALOGTYPEID_SISTER_2_SUCCESS)
		SceneManager.UpdateCurrentScene()
		
		return
	
	Avatar_AddJournalRecord(TableManager.AVATARTYPEID_KING, "FAMILY_IS_THE_MOST_IMPORTANT_THING")

func PlayChessSuccessFunction_NPCArticle_65(_initWrangleDialogTypeID: int, _currentWrangleDialogTypeID: int):
	DownPanel_Bag_Add(TableManager.GOODSTYPEID_THREEHEADSDRAGON3)
	
	SaveTask(TableManager.WRANGLEDIALOGTYPEID_THREEHEADSDRAGON3_INIT, TableManager.WRANGLEDIALOGTYPEID_THREEHEADSDRAGON3_SUCCESS)
	SceneManager.UpdateCurrentScene()

func CheckConditionFunction_NPCArticle_65() -> bool:
	var isOK: bool = false
	if TableManager.AVATARTYPEID_DONKEY1 == AvatarManager.GetCurrentActiveAvatarTypeID():
		isOK = true
	else:
		isOK = false
	
	return isOK

func PlayChessFailureFunction_NPCArticle_65(_initWrangleDialogTypeID: int, _currentWrangleDialogTypeID: int):
	if not CheckConditionFunction_NPCArticle_65():
		Goods_AddJournalRecord(TableManager.GOODSTYPEID_THREEHEADSDRAGON3, "TO_ROYAL_HOUSEHOLD_LETTER")

func WrangleDialog_169_4_Function_1():
	PlayChessStart()

func WrangleDialog_174_Function_1():
	PlayChessSuccessFunction_NPCArticle_66(0, 0)

func PlayChessFailureFunction_NPCArticle_66(_initWrangleDialogTypeID: int, _currentWrangleDialogTypeID: int):
	pass

func PlayChessSuccessFunction_NPCArticle_66(_initWrangleDialogTypeID: int, _currentWrangleDialogTypeID: int):
	ChessPanel1_Terminate()
	
	SceneManager.ChangeSceneFromTrigger(6, 2)

func StartSwallowAction(nightDurationTimeInSeconds: float, initiatorAvatarTypeID: int):
	HQH.Log("StartSwallowAction, nightDurationTimeInSeconds: %s" % nightDurationTimeInSeconds)
	
	m_SwallowActionInfo.isSwallowActionStart = true
	SaveGameManager.SetSaveGameData_Archive_TaskList_SwallowActionIsStart()
	SaveGameManager.SetSaveGameData_Archive_TaskList_SwallowActionIsFinishNo()
	m_SwallowActionInfo.isNightDurationStart = true
	m_SwallowActionInfo.isSloganStart = false
	m_SwallowActionInfo.nightDurationTimeInSeconds = nightDurationTimeInSeconds
	m_SwallowActionInfo.nightDurationTimeInSecondsTimer = 0.0
	m_SwallowActionInfo.initiatorAvatarTypeID = initiatorAvatarTypeID
	m_SwallowActionInfo.sloganTimer = 0.0
	
	if 0 < m_SwallowActionInfo.initiatorAvatarTypeID:
		Avatar_AddJournalRecord(m_SwallowActionInfo.initiatorAvatarTypeID, "DAYNIGHTPANEL_FIRSTSTARTNIGHT")
	else:
		DownPanel_AddJournalRecordWithStringKey("DAYNIGHTPANEL_FIRSTSTARTNIGHT")
	
	DayNightPanel_SetData_Night(nightDurationTimeInSeconds * 2)

func GetIsSwallowActionStart() -> bool:
	return m_SwallowActionInfo.isSwallowActionStart

func IsCanMoveSwallowAction() -> bool:
	var isCanMove: bool = false
	if m_SwallowActionInfo.isSwallowActionStart:
		if m_SwallowActionInfo.isNightDurationStart:
			isCanMove = true
		else:
			isCanMove = false
	else:
		isCanMove = true
	
	return isCanMove

func SwallowActionProcess(delta: float):
	if not SceneManager.IsInGameScene():
		return
	
	if not m_SwallowActionInfo.isSwallowActionStart:
		if SaveGameManager.GetSaveGameData_Archive_TaskList_SwallowActionIsStart() and (not SaveGameManager.GetSaveGameData_Archive_TaskList_SwallowActionIsFinish()):
			StartSwallowAction(1, 0)
			SaveGameManager.SetSaveGameData_Archive_TaskList_SwallowActionIsStartNo()
			SaveGameManager.SetSaveGameData_Archive_TaskList_SwallowActionIsFinish()
		
		return
	
	if m_SwallowActionInfo.isNightDurationStart:
		m_SwallowActionInfo.nightDurationTimeInSecondsTimer += delta
		if m_SwallowActionInfo.nightDurationTimeInSeconds < m_SwallowActionInfo.nightDurationTimeInSecondsTimer:
			HQH.Log("NightDuration finish")
			m_SwallowActionInfo.isNightDurationStart = false
			
			if SceneManager.GetCurrentSceneTypeID() in TableManager.SCENE_HOME_SCENETYPEID_LIST:
				# In home
				ShowSlogan_HomeSafe_UpNamePanel_ShowMiddleString()
			else:
				# Out side of home
				var archive_AvatarList: Array = SaveGameManager.GetSaveGameData_Archive_AvatarList()
				if SaveGameManager.SWALLOW_ARCHIVE_AVATARLIST_SIZE_MIN <= archive_AvatarList.size():
					var backAvatar: Dictionary = archive_AvatarList.front()
					SaveGameManager.AddSaveGameData_Archive_TaskList_Swallow(backAvatar.avatarTypeID)
					AvatarManager.RemoveAvatarFromScene(backAvatar.avatarTypeID)
					
					ShowSlogan_AvatarDead_UpNamePanel_ShowMiddleString()
				else:
					ShowSlogan_AvatarDead_But_UpNamePanel_ShowMiddleString()
			
			HQH.Log("Slogan start")
			m_SwallowActionInfo.isSloganStart = true
	
	if m_SwallowActionInfo.isSloganStart:
		m_SwallowActionInfo.sloganTimer += delta
		if UPNAMEPANEL_SHOWMIDDLESTRING_ANIMATIONLENGTHINSECONDS < m_SwallowActionInfo.sloganTimer:
			HQH.Log("Slogan finish")
			m_SwallowActionInfo.isSloganStart = false
			
			var firstString: String = TableManager.GetAffixKeyRandomString("SLOGAN_NEW_DAY_")
			DownPanel_AddJournalRecord("%s%s" % [TableManager.GetLanguageString("HOME_IS_SAFE"), firstString])
			
			DayNightPanel_SetData_Daytime()
			m_SwallowActionInfo.isSwallowActionStart = false
			SaveGameManager.SetSaveGameData_Archive_TaskList_SwallowActionIsStartNo()
			SaveGameManager.SetSaveGameData_Archive_TaskList_SwallowActionIsFinish()
			
			if not SceneManager.GetCurrentSceneTypeID() in TableManager.SCENE_HOME_SCENETYPEID_LIST:
				var initAvatarTypeID: int = SaveGameManager.GetSaveGameData_Archive_Info_InitAvatarTypeID()
				match initAvatarTypeID:
					TableManager.AVATARTYPEID_SNAKE1:
						SceneManager.ChangeSceneFromTrigger(9, 1)
					
					TableManager.AVATARTYPEID_PLAYER1:
						SceneManager.ChangeSceneFromTrigger(10, 1)
					
					TableManager.AVATARTYPEID_SILVERCARP1:
						SceneManager.ChangeSceneFromTrigger(12, 1)

func WrangleDialog_178_Function_1():
	var isHasSuccess_WRANGLEDIALOGTYPEID_SISTER_3_SUCCESS: bool = SaveGameManager.IsHasSaveGameData_Archive_TaskList_TaskInfoByWrangleDialogTypeIDAndlastChoiceWrangleDialogTypeID(TableManager.WRANGLEDIALOGTYPEID_SISTER_3_SUCCESS, TableManager.WRANGLEDIALOGTYPEID_SISTER_3_SUCCESS)
	if isHasSuccess_WRANGLEDIALOGTYPEID_SISTER_3_SUCCESS:
		SaveTask(TableManager.WRANGLEDIALOGTYPEID_CLINKERVALLEY_SISTER_INIT, TableManager.WRANGLEDIALOGTYPEID_SISTER_4_INIT)

func WrangleDialog_224_Function_1():
	SaveTask(TableManager.WRANGLEDIALOGTYPEID_CLINKERVALLEY_SISTER_INIT, TableManager.WRANGLEDIALOGTYPEID_SISTER_4_SUCCESS)

func WrangleDialog_225_Function_1():
	if not m_ClinkerValleySisterInfo.isStartCounting:
		PlayChessStart()
	else:
		Avatar_AddJournalRecord(TableManager.AVATARTYPEID_SISTER, "THE_LAST_COUNT_IS_NOT_OVER")

func ClinkerValleySisterProcess(delta: float):
	if m_ClinkerValleySisterInfo.isStartCounting:
		m_ClinkerValleySisterInfo.countingTimer += delta
		if m_ClinkerValleySisterInfo.countingtimeStep < m_ClinkerValleySisterInfo.countingTimer:
			m_ClinkerValleySisterInfo.countingTimer = 0.0
			
			if not m_SceneClinkerValleyInfo.isCloseEye:
				var currentCountingNumber: int = CLINKERVALLEY_SISTER_INFO_COUNTING_NUMBER_MAX - m_ClinkerValleySisterInfo.countingNumber + 1
				Avatar_AddJournalRecordString(TableManager.AVATARTYPEID_SISTER, String(currentCountingNumber))
				HQH.Log("ClinkerValleySisterProcess, currentCountingNumber: %s" % currentCountingNumber)
			
			m_ClinkerValleySisterInfo.countingNumber += 1
			if CLINKERVALLEY_SISTER_INFO_COUNTING_NUMBER_MAX < m_ClinkerValleySisterInfo.countingNumber:
				m_ClinkerValleySisterInfo.isStartCounting = false
				m_ClinkerValleySisterInfo.countingNumber = CLINKERVALLEY_SISTER_INFO_COUNTING_NUMBER_MIN
				
				if not m_SceneClinkerValleyInfo.isCloseEye:
					Avatar_AddJournalRecord(TableManager.AVATARTYPEID_SISTER, "LOOK_WHERE_THEY_ARE")
				
				HQH.Log("ClinkerValleySisterProcess, m_ClinkerValleySisterInfo.isStartCounting = false")
