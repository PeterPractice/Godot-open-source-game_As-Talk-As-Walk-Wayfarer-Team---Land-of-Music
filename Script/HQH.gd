extends Node

const PROJECT_NAME: String = "HQH3"
const PROJECT_VERSION_RELEASE: int = 1
const PROJECT_VERSION_BETA: int = 0
const PROJECT_VERSION_ALPHA: int = 0
const IS_DEBUG: bool = false # false # cpdebug
const IS_PUBLISH_ON_STEAM: bool = false # true: released on Steam. false: just on PC.

const VIEW_PROCESS_FRAME_NUMBER: float = 30.0
const VIEW_PROCESS_FRAME_MIN_SECONDS_NUMBER: float = 1.0 / VIEW_PROCESS_FRAME_NUMBER # 0.033 seconds
const PHYSICS_PROCESS_FRAME_NUMBER: float = 60.0
const PHYSICS_PROCESS_FRAME_MIN_SECONDS_NUMBER: float = 1.0 / PHYSICS_PROCESS_FRAME_NUMBER # 0.016 seconds

const FLOAT_EPSILON: float = 0.00000011920928955078125 # Like FLT_EPSILON(1.1920928955078125e-07, also 1.0/math.pow(2,23)), for 2 float numbers reduce result to compare

const SCALE_INIT: float = 1.0
const SCALE_MIN: float = 0.01
const SCALE_MAX: float = 1.0

const AVATAR_PICTURE_SQUARE_LENGTH_OF_SIDE: float = 64.0

const COLORPALETTE_UI: Dictionary = {
	"COLOR_BG1": Color("#090F0D"),
	"COLOR_BG2": Color("#273132"),
	"COLOR_BG3": Color("#E2CB99"),
	"COLOR_BG4": Color("#4B4930"),
	"COLOR_BG4_TRANSLUCENCE": Color("#804B4930"),
	"COLOR_BG4_2": Color("#968A64"),
	"COLOR_BG4_3": Color("#706949"),
	"COLOR_BG5": Color("#0D1311"),
	"COLOR_BG6": Color("#1D2E36"),
	"COLOR_BG7": Color("#535955"),
	"COLOR_BG_CHESSPANEL": Color("#26030502"),
	"FONT_COLOR1": Color("#F7F9E4"),
	"FONT_COLOR2": Color("#575958"),					# Outline
	"FONT_COLOR3": Color("#FBE5B3"),
	"FONT_COLOR4": Color("#030502"),
	"FONT_COLOR5": Color("#CC9828"),
	"BOOTSCENE_BG_COLOR": Color("#424242"),				# 说明：Scene BG（Back Ground）color，场景背景颜色，设置在ProjectSettings-rendering/environment/default_clear_color（#212121）中，也就是场景的默认背景颜色。BOOTSCENE_BG_COLOR主要是设置BootScene的背景颜色，因为它们主要负责加载场景，所以，与场景默认背景色有区别。
	"LOADINGSCENEPANEL_BG_COLOR": Color("#424242"), 	# 说明：Scene BG（Back Ground）color，场景背景颜色，设置在ProjectSettings-rendering/environment/default_clear_color（#212121）中，也就是场景的默认背景颜色。LOADINGSCENEPANEL_BG_COLOR主要是设置LoadingScenePanel的背景颜色，因为它们主要负责加载场景，所以，与场景默认背景色有区别。
	"COLOR_HEADPORTRAITFRAME": Color("#8F7D59"),
	"COLOR_HEADPORTRAITBG": Color("#1C2D3D"),
	"COLOR_SKILLFRAME": Color("#868277"),
	"COLOR_SKILLCD": Color("#CC303030"),
	"COLOR_SKILLBG": Color("#242D2C"),
	"COLOR_ITEMFRAME": Color("#746C55"),
	"COLOR_ITEMBG": Color("#1C2628"),
	"COLOR_BUFFFRAME": Color("#546262"),
	"COLOR_BUFFBG": Color("#222421"),	
	"COLOR_HP": Color("#992D2D"),
	"COLOR_MP": Color("#232377"),
	"COLOR_EP": Color("#754F3A"),						# EnergyPoint，行动力
	"COLOR_TRANSPARENT": Color("#00000000"),
}

