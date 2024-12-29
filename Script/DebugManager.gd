extends Node

const DEBUG_DATA_LIST: Array = [
	{"label": "DataSample", "scriptFunctionNameString": "DataSample", "labelArg1Text": "Label 1", "lineEditArg1Text": "1", "labelArg2Text": "Label 2", "lineEditArg2Text": "2", "labelArg3Text": "Label 3", "lineEditArg3Text": "3", "labelArg4Text": "Label 4", "lineEditArg4Text": "4", "labelArg5Text": "Label 5", "lineEditArg5Text": "5"},
	{"label": "RandomSample", "scriptFunctionNameString": "RandomSample"},
	{"label": "AvatarAnimation", "scriptFunctionNameString": "AvatarAnimation", "labelArg1Text": "IsCreateAll", "lineEditArg1Text": "1", "labelArg2Text": "IsCreatePart", "lineEditArg2Text": "0", "labelArg3Text": "Create1AvatarTypeID", "lineEditArg3Text": "0"},
	{"label": "AvatarFollow", "scriptFunctionNameString": "AvatarFollow", "labelArg1Text": "AvatarNumber", "lineEditArg1Text": "5"},
	{"label": "AvatarFollow2", "scriptFunctionNameString": "AvatarFollow2", "labelArg1Text": "AvatarTypeID1", "lineEditArg1Text": "8", "labelArg2Text": "AvatarTypeID2", "lineEditArg2Text": "7", "labelArg3Text": "AvatarTypeID3", "lineEditArg3Text": "2", "labelArg4Text": "AvatarTypeID4", "lineEditArg4Text": "4", "labelArg5Text": "AvatarTypeID5", "lineEditArg5Text": "3"},
	{"label": "CreateScene", "scriptFunctionNameString": "CreateScene", "labelArg1Text": "SceneTypeID", "lineEditArg1Text": "1"},
	{"label": "PrintLanguageTable", "scriptFunctionNameString": "PrintLanguageTable", "labelArg1Text": "LanguageName", "lineEditArg1Text": "Chinese"}, # TableManager.LANGUAGE_NAME_CHINESE
	{"label": "PrintDataTable", "scriptFunctionNameString": "PrintDataTable", "labelArg1Text": "Name", "lineEditArg1Text": ""},
	{"label": "TimerSample", "scriptFunctionNameString": "TimerSample", "labelArg1Text": "DelayTime", "lineEditArg1Text": "2"},
	{"label": "SimulateActionaPressSample", "scriptFunctionNameString": "SimulateActionaPressSample", "labelArg1Text": "ActionName", "lineEditArg1Text": "ui_down"},
	{"label": "OpenLogFileFolder", "scriptFunctionNameString": "OpenLogFileFolder", "isJustRun": true},
	{"label": "OpenUserDataFolder", "scriptFunctionNameString": "OpenUserDataFolder", "isJustRun": true},
	{"label": "PutOnEquip", "scriptFunctionNameString": "PutOnEquip", "labelArg1Text": "AvatarTypeID", "lineEditArg1Text": "4", "labelArg2Text": "EquipTypeID", "lineEditArg2Text": "13"},
	{"label": "PrintSaveGameData", "scriptFunctionNameString": "PrintSaveGameData"},
	{"label": "KillCurrentProcess", "scriptFunctionNameString": "KillCurrentProcess"},
	{"label": "PlayAudio", "scriptFunctionNameString": "PlayAudio", "labelArg1Text": "AudioName", "lineEditArg1Text": "Audio_Intro"},
	{"label": "PlayNextAudio", "scriptFunctionNameString": "PlayNextAudio", "isJustRun": true},
	{"label": "PlayPreviousAudio", "scriptFunctionNameString": "PlayPreviousAudio", "isJustRun": true},
	{"label": "ShowTileMapCollision", "scriptFunctionNameString": "ShowTileMapCollision", "labelArg1Text": "IsVisible", "lineEditArg1Text": "1"},
	{"label": "AStarCookData", "scriptFunctionNameString": "AStarCookData"},
	{"label": "SetIsAStarCanRun", "scriptFunctionNameString": "SetIsAStarCanRun", "labelArg1Text": "IsAStarCanRun", "lineEditArg1Text": "1"},
	{"label": "ShowTileMapNavigationPathPoint", "scriptFunctionNameString": "ShowTileMapNavigationPathPoint", "labelArg1Text": "IsVisible", "lineEditArg1Text": "1"},
	{"label": "ShowTileMapWarFog", "scriptFunctionNameString": "ShowTileMapWarFog", "labelArg1Text": "IsVisible", "lineEditArg1Text": "0"},
	{"label": "UpNamePanel_ShowUpName", "scriptFunctionNameString": "UpNamePanel_ShowUpName", "labelArg1Text": "ShowName", "lineEditArg1Text": "UpName"},
	{"label": "UpNamePanel_ShowTips", "scriptFunctionNameString": "UpNamePanel_ShowTips", "labelArg1Text": "ShowTips", "lineEditArg1Text": "tips"},
	{"label": "UpNamePanel_ShowMiddleString", "scriptFunctionNameString": "UpNamePanel_ShowMiddleString", "labelArg1Text": "ShowMiddleString", "lineEditArg1Text": "middleString"},
	{"label": "ShowSlogan", "scriptFunctionNameString": "ShowSlogan", "labelArg1Text": "SloganType", "lineEditArg1Text": "1"},
	{"label": "DownPanel_ShowWrangleDialog", "scriptFunctionNameString": "DownPanel_ShowWrangleDialog", "labelArg1Text": "IsVisibleWrangleDialog", "lineEditArg1Text": "1", "labelArg2Text": "Type", "lineEditArg2Text": "0"},
	{"label": "DownPanel_SetJournalRecordDebugProcessTimeStep", "scriptFunctionNameString": "DownPanel_SetJournalRecordDebugProcessTimeStep", "labelArg1Text": "TimeStep", "lineEditArg1Text": "1"},
	{"label": "DownPanel_Add1JournalRecord", "scriptFunctionNameString": "DownPanel_Add1JournalRecord", "labelArg1Text": "StringType", "lineEditArg1Text": "1"},
	{"label": "TeamPanel_ShowItem", "scriptFunctionNameString": "TeamPanel_ShowItem", "labelArg1Text": "ItemNumber", "lineEditArg1Text": "1"},
	{"label": "DownPanel_ShowBag", "scriptFunctionNameString": "DownPanel_ShowBag", "labelArg1Text": "BagNumber", "lineEditArg1Text": "1"},
	{"label": "DownPanel_Bag_Get", "scriptFunctionNameString": "DownPanel_Bag_Get", "labelArg1Text": "GoodsTypeID", "lineEditArg1Text": "1"},
	{"label": "DownPanel_Bag_Add", "scriptFunctionNameString": "DownPanel_Bag_Add", "labelArg1Text": "GoodsTypeID", "lineEditArg1Text": "1", "labelArg2Text": "Flag", "lineEditArg2Text": "0"},
	{"label": "DownPanel_Bag_Remove", "scriptFunctionNameString": "DownPanel_Bag_Remove", "labelArg1Text": "GoodsTypeID", "lineEditArg1Text": "1"},
	{"label": "DownPanel_Bag_Update", "scriptFunctionNameString": "DownPanel_Bag_Update", "labelArg1Text": "GoodsTypeID", "lineEditArg1Text": "1", "labelArg2Text": "BagGoodsData", "lineEditArg2Text": "1"},
	{"label": "GoodsAddFunction_Bag", "scriptFunctionNameString": "GoodsAddFunction_Bag"},
	{"label": "GoodsAddFunction_JournalRecordBook", "scriptFunctionNameString": "GoodsAddFunction_JournalRecordBook"},
	{"label": "DayNightPanel_SetCommonLabelDaysNumber", "scriptFunctionNameString": "DayNightPanel_SetCommonLabelDaysNumber", "labelArg1Text": "DaysNumber", "lineEditArg1Text": "2"},
	{"label": "DayNightPanel_SetData", "scriptFunctionNameString": "DayNightPanel_SetData", "labelArg1Text": "IsCurrentDayTime", "lineEditArg1Text": "0", "labelArg2Text": "DaytimeDurationTimeInSeconds", "lineEditArg2Text": "3", "labelArg3Text": "NightDurationTimeInSeconds", "lineEditArg3Text": "10"},
	{"label": "AddAvatarFromScene", "scriptFunctionNameString": "AddAvatarFromScene", "labelArg1Text": "AvatarTypeID", "lineEditArg1Text": "0"},
	{"label": "RemoveAvatarFromScene", "scriptFunctionNameString": "RemoveAvatarFromScene", "labelArg1Text": "AvatarTypeID", "lineEditArg1Text": "0"},
	{"label": "AddAvatar", "scriptFunctionNameString": "AddAvatar", "labelArg1Text": "AvatarTypeID", "lineEditArg1Text": "1"},
	{"label": "God", "scriptFunctionNameString": "God"},
	{"label": "PlayChessCalculateSuccessRate", "scriptFunctionNameString": "PlayChessCalculateSuccessRate", "labelArg1Text": "meMin", "lineEditArg1Text": "1", "labelArg2Text": "meMax", "lineEditArg2Text": "2", "labelArg3Text": "opMin", "lineEditArg3Text": "1", "labelArg4Text": "opMax", "lineEditArg4Text": "250"},
	{"label": "SetAllAvatarToCurrentActiveAvatarPosition", "scriptFunctionNameString": "SetAllAvatarToCurrentActiveAvatarPosition"},
	{"label": "SetAvatarPositionDebugData", "scriptFunctionNameString": "SetAvatarPositionDebugData", "labelArg1Text": "sceneTypeID", "lineEditArg1Text": "0", "labelArg2Text": "avatarPositionX", "lineEditArg2Text": "0", "labelArg3Text": "avatarPositionY", "lineEditArg3Text": "0",},
	{"label": "SwallowDebug", "scriptFunctionNameString": "SwallowDebug", "labelArg1Text": "IsSave", "lineEditArg1Text": "0"},
	{"label": "StartSwallowAction", "scriptFunctionNameString": "StartSwallowAction", "labelArg1Text": "NightDurationTimeInSeconds", "lineEditArg1Text": "10"},
	{"label": "Debug_PlayChessSuccessFunction_Avatar_27", "scriptFunctionNameString": "Debug_PlayChessSuccessFunction_Avatar_27"},
	{"label": "SetPlayChessSuccessOrFailure", "scriptFunctionNameString": "SetPlayChessSuccessOrFailure", "labelArg1Text": "IsDebugResult", "lineEditArg1Text": "1", "labelArg2Text": "IsSuccess", "lineEditArg2Text": "1"},
]

var m_AvatarAnimationDebugData: Dictionary = {
	"isStart": false,
}

var m_AudioDebugData: Dictionary = {
	"playNextOrPrevious_CurrentPlayIndex": -1,
}

