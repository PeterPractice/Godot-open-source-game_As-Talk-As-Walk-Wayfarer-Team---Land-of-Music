extends "res://Script/UI/CommonUI/CommonPanel.gd"

const TEXTURERECTDAYNIGHT_RECT_ROTATION_DAYTIME_STOP_AT: float = 0.0 #DayTime: [0.0, 180.0], stop at 0.0
const TEXTURERECTDAYNIGHT_RECT_ROTATION_NIGHT_STOP_AT: float = 180.0 #Night: [180.0, 360.0], stop at 180.0
const TEXTURERECTDAYNIGHT_RECT_ROTATION_DAYNIGHT_SPAN: float = 180.0
const TEXTURERECTDAYNIGHT_RECT_ROTATION_MIN: float = 0.0
const TEXTURERECTDAYNIGHT_RECT_ROTATION_MAX: float = 360.0

onready var commonLabelDaysNumber = $controlClock/commonLabelDaysNumber
onready var textureRectDayNight = $controlClock/textureRectDayNight
onready var light2DDayNight = $controlClock/light2DDayNight
onready var controlSecondHand_TextureRect = $controlClock/controlSecondHand/TextureRect
onready var controlSecondHand_TextureRect2 = $controlClock/controlSecondHand/TextureRect2
onready var colorRectBlackBG = $colorRectBlackBG

var m_IsFirstDaytimeStop: bool = true
var m_IsFirstNightStop: bool = true
var m_IsFirstStartNight: bool = false

func _ready():
	light2DDayNight.range_layer_min = Layout.CANVASLAYER_INDEX_TYPE.UI
	light2DDayNight.range_layer_max = Layout.CANVASLAYER_INDEX_TYPE.UI
	
	commonLabelDaysNumber.visible = false
	SetText()
	
	SetTextureRectDayNight(TEXTURERECTDAYNIGHT_RECT_ROTATION_NIGHT_STOP_AT)
	
	SetFalse_IsNeedToCheck_IsUIPanelHadConsumed_Event_FocusClick()

func SetText():
	SetCommonLabelDaysNumber(1)

func _process(delta: float):
	if not SceneManager.IsInGameScene():
		return
	
	if 0 == (HQH.Time() % 2):
		controlSecondHand_TextureRect.visible = true
		controlSecondHand_TextureRect2.visible = false
	else:
		controlSecondHand_TextureRect.visible = false
		controlSecondHand_TextureRect2.visible = true
	
	var DEVIATION_DEGREE: float = 5.0
	var dayNightPanelData: Dictionary = UIManager.DayNightPanel_GetData()
	var isCurrentDayTime: bool = dayNightPanelData.isCurrentDayTime
	var daytimeDurationTimeInSeconds: float = dayNightPanelData.daytimeDurationTimeInSeconds
	var nightDurationTimeInSeconds: float = dayNightPanelData.nightDurationTimeInSeconds
	var daytimeSpeed: float = TEXTURERECTDAYNIGHT_RECT_ROTATION_MAX / daytimeDurationTimeInSeconds
	var nightSpeed: float = TEXTURERECTDAYNIGHT_RECT_ROTATION_MAX / nightDurationTimeInSeconds
	if isCurrentDayTime:
		m_IsFirstNightStop = true
		m_IsFirstStartNight = false
		
		if (TEXTURERECTDAYNIGHT_RECT_ROTATION_NIGHT_STOP_AT <= textureRectDayNight.rect_rotation):
			ClockwiseRotationTextureRectDayNight(delta * daytimeSpeed)
			var textureRectDayNight_rect_rotation_Temp: float = textureRectDayNight.rect_rotation
			if TEXTURERECTDAYNIGHT_RECT_ROTATION_MAX <= textureRectDayNight.rect_rotation:
				SetTextureRectDayNight(TEXTURERECTDAYNIGHT_RECT_ROTATION_DAYTIME_STOP_AT)
			
			colorRectBlackBG.visible = true
			var alphaNumber: float = ((textureRectDayNight_rect_rotation_Temp - TEXTURERECTDAYNIGHT_RECT_ROTATION_NIGHT_STOP_AT) / TEXTURERECTDAYNIGHT_RECT_ROTATION_DAYNIGHT_SPAN)
			colorRectBlackBG.color.a = clamp(1.0 - alphaNumber, 0.0, 1.0)
		else:
			if DEVIATION_DEGREE < (textureRectDayNight.rect_rotation - TEXTURERECTDAYNIGHT_RECT_ROTATION_DAYTIME_STOP_AT):
				ClockwiseRotationTextureRectDayNight(delta * daytimeSpeed)
				
				colorRectBlackBG.visible = true
				var alphaNumber: float = textureRectDayNight.rect_rotation / TEXTURERECTDAYNIGHT_RECT_ROTATION_DAYNIGHT_SPAN
				colorRectBlackBG.color.a = clamp(alphaNumber, 0.0, 1.0)
			else:
				if m_IsFirstDaytimeStop:
					m_IsFirstDaytimeStop = false
					
					HQH.Log("Daytime stop")
				
				SetTextureRectDayNight(TEXTURERECTDAYNIGHT_RECT_ROTATION_DAYTIME_STOP_AT)
				
				colorRectBlackBG.visible = false
	else:
		m_IsFirstDaytimeStop = true
		
		if not m_IsFirstStartNight:
			m_IsFirstStartNight = true
			
			HQH.Log("Night start")