const COLORPALETTE_EQUIP_COLOR_CHANGING_COLOR: String = "COLOR_CHANGING_COLOR"
const COLORPALETTE_EQUIP: Dictionary = {
	"COLOR_BLACK": Color("#030A03"),
	"COLOR_RED": Color("#B02300"),
	"COLOR_WHITE": Color("#B0B0B0"),
	"COLOR_YELLOW": Color("#B08A49"),
	"COLOR_GRAYISH_BLUE": Color("#3A4C58"),
	"COLOR_GRAYISH_BLUE2": Color("#004C58"),
	"COLOR_GRAYISH_BLUE3": Color("#3A0058"),
	"COLOR_GRAYISH_BLUE4": Color("#3A4C00"),
	"COLOR_GRAYISH_BLUE5": Color("#3A0000"),
	"COLOR_GRAYISH_BLUE6": Color("#004C00"),
	"COLOR_GRAYISH_BLUE7": Color("#000058"),
	"COLOR_PALE_YELLOW": Color("#F9F0CF"),
	"COLOR_RED2": Color("#F900CF"),
	"COLOR_BLUE2": Color("#00F0CF"),
	"COLOR_YELLOW2": Color("#F9F000"),
	COLORPALETTE_EQUIP_COLOR_CHANGING_COLOR: Color("#000000"),
}

const COLORPALETTE_SCENE: Dictionary = {
	"COLOR_WATER": Color("#435559"),
	"COLOR_WATER_2": Color("#55676B"),
	"COLOR_WATER2": Color("#35464D"),
	"COLOR_WATER_FOAM": Color("#65777B"),
	"COLOR_RED_WATER": Color("#430000"),
	"COLOR_RED_WATER2": Color("#350000"),
	"COLOR_RED_WATER_FOAM": Color("#650000"),
	"COLOR_NAVIGATION_POINT": Color("#91A19E"),
	"COLOR_BG_AND_CLEAR": Color("#000000"),
	"COLOR_MYSTERIOUSDEVICE_BG": Color("#FBFAE6"),
	"COLOR_MYSTERIOUSDEVICE_BG1": Color("#E0DFCE"),
	"COLOR_MYSTERIOUSDEVICE_BG2": Color("#C6C6B6"),
	"COLOR_MYSTERIOUSDEVICE_BG3": Color("#05FBFAE6"),
	"COLOR_ODETOJOY_BG": Color("#040404"),
	"COLOR_ODETOJOY_FBG": Color("#FBFBFB"),
	"COLOR_ODETOJOY_HIGHLIGHT": Color("#D6BD85"),
	"COLOR_WALL_COLLISION": Color("#C011FF"),
	"COLOR_DOOR_COLLISION": Color("#C075FF"),
}

enum NPC_MANNER_TYPE {
	NPC_MANNER_BEGIN = 0,
	NPC_MANNER_FRIENDLY = 0,
	NPC_MANNER_HOSTILITY,
	NPC_MANNER_ARTICLE,
	
	NPC_MANNER_END,
}

const COLORPALETTE_AVATAR: Dictionary = {
	"COLOR_AVATAR_OUTLINE": Color("#00BE00"),
	"COLOR_NPC_FRIENDLY_OUTLINE": Color("#0000BE"),
	"COLOR_NPC_HOSTILITY_OUTLINE": Color("#BE0000"),
	"COLOR_NPC_ARTICLE_OUTLINE": Color("#BEBE00"),
	"COLOR_SNAKE1": Color("#A1DA2F"),
	"COLOR_DOG1": Color("#E6D5BA"),
	"COLOR_PLAYER1": Color("#FFB27F"),
	"COLOR_SILVERCARP1": Color("#A0C2D1"),
	"COLOR_TORTOISE1": Color("#BAA789"),
	"COLOR_SNAKE2": Color("#A1DA2F"),
	"COLOR_SNAKE3": Color("#C9F62B"),
	"COLOR_TURTLE1": Color("#9C913D"),
	"COLOR_ANGEL1": Color("#F3CFB0"),
	"COLOR_DONKEY1": Color("#635E56"),
	"COLOR_QIUYU1": Color("#F1CDB9"),
	"COLOR_CLERGY1": Color("#4F3E7D"),
	"COLOR_MONSTER1": Color("#30A000"),
	"COLOR_MONSTER2": Color("#7000A0"),
	"COLOR_MONSTER3": Color("#A00080"),
	"COLOR_MONSTER4": Color("#00A070"),
	"COLOR_MONSTER5": Color("#A07000"),
	"COLOR_MONSTER6": Color("#0080A0"),
	"COLOR_MONSTER7": Color("#80A000"),
	"COLOR_MONSTER8": Color("#0030A0"),
	"COLOR_MONSTER9": Color("#A03B00"),
	"COLOR_MONSTER10": Color("#A00030"),
	"COLOR_MONSTER11": Color("#6C6C6C"),
	"COLOR_MONSTER12": Color("#2B2B2B"),
	"COLOR_KING": Color("#756644"),
	"COLOR_QUEEN": Color("#C1A99E"),
	"COLOR_SISTER": Color("#77433C"),
	"COLOR_HOUSEKEEPER": Color("#7F6E1E"),
	"COLOR_BUTLER": Color("#896673"),
	"COLOR_BAG": Color("#273100"),
	"COLOR_JOURNALRECORDBOOK": Color("#4F4E33"),
	"COLOR_LETTER": Color("#808080"),
	"COLOR_THREEHEADSDRAGON3": Color("#000000"),
}