var m_TileMapDebugData: Dictionary = {
	"collisionVisible": false,
	"navigationPathPointVisible": false,
	"warFogVisible": true,
}

var m_DownPanelDebugData: Dictionary = {
	"journalRecordDebugData": {
		"journalRecordDebugProcessTime": 0.0,
		"journalRecordDebugProcessTimeStep": 0.0,
		"journalRecordDebugString": "",
		"journalRecordDebugStringType": 0,
		"journalRecordDebugStringCount": 0,
	}
}

const AVATAR_POSITION_DEBUG_DATA: Dictionary = {
	"sceneTypeID": 0,
	"avatarPosition": Vector2.ZERO,
}
var m_AvatarPositionDebugData: Dictionary = AVATAR_POSITION_DEBUG_DATA.duplicate(true)

const PLAY_CHESS_DEBUG_DATA: Dictionary = {
	"isDebugResult": false,
	"isSuccess": false,
}
var m_PlayChessDebugData: Dictionary = PLAY_CHESS_DEBUG_DATA.duplicate(true)

func _process(_delta: float):
	DownPanel_processDebug(_delta)

func GetDebugDataScriptFunctionNameString(index: int) -> String:
	return GetDebugData(index).scriptFunctionNameString

func GetDebugData(index: int) -> Dictionary:
	var debugData = {}
	if((0 <= index) and (GetDebugDataListSize() > index)):
		debugData = DEBUG_DATA_LIST[index]
	
	return debugData

func GetDebugDataList() -> Array:
	return DEBUG_DATA_LIST

func GetDebugDataListSize() -> int:
	return DEBUG_DATA_LIST.size()

func DisposeInput(event: InputEvent):
	if HQH.IS_DEBUG:
		if event.is_action_pressed("ui_debug"):
			UIManager.DebugMenuPanel_ShowHide()
		
		AllAvatarAnimationDebug_Input(event)

func DebugMenuPanel_on_buttonRun_pressed(selectedItemsIndex: int, arg1: String, arg2: String, arg3: String, arg4: String, arg5: String):
	call(GetDebugDataScriptFunctionNameString(selectedItemsIndex), arg1, arg2, arg3, arg4, arg5)
	
	UIManager.DebugMenuPanel_Hide()

func RandomSample(_arg1: String, _arg2: String, _arg3: String, _arg4: String, _arg5: String):
	HQH.Log("RandomSample")
	
	var randomList: Array = []
	for _iv in range(100):
		var r: int = HQH.Rand()
		randomList.append(r)
	
	HQH.Log("randomList:")
	HQH.Log(randomList)
	
	var rand_max_1f: float = HQH.RAND_MAX * HQH.RAND_1_MAX
	HQH.Log("HQH.RAND_MAX: %s, HQH.RAND_1_MAX: %s" % [HQH.RAND_MAX, HQH.RAND_1_MAX])
	HQH.Log("rand_max_1f: %s" % rand_max_1f)
	
	var randomFloatList: Array = []
	for _iv in range(100):
		var r: float = HQH.RandFloat()
		randomFloatList.append(r)
	
	HQH.Log("randomFloatList:")
	HQH.Log(randomFloatList)
	
	var randomD6List: Array = []
	for _iv in range(100):
		var rD6: int = HQH.RandomD6()
		randomD6List.append(rD6)
	
	HQH.Log("randomD6List:")
	HQH.Log(randomD6List)
	
	var minValue: int = 7
	var maxValue: int = 9
	var modRangeList: Array = []
	for _iv in range(100):
		var value: int = randomD6List[_iv]
		var r: int = HQH.ModRange(minValue, maxValue, value)
		modRangeList.append(r)
	
	HQH.Log("randomD6List, ModRange(%s, %s):" % [minValue, maxValue])
	HQH.Log(modRangeList)
	
	var randomModRangeList: Array = []
	for i in 100:
		var r: int = HQH.RandomModRange(minValue, maxValue)
		randomModRangeList.append(r)
	
	HQH.Log("randomModRangeList, RandomModRange(%s, %s):" % [minValue, maxValue])
	HQH.Log(randomModRangeList)
	
	var randomD2List: Array = []
	for _iv in range(100):
		var rD2: int = HQH.RandomD2()
		randomD2List.append(rD2)
	
	HQH.Log("randomD2List:")
	HQH.Log(randomD2List)

# AvatarAnimation, arg1:
# arg1_IsCreateAll: 0: not create all. other number: create all.
# arg2_IsCreatePart: 0: not create part. positive number: create part.
# arg3_Create1AvatarTypeID: positive number: create 1  avatar the avatarTypeID.
func AvatarAnimation(arg1_IsCreateAll: String, arg2_IsCreatePart: String, arg3_Create1AvatarTypeID: String, _arg4: String, _arg5: String):
	HQH.Log("AvatarAnimation, arg1_IsCreateAll: %s, arg2_IsCreatePart: %s, arg3_Create1AvatarTypeID: %s" % [arg1_IsCreateAll, arg2_IsCreatePart, arg3_Create1AvatarTypeID])
	
	m_AvatarAnimationDebugData.isStart = true
	
	var arg1_IsCreateAllNumber: int = int(arg1_IsCreateAll)
	var arg2_IsCreatePartNumber: int = int(arg2_IsCreatePart)
	var arg3_Create1AvatarTypeIDNumber: int = int(arg3_Create1AvatarTypeID)
	
	var AVATAR_TYPE_MAP_SIZE: int = TableManager.GetAvatarTypeMapSize()
	
	var isCreateAll: bool = false
	if 0 != arg1_IsCreateAllNumber:
		 isCreateAll = true
	
	var isCreatePart: bool = false
	if 0 < arg2_IsCreatePartNumber:
		isCreatePart = true
	
	AvatarManager.RemoveCurrentSceneAllAvatar()
	
	var i: int = 0
	var COUNT_LOOP_STEP: int = 10
	var POSITION_OFFSET: int = 100
	var lineNumber: int = 0
	var lineNumberIn1Number: int = 0
	if isCreateAll:
		# create all animations
		lineNumber = int(AVATAR_TYPE_MAP_SIZE / COUNT_LOOP_STEP)
		lineNumberIn1Number = COUNT_LOOP_STEP
	elif isCreatePart:
		# create part animations
		lineNumber = int(arg2_IsCreatePartNumber / COUNT_LOOP_STEP)
		lineNumberIn1Number = arg2_IsCreatePartNumber # Just be used in when "1 >= lineNumber" true
	else:
		# create 1 animation in i index
		lineNumber = 1
		lineNumberIn1Number = 1
	
	var currentCameraIndex: int = 0
	if 1 >= lineNumber:
		currentCameraIndex = int(lineNumberIn1Number / 2)
	else:
		currentCameraIndex = int(max(lineNumber - 1, 0) * COUNT_LOOP_STEP) + int(COUNT_LOOP_STEP / 2)
	
	if isCreateAll:
		# create all animations
		for k in TableManager.GetAvatarTypeMap():
			var resourceInstance: KinematicBody2DAvatar = AvatarManager.GetAvatarTypePreloadResourceInstance(k)
			AvatarManager.AddAvatarToCurrentScene(resourceInstance, Vector2((i % COUNT_LOOP_STEP) * POSITION_OFFSET, int(i / COUNT_LOOP_STEP) * POSITION_OFFSET), currentCameraIndex == i, k)
			i = i + 1
	elif isCreatePart:
		# create part animations
		for k in TableManager.GetAvatarTypeMap():
			if (arg2_IsCreatePartNumber > i):
				var resourceInstance: KinematicBody2DAvatar = AvatarManager.GetAvatarTypePreloadResourceInstance(k)
				AvatarManager.AddAvatarToCurrentScene(resourceInstance, Vector2((i % COUNT_LOOP_STEP) * POSITION_OFFSET, int(i / COUNT_LOOP_STEP) * POSITION_OFFSET), currentCameraIndex == i, k)
			else:
				break
			
			i = i + 1
	else:
		# create 1 animation in i index
		if TableManager.IsHasAvatarType(arg3_Create1AvatarTypeIDNumber):
			var resourceInstance: KinematicBody2DAvatar = AvatarManager.GetAvatarTypePreloadResourceInstance(arg3_Create1AvatarTypeIDNumber)
			AvatarManager.AddAvatarToCurrentScene(resourceInstance, Vector2.ZERO, true, arg3_Create1AvatarTypeIDNumber)

func AllAvatarAnimationDebug_Input(event: InputEvent):
	if not m_AvatarAnimationDebugData.isStart:
		return
	
	var node2DAvatarChildren: Array = SceneManager.GetCurrentSceneNode2DAvatarChildren()
	if event.is_action_pressed("ui_home"):
		for iv in node2DAvatarChildren:
			iv.AvatarStart_TALK()
	elif event.is_action_pressed("ui_end"):
		for iv in node2DAvatarChildren:
			iv.AvatarStop_TALK()
	elif event.is_action_pressed("ui_accept"):
		for iv in node2DAvatarChildren:
			iv.AvatarStart_ATTACK()

func DataSample_TimeToDictionary(timeValue: int):
	var timeDictionary: Dictionary = HQH.TimeToDictionary(timeValue)
	var timeString: String = HQH.TimeToString(timeValue)
	HQH.Log("timeValue: %s seconds, timeDictionary: %s, timeString: %s" % [timeValue, timeDictionary, timeString])