#			UIManager.DownPanel_AddJournalRecordWithStringKey("DAYNIGHTPANEL_FIRSTSTARTNIGHT")
		
		if (TEXTURERECTDAYNIGHT_RECT_ROTATION_NIGHT_STOP_AT > textureRectDayNight.rect_rotation):
			ClockwiseRotationTextureRectDayNight(delta * nightSpeed)
			if TEXTURERECTDAYNIGHT_RECT_ROTATION_NIGHT_STOP_AT <= textureRectDayNight.rect_rotation:
				SetTextureRectDayNight(TEXTURERECTDAYNIGHT_RECT_ROTATION_NIGHT_STOP_AT)
			
			colorRectBlackBG.visible = true
			var alphaNumber: float = textureRectDayNight.rect_rotation / TEXTURERECTDAYNIGHT_RECT_ROTATION_DAYNIGHT_SPAN
			colorRectBlackBG.color.a = clamp(alphaNumber, 0.0, 1.0)
		else:
			if DEVIATION_DEGREE < (textureRectDayNight.rect_rotation - TEXTURERECTDAYNIGHT_RECT_ROTATION_NIGHT_STOP_AT):
				ClockwiseRotationTextureRectDayNight(delta * nightSpeed)
				var textureRectDayNight_rect_rotation_Temp: float = textureRectDayNight.rect_rotation
				if TEXTURERECTDAYNIGHT_RECT_ROTATION_MAX <= textureRectDayNight.rect_rotation:
					SetTextureRectDayNight(TEXTURERECTDAYNIGHT_RECT_ROTATION_DAYTIME_STOP_AT)
				
				colorRectBlackBG.visible = true
				var alphaNumber: float = ((textureRectDayNight_rect_rotation_Temp - TEXTURERECTDAYNIGHT_RECT_ROTATION_NIGHT_STOP_AT) / TEXTURERECTDAYNIGHT_RECT_ROTATION_DAYNIGHT_SPAN)
				colorRectBlackBG.color.a = clamp(1.0 - alphaNumber, 0.0, 1.0)
			else:
				if m_IsFirstNightStop:
					m_IsFirstNightStop = false
					
					HQH.Log("Night finish")
				
				SetTextureRectDayNight(TEXTURERECTDAYNIGHT_RECT_ROTATION_NIGHT_STOP_AT)
				
				colorRectBlackBG.visible = true

func SetTextureRectDayNight(rectRotationValue: float):
	textureRectDayNight.rect_rotation = clamp(rectRotationValue, TEXTURERECTDAYNIGHT_RECT_ROTATION_MIN, TEXTURERECTDAYNIGHT_RECT_ROTATION_MAX)

func ClockwiseRotationTextureRectDayNight(increaseRotation: float):
	var rectRotationTemp: float = textureRectDayNight.rect_rotation + increaseRotation
	SetTextureRectDayNight(rectRotationTemp)

func SetCommonLabelDaysNumber(daysNumber: int):
	if commonLabelDaysNumber.visible:
		commonLabelDaysNumber.text = TableManager.GetLanguageString("DAYNIGHTPANEL_COMMONLABELDAYSNUMBER") % str(daysNumber)