const COMMON_BUTTON_TEXTURERECTNORMAL_MODULATE_V: float = 0.9

const VISUAL_FIELD_DISTANCE_MIN: int = 3
const VISUAL_FIELD_DISTANCE_MAX: int = 20
enum VISUAL_FIELD_SHARP_TYPE {
	RHOMBUS,
	EGG,
}

const AUDIO_MIN_VALUE: int = 0
const AUDIO_MAX_VALUE: int = 100

const VIDEO_RESOLUTION_RATIO_ID_DEFAULT = 2 # OPTION_PANEL_DATA_TABLE_INFO.videoResolutionRatioList.videoResolutionRatioID
const WINDOW_IS_FULL_SCREEN_DEFAULT = true
const WINDOW_IS_WINDOW_STRETCH_DEFAULT = true
const MUSIC_IS_MUTE_DEFAULT = false
const MUSIC_VALUE_DEFAULT = int(AUDIO_MAX_VALUE * 0.6)
const SOUND_EFFECT_IS_MUTE_DEFAULT = false
const SOUND_EFFECT_VALUE_DEFAULT = int(AUDIO_MAX_VALUE * 0.6)
const LANGUAGE_NAME_DEFAULT = "English"

func _ready():
	Log("Project Name: %s" % PROJECT_NAME)
	Log("Is Debug: %s" % IS_DEBUG)
	
	VisualServer.set_default_clear_color(COLORPALETTE_SCENE.COLOR_BG_AND_CLEAR)
	
	var currentLocalTime: int = Time()
	Log("Random Seed set currentLocalTime: %s" % currentLocalTime)
	Srand(currentLocalTime)
	SetRandType(currentLocalTime)
	
#	if IS_PUBLISH_ON_STEAM:
#		_initialize_Steam()

#func _initialize_Steam() -> void:
#	var INIT: Dictionary = Steam.steamInit()
#	Log("Did Steam initialize?: "+str(INIT))
#
#	if INIT['status'] != 1:
#		Log("Failed to initialize Steam. "+str(INIT['verbal'])+" Shutting down...")
##		get_tree().quit()
#		KillCurrentProcess()

const ONE_MINUTE_IN_SECOND: int = 60
const ONE_HOUR_IN_MINUTE: int = 60
const ONE_DAY_IN_HOUR: int = 24
const ONE_MONTH_IN_DAY: int = 30
const ONE_YEAR_IN_MONTH: int = 12
func TimeToDictionary_ModAndCut(timeValue: int, modNumber: int) -> Dictionary:
	return {"timeValue": timeValue % modNumber, "cutValue": timeValue / modNumber}