func DataSample(_arg1: String, _arg2: String, _arg3: String, _arg4: String, _arg5: String):
	HQH.Log("DataSample, _arg1: %s, _arg2: %s, _arg3: %s, _arg4: %s, _arg5: %s" % [_arg1, _arg2, _arg3, _arg4, _arg5])
	
	HQH.Log("Array for loop:")
	var i: int = 0
	var list: Array = [1, 2, 3]
	HQH.Log(list)
	for iv in list:
		HQH.Log("[%s] %s" % [i, iv])
		i = i + 1
	
	HQH.Log("Dictionary for loop:")
	var dict: Dictionary = {"a": 1, "b": 2, "c": 3}
	HQH.Log(dict)
	for k in dict:
		HQH.Log("k: %s, dict[k]: %s" % [k, dict[k]])
	
	# assign same key value 2 times
	dict["a"] = 100
	dict["a"] += 23
	HQH.Log(dict)
	
	var valueNull = null
	if valueNull:
		HQH.Log("valueNull not null")
	elif is_instance_valid(valueNull):
		HQH.Log("valueNull not equal to null")
	else:
		HQH.Log("valueNull null")
	
	var longPrintNumber: int = 10
	HQH.Log("longPrintNumber: %s" % longPrintNumber)
	for iv in range(longPrintNumber):
		HQH.Log("%s/%s" % [iv, longPrintNumber])
	
	var date: String = "2022-11-22 11:22:33"
	HQH.Log("date: %s" % date)
	var datetime: Dictionary = HQH.String_to_datetime(date)
	var datetimeString: String = HQH.Datetime_to_string(datetime)
	var datetimeInSecond: int = HQH.String_to_datetimeInSecond(date)
	HQH.Log("datetime: %s" % datetime)
	HQH.Log("datetimeString: %s" % datetimeString)
	HQH.Log("datetimeInSecond: %s" % datetimeInSecond)
	
	var firstSaveGameDataDateTime: String = SaveGameManager.GetSaveData_firstSaveGameDataDateTime()
	var firstSaveGameDataDateTimeInSecond: int = HQH.String_to_datetimeInSecond(firstSaveGameDataDateTime)
	var lastSaveGameDataDateTime: String = SaveGameManager.GetSaveData_lastSaveGameDataDateTime()
	var lastSaveGameDataDateTimeInSecond: int = HQH.String_to_datetimeInSecond(lastSaveGameDataDateTime)
	var hasPassedGameTimeInSecond: int = lastSaveGameDataDateTimeInSecond - firstSaveGameDataDateTimeInSecond
	var hasPassedGameTimeDictionary: Dictionary = HQH.TimeToDictionary(hasPassedGameTimeInSecond)
	var hasPassedGameTimeString: String = HQH.TimeToString(hasPassedGameTimeInSecond)
	HQH.Log("firstSaveGameDataDateTime: %s, lastSaveGameDataDateTime: %s, hasPassedGameTimeInSecond: %s, hasPassedGameTimeDictionary: %s, hasPassedGameTimeString: %s" % [firstSaveGameDataDateTime, lastSaveGameDataDateTime, hasPassedGameTimeInSecond, hasPassedGameTimeDictionary, hasPassedGameTimeString])
	
	DataSample_TimeToDictionary(0)
	DataSample_TimeToDictionary(1)
	DataSample_TimeToDictionary((2 * HQH.ONE_MINUTE_IN_SECOND) + 1)
	DataSample_TimeToDictionary((3 * HQH.ONE_HOUR_IN_MINUTE * HQH.ONE_MINUTE_IN_SECOND) + (2 * HQH.ONE_MINUTE_IN_SECOND) + 1)
	DataSample_TimeToDictionary((3 * HQH.ONE_HOUR_IN_MINUTE * HQH.ONE_MINUTE_IN_SECOND) + (0 * HQH.ONE_MINUTE_IN_SECOND) + 1)
	DataSample_TimeToDictionary((4 * HQH.ONE_DAY_IN_HOUR * HQH.ONE_HOUR_IN_MINUTE * HQH.ONE_MINUTE_IN_SECOND) + (3 * HQH.ONE_HOUR_IN_MINUTE * HQH.ONE_MINUTE_IN_SECOND) + (2 * HQH.ONE_MINUTE_IN_SECOND) + 1)
	DataSample_TimeToDictionary((4 * HQH.ONE_DAY_IN_HOUR * HQH.ONE_HOUR_IN_MINUTE * HQH.ONE_MINUTE_IN_SECOND) + (0 * HQH.ONE_HOUR_IN_MINUTE * HQH.ONE_MINUTE_IN_SECOND) + (2 * HQH.ONE_MINUTE_IN_SECOND) + 1)
	DataSample_TimeToDictionary((4 * HQH.ONE_DAY_IN_HOUR * HQH.ONE_HOUR_IN_MINUTE * HQH.ONE_MINUTE_IN_SECOND) + (3 * HQH.ONE_HOUR_IN_MINUTE * HQH.ONE_MINUTE_IN_SECOND) + (0 * HQH.ONE_MINUTE_IN_SECOND) + 1)
	DataSample_TimeToDictionary((4 * HQH.ONE_DAY_IN_HOUR * HQH.ONE_HOUR_IN_MINUTE * HQH.ONE_MINUTE_IN_SECOND) + (0 * HQH.ONE_HOUR_IN_MINUTE * HQH.ONE_MINUTE_IN_SECOND) + (0 * HQH.ONE_MINUTE_IN_SECOND) + 1)
	DataSample_TimeToDictionary((5 * HQH.ONE_MONTH_IN_DAY * HQH.ONE_DAY_IN_HOUR * HQH.ONE_HOUR_IN_MINUTE * HQH.ONE_MINUTE_IN_SECOND) + (4 * HQH.ONE_DAY_IN_HOUR * HQH.ONE_HOUR_IN_MINUTE * HQH.ONE_MINUTE_IN_SECOND) + (3 * HQH.ONE_HOUR_IN_MINUTE * HQH.ONE_MINUTE_IN_SECOND) + (2 * HQH.ONE_MINUTE_IN_SECOND) + 1)
	DataSample_TimeToDictionary((6 * HQH.ONE_YEAR_IN_MONTH * HQH.ONE_MONTH_IN_DAY * HQH.ONE_DAY_IN_HOUR * HQH.ONE_HOUR_IN_MINUTE * HQH.ONE_MINUTE_IN_SECOND) + (5 * HQH.ONE_MONTH_IN_DAY * HQH.ONE_DAY_IN_HOUR * HQH.ONE_HOUR_IN_MINUTE * HQH.ONE_MINUTE_IN_SECOND) + (4 * HQH.ONE_DAY_IN_HOUR * HQH.ONE_HOUR_IN_MINUTE * HQH.ONE_MINUTE_IN_SECOND) + (3 * HQH.ONE_HOUR_IN_MINUTE * HQH.ONE_MINUTE_IN_SECOND) + (2 * HQH.ONE_MINUTE_IN_SECOND) + 1)
	DataSample_TimeToDictionary((100 * HQH.ONE_YEAR_IN_MONTH * HQH.ONE_MONTH_IN_DAY * HQH.ONE_DAY_IN_HOUR * HQH.ONE_HOUR_IN_MINUTE * HQH.ONE_MINUTE_IN_SECOND) + (5 * HQH.ONE_MONTH_IN_DAY * HQH.ONE_DAY_IN_HOUR * HQH.ONE_HOUR_IN_MINUTE * HQH.ONE_MINUTE_IN_SECOND) + (4 * HQH.ONE_DAY_IN_HOUR * HQH.ONE_HOUR_IN_MINUTE * HQH.ONE_MINUTE_IN_SECOND) + (3 * HQH.ONE_HOUR_IN_MINUTE * HQH.ONE_MINUTE_IN_SECOND) + (2 * HQH.ONE_MINUTE_IN_SECOND) + 1)

func AvatarFollow(arg1_AvatarNumber: String, _arg2: String, _arg3: String, _arg4: String, _arg5: String):
	HQH.Log("AvatarFollow, arg1_AvatarNumber: %s" % [arg1_AvatarNumber])
	
	var arg1_AvatarNumberInt: int = int(arg1_AvatarNumber)
	
	AvatarManager.RemoveCurrentSceneAllAvatar()
	
	var AVATAR_TYPE_MAP_SIZE: int = TableManager.GetAvatarTypeMapSize()
	var currentCameraIndex: int = arg1_AvatarNumberInt - 1
	var COUNT_LOOP_STEP: int = 10
	var POSITION_OFFSET: int = 0
	for i in range(1, arg1_AvatarNumberInt):
		var avatarTypeID: int = i % AVATAR_TYPE_MAP_SIZE
		var resourceInstance: KinematicBody2DAvatar = AvatarManager.GetAvatarTypePreloadResourceInstance(avatarTypeID)
		var isCurrentActive: bool = (currentCameraIndex == i)
		AvatarManager.AddAvatarToCurrentScene(resourceInstance, Vector2((i % COUNT_LOOP_STEP) * POSITION_OFFSET, int(i / COUNT_LOOP_STEP) * POSITION_OFFSET), isCurrentActive, avatarTypeID)
		if not isCurrentActive:
			resourceInstance.AvatarStart_FOLLOW_IDLE()
			resourceInstance.CollisionShape2D1ShapeRadiusSetNormal()
		else:
			resourceInstance.CollisionShape2D1ShapeRadiusSetSmall()

func AvatarFollow2(arg1_AvatarTypeID: String, arg2_AvatarTypeID: String, arg3_AvatarTypeID: String, arg4_AvatarTypeID: String, arg5_AvatarTypeID: String):
	HQH.Log("AvatarFollow2, arg1_AvatarTypeID: %s, arg2_AvatarTypeID: %s, arg3_AvatarTypeID: %s, arg4_AvatarTypeID: %s, arg5_AvatarTypeID: %s" % [arg1_AvatarTypeID, arg2_AvatarTypeID, arg3_AvatarTypeID, arg4_AvatarTypeID, arg5_AvatarTypeID])
	
	var arg1_AvatarTypeIDNumber: int = int(arg1_AvatarTypeID)
	var arg2_AvatarTypeIDNumber: int = int(arg2_AvatarTypeID)
	var arg3_AvatarTypeIDNumber: int = int(arg3_AvatarTypeID)
	var arg4_AvatarTypeIDNumber: int = int(arg4_AvatarTypeID)
	var arg5_AvatarTypeIDNumber: int = int(arg5_AvatarTypeID)
	
	AvatarManager.ClearCreateAvatarInfoList()
	
	AvatarManager.AddCreateAvatarInfoList(arg1_AvatarTypeIDNumber, Vector2.ZERO, 0)
	AvatarManager.AddCreateAvatarInfoList(arg2_AvatarTypeIDNumber, Vector2.ZERO, 0)
	AvatarManager.AddCreateAvatarInfoList(arg3_AvatarTypeIDNumber, Vector2.ZERO, 0)
	AvatarManager.AddCreateAvatarInfoList(arg4_AvatarTypeIDNumber, Vector2.ZERO, 0)
	AvatarManager.AddCreateAvatarInfoList(arg5_AvatarTypeIDNumber, Vector2.ZERO, 0)
	
	AvatarManager.CreateAvatarInCurrentScene()

func CreateScene(arg1_SceneTypeID: String, _arg2: String, _arg3: String, _arg4: String, _arg5: String):
	HQH.Log("CreateScene, arg1_SceneTypeID: %s" % [arg1_SceneTypeID])
	
	var arg1_SceneTypeIDNumber: int = int(arg1_SceneTypeID)
	
	SceneManager.ChangeToSceneBySceneTypeID(arg1_SceneTypeIDNumber)