func TimeToDictionary(timeValue: int) -> Dictionary:
	var timeValueTemp: int = timeValue
	var timeDictionary: Dictionary = {}
	if 0 <= timeValueTemp:
		var result: Dictionary = TimeToDictionary_ModAndCut(timeValueTemp, ONE_MINUTE_IN_SECOND)
		timeDictionary.second = result.timeValue
		timeValueTemp = result.cutValue
	
	if 0 < timeValueTemp:
		var result: Dictionary = TimeToDictionary_ModAndCut(timeValueTemp, ONE_HOUR_IN_MINUTE)
		timeDictionary.minute = result.timeValue
		timeValueTemp = result.cutValue
	
	if 0 < timeValueTemp:
		var result: Dictionary = TimeToDictionary_ModAndCut(timeValueTemp, ONE_DAY_IN_HOUR)
		timeDictionary.hour = result.timeValue
		timeValueTemp = result.cutValue
	
	if 0 < timeValueTemp:
		var result: Dictionary = TimeToDictionary_ModAndCut(timeValueTemp, ONE_MONTH_IN_DAY)
		timeDictionary.day = result.timeValue
		timeValueTemp = result.cutValue
	
	if 0 < timeValueTemp:
		var result: Dictionary = TimeToDictionary_ModAndCut(timeValueTemp, ONE_YEAR_IN_MONTH)
		timeDictionary.month = result.timeValue
		timeValueTemp = result.cutValue
	
	if 0 < timeValueTemp:
		timeDictionary.year = timeValueTemp
	
	return timeDictionary

func TimeToString(timeValue: int) -> String:
	var timeString: String = ""
	var timeDictionary: Dictionary = TimeToDictionary(timeValue)
	if timeDictionary.has("year"):
		timeString = "%s%s%s" % [timeString, timeDictionary.year, TableManager.GetLanguageString("TIME_YEAR")]
	
	if timeDictionary.has("month"):
		timeString = "%s%s%s" % [timeString, timeDictionary.month, TableManager.GetLanguageString("TIME_MONTH")]
	
	if timeDictionary.has("day"):
		timeString = "%s%s%s" % [timeString, timeDictionary.day, TableManager.GetLanguageString("TIME_DAY")]
	
	if timeDictionary.has("hour"):
		timeString = "%s%s%s" % [timeString, timeDictionary.hour, TableManager.GetLanguageString("TIME_HOUR")]
	
	if timeDictionary.has("minute"):
		timeString = "%s%s%s" % [timeString, timeDictionary.minute, TableManager.GetLanguageString("TIME_MINUTE")]
	
	if timeDictionary.has("second"):
		timeString = "%s%s%s" % [timeString, timeDictionary.second, TableManager.GetLanguageString("TIME_SECOND")]
	
	return timeString

func String_to_datetimeInSecond(date: String) -> int:
	var dateTime: Dictionary = String_to_datetime(date)
	
	return OS.get_unix_time_from_datetime(dateTime)

func String_to_datetime(date: String) -> Dictionary:
	var dateTime: Dictionary = {"year": 2022, "month": 11, "day": 22, "hour": 11, "minute" :22, "second" :33}
	dateTime.year = date.substr(0, 4)
	dateTime.month = date.substr(5, 2)
	dateTime.day = date.substr(8, 2)
	dateTime.hour = date.substr(11, 2)
	dateTime.minute = date.substr(14, 2)
	dateTime.second = date.substr(17, 2)
	
	return dateTime

func Datetime_to_string(date: Dictionary) -> String:
	# Date and time.
	return "{year}-{month}-{day} {hour}:{minute}:{second}".format({
		"year": str(date.year).pad_zeros(2),
		"month": str(date.month).pad_zeros(2),
		"day": str(date.day).pad_zeros(2),
		"hour": str(date.hour).pad_zeros(2),
		"minute": str(date.minute).pad_zeros(2),
		"second": str(date.second).pad_zeros(2),
	})

func Date_to_string(date: Dictionary) -> String:
	# Date only.
	return "{year}-{month}-{day}".format({
		"year": str(date.year).pad_zeros(2),
		"month": str(date.month).pad_zeros(2),
		"day": str(date.day).pad_zeros(2),
	})

func Time_to_string(date: Dictionary) -> String:
	# Time only.
	return "{hour}:{minute}:{second}".format({
		"hour": str(date.hour).pad_zeros(2),
		"minute": str(date.minute).pad_zeros(2),
		"second": str(date.second).pad_zeros(2),
	})

const MILLISECOND_NUMBER: int = 1000
var m_LogHistory: Dictionary = {}
var LOGHISTORY_MAXSIZE: int = 30000
# logHistoryTimeIntervalInMilliseconds: For too frequently log, limit print time interval in milliseconds
func Log(s, logHistoryTimeIntervalInMilliseconds: int = 0):
	var isPrint: bool = true
	var milliTime: int = MilliTime()
	if IS_DEBUG:
		if 0 < logHistoryTimeIntervalInMilliseconds:
			if m_LogHistory.has(s):
				if logHistoryTimeIntervalInMilliseconds < (milliTime - m_LogHistory.get(s)):
					m_LogHistory[s] = milliTime
				else:
					isPrint = false
			else:
				m_LogHistory[s] = milliTime
			
			if LOGHISTORY_MAXSIZE < m_LogHistory.size():
				m_LogHistory.clear()
	
	if isPrint:
		var localTimeString: String = GetDateTimeString()
		var onlyMilliseconds: int = milliTime % MILLISECOND_NUMBER
		print("%s:%03d[%s]%s" % [localTimeString, onlyMilliseconds, PROJECT_NAME, s])

func AssertLog(s):
	Log(s)
	if IS_DEBUG:
		OS.alert(s)
		assert(false)

func CheckIsOddNumber(n: int):
	var isOddNumber: bool = (1 == (n % 2))
	if not isOddNumber:
		AssertLog("CheckIsOddNumber, not isOddNumber: %s" % n)

func CheckLessThanOrEqualToMaxNumber(s: String, nMax: int, n: int):
	if not (nMax >= n):
		AssertLog("CheckLessThanOrEqualToMaxNumber, \"%s\", not (nMax: %s >= n: %s)" % [s, nMax, n])

func CheckLessThanMaxNumber(s: String, nMax: int, n: int):
	if not (nMax > n):
		AssertLog("CheckLessThanMaxNumber, \"%s\", not (nMax: %s > n: %s)" % [s, nMax, n])

func CheckGreaterThanOrEqualToMinNumber(s: String, nMin: int, n: int):
	if not (nMin <= n):
		AssertLog("CheckGreaterThanOrEqualToMinNumber, \"%s\", not (nMin: %s <= n: %s)" % [s, nMin, n])

func CheckGreaterThanMinNumber(s: String, nMin: int, n: int):
	if not (nMin < n):
		AssertLog("CheckGreaterThanMinNumber, \"%s\", not (nMin: %s < n: %s)" % [s, nMin, n])

const RAND_MAX: int = 32767 # 0x7fff
const RAND_1_MAX: float = 1.0 / float(RAND_MAX)
const RAND_NUMBER2: int = 2
const RAND_NUMBER3: int = 3
const RAND_NUMBER4: int = 4
const RAND_NUMBER5: int = 5
const RAND_NUMBER6: int = 6
const RAND_NUMBER7: int = 7
const RAND_NUMBER8: int = 8
const RAND_NUMBER9: int = 9
const RAND_NUMBER10: int = 10
enum RAND_LCG_TYPE {
	RAND_LCG_VS_C_RANDOM_LIBRARY, 			# Microsoft Visual/QuickC/C++
	RAND_LCG_GCC_GLIBC, 					# glibc (used by GCC), ANSI C: Watcom, Digital Mars, CodeWarrior, IBM VisualAge C/C++
	
	MAX,
}
var m_RandNextSeedLCG: int = 1  # Init seed for LCG is 1
var m_RandLCGType: int = RAND_LCG_TYPE.RAND_LCG_VS_C_RANDOM_LIBRARY

# Returns a pseudorandom number in the range [0, 32767].
func RandLCG(randLCGType: int) -> int:
	match randLCGType:
		RAND_LCG_TYPE.RAND_LCG_VS_C_RANDOM_LIBRARY:
			m_RandNextSeedLCG = m_RandNextSeedLCG * 214013 + 2531011
		RAND_LCG_TYPE.RAND_LCG_GCC_GLIBC:
			m_RandNextSeedLCG = m_RandNextSeedLCG * 1103515245 + 12345
	
	return (m_RandNextSeedLCG >> 16) & RAND_MAX

func SrandLCG(seedValue: int):
	m_RandNextSeedLCG = seedValue

func SetRandLCGType(seedValue: int):
	m_RandLCGType = seedValue % RAND_LCG_TYPE.MAX

# Returns a pseudorandom number in the range [0, 32767].
func Rand() -> int:
	return RandLCG(m_RandLCGType)

# Returns a pseudorandom float number in the range [0.0, 1.0].
func RandFloat() -> float:
#	return float(Rand()) / float(RAND_MAX)
	return float(Rand()) * RAND_1_MAX