func PrintLanguageTable(arg1_LanguageName: String, _arg2: String, _arg3: String, _arg4: String, _arg5: String):
	HQH.Log("PrintLanguageTable, arg1_LanguageName: %s" % [arg1_LanguageName])
	
	# Check locale
	var locale: String = OS.get_locale()
	var localeLanguage: String = OS.get_locale_language()
	var localeLanguageName: String = TableManager.GetLanguageNameByLocale()
	HQH.Log("locale: %s, localeLanguage: %s, localeLanguageName: %s" % [locale, localeLanguage, localeLanguageName])
	var allLanguageName: Array = TableManager.GetAllLanguageName()
	var currentLanguageName: String = TableManager.GetCurrentLanguageName()
	var languageNameIndex: int = 0
	for iv in allLanguageName:
		if currentLanguageName == iv:
			HQH.Log("[%s]LanguageName: %s <- currentLanguage" % [languageNameIndex, iv])
		else:
			HQH.Log("[%s]LanguageName: %s" % [languageNameIndex, iv])
		
		languageNameIndex = languageNameIndex + 1
	
	# Set language and load language table
	TableManager.SetLanguage(arg1_LanguageName, false)
	
	# Print language table
	TableManager.PrintCurrentLanguageTable()

func PrintDataTable(arg1_Name: String, _arg2: String, _arg3: String, _arg4: String, _arg5: String):
	HQH.Log("PrintDataTable, arg1_Name: %s" % [arg1_Name])
	
	TableManager.PrintDictionaryTable_EquipTable1()
	
	HQH.Log("EquipTable1 info:")
	if true:
		var ID: String = "3"
		var keyIndex: int = -1
		var valueString: String = ""
		
		keyIndex = TableManager.EQUIPTABLE1_DATA_INDEX_EQUIPID
		valueString = TableManager.TableGetValue_EquipTable1(ID, keyIndex, TableManager.TABLEGETVALUE_HANDLE_TYPE.NONE)
		HQH.Log("ID: %s, keyIndex and valueString: [%s: %s]" % [ID, keyIndex, valueString])
		
		keyIndex = TableManager.EQUIPTABLE1_DATA_INDEX_FILENAME
		valueString = TableManager.TableGetValue_EquipTable1(ID, keyIndex, TableManager.TABLEGETVALUE_HANDLE_TYPE.HANDLE_FILEPATH)
		HQH.Log("ID: %s, keyIndex and valueString: [%s: %s]" % [ID, keyIndex, valueString])
		
		keyIndex = TableManager.EQUIPTABLE1_DATA_INDEX_COLOR
		valueString = TableManager.TableGetValue_EquipTable1(ID, keyIndex, TableManager.TABLEGETVALUE_HANDLE_TYPE.HANDLE_COLORPALETTE_EQUIP)
		HQH.Log("ID: %s, keyIndex and valueString: [%s: %s]" % [ID, keyIndex, valueString])

func TimerSample(arg1_DelayTime: String, _arg2: String, _arg3: String, _arg4: String, _arg5: String):
	HQH.Log("TimerSample, arg1_DelayTime: %s" % [arg1_DelayTime])
	
	var timer: Timer = null
	if not is_instance_valid(timer):
		timer = Timer.new()
		timer.one_shot = true
		add_child(timer)
		timer.connect("timeout", self, "TimerSample_OnTimeout")
		
		HQH.Log("timer.start, arg1_DelayTime: %s" % arg1_DelayTime)
		var arg1_DelayTimeNumber: int = int(arg1_DelayTime)
		timer.start(arg1_DelayTimeNumber)

func TimerSample_OnTimeout():
	HQH.Log("TimerSample_OnTimeout")

func SimulateActionaPressSample(arg1_ActionName: String, _arg2: String, _arg3: String, _arg4: String, _arg5: String):
	HQH.Log("SimulateActionaPressSample, arg1_ActionName: %s" % [arg1_ActionName])
	
	var isPrintInputEvent = SceneManager.GetIsPrintInputEvent()
	SceneManager.SetIsPrintInputEvent(not isPrintInputEvent)
	
	var inputEventAction = InputEventAction.new()
	inputEventAction.action = arg1_ActionName
	inputEventAction.pressed = true
	Input.parse_input_event(inputEventAction)

func OpenLogFileFolder(_arg1: String, _arg2: String, _arg3: String, _arg4: String, _arg5: String):
	HQH.Log("OpenLogFileFolder")
	
	var logFileFolderPath = HQH.GetLogFileFolderPath()
	HQH.Log("logFileFolderPath: %s" % logFileFolderPath)
	OS.shell_open(logFileFolderPath)

func OpenUserDataFolder(_arg1: String, _arg2: String, _arg3: String, _arg4: String, _arg5: String):
	HQH.Log("OpenUserDataFolder")
	
	var userDataFolderPath = HQH.GetUserDataFolderPath()
	HQH.Log("userDataFolderPath: %s" % userDataFolderPath)
	OS.shell_open(userDataFolderPath)

func PutOnEquip(arg1_AvatarTypeID: String, arg2_EquipTypeID: String, _arg3: String, _arg4: String, _arg5: String):
	HQH.Log("PutOnEquip, arg1_AvatarTypeID: %s, arg2_EquipTypeID: %s" % [arg1_AvatarTypeID, arg2_EquipTypeID])
	
	var arg1_AvatarTypeIDNumber: int = int(arg1_AvatarTypeID)
	var arg2_EquipTypeIDNumber: int = int(arg2_EquipTypeID)
	
	if true:
		EquipManager.AvatarPutOnEquip(arg1_AvatarTypeIDNumber, arg2_EquipTypeIDNumber)
	else:
		var node2DAvatarChildren: Array = SceneManager.GetCurrentSceneNode2DAvatarChildren()
		for iv in node2DAvatarChildren:
			if arg1_AvatarTypeIDNumber == iv.GetAvatarTypeID():
				iv.PutOnEquip(arg2_EquipTypeIDNumber)
				
				break

func PrintSaveGameData(_arg1: String, _arg2: String, _arg3: String, _arg4: String, _arg5: String):
	HQH.Log("PrintSaveGameData")
	
	SaveGameManager.PrintSaveGameData()

func KillCurrentProcess(_arg1: String, _arg2: String, _arg3: String, _arg4: String, _arg5: String):
	HQH.Log("KillCurrentProcess")
	
	HQH.KillCurrentProcess()

func PlayAudio(arg1_AudioName: String, _arg2: String, _arg3: String, _arg4: String, _arg5: String):
	HQH.Log("PlayAudio, arg1_AudioName: %s" % [arg1_AudioName])
	
	AudioManager.PlayByName(arg1_AudioName)

func PlayNextAudio(_arg1: String, _arg2: String, _arg3: String, _arg4: String, _arg5: String):
	HQH.Log("PlayNextAudio")
	
	m_AudioDebugData.playNextOrPrevious_CurrentPlayIndex = m_AudioDebugData.playNextOrPrevious_CurrentPlayIndex + 1
	var keysSize: int = TableManager.GetKeysSize_AUDIO_INFO_LIST_keys()
	if keysSize <= m_AudioDebugData.playNextOrPrevious_CurrentPlayIndex:
		m_AudioDebugData.playNextOrPrevious_CurrentPlayIndex = 0
	
	AudioManager.StopBGMusic()
	AudioManager.PlayByIndex(m_AudioDebugData.playNextOrPrevious_CurrentPlayIndex)

func PlayPreviousAudio(_arg1: String, _arg2: String, _arg3: String, _arg4: String, _arg5: String):
	HQH.Log("PlayPreviousAudio")
	
	m_AudioDebugData.playNextOrPrevious_CurrentPlayIndex = m_AudioDebugData.playNextOrPrevious_CurrentPlayIndex - 1
	if 0 > m_AudioDebugData.playNextOrPrevious_CurrentPlayIndex:
		var keysSize: int = TableManager.GetKeysSize_AUDIO_INFO_LIST_keys()
		m_AudioDebugData.playNextOrPrevious_CurrentPlayIndex = keysSize - 1
	
	AudioManager.StopBGMusic()
	AudioManager.PlayByIndex(m_AudioDebugData.playNextOrPrevious_CurrentPlayIndex)

func ShowTileMapCollision(arg1_IsVisible: String, _arg2: String, _arg3: String, _arg4: String, _arg5: String):
	HQH.Log("ShowTileMapCollision, arg1_IsVisible: %s" % arg1_IsVisible)
	
	var arg1_IsVisibleNumber: int = int(arg1_IsVisible)
	
	m_TileMapDebugData.collisionVisible = (0 < arg1_IsVisibleNumber)
	SceneManager.ShowTileMapCollision(m_TileMapDebugData.collisionVisible)

func AStarCookData(_arg1: String, _arg2: String, _arg3: String, _arg4: String, _arg5: String):
	HQH.Log("AStarCookData")
	
	NavigationManager.AStarCookData()

func SetIsAStarCanRun(arg1_IsAStarCanRun: String, _arg2: String, _arg3: String, _arg4: String, _arg5: String):
	HQH.Log("SetIsAStarCanRun, arg1_IsAStarCanRun: %s" % arg1_IsAStarCanRun)
	
	var isAStarCanRun: bool = (0 < int(arg1_IsAStarCanRun))
	NavigationManager.SetIsAStarCanRun(isAStarCanRun)

func GetTileMapDebugData_collisionVisible() -> bool:
	return m_TileMapDebugData.collisionVisible

func ShowTileMapNavigationPathPoint(arg1_IsVisible: String, _arg2: String, _arg3: String, _arg4: String, _arg5: String):
	HQH.Log("ShowTileMapNavigationPathPoint, arg1_IsVisible: %s" % arg1_IsVisible)
	
	var arg1_IsVisibleNumber: int = int(arg1_IsVisible)
	
	m_TileMapDebugData.navigationPathPointVisible = (0 < arg1_IsVisibleNumber)
	NavigationManager.CallTileMapNavigationDraw()

func GetTileMapDebugData_navigationPathPointVisible() -> bool:
	return m_TileMapDebugData.navigationPathPointVisible

func ShowTileMapWarFog(arg1_IsVisible: String, _arg2: String, _arg3: String, _arg4: String, _arg5: String):
	HQH.Log("ShowTileMapWarFog, arg1_IsVisible: %s" % arg1_IsVisible)
	
	var arg1_IsVisibleNumber: int = int(arg1_IsVisible)
	
	m_TileMapDebugData.warFogVisible = (0 < arg1_IsVisibleNumber)
	SceneManager.ShowTileMapWarFog(m_TileMapDebugData.warFogVisible)

func GetTileMapDebugData_warFogVisible() -> bool:
	return m_TileMapDebugData.warFogVisible

func UpNamePanel_ShowUpName(arg1_ShowName: String, _arg2: String, _arg3: String, _arg4: String, _arg5: String):
	HQH.Log("UpNamePanel_ShowUpName, arg1_ShowName: %s" % arg1_ShowName)
	
	UIManager.UpNamePanel_ShowUpName(arg1_ShowName)

func UpNamePanel_ShowTips(arg1_ShowTips: String, _arg2: String, _arg3: String, _arg4: String, _arg5: String):
	HQH.Log("UpNamePanel_ShowTips, arg1_ShowTips: %s" % arg1_ShowTips)
	
	UIManager.UpNamePanel_ShowTips(arg1_ShowTips)

func UpNamePanel_ShowMiddleString(arg1_ShowMiddleString: String, _arg2: String, _arg3: String, _arg4: String, _arg5: String):
	HQH.Log("UpNamePanel_ShowMiddleString, arg1_ShowMiddleString: %s" % arg1_ShowMiddleString)
	
	UIManager.UpNamePanel_ShowMiddleString(arg1_ShowMiddleString)

func ShowSlogan(arg1_SloganType: String, _arg2: String, _arg3: String, _arg4: String, _arg5: String):
	HQH.Log("ShowSlogan, arg1_SloganType: %s" % arg1_SloganType)
	
	var arg1_SloganTypeNumber: int = int(arg1_SloganType)
	match arg1_SloganTypeNumber:
		1:
			UIManager.ShowSlogan_AvatarDead_UpNamePanel_ShowMiddleString()

func DownPanel_ShowWrangleDialog(arg1_IsVisibleWrangleDialog: String, arg2_Type: String, _arg3: String, _arg4: String, _arg5: String):
	HQH.Log("DownPanel_ShowWrangleDialog, arg1_IsVisibleWrangleDialog: %s, arg2_Type: %s" % [arg1_IsVisibleWrangleDialog, arg2_Type])
	
	var arg1_IsVisibleWrangleDialogNumber: int = int(arg1_IsVisibleWrangleDialog)
	var arg2_TypeNumber: int = int(arg2_Type)
	
	var isVisibleWrangleDialog: bool = false
	if 0 != arg1_IsVisibleWrangleDialogNumber:
		 isVisibleWrangleDialog = true
	
	UIManager.DownPanel_WrangleDialogSetIsVisible(isVisibleWrangleDialog)
	
	if isVisibleWrangleDialog:
		var contentString: String = ""
		var wrangleDialogButtonStringArray: Array = []
		if 16 >= arg2_TypeNumber:
			var preloadResourceName: String = ""
			var name: String = ""
			match arg2_TypeNumber:
				0:
					preloadResourceName = "Scene_Bag"
					name = "name0"
					contentString = "contentString0"
					wrangleDialogButtonStringArray.clear()
				
				1:
					preloadResourceName = "Scene_JournalRecordBook"
					name = "name1"
					contentString = "contentString 1"
					wrangleDialogButtonStringArray.append("button1")
				
				2:
					preloadResourceName = "Scene_Door1"
					name = "name2"
					contentString = "contentString 2, Add a CanvasLayer and try out combinations of nodes and lights. You will notice the lights disregard the CanvasLayer that is te."
					wrangleDialogButtonStringArray.append("button1")
					wrangleDialogButtonStringArray.append("button2, description")
				
				3, 4, 5, 6, 7:
					preloadResourceName = "HeadPortrait_Angel1"
					name = "name3-7"
					for i in arg2_TypeNumber:
						var s: String = "Add a CanvasLayer and try out combinations of nodes and lights. line %s" % (i + 1)
						contentString = contentString + s
						if (arg2_TypeNumber - 1) > i:
							contentString = contentString + "\n"
						
						wrangleDialogButtonStringArray.append("button%s" % (i + 1))
				
				8:
					preloadResourceName = "HeadPortrait_Snake3"
					name = "name, 2 lines and no button"
					# 2 lines
					contentString = "2 lines, Add a CanvasLayer and try out combinations of nodes and lights. You will notice the lights disregard the CanvasLayer that is te."
					wrangleDialogButtonStringArray.clear()
				
				9:
					preloadResourceName = "HeadPortrait_Tortoise1"
					name = "name, 3 lines and no button"
					# 3 lines
					contentString = "3 lines, Add a CanvasLayer and try out combinations of nodes and lights. You will notice the lights disregard the CanvasLayer that is te. Add a CanvasLayer and try out combinations of nodes and lights. You will"
					wrangleDialogButtonStringArray.clear()
				
				10:
					preloadResourceName = "HeadPortrait_Turtle1"
					name = "name, 4 lines and no button"
					# 4 lines
					contentString = "4 lines, Add a CanvasLayer and try out combinations of nodes and lights. You will notice the lights disregard the CanvasLayer that is te. Add a CanvasLayer and try out combinations of nodes and lights. You will notice the lights. Add a CanvasLayer and try out combinations of nodes and lights"
					wrangleDialogButtonStringArray.clear()
				
				11:
					preloadResourceName = "HeadPortrait_Turtle1"
					name = "name, 5 lines and no button"
					# 5 lines
					contentString = "4 lines, Add a CanvasLayer and try out combinations of nodes and lights. You will notice the lights disregard the CanvasLayer that is te. Add a CanvasLayer and try out combinations of nodes and lights. You will notice the lights. Add a CanvasLayer and try out combinations of nodes and lights"
					contentString = contentString + "\n5 line"
					wrangleDialogButtonStringArray.clear()
				
				12:
					preloadResourceName = "HeadPortrait_Turtle1"
					name = "name, 6 lines and no button"
					# 6 lines
					contentString = "4 lines, Add a CanvasLayer and try out combinations of nodes and lights. You will notice the lights disregard the CanvasLayer that is te. Add a CanvasLayer and try out combinations of nodes and lights. You will notice the lights. Add a CanvasLayer and try out combinations of nodes and lights"
					contentString = contentString + "\n5 line"
					contentString = contentString + "\n6 line"
					wrangleDialogButtonStringArray.clear()
				
				13:
					preloadResourceName = "HeadPortrait_Turtle1"
					name = "name, 7 lines and no button"
					# 7 lines
					contentString = "4 lines, Add a CanvasLayer and try out combinations of nodes and lights. You will notice the lights disregard the CanvasLayer that is te. Add a CanvasLayer and try out combinations of nodes and lights. You will notice the lights. Add a CanvasLayer and try out combinations of nodes and lights"
					contentString = contentString + "\n5 line"
					contentString = contentString + "\n6 line"
					contentString = contentString + "\n7 line"
					wrangleDialogButtonStringArray.clear()
				
				14:
					preloadResourceName = "HeadPortrait_Turtle1"
					name = "name, 8 lines and no button"
					# 8 lines
					contentString = "4 lines, Add a CanvasLayer and try out combinations of nodes and lights. You will notice the lights disregard the CanvasLayer that is te. Add a CanvasLayer and try out combinations of nodes and lights. You will notice the lights. Add a CanvasLayer and try out combinations of nodes and lights"
					contentString = contentString + "\n5 line"
					contentString = contentString + "\n6 line"
					contentString = contentString + "\n7 line"
					contentString = contentString + "\n8 line"
					wrangleDialogButtonStringArray.clear()
				
				15:
					preloadResourceName = "HeadPortrait_Snake2"
					name = "name, 15 lines and no button"
					# 15 lines
					contentString = "15 lines, Add a CanvasLayer and try out combinations of nodes and lights. You will notice the lights disregard the CanvasLayer that is te. Add a CanvasLayer and try out combinations of nodes and lights. You will notice the lights disregard the CanvasLayer that is te.WrangleDialogContent, Add a CanvasLayer and try out combinations of nodes and lights. You will notice the lights disregard the CanvasLayer that is te. Add a CanvasLayer and try out combinations of nodes and lights. You will notice the lights disregard the CanvasLayer that is te.WrangleDialogContent, Add a CanvasLayer and try out combinations of nodes and lights. You will notice the lights disregard the CanvasLayer that is te. Add a CanvasLayer and try out combinations of nodes and lights. You will notice the lights disregard the CanvasLayer that is te.WrangleDialogContent, Add a CanvasLayer and try out combinations of nodes and lights. You will notice the lights disregard the CanvasLayer that is te. Add a CanvasLayer and try out combinations of nodes and lights. You will notice the lights disregard the CanvasLayer that is .15 lines"
					wrangleDialogButtonStringArray.clear()
				
				16:
					preloadResourceName = "HeadPortrait_Snake1"
					name = "name, 15 lines and no button"
	#				name = "name, 15 lines and no button, name out side, name out side, name out side, name out side, name out side, name out side, name out side, name out side, name out side, name out side, name out side, name out side, name out side, name out side, name out side, name out side"
					# 15 lines
					contentString = "15 lines, Add a CanvasLayer and try out combinations of nodes and lights. You will notice the lights disregard the CanvasLayer that is te. Add a CanvasLayer and try out combinations of nodes and lights. You will notice the lights disregard the CanvasLayer that is te.WrangleDialogContent, Add a CanvasLayer and try out combinations of nodes and lights. You will notice the lights disregard the CanvasLayer that is te. Add a CanvasLayer and try out combinations of nodes and lights. You will notice the lights disregard the CanvasLayer that is te.WrangleDialogContent, Add a CanvasLayer and try out combinations of nodes and lights. You will notice the lights disregard the CanvasLayer that is te. Add a CanvasLayer and try out combinations of nodes and lights. You will notice the lights disregard the CanvasLayer that is te.WrangleDialogContent, Add a CanvasLayer and try out combinations of nodes and lights. You will notice the lights disregard the CanvasLayer that is te. Add a CanvasLayer and try out combinations of nodes and lights. You will notice the lights disregard the CanvasLayer that is .15 lines"
					# 16 lines
	#				contentString = "15 lines, Add a CanvasLayer and try out combinations of nodes and lights. You will notice the lights disregard the CanvasLayer that is te. Add a CanvasLayer and try out combinations of nodes and lights. You will notice the lights disregard the CanvasLayer that is te.WrangleDialogContent, Add a CanvasLayer and try out combinations of nodes and lights. You will notice the lights disregard the CanvasLayer that is te. Add a CanvasLayer and try out combinations of nodes and lights. You will notice the lights disregard the CanvasLayer that is te.WrangleDialogContent, Add a CanvasLayer and try out combinations of nodes and lights. You will notice the lights disregard the CanvasLayer that is te. Add a CanvasLayer and try out combinations of nodes and lights. You will notice the lights disregard the CanvasLayer that is te.WrangleDialogContent, Add a CanvasLayer and try out combinations of nodes and lights. You will notice the lights disregard the CanvasLayer that is te. Add a CanvasLayer and try out combinations of nodes and lights. You will notice the lights disregard the CanvasLayer that is te.WrangleDialogContent, Add a CanvasLayer and try out combinations of nodes and lights. You will notice the lights disregard the CanvasLayer that is te. Add a CanvasLayer and try out combinations of nodes and lights. You will notice the lights disregard the CanvasLayer that is te. 16 16 16 16 16 "
					wrangleDialogButtonStringArray.append("button1, description")
					wrangleDialogButtonStringArray.append("button2, description description")
					wrangleDialogButtonStringArray.append("button3, description description description")
					wrangleDialogButtonStringArray.append("button4, description description description description")
					wrangleDialogButtonStringArray.append("button5, description description description description description")
					wrangleDialogButtonStringArray.append("button6, description description description description description description")
					wrangleDialogButtonStringArray.append("button7, description description description description description description ...")
			
			UIManager.DownPanel_WrangleDialogSetDataForPicture(preloadResourceName, name, contentString, wrangleDialogButtonStringArray)
		elif 17 >= arg2_TypeNumber:
			var avatarTypeID: int = 1
			contentString = "contentString avatar"
			wrangleDialogButtonStringArray.append("button1")
			UIManager.DownPanel_WrangleDialogSetDataForAvatar(avatarTypeID, contentString, wrangleDialogButtonStringArray)
		elif 18 >= arg2_TypeNumber:
			var goodsTypeID: int = 1
			contentString = "contentString goods"
			wrangleDialogButtonStringArray.append("button1")
			wrangleDialogButtonStringArray.append("button2, description")
			UIManager.DownPanel_WrangleDialogSetDataForGoods(goodsTypeID, contentString, wrangleDialogButtonStringArray)