func Srand(seedValue: int):
	SrandLCG(seedValue)

func SetRandType(seedValue: int):
	SetRandLCGType(seedValue)

# Returns true or false.
func RandomBool() -> bool:
	return 0 == RandomD2()

# Returns a pseudorandom number in the range [0, 1].
func RandomD2() -> int:
	return Rand() % RAND_NUMBER2

# Returns a pseudorandom number in the range [0, 2].
func RandomD3() -> int:
	return Rand() % RAND_NUMBER3

# Returns a pseudorandom number in the range [0, 3].
func RandomD4() -> int:
	return Rand() % RAND_NUMBER4

# Returns a pseudorandom number in the range [0, 4].
func RandomD5() -> int:
	return Rand() % RAND_NUMBER5

# Returns a pseudorandom number in the range [0, 5].
func RandomD6() -> int:
	return Rand() % RAND_NUMBER6

# Returns a pseudorandom number in the range [0, 6].
func RandomD7() -> int:
	return Rand() % RAND_NUMBER7

# Returns a pseudorandom number in the range [0, 7].
func RandomD8() -> int:
	return Rand() % RAND_NUMBER8

# Returns a pseudorandom number in the range [0, 8].
func RandomD9() -> int:
	return Rand() % RAND_NUMBER9

# Returns a pseudorandom number in the range [0, 9].
func RandomD10() -> int:
	return Rand() % RAND_NUMBER10

# Returns a value mod number in the range [minValue, maxValue].
func ModRange(minValue: int, maxValue: int, value: int) -> int:
	if IS_DEBUG:
		if not (minValue <= maxValue):
			AssertLog("ModRange, not (minValue: %s <= maxValue: %s):" % [minValue, maxValue])
	
	return minValue + (value % (maxValue - minValue + 1))

# Returns a pseudorandom number in the range [minValue, maxValue].
func RandomModRange(minValue: int, maxValue: int) -> int:
	if IS_DEBUG:
		if not (minValue <= maxValue):
			AssertLog("RandomModRange, not (minValue: %s <= maxValue: %s):" % [minValue, maxValue])
	
#	return minValue + (Rand() % (maxValue - minValue + 1))
	return ModRange(minValue, maxValue, Rand())

# Returns a pseudorandom float number in the range [minValue, maxValue].
func RandomModRangeFloat(minValue: float, maxValue: float) -> float:
	if IS_DEBUG:
		if not (minValue <= maxValue):
			AssertLog("RandomModRangeFloat, not (minValue: %s <= maxValue: %s):" % [minValue, maxValue])
	
	return minValue + ((maxValue - minValue) * RandFloat())

func Time() -> int:
	return OS.get_system_time_secs()

func MilliTime() -> int:
	return OS.get_system_time_msecs()

func DateTime() -> Dictionary:
	return OS.get_datetime()

func GetDateTimeString() -> String:
	return Datetime_to_string(DateTime())

func GetProjectVersionString() -> String:
	return "%s.%s.%s" % [PROJECT_VERSION_RELEASE, PROJECT_VERSION_BETA, PROJECT_VERSION_ALPHA]

func GetLogFileFolderPath() -> String:
	var user_data_dir = OS.get_user_data_dir()
	var logFileFolderPath = user_data_dir + "/logs"
	
	return logFileFolderPath

func GetUserDataFolderPath() -> String:
	var user_data_dir = OS.get_user_data_dir()
	
	return user_data_dir

func KillCurrentProcess():
	OS.kill(OS.get_process_id())

func SetVideoResolutionRatio(isFullScreen: bool, width: int, height: int):
	OS.set_window_fullscreen(isFullScreen)
	if not isFullScreen:
		OS.set_window_size(Vector2(width, height))

func SetWindowTitle():
	var windowTitle: String = TableManager.GetLanguageString("NAME_GAME_NAME")
	if IS_DEBUG:
		windowTitle = "%s (Process ID: %s)" % [windowTitle, OS.get_process_id()]
	
	OS.set_window_title(windowTitle)

func IsVector2AbsGreaterThan0(vector2Value: Vector2):
	return (FLOAT_EPSILON < abs(vector2Value.x)) or (FLOAT_EPSILON < abs(vector2Value.y))