func DownPanel_SetJournalRecordDebugProcessTimeStep(arg1_TimeStep: String, _arg2: String, _arg3: String, _arg4: String, _arg5: String):
	HQH.Log("DownPanel_SetJournalRecordDebugProcessTimeStep, arg1_TimeStep: %s" % [arg1_TimeStep])
	
	var arg1_TimeStepInt: int = int(arg1_TimeStep)
	
	m_DownPanelDebugData.journalRecordDebugData.journalRecordDebugProcessTimeStep = arg1_TimeStepInt

func DownPanel_Add1JournalRecord(arg1_StringType: String, _arg2: String, _arg3: String, _arg4: String, _arg5: String):
	HQH.Log("DownPanel_Add1JournalRecord, arg1_StringType: %s" % [arg1_StringType])
	
	var arg1_StringTypeInt: int = int(arg1_StringType)
	
	if 6 <= arg1_StringTypeInt:
		UIManager.CurrentActiveAvatar_AddJournalRecord("WE_HAVE_FOUND_THE_TWELVE_GOO")
	else:
		DownPanel_JournalRecord_AddJournalRecord(arg1_StringTypeInt)

func DownPanel_ShowBag(arg1_BagNumber: String, _arg2: String, _arg3: String, _arg4: String, _arg5: String):
	HQH.Log("DownPanel_ShowBag, arg1_BagNumber: %s" % [arg1_BagNumber])
	
	var arg1_BagNumberInt: int = int(arg1_BagNumber)
	
	var currentBagNumber: int = UIManager.DownPanel_GetBagDataLength()
	for i in currentBagNumber:
		var isValidBag: bool = false
		var bagResourceName: String = ""
		var bagNumber: int = 0
		var bagCDStartTimeInMilliseconds: int = 0
		var bagCDLengthTimeInMilliseconds: int = 0
		var goodsTypeID: int = i + 1
		if arg1_BagNumberInt > i:
			isValidBag = true
			
			if 0 == (i % 8):
				bagResourceName = "Skill_SkillWater"
			elif 1 == (i % 8):
				bagResourceName = "Skill_SkillThunder"
			elif 2 == (i % 8):
				bagResourceName = "Skill_SkillFoot"
			elif 3 == (i % 8):
				bagResourceName = "Skill_SkillFire"
			elif 4 == (i % 8):
				bagResourceName = "Skill_SkillShield"
			elif 5 == (i % 8):
				bagResourceName = "Skill_SkillSlow"
			elif 6 == (i % 8):
				bagResourceName = "Skill_SkillLucky"
			else:
				bagResourceName = "Item_ItemMP05"
			
			bagNumber = i
			bagCDStartTimeInMilliseconds = HQH.MilliTime()
			bagCDLengthTimeInMilliseconds = (i + 1) * 1000
		
		UIManager.DownPanel_SetBagDataByIndex(i, isValidBag, bagResourceName, bagNumber, bagCDStartTimeInMilliseconds, bagCDLengthTimeInMilliseconds, goodsTypeID)
	
	UIManager.DownPanel_SetBag()

func DownPanel_Bag_Get(arg1_GoodsTypeID: String, _arg2: String, _arg3: String, _arg4: String, _arg5: String):
	HQH.Log("DownPanel_Bag_Get, arg1_GoodsTypeID: %s" % [arg1_GoodsTypeID])
	
	var arg1_GoodsTypeIDInt: int = int(arg1_GoodsTypeID)
	
	var bagInfo: Dictionary = UIManager.DownPanel_Bag_Get(arg1_GoodsTypeIDInt)
	HQH.Log("arg1_GoodsTypeIDInt: %s, bagInfo.isHas: %s" % [arg1_GoodsTypeIDInt, bagInfo.isHas])
	if bagInfo.isHas:
		HQH.Log("bagInfo.index: %s" % bagInfo.index)
		HQH.Log(bagInfo.bagInfo)

func DownPanel_Bag_Add(arg1_GoodsTypeID: String, arg2_Flag: String, _arg3: String, _arg4: String, _arg5: String):
	HQH.Log("DownPanel_Bag_Add, arg1_GoodsTypeID: %s, arg2_Flag: %s" % [arg1_GoodsTypeID, arg2_Flag])
	
	var arg1_GoodsTypeIDInt: int = int(arg1_GoodsTypeID)
	var arg2_FlagInt: int = int(arg2_Flag)
	
	if 0 < arg2_FlagInt:
		for i in range(TableManager.GOODSTYPEID_WIG_BEGIN, TableManager.GOODSTYPEID_WIG_END + 1):
			UIManager.DownPanel_Bag_Add(i)
		
		return
	
	UIManager.DownPanel_Bag_Add(arg1_GoodsTypeIDInt)

func DownPanel_Bag_Remove(arg1_GoodsTypeID: String, _arg2: String, _arg3: String, _arg4: String, _arg5: String):
	HQH.Log("DownPanel_Bag_Remove, arg1_GoodsTypeID: %s" % [arg1_GoodsTypeID])
	
	var arg1_GoodsTypeIDInt: int = int(arg1_GoodsTypeID)
	UIManager.DownPanel_Bag_Remove(arg1_GoodsTypeIDInt)

func DownPanel_Bag_Update(arg1_GoodsTypeID: String, arg2_BagGoodsData: String, _arg3: String, _arg4: String, _arg5: String):
	HQH.Log("DownPanel_Bag_Update, arg1_GoodsTypeID: %s, arg2_BagGoodsData: %s" % [arg1_GoodsTypeID, arg2_BagGoodsData])
	
	var arg1_GoodsTypeIDInt: int = int(arg1_GoodsTypeID)
	var arg2_BagGoodsDataInt: int = int(arg2_BagGoodsData)
	
	UIManager.DownPanel_Bag_Update(arg1_GoodsTypeIDInt, arg2_BagGoodsDataInt)

func GoodsAddFunction_Bag(_arg1: String, _arg2: String, _arg3: String, _arg4: String, _arg5: String):
	HQH.Log("GoodsAddFunction_Bag")
	
	UIManager.GoodsAddFunction_Bag()

func GoodsAddFunction_JournalRecordBook(_arg1: String, _arg2: String, _arg3: String, _arg4: String, _arg5: String):
	HQH.Log("GoodsAddFunction_JournalRecordBook")
	
	UIManager.GoodsAddFunction_JournalRecordBook()

func DownPanel_JournalRecord_AddJournalRecord(journalRecordDebugStringType: int):
	m_DownPanelDebugData.journalRecordDebugData.journalRecordDebugStringType = journalRecordDebugStringType
	
	var JOURNALRECORDDEBUGSTRINGDEBUGNUMBER_MAX: int = 5
	if (0 >= m_DownPanelDebugData.journalRecordDebugData.journalRecordDebugStringType) or (JOURNALRECORDDEBUGSTRINGDEBUGNUMBER_MAX < m_DownPanelDebugData.journalRecordDebugData.journalRecordDebugStringType):
		m_DownPanelDebugData.journalRecordDebugData.journalRecordDebugStringType = 1
	
	if 1 == m_DownPanelDebugData.journalRecordDebugData.journalRecordDebugStringType:
		# 1 line
		m_DownPanelDebugData.journalRecordDebugData.journalRecordDebugString = "1 line. String content"
	elif 2 == m_DownPanelDebugData.journalRecordDebugData.journalRecordDebugStringType:
		# 2 lines
		m_DownPanelDebugData.journalRecordDebugData.journalRecordDebugString = "2 lines. Add a CanvasLayer and try out combinations of nodes and lights. You will notice the lights disregard the CanvasLayer that is te."
	elif 3 == m_DownPanelDebugData.journalRecordDebugData.journalRecordDebugStringType:
		# 9 lines
		m_DownPanelDebugData.journalRecordDebugData.journalRecordDebugString = "Add a CanvasLayer and try out combinations of nodes and lights. You will notice the lights disregard the CanvasLayer that is te."
		m_DownPanelDebugData.journalRecordDebugData.journalRecordDebugString = m_DownPanelDebugData.journalRecordDebugData.journalRecordDebugString + m_DownPanelDebugData.journalRecordDebugData.journalRecordDebugString
		m_DownPanelDebugData.journalRecordDebugData.journalRecordDebugString = m_DownPanelDebugData.journalRecordDebugData.journalRecordDebugString + m_DownPanelDebugData.journalRecordDebugData.journalRecordDebugString
		m_DownPanelDebugData.journalRecordDebugData.journalRecordDebugString = m_DownPanelDebugData.journalRecordDebugData.journalRecordDebugString + m_DownPanelDebugData.journalRecordDebugData.journalRecordDebugString
		m_DownPanelDebugData.journalRecordDebugData.journalRecordDebugString = "9 lines. " + m_DownPanelDebugData.journalRecordDebugData.journalRecordDebugString
	elif 4 == m_DownPanelDebugData.journalRecordDebugData.journalRecordDebugStringType:
		# 24 lines
		m_DownPanelDebugData.journalRecordDebugData.journalRecordDebugString = TableManager.GetLanguageString("STARTGAMEPANEL_TITLELABEL38GAMETITLE") + TableManager.GetLanguageString("NAME_AVATAR_3")
		for i in 7:
			m_DownPanelDebugData.journalRecordDebugData.journalRecordDebugString = m_DownPanelDebugData.journalRecordDebugData.journalRecordDebugString + m_DownPanelDebugData.journalRecordDebugData.journalRecordDebugString
		
		m_DownPanelDebugData.journalRecordDebugData.journalRecordDebugString = "24 lines. " + m_DownPanelDebugData.journalRecordDebugData.journalRecordDebugString
	else:
		var blueColorString: String = UIManager.RichTextLabel_GetStringWithColor("Blue Color Text", "#0000FF")
		var clickEventString: String = UIManager.RichTextLabel_GetStringWithClickEvent("Click Event 2", UIManager.UI_INPUT_ACTION_EVENT_TYPE.COMMONRICHTEXTLABEL_META_CLICKED_EVENT2_COMMONRICHTEXTLABEL1)
		var underlineString: String = UIManager.RichTextLabel_GetStringWithUnderline("Underline")
		var blueColorAndClickEvent2String: String = UIManager.RichTextLabel_GetStringWithColorAndClickEvent("Blue Color Text and Click Event 2", "#0000FF", UIManager.UI_INPUT_ACTION_EVENT_TYPE.COMMONRICHTEXTLABEL_META_CLICKED_EVENT2_COMMONRICHTEXTLABEL1)
		var blueColorAndUnderlineString: String = UIManager.RichTextLabel_GetStringWithColorAndUnderline("Blue Color Text and Underline", "#0000FF")
		
		m_DownPanelDebugData.journalRecordDebugData.journalRecordDebugString = blueColorString + " " + clickEventString + " " + underlineString + " " + blueColorAndClickEvent2String + " " + blueColorAndUnderlineString
	
	UIManager.DownPanel_AddJournalRecord("[%s]%s" % [m_DownPanelDebugData.journalRecordDebugData.journalRecordDebugStringCount, m_DownPanelDebugData.journalRecordDebugData.journalRecordDebugString])
	m_DownPanelDebugData.journalRecordDebugData.journalRecordDebugStringCount = m_DownPanelDebugData.journalRecordDebugData.journalRecordDebugStringCount + 1

func DownPanel_processDebug(_delta: float):
	if UIManager.DownPanel_IsVisible():
		DownPanel_JournalRecord_processDebug(_delta)

func DownPanel_JournalRecord_processDebug(_delta: float):
	if 0 < m_DownPanelDebugData.journalRecordDebugData.journalRecordDebugProcessTimeStep:
		m_DownPanelDebugData.journalRecordDebugData.journalRecordDebugProcessTime = m_DownPanelDebugData.journalRecordDebugData.journalRecordDebugProcessTime + _delta
		if m_DownPanelDebugData.journalRecordDebugData.journalRecordDebugProcessTimeStep < m_DownPanelDebugData.journalRecordDebugData.journalRecordDebugProcessTime:
			m_DownPanelDebugData.journalRecordDebugData.journalRecordDebugProcessTime = 0.0
			
			DownPanel_JournalRecord_AddJournalRecord(m_DownPanelDebugData.journalRecordDebugData.journalRecordDebugStringType + 1)
			var fps: float = Engine.get_frames_per_second()
			if HQH.VIEW_PROCESS_FRAME_NUMBER > fps:
				HQH.Log("fps: %s, m_DownPanelDebugData.journalRecordDebugData.journalRecordDebugStringCount: %s, m_DownPanelDebugData.journalRecordDebugData.journalRecordDebugString Length: %s" % [fps, m_DownPanelDebugData.journalRecordDebugData.journalRecordDebugStringCount, m_DownPanelDebugData.journalRecordDebugData.journalRecordDebugString.length()])

func TeamPanel_ShowItem(arg1_ItemNumber: String, _arg2: String, _arg3: String, _arg4: String, _arg5: String):
	HQH.Log("TeamPanel_ShowItem, arg1_ItemNumber: %s" % [arg1_ItemNumber])
	
	var arg1_ItemNumberInt: int = int(arg1_ItemNumber)
	
	var currentItemNumber: int = UIManager.TeamPanel_GetItemDataLength()
	for i in currentItemNumber:
		var isValidItem: bool = false
		var itemResourceName: String = ""
		var itemNumber: int = 0
		var itemCDStartTimeInMilliseconds: int = 0
		var itemCDLengthTimeInMilliseconds: int = 0
		var typeID: int = 0
		if arg1_ItemNumberInt > i:
			isValidItem = true
			
			if 0 == i:
				itemResourceName = "Item_ItemHP1"
			elif 1 == i:
				itemResourceName = "Item_ItemHP2"
			elif 2 == i:
				itemResourceName = "Item_ItemMP1"
			elif 3 == i:
				itemResourceName = "Item_ItemMP2"
			elif 4 == i:
				itemResourceName = "Item_ItemEP1"
			elif 5 == i:
				itemResourceName = "Item_ItemHP1"
			elif 6 == i:
				itemResourceName = "Item_ItemHP2"
			elif 7 == i:
				itemResourceName = "Item_ItemMP1"
			elif 8 == i:
				itemResourceName = "Item_ItemMP2"
			elif 9 == i:
				itemResourceName = "Item_ItemEP1"
			
			itemNumber = i * 10
			itemCDStartTimeInMilliseconds = HQH.MilliTime()
			itemCDLengthTimeInMilliseconds = (i + 1) * 1000
		
		UIManager.TeamPanel_SetItemDataByIndex(i, isValidItem, itemResourceName, itemNumber, itemCDStartTimeInMilliseconds, itemCDLengthTimeInMilliseconds, typeID)
	
	UIManager.TeamPanel_SetItem()

func DayNightPanel_SetCommonLabelDaysNumber(arg1_DaysNumber: String, _arg2: String, _arg3: String, _arg4: String, _arg5: String):
	HQH.Log("DayNightPanel_SetCommonLabelDaysNumber, arg1_DaysNumber: %s" % [arg1_DaysNumber])
	
	var arg1_DaysNumberInt: int = int(arg1_DaysNumber)
	UIManager.DayNightPanel_SetCommonLabelDaysNumber(arg1_DaysNumberInt)

func DayNightPanel_SetData(arg1_IsCurrentDayTime: String, arg2_DaytimeDurationTimeInSeconds: String, arg3_NightDurationTimeInSeconds: String, _arg4: String, _arg5: String):
	HQH.Log("DayNightPanel_SetData, arg1_IsCurrentDayTime: %s, arg2_DaytimeDurationTimeInSeconds: %s, arg3_NightDurationTimeInSeconds: %s" % [arg1_IsCurrentDayTime, arg2_DaytimeDurationTimeInSeconds, arg3_NightDurationTimeInSeconds])
	
	var arg1_IsCurrentDayTimeInt: int = int(arg1_IsCurrentDayTime)
	var arg2_DaytimeDurationTimeInSecondsInt: int = int(arg2_DaytimeDurationTimeInSeconds)
	var arg3_NightDurationTimeInSecondsInt: int = int(arg3_NightDurationTimeInSeconds)
	if 0 < arg1_IsCurrentDayTimeInt:
		UIManager.DayNightPanel_SetData_Daytime(arg2_DaytimeDurationTimeInSecondsInt)
	else:
		UIManager.DayNightPanel_SetData_Night(arg3_NightDurationTimeInSecondsInt)

func AddAvatarFromScene(arg1_AvatarTypeID: String, _arg2: String, _arg3: String, _arg4: String, _arg5: String):
	HQH.Log("AddAvatarFromScene, arg1_AvatarTypeID: %s" % [arg1_AvatarTypeID])
	
	var arg1_AvatarTypeIDInt: int = int(arg1_AvatarTypeID)
	AvatarManager.AddAvatarFromScene(arg1_AvatarTypeIDInt)

func RemoveAvatarFromScene(arg1_AvatarTypeID: String, _arg2: String, _arg3: String, _arg4: String, _arg5: String):
	HQH.Log("RemoveAvatarFromScene, arg1_AvatarTypeID: %s" % [arg1_AvatarTypeID])
	
	var arg1_AvatarTypeIDInt: int = int(arg1_AvatarTypeID)
	AvatarManager.RemoveAvatarFromScene(arg1_AvatarTypeIDInt)

func AddAvatar(arg1_AvatarTypeID: String, _arg2: String, _arg3: String, _arg4: String, _arg5: String):
	HQH.Log("AddAvatar, arg1_AvatarTypeID: %s" % [arg1_AvatarTypeID])
	HQH.Log("AddAvatar, need to restart the game or change scene, will see new add avatar.")
	
	var arg1_AvatarTypeIDInt: int = int(arg1_AvatarTypeID)
	var avatarSceneTypeID: int = 0
	var avatarPositionX: float = 0.0
	var avatarPositionY: float = 0.0
	var equipTypeID: int = 0
	SaveGameManager.AddSaveGameData_Archive_AvatarList(arg1_AvatarTypeIDInt, avatarSceneTypeID, avatarPositionX, avatarPositionY, equipTypeID)

func God(_arg1: String, _arg2: String, _arg3: String, _arg4: String, _arg5: String):
	HQH.Log("God")
	HQH.Log("God, need to restart the game or change scene, will see new add avatars and items.")
	
	var avatarSceneTypeID: int = TableManager.SCENETYPEID_1_HOME
	var teamLeaderAvatarInfo: Dictionary = SaveGameManager.GetSaveGameData_Archive_AvatarList_TeamLeaderAvatarInfo()
	if not teamLeaderAvatarInfo.empty():
		avatarSceneTypeID = teamLeaderAvatarInfo.avatarSceneTypeID
	
	SaveGameManager.AddSaveGameData_Archive_AvatarList(TableManager.AVATARTYPEID_SNAKE1, avatarSceneTypeID, 0.0, 0.0, 0)
	SaveGameManager.AddSaveGameData_Archive_AvatarList(TableManager.AVATARTYPEID_DOG1, avatarSceneTypeID, 0.0, 0.0, 0)
	SaveGameManager.AddSaveGameData_Archive_AvatarList(TableManager.AVATARTYPEID_PLAYER1, avatarSceneTypeID, 0.0, 0.0, 0)
	SaveGameManager.AddSaveGameData_Archive_AvatarList(TableManager.AVATARTYPEID_SILVERCARP1, avatarSceneTypeID, 0.0, 0.0, 0)
	SaveGameManager.AddSaveGameData_Archive_AvatarList(TableManager.AVATARTYPEID_SNAKE2, avatarSceneTypeID, 0.0, 0.0, 0)
	SaveGameManager.AddSaveGameData_Archive_AvatarList(TableManager.AVATARTYPEID_SNAKE3, avatarSceneTypeID, 0.0, 0.0, 0)
	SaveGameManager.AddSaveGameData_Archive_AvatarList(TableManager.AVATARTYPEID_TURTLE1, avatarSceneTypeID, 0.0, 0.0, 0)
	SaveGameManager.AddSaveGameData_Archive_AvatarList(TableManager.AVATARTYPEID_DONKEY1, avatarSceneTypeID, 0.0, 0.0, 0)
#	SaveGameManager.AddSaveGameData_Archive_AvatarList(TableManager.AVATARTYPEID_MONSTER11, avatarSceneTypeID, 0.0, 0.0, 0)
#	SaveGameManager.AddSaveGameData_Archive_AvatarList(TableManager.AVATARTYPEID_MONSTER12, avatarSceneTypeID, 0.0, 0.0, 0)
#	SaveGameManager.AddSaveGameData_Archive_AvatarList(TableManager.AVATARTYPEID_QIUYU1, avatarSceneTypeID, 0.0, 0.0, 0)
	
	UIManager.GoodsAddFunction_Bag()
	UIManager.GoodsAddFunction_JournalRecordBook()
	UIManager.DownPanel_Bag_Add(TableManager.GOODSTYPEID_FOOT)
	UIManager.DownPanel_Bag_Add(TableManager.GOODSTYPEID_TELESCOPE)
	SaveGameManager.AddSaveGameData_Archive_GoodsUsedList(TableManager.GOODSTYPEID_TELESCOPE, HQH.VISUAL_FIELD_DISTANCE_MAX, HQH.VISUAL_FIELD_SHARP_TYPE.EGG)
	SaveGameManager.UpdateSaveGameData_Archive_GoodsUsedList(TableManager.GOODSTYPEID_TELESCOPE, HQH.VISUAL_FIELD_DISTANCE_MAX, HQH.VISUAL_FIELD_SHARP_TYPE.EGG)
	UIManager.DownPanel_Bag_Add(TableManager.GOODSTYPEID_HOUSEKEEPERKEY)
	UIManager.DownPanel_Bag_Add(TableManager.GOODSTYPEID_BUTLERKEY)
	UIManager.DownPanel_Bag_Add(TableManager.GOODSTYPEID_QUEENKEY)

func PlayChessCalculateSuccessRate(arg1_MeMin: String, arg2_MeMax: String, arg3_OpMin: String, arg4_OpMax: String, _arg5: String):
	HQH.Log("PlayChessCalculateSuccessRate, arg1_MeMin: %s, arg2_MeMax: %s, arg3_OpMin: %s, arg4_OpMax: %s" % [arg1_MeMin, arg2_MeMax, arg3_OpMin, arg4_OpMax])
	
	var arg1_MeMinInt: int = int(arg1_MeMin)
	var arg2_MeMaxInt: int = int(arg2_MeMax)
	var arg3_OpMinInt: int = int(arg3_OpMin)
	var arg4_OpMaxInt: int = int(arg4_OpMax)
	
	var successRate: Dictionary = UIManager.PlayChessCalculateSuccessRate(arg1_MeMinInt, arg2_MeMaxInt, arg3_OpMinInt, arg4_OpMaxInt)
	if (0 == successRate.successRateIntNumerator) and (0 == successRate.successRateIntDenominator):
		HQH.Log("successRateFloat: 0.0, me is too low")
	else:
		var successRateFloat: float = float(successRate.successRateIntNumerator) / float(successRate.successRateIntDenominator)
		var successRateFloat100: float = successRateFloat * 100.0
		HQH.Log("successRateFloat: %s (%s%%), successRateFractions: %s / %s." % [successRateFloat, successRateFloat100, successRate.successRateIntNumerator, successRate.successRateIntDenominator])
	
	var successRateByLoop: Dictionary = UIManager.PlayChessCalculateSuccessRateByLoop(arg1_MeMinInt, arg2_MeMaxInt, arg3_OpMinInt, arg4_OpMaxInt)
	if (0 == successRateByLoop.successRateIntNumerator) and (0 == successRateByLoop.successRateIntDenominator):
		HQH.Log("successRateFloatByLoop: 0.0, me is too low")
	else:
		var successRateFloatByLoop: float = float(successRateByLoop.successRateIntNumerator) / float(successRateByLoop.successRateIntDenominator)
		var successRateFloat100ByLoop: float = successRateFloatByLoop * 100.0
		HQH.Log("successRateFloatByLoop: %s (%s%%), successRateFractionsByLoop: %s / %s." % [successRateFloatByLoop, successRateFloat100ByLoop, successRateByLoop.successRateIntNumerator, successRateByLoop.successRateIntDenominator])
	
	if not ((successRate.successRateIntNumerator == successRateByLoop.successRateIntNumerator) and (successRate.successRateIntDenominator == successRateByLoop.successRateIntDenominator)):
		HQH.AssertLog("PlayChessCalculateSuccessRate, not ((successRate.successRateIntNumerator: %s == successRateByLoop.successRateIntNumerator: %s) and (successRate.successRateIntDenominator: %s == successRateByLoop.successRateIntDenominator: %s))" % [successRate.successRateIntNumerator, successRateByLoop.successRateIntNumerator, successRate.successRateIntDenominator, successRateByLoop.successRateIntDenominator])

func SetAllAvatarToCurrentActiveAvatarPosition(_arg1: String, _arg2: String, _arg3: String, _arg4: String, _arg5: String):
	HQH.Log("SetAllAvatarToCurrentActiveAvatarPosition")
	
	AvatarManager.SetAllAvatarToCurrentActiveAvatarPosition()

func GetAvatarPositionDebugData() -> Dictionary:
	return m_AvatarPositionDebugData

func SetAvatarPositionDebugData(arg1_sceneTypeID: String, arg2_avatarPositionX: String, arg3_avatarPositionY: String, _arg4: String, _arg5: String):
	HQH.Log("SetAvatarPositionDebugData, arg1_sceneTypeID: %s, arg2_avatarPositionX: %s, arg3_avatarPositionY: %s" % [arg1_sceneTypeID, arg2_avatarPositionX, arg3_avatarPositionY])
	
	var arg1_sceneTypeIDInt: int = int(arg1_sceneTypeID)
	var arg2_avatarPositionXInt: int = int(arg2_avatarPositionX)
	var arg3_avatarPositionYInt: int = int(arg3_avatarPositionY)
	
	m_AvatarPositionDebugData.sceneTypeID = arg1_sceneTypeIDInt
	m_AvatarPositionDebugData.avatarPosition.x = arg2_avatarPositionXInt
	m_AvatarPositionDebugData.avatarPosition.y = arg3_avatarPositionYInt

func SwallowDebug(arg1_IsSave: String, _arg2: String, _arg3: String, _arg4: String, _arg5: String):
	HQH.Log("SwallowDebug, arg1_IsSave: %s" % arg1_IsSave)
	
	var arg1_IsSaveInt: int = int(arg1_IsSave)
	
	var swallowBegin: int = TableManager.WRANGLEDIALOGTYPEID_SWALLOW_BEGIN
	var swallowLength: int = TableManager.WRANGLEDIALOGTYPEID_SWALLOW_END - TableManager.WRANGLEDIALOGTYPEID_SWALLOW_BEGIN + 1
	
	match arg1_IsSaveInt:
		1:
			for i in swallowLength:
				var initWrangleDialogTypeID: int = i + swallowBegin
				UIManager.SaveTask(initWrangleDialogTypeID, initWrangleDialogTypeID)
		
		2:
			for i in swallowLength:
				var initWrangleDialogTypeID: int = TableManager.WRANGLEDIALOGTYPEID_SWALLOW_END - i
				UIManager.SaveTask(initWrangleDialogTypeID, initWrangleDialogTypeID)
		
		3:
			UIManager.SaveTask(TableManager.WRANGLEDIALOGTYPEID_SWALLOW_PLAYER1, TableManager.WRANGLEDIALOGTYPEID_SWALLOW_PLAYER1)
			UIManager.SaveTask(TableManager.WRANGLEDIALOGTYPEID_SWALLOW_DOG1, TableManager.WRANGLEDIALOGTYPEID_SWALLOW_DOG1)
			UIManager.SaveTask(TableManager.WRANGLEDIALOGTYPEID_SWALLOW_SNAKE1, TableManager.WRANGLEDIALOGTYPEID_SWALLOW_SNAKE1)
		
		4:
			SaveGameManager.AddSaveGameData_Archive_TaskList_Swallow(TableManager.AVATARTYPEID_SNAKE3)
			SaveGameManager.AddSaveGameData_Archive_TaskList_Swallow(TableManager.AVATARTYPEID_SNAKE2)
			SaveGameManager.AddSaveGameData_Archive_TaskList_Swallow(TableManager.AVATARTYPEID_SNAKE1)
			SaveGameManager.AddSaveGameData_Archive_TaskList_Swallow(TableManager.AVATARTYPEID_DOG1)
			SaveGameManager.AddSaveGameData_Archive_TaskList_Swallow(TableManager.AVATARTYPEID_PLAYER1)
		
		5:
			SaveGameManager.InvalidSaveGameData_Archive_TaskList_SwallowLastAvatarTypeID()
	
	var lastAvatarTypeID: int = SaveGameManager.GetSaveGameData_Archive_TaskList_SwallowLastAvatarTypeID()
	HQH.Log("lastAvatarTypeID: %s" % lastAvatarTypeID)
	
	if true:
		var swallowInfoList: Array = SaveGameManager.GetSaveGameData_Archive_TaskList_Swallow()
		if swallowInfoList.empty():
			HQH.Log("swallowInfoList.empty()")
		else:
			HQH.Log("swallowInfoList.size: %s" % swallowInfoList.size())
			HQH.Log("swallowInfoList: %s" % JSON.print(swallowInfoList))
	
	if false:
		for i in swallowLength:
			var resultTaskInfo: Dictionary = SaveGameManager.GetSaveGameData_Archive_TaskList_TaskInfoByWrangleDialogTypeID(i + swallowBegin)
			HQH.Log("[%s]%s" % [i, resultTaskInfo])

func StartSwallowAction(arg1_NightDurationTimeInSeconds: String, _arg2: String, _arg3: String, _arg4: String, _arg5: String):
	HQH.Log("StartSwallowAction, arg1_NightDurationTimeInSeconds: %s" % arg1_NightDurationTimeInSeconds)
	
	var arg1_NightDurationTimeInSecondsInt: int = int(arg1_NightDurationTimeInSeconds)
	
	UIManager.StartSwallowAction(arg1_NightDurationTimeInSecondsInt, TableManager.AVATARTYPEID_MONSTER1)

func Debug_PlayChessSuccessFunction_Avatar_27(_arg1: String, _arg2: String, _arg3: String, _arg4: String, _arg5: String):
	HQH.Log("Debug_PlayChessSuccessFunction_Avatar_27")
	
	UIManager.PlayChessSuccessFunction_Avatar_27(0, 0)

func GetPlayChessDebugData() -> Dictionary:
	return m_PlayChessDebugData

func SetPlayChessSuccessOrFailure(arg1_IsDebugResult: String, arg2_IsSuccess: String, _arg3: String, _arg4: String, _arg5: String):
	HQH.Log("SetPlayChessSuccessOrFailure, arg1_IsDebugResult: %s, arg2_IsSuccess: %s" % [arg1_IsDebugResult, arg2_IsSuccess])
	
	var arg1_IsDebugResultInt: int = int(arg1_IsDebugResult)
	var arg2_IsSuccessInt: int = int(arg2_IsSuccess)
	
	if 0 < arg1_IsDebugResultInt:
		m_PlayChessDebugData.isDebugResult = true
	else:
		m_PlayChessDebugData.isDebugResult = false
	
	if 0 < arg2_IsSuccessInt:
		m_PlayChessDebugData.isSuccess = true
	else:
		m_PlayChessDebugData.isSuccess = false
