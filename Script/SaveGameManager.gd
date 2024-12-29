extends Node

# 在电脑上，存储位置为：C:\Users\XiaoBao5\AppData\Roaming\HQH3Data\SaveGame.json
const SAVE_GAME_FILE_NAME: String = "user://SaveGame.json"
const IS_USE_SAVE_GAME_PASS_WORD: bool = true # true # cpdebug
const SAVE_GAME_PASS_WORD: String = "@BaoZhi@"
const SAVE_GAME_ARCHIVE_NUMBWE_MAX: int = 4
const SAVE_GAME_ARCHIVE_FILE_NAME: String = "user://SaveGameArchive%s.json"

# Sample Data
#var m_SaveGameData: Dictionary = {
#	"stringValue": "string 1",
#	"intValue": 1,
#
#	"dictionaryValue": {
#		"key1": "string 2",
#		"key2": 2,
#	},
#
#	"listValue": [
#		"string 3",
#		3,
#		"string 4",
#		4,
#	],
#
#	"listDictionaryValue": [
#		{"key3": "string 5", "key4": 5},
#		{"key3": "string 6", "key4": 6},
#	],
#}
var m_SaveGameData: Dictionary = {
	"gameName": HQH.PROJECT_NAME,
	"versionRelease": HQH.PROJECT_VERSION_RELEASE,
	"versionBeta": HQH.PROJECT_VERSION_BETA,
	"versionAlpha": HQH.PROJECT_VERSION_ALPHA,
	
	"firstSaveGameDataDateTime": "2022-11-22 11:22:33",
	"lastSaveGameDataDateTime": "2022-11-22 11:22:33",
	
	"option": {
		"videoResolutionRatioID": HQH.VIDEO_RESOLUTION_RATIO_ID_DEFAULT, # OPTION_PANEL_DATA_TABLE_INFO.videoResolutionRatioList.videoResolutionRatioID
		"windowIsFullScreen": HQH.WINDOW_IS_FULL_SCREEN_DEFAULT, # true # cpdebug
		"windowIsWindowStretch": HQH.WINDOW_IS_WINDOW_STRETCH_DEFAULT,
		"musicIsMute": HQH.MUSIC_IS_MUTE_DEFAULT, # false
		"musicValue": HQH.MUSIC_VALUE_DEFAULT,
		"soundEffectIsMute": HQH.SOUND_EFFECT_IS_MUTE_DEFAULT,
		"soundEffectValue": HQH.SOUND_EFFECT_VALUE_DEFAULT,
		"languageName": HQH.LANGUAGE_NAME_DEFAULT,
	},
	
	"archive":{
		"currentUsedIndex": -1, # rang in [0, SAVE_GAME_ARCHIVE_NUMBWE_MAX), -1 is None.
	}
}

var m_IsFirstTimeSaveGameData: bool = false
var m_IsDirty_NeedSaveGame: bool = false
var m_IsDirty_NeedSaveGameArchive: bool = false

enum SAVEGAMEDATA_ARCHIVE_LISTDATATYPE {
	SAVEGAMEDATA_ARCHIVE_LISTDATATYPE_AVATAR,
	SAVEGAMEDATA_ARCHIVE_LISTDATATYPE_GOODSUSED,
	SAVEGAMEDATA_ARCHIVE_LISTDATATYPE_BAG,
	SAVEGAMEDATA_ARCHIVE_LISTDATATYPE_SCENE,
	SAVEGAMEDATA_ARCHIVE_LISTDATATYPE_TASK,
}
const SAVEGAMEDATA_ARCHIVE_AVATAR: Dictionary = {
	"avatarTypeID": 0,
	"avatarSceneTypeID": 0,
	"avatarPositionX": 0.0,
	"avatarPositionY": 0.0,
	"equipTypeID": 0,
}
const SAVEGAMEDATA_ARCHIVE_GOODSUSED: Dictionary = {
	"goodsTypeID": 0,
	"goodsData1": 0,
	"goodsData2": 0,
}
const SAVEGAMEDATA_ARCHIVE_BAG: Dictionary = {
	"bagGoodsTypeID": 0,
	"bagGoodsData": 0,
}
const SAVEGAMEDATA_ARCHIVE_SCENE_WARFOGCELL: Dictionary = {
	"cellX": 0,
	"cellY": 0,
}
const SAVEGAMEDATA_ARCHIVE_SCENE: Dictionary = {
	"sceneTypeID": 0,
	"sceneDataWarFogCellsList": [], # list of SAVEGAMEDATA_ARCHIVE_SCENE_WARFOGCELL
}
const SAVEGAMEDATA_ARCHIVE_TASK: Dictionary = {
	"wrangleDialogTypeID": 0,
	"lastChoiceWrangleDialogTypeID": 0,
}
const SAVEGAMEDATA_ARCHIVE: Dictionary = {
	"isEmptyArchive": true, # true: empty archive, never enter the game. false: had entered the game.
	"firstSaveGameDataArchiveDateTime": "2022-11-23 11:22:33",
	"lastSaveGameDataArchiveDateTime": "2022-11-23 11:22:33",
	
	# AvatarAttribute
	"avatarAttribute": {
		"visualFieldDistance": HQH.VISUAL_FIELD_DISTANCE_MIN,
		"visualFieldSharpType": HQH.VISUAL_FIELD_SHARP_TYPE.RHOMBUS,
	},
	
	# Info
	"info": {
		"initAvatarTypeID": 0,
	},
	
	# Avatar
	"saveGameData_Archive_AvatarList": [], # list of SAVEGAMEDATA_ARCHIVE_AVATAR
	
	# GoodsUsed
	"saveGameData_Archive_GoodsUsedList": [], # list of SAVEGAMEDATA_ARCHIVE_GOODSUSED
	
	# Bag
	"saveGameData_Archive_BagList": [], # list of SAVEGAMEDATA_ARCHIVE_BAG
	
	# Scene
	"saveGameData_Archive_SceneList": [], # list of SAVEGAMEDATA_ARCHIVE_SCENE
	
	# Task
	"saveGameData_Archive_TaskList": [], # list of SAVEGAMEDATA_ARCHIVE_TASK
}
var m_SaveGameData_ArchiveList: Array = [] # list of SAVEGAMEDATA_ARCHIVE

const SWALLOW_ARCHIVE_AVATARLIST_SIZE_MIN: int = 2
const SWALLOW_INFO: Dictionary = {
	"index": 0,
	"wrangleDialogTypeID_Swallow": 0,
}

func _ready():
	LoadGame()
	
	for i in SAVE_GAME_ARCHIVE_NUMBWE_MAX: 
		m_SaveGameData_ArchiveList.append(SAVEGAMEDATA_ARCHIVE.duplicate(true))
	
	LoadGameArchiveList()

func _process(_delta: float):
	if m_IsDirty_NeedSaveGame:
		m_IsDirty_NeedSaveGame = false
		
		SaveGame()
	
	if m_IsDirty_NeedSaveGameArchive:
		m_IsDirty_NeedSaveGameArchive = false
		
		SaveGameArchive()

func SaveGameBase(filePath: String, saveGameData: Dictionary):
	var fileHandle = File.new()
	var openFileResult: int = FAILED
	if IS_USE_SAVE_GAME_PASS_WORD:
		openFileResult = fileHandle.open_encrypted_with_pass(filePath, File.WRITE, SAVE_GAME_PASS_WORD)
	else:
		openFileResult = fileHandle.open(filePath, File.WRITE)
	
	if OK != openFileResult:
		HQH.AssertLog("SaveGameBase, FAILED OPEN FILE: %s " % filePath)
		
		fileHandle.close()
		
		return
	
	fileHandle.store_string(to_json(saveGameData))
	fileHandle.close()

func LoadGameBase(filePath: String) -> Dictionary:
	var fileHandle = File.new()
	var openFileResult: int = FAILED
	if IS_USE_SAVE_GAME_PASS_WORD:
		openFileResult = fileHandle.open_encrypted_with_pass(filePath, File.READ, SAVE_GAME_PASS_WORD)
	else:
		openFileResult = fileHandle.open(filePath, File.READ)
	
	if OK != openFileResult:
		HQH.AssertLog("LoadGameBase, FAILED OPEN FILE: %s " % filePath)
		
		fileHandle.close()
		
		return {}
	
	var parseJsonData = parse_json(fileHandle.get_as_text())
	fileHandle.close()
	if TYPE_DICTIONARY != typeof(parseJsonData):
		HQH.AssertLog("LoadGameBase, CORRUPTED FILE DATA!")
		
		return {}
	
	return parseJsonData

func SaveGame():
	SetSaveData_lastSaveGameDataDateTime()
	SaveGameBase(SAVE_GAME_FILE_NAME, m_SaveGameData)

func LoadGame():
	var filePath: String = SAVE_GAME_FILE_NAME
	var fileHandle = File.new()
	if not fileHandle.file_exists(filePath):
		HQH.Log("LoadGame, NOT EXIST FILE: %s " % filePath)
		
		SetIsFirstTimeSaveGameData_true()
		
		SaveGame()
		
		return
	
	var saveGameData: Dictionary = LoadGameBase(filePath)
	if not saveGameData.empty():
		m_SaveGameData = saveGameData

func PrintSaveGameData():
	HQH.Log(JSON.print(m_SaveGameData, "\t"))

func GetSaveData_firstSaveGameDataDateTime() -> String:
	return m_SaveGameData.firstSaveGameDataDateTime

func SetSaveData_firstSaveGameDataDateTime():
	m_SaveGameData.firstSaveGameDataDateTime = HQH.GetDateTimeString()

func GetSaveData_lastSaveGameDataDateTime() -> String:
	return m_SaveGameData.lastSaveGameDataDateTime

func SetSaveData_lastSaveGameDataDateTime():
	m_SaveGameData.lastSaveGameDataDateTime = HQH.GetDateTimeString()

func GetSaveData_option_videoResolutionRatioID() -> int:
	return m_SaveGameData.option.videoResolutionRatioID

func SetSaveData_option_videoResolutionRatioID(videoResolutionRatioID: int):
	if videoResolutionRatioID != m_SaveGameData.option.videoResolutionRatioID:
		m_SaveGameData.option.videoResolutionRatioID = videoResolutionRatioID
		
		SetNeedSaveGame()

func GetSaveData_option_windowIsFullScreen() -> bool:
	return m_SaveGameData.option.windowIsFullScreen

func SetSaveData_option_windowIsFullScreen(windowIsFullScreen: bool):
	if windowIsFullScreen != m_SaveGameData.option.windowIsFullScreen:
		m_SaveGameData.option.windowIsFullScreen = windowIsFullScreen
		
		SetNeedSaveGame()

func GetSaveData_option_windowIsWindowStretch() -> bool:
	return m_SaveGameData.option.windowIsWindowStretch

func SetSaveData_option_windowIsWindowStretch(windowIsWindowStretch: bool):
	if windowIsWindowStretch != m_SaveGameData.option.windowIsWindowStretch:
		m_SaveGameData.option.windowIsWindowStretch = windowIsWindowStretch
		
		SetNeedSaveGame()

func GetSaveData_option_musicIsMute() -> bool:
	return m_SaveGameData.option.musicIsMute

func SetSaveData_option_musicIsMute(musicIsMute: bool):
	m_SaveGameData.option.musicIsMute = musicIsMute
	
	SetNeedSaveGame()

func GetSaveData_option_musicValue() -> int:
	return m_SaveGameData.option.musicValue

func SetSaveData_option_musicValue(musicValue: int):
	m_SaveGameData.option.musicValue = musicValue
	
	SetNeedSaveGame()

func GetSaveData_option_soundEffectIsMute() -> bool:
	return m_SaveGameData.option.soundEffectIsMute

func SetSaveData_option_soundEffectIsMute(soundEffectIsMute: bool):
	m_SaveGameData.option.soundEffectIsMute = soundEffectIsMute
	
	SetNeedSaveGame()

func GetSaveData_option_soundEffectValue() -> int:
	return m_SaveGameData.option.soundEffectValue

func SetSaveData_option_soundEffectValue(soundEffectValue: int):
	m_SaveGameData.option.soundEffectValue = soundEffectValue
	
	SetNeedSaveGame()

func GetSaveData_option_languageName() -> String:
	return m_SaveGameData.option.languageName

func SetSaveData_option_languageName(languageName: String):
	m_SaveGameData.option.languageName = languageName
	
	SetNeedSaveGame()

func GetSaveData_archive_currentUsedIndex() -> int:
	return m_SaveGameData.archive.currentUsedIndex

func SetNeedSaveGame():
	m_IsDirty_NeedSaveGame = true
	
func SetNeedSaveGameArchive():
	m_IsDirty_NeedSaveGameArchive = true

func GetIsFirstTimeSaveGameData() -> bool:
	return m_IsFirstTimeSaveGameData

func SetIsFirstTimeSaveGameData_true():
	m_IsFirstTimeSaveGameData = true
	
	SetSaveData_firstSaveGameDataDateTime()

func SetIsFirstTimeSaveGameData_false():
	m_IsFirstTimeSaveGameData = false

func GetCurrentUsedSaveGameArchiveFileName(index: int) -> String:
	return SAVE_GAME_ARCHIVE_FILE_NAME % index

func ResetArchive(index: int):
	if (0 <= index) and (SAVE_GAME_ARCHIVE_NUMBWE_MAX > index):
		m_SaveGameData_ArchiveList[index] = SAVEGAMEDATA_ARCHIVE.duplicate(true)
		
		m_SaveGameData_ArchiveList[index].firstSaveGameDataArchiveDateTime = HQH.GetDateTimeString()
		
		m_SaveGameData_ArchiveList[index].avatarAttribute.visualFieldDistance = HQH.RandomModRange(HQH.VISUAL_FIELD_DISTANCE_MIN, HQH.VISUAL_FIELD_DISTANCE_MIN * 2)
		if 0 == HQH.RandomD2():
			m_SaveGameData_ArchiveList[index].avatarAttribute.visualFieldSharpType = HQH.VISUAL_FIELD_SHARP_TYPE.RHOMBUS
		else:
			m_SaveGameData_ArchiveList[index].avatarAttribute.visualFieldSharpType = HQH.VISUAL_FIELD_SHARP_TYPE.EGG
		
		m_SaveGameData_ArchiveList[index].info.initAvatarTypeID = 0

func LoadGameArchiveList():
	for i in SAVE_GAME_ARCHIVE_NUMBWE_MAX: 
		var filePath: String = GetCurrentUsedSaveGameArchiveFileName(i)
		var fileHandle = File.new()
		if not fileHandle.file_exists(filePath):
			HQH.Log("LoadGameArchiveList, NOT EXIST FILE: %s " % filePath)
			
			ResetArchive(i)
			
			SaveGameArchiveBase(i)
			
			continue
		
		var saveGameData: Dictionary = LoadGameBase(filePath)
		if not saveGameData.empty():
			m_SaveGameData_ArchiveList[i] = saveGameData

func SaveGameArchiveBase(index: int):
	if 0 > index:
		HQH.AssertLog("SaveGameArchiveBase, 0 > index: %s" % index)
		
		return
	
	m_SaveGameData_ArchiveList[index].lastSaveGameDataArchiveDateTime = HQH.GetDateTimeString()
	var filePath: String = GetCurrentUsedSaveGameArchiveFileName(index)
	SaveGameBase(filePath, m_SaveGameData_ArchiveList[index])

func SaveGameArchive():
	if 0 > m_SaveGameData.archive.currentUsedIndex:
		HQH.AssertLog("SaveGameArchive, 0 > m_SaveGameData.archive.currentUsedIndex: %s" % m_SaveGameData.archive.currentUsedIndex)
		
		return
	
	SaveGameArchiveBase(m_SaveGameData.archive.currentUsedIndex)

func ClearSaveGameArchive(index: int):
	if (0 <= index) and (SAVE_GAME_ARCHIVE_NUMBWE_MAX > index):
		if not m_SaveGameData_ArchiveList[index].isEmptyArchive:
			ResetArchive(index)
			
#			if m_SaveGameData.archive.currentUsedIndex == index:
#				# Find next valid archive index
#				var nextValidArchiveIndex: int = -1
#				for i in SAVE_GAME_ARCHIVE_NUMBWE_MAX:
#					if not m_SaveGameData_ArchiveList[i].isEmptyArchive:
#						nextValidArchiveIndex = i
#
#						break
#
#				if 0 <= nextValidArchiveIndex:
#					SetSaveData_archive_currentUsedIndex(nextValidArchiveIndex)
#				else:
#					# Invalid index
#					SetSaveData_archive_currentUsedIndex_Invalid()
			
			SaveGameArchiveBase(index)
		else:
			HQH.Log("ClearSaveGameArchive, archive index: %s is already empty" % [index])
	else:
		HQH.AssertLog("ClearSaveGameArchive, index: %s is out of rang[0, SAVE_GAME_ARCHIVE_NUMBWE_MAX: %s)" % [index, SAVE_GAME_ARCHIVE_NUMBWE_MAX])

func GetSaveGameArchiveByIndex_IsEmpty(index: int) -> bool:
	if 0 > index:
		HQH.AssertLog("GetSaveGameArchiveByIndex_IsEmpty, 0 > index: %s" % index)
		
		return true
	
	return m_SaveGameData_ArchiveList[index].isEmptyArchive

func SetSaveGameArchiveByIndex_IsEmpty_false(index: int):
	if 0 > index:
		HQH.AssertLog("SetSaveGameArchiveByIndex_IsEmpty_false, 0 > index: %s" % index)
		
		return
	
	m_SaveGameData_ArchiveList[index].isEmptyArchive = false

func GetSaveGameArchiveByIndex_lastSaveGameDataArchiveDateTime(index: int) -> String:
	if 0 > index:
		HQH.AssertLog("GetSaveGameArchiveByIndex_lastSaveGameDataArchiveDateTime, 0 > index: %s" % index)
		
		return ""
	
	return m_SaveGameData_ArchiveList[index].lastSaveGameDataArchiveDateTime

func SetSaveData_archive_currentUsedIndex_Invalid():
	m_SaveGameData.archive.currentUsedIndex = -1
	
	SetNeedSaveGame()

func SetSaveData_archive_currentUsedIndex(index: int, isNeedSetEmpty: bool = true):
	if (0 <= index) and (SAVE_GAME_ARCHIVE_NUMBWE_MAX > index):
		m_SaveGameData.archive.currentUsedIndex = index
		
		if isNeedSetEmpty:
			SetSaveGameArchiveByIndex_IsEmpty_false(m_SaveGameData.archive.currentUsedIndex)
		
		SetNeedSaveGame()
		SetNeedSaveGameArchive()
	else:
		HQH.AssertLog("SetSaveData_archive_currentUsedIndex, index: %s is out of rang[0, SAVE_GAME_ARCHIVE_NUMBWE_MAX: %s)" % [index, SAVE_GAME_ARCHIVE_NUMBWE_MAX])

func GetSaveGameData_Archive_AvatarList() -> Array:
	return GetSaveGameData_Archive_DataList(SAVEGAMEDATA_ARCHIVE_LISTDATATYPE.SAVEGAMEDATA_ARCHIVE_LISTDATATYPE_AVATAR)

func GetSaveGameData_Archive_AvatarList_TeamLeaderAvatarInfo() -> Dictionary:
	return GetSaveGameData_Archive_DataList_DataInfoByIndex(SAVEGAMEDATA_ARCHIVE_LISTDATATYPE.SAVEGAMEDATA_ARCHIVE_LISTDATATYPE_AVATAR, GetSaveGameData_Archive_AvatarList().size() - 1)

func GetSaveGameData_Archive_AvatarList_AvatarInfoByIndex(index: int) -> Dictionary:
	return GetSaveGameData_Archive_DataList_DataInfoByIndex(SAVEGAMEDATA_ARCHIVE_LISTDATATYPE.SAVEGAMEDATA_ARCHIVE_LISTDATATYPE_AVATAR, index)

func GetSaveGameData_Archive_AvatarList_AvatarInfoByAvatarTypeID(avatarTypeID: int) -> Dictionary:
	return GetSaveGameData_Archive_DataList_DataInfoByTypeID(SAVEGAMEDATA_ARCHIVE_LISTDATATYPE.SAVEGAMEDATA_ARCHIVE_LISTDATATYPE_AVATAR, avatarTypeID)

func AddSaveGameData_Archive_AvatarList(avatarTypeID: int, avatarSceneTypeID: int, avatarPositionX: float, avatarPositionY: float, equipTypeID: int) -> bool:
	var isSuccess: bool = false
	if (0 <= m_SaveGameData.archive.currentUsedIndex) and (SAVE_GAME_ARCHIVE_NUMBWE_MAX > m_SaveGameData.archive.currentUsedIndex):
		if AvatarManager.CREATEAVATARINFOLIST_NUMBER_MAX > m_SaveGameData_ArchiveList[m_SaveGameData.archive.currentUsedIndex].saveGameData_Archive_AvatarList.size():
			var resultAvatarInfo: Dictionary = GetSaveGameData_Archive_AvatarList_AvatarInfoByAvatarTypeID(avatarTypeID)
			if not resultAvatarInfo.isHas:
				isSuccess = true
				
				var archive_avatar: Dictionary = SAVEGAMEDATA_ARCHIVE_AVATAR.duplicate(true)
				archive_avatar.avatarTypeID = avatarTypeID
				archive_avatar.avatarSceneTypeID = avatarSceneTypeID
				archive_avatar.avatarPositionX = avatarPositionX
				archive_avatar.avatarPositionY = avatarPositionY
				archive_avatar.equipTypeID = equipTypeID
				m_SaveGameData_ArchiveList[m_SaveGameData.archive.currentUsedIndex].saveGameData_Archive_AvatarList.insert(0, archive_avatar)
				
				SetNeedSaveGameArchive()
			else:
				HQH.Log("AddSaveGameData_Archive_AvatarList, has avatarTypeID: %s" % [avatarTypeID])
				UIManager.DownPanel_AddJournalRecord(TableManager.GetLanguageString("ADDSAVEGAMEDATA_ARCHIVE_AVATARLIST_YOU_CANNOT_ADD_TEAM_MEMBERS_REPEATEDLY") % TableManager.GetAvatarShowName(avatarTypeID))
		else:
			HQH.Log("AddSaveGameData_Archive_AvatarList, AvatarManager.CREATEAVATARINFOLIST_NUMBER_MAX: %s <= saveGameData_Archive_AvatarList.size(): %s" % [AvatarManager.CREATEAVATARINFOLIST_NUMBER_MAX, m_SaveGameData_ArchiveList[m_SaveGameData.archive.currentUsedIndex].saveGameData_Archive_AvatarList.size()])
			UIManager.DownPanel_AddJournalRecord(TableManager.GetLanguageString("ADDSAVEGAMEDATA_ARCHIVE_AVATARLIST_THE_TEAM_HAS_A_MAXIMUM_OF_AVATAR") % AvatarManager.CREATEAVATARINFOLIST_NUMBER_MAX)
	
	return isSuccess

func ReorderSaveGameData_Archive_AvatarList_SortFunction(a, b):
	var aAvatarInfo: Dictionary = AvatarManager.GetCreateAvatarInfoListOneElementByAvatarTypeID(a.avatarTypeID)
	if aAvatarInfo.empty():
		HQH.AssertLog("aAvatarInfo.empty(), a.avatarTypeID: %s" % a.avatarTypeID)
		
		return false
	
	var bAvatarInfo: Dictionary = AvatarManager.GetCreateAvatarInfoListOneElementByAvatarTypeID(b.avatarTypeID)
	if bAvatarInfo.empty():
		HQH.AssertLog("bAvatarInfo.empty(), b.avatarTypeID: %s" % b.avatarTypeID)
		
		return true
	
	return aAvatarInfo.index < bAvatarInfo.index

func ReorderSaveGameData_Archive_AvatarList():
	if (0 <= m_SaveGameData.archive.currentUsedIndex) and (SAVE_GAME_ARCHIVE_NUMBWE_MAX > m_SaveGameData.archive.currentUsedIndex):
		var createAvatarInfoList: Array = AvatarManager.GetCreateAvatarInfoList()
		if createAvatarInfoList.size() != m_SaveGameData_ArchiveList[m_SaveGameData.archive.currentUsedIndex].saveGameData_Archive_AvatarList.size():
			HQH.AssertLog("createAvatarInfoList.size() != m_SaveGameData_ArchiveList[m_SaveGameData.archive.currentUsedIndex].saveGameData_Archive_AvatarList.size()" % [createAvatarInfoList.size(), m_SaveGameData_ArchiveList[m_SaveGameData.archive.currentUsedIndex].saveGameData_Archive_AvatarList.size()])
		
		m_SaveGameData_ArchiveList[m_SaveGameData.archive.currentUsedIndex].saveGameData_Archive_AvatarList.sort_custom(self, "ReorderSaveGameData_Archive_AvatarList_SortFunction")
		
		SetNeedSaveGameArchive()

func RemoveSaveGameData_Archive_AvatarListByAvatarTypeID(avatarTypeID: int) -> bool:
	return RemoveSaveGameData_Archive_DataListByTypeID(SAVEGAMEDATA_ARCHIVE_LISTDATATYPE.SAVEGAMEDATA_ARCHIVE_LISTDATATYPE_AVATAR, avatarTypeID)

func RemoveSaveGameData_Archive_AvatarListByIndex(index: int) -> bool:
	return RemoveSaveGameData_Archive_DataListByIndex(SAVEGAMEDATA_ARCHIVE_LISTDATATYPE.SAVEGAMEDATA_ARCHIVE_LISTDATATYPE_AVATAR, index)

func GetSaveGameData_Archive_AvatarListByAvatarTypeID_Position(avatarTypeID: int) -> Dictionary:
	var avatarSceneTypeID: int = 0
	var avatarPositionY: float = 0.0
	var avatarPositionX: float = 0.0
	if (0 <= m_SaveGameData.archive.currentUsedIndex) and (SAVE_GAME_ARCHIVE_NUMBWE_MAX > m_SaveGameData.archive.currentUsedIndex):
		for iv in m_SaveGameData_ArchiveList[m_SaveGameData.archive.currentUsedIndex].saveGameData_Archive_AvatarList:
			if avatarTypeID == iv.avatarTypeID:
				avatarSceneTypeID = iv.avatarSceneTypeID
				avatarPositionX = iv.avatarPosition
				avatarPositionY = iv.avatarPositionY
				
				break
	
	return {"avatarSceneTypeID": avatarSceneTypeID, "avatarPositionX": avatarPositionX, "avatarPositionY": avatarPositionY}

func GetSaveGameData_Archive_AvatarListByAvatarTypeID_equipTypeID(avatarTypeID: int) -> int:
	var equipTypeID: int = 0
	if (0 <= m_SaveGameData.archive.currentUsedIndex) and (SAVE_GAME_ARCHIVE_NUMBWE_MAX > m_SaveGameData.archive.currentUsedIndex):
		for iv in m_SaveGameData_ArchiveList[m_SaveGameData.archive.currentUsedIndex].saveGameData_Archive_AvatarList:
			if avatarTypeID == iv.avatarTypeID:
				equipTypeID = iv.equipTypeID
				
				break
	
	return equipTypeID

func UpdateSaveGameData_Archive_AvatarListByAvatarTypeID_Position(avatarTypeID: int, avatarSceneTypeID: int, avatarPositionX: float, avatarPositionY: float) -> bool:
	var isSuccess: bool = false
	if (0 <= m_SaveGameData.archive.currentUsedIndex) and (SAVE_GAME_ARCHIVE_NUMBWE_MAX > m_SaveGameData.archive.currentUsedIndex):
		for iv in m_SaveGameData_ArchiveList[m_SaveGameData.archive.currentUsedIndex].saveGameData_Archive_AvatarList:
			if avatarTypeID == iv.avatarTypeID:
				isSuccess = true
				
				iv.avatarSceneTypeID = avatarSceneTypeID
				iv.avatarPositionX = avatarPositionX
				iv.avatarPositionY = avatarPositionY
				
				SetNeedSaveGameArchive()
				
				break
	
	return isSuccess

func UpdateSaveGameData_Archive_AvatarListByAvatarTypeID_equipTypeID(avatarTypeID: int, equipTypeID: int) -> bool:
	var isSuccess: bool = false
	if (0 <= m_SaveGameData.archive.currentUsedIndex) and (SAVE_GAME_ARCHIVE_NUMBWE_MAX > m_SaveGameData.archive.currentUsedIndex):
		for iv in m_SaveGameData_ArchiveList[m_SaveGameData.archive.currentUsedIndex].saveGameData_Archive_AvatarList:
			if avatarTypeID == iv.avatarTypeID:
				isSuccess = true
				
				iv.equipTypeID = equipTypeID
				
				SetNeedSaveGameArchive()
				
				break
	
	return isSuccess

func IsBagHas(goodsTypeID: int) -> bool:
	var resultBagInfo: Dictionary = GetSaveGameData_Archive_BagList_BagInfoByGoodsTypeID(goodsTypeID)
	
	return resultBagInfo.isHas 

func IsBagHas_Foot() -> bool:
	return IsBagHas(TableManager.GOODSTYPEID_FOOT)

func IsBagHas_Telescope() -> bool:
	return IsBagHas(TableManager.GOODSTYPEID_TELESCOPE)

func GetSaveGameData_Archive_BagList() -> Array:
	return GetSaveGameData_Archive_DataList(SAVEGAMEDATA_ARCHIVE_LISTDATATYPE.SAVEGAMEDATA_ARCHIVE_LISTDATATYPE_BAG)

func GetSaveGameData_Archive_BagList_BagInfoByIndex(index: int) -> Dictionary:
	return GetSaveGameData_Archive_DataList_DataInfoByIndex(SAVEGAMEDATA_ARCHIVE_LISTDATATYPE.SAVEGAMEDATA_ARCHIVE_LISTDATATYPE_BAG, index)

func GetSaveGameData_Archive_BagList_BagInfoByGoodsTypeID(goodsTypeID: int) -> Dictionary:
	return GetSaveGameData_Archive_DataList_DataInfoByTypeID(SAVEGAMEDATA_ARCHIVE_LISTDATATYPE.SAVEGAMEDATA_ARCHIVE_LISTDATATYPE_BAG, goodsTypeID)

func GetSaveGameData_Archive_BagList_BagGoodsDataByIndex(index: int) -> int:
	var bagGoodsData: int = 0
	var bagInfo: Dictionary = GetSaveGameData_Archive_BagList_BagInfoByIndex(index)
	if not bagInfo.empty():
		bagGoodsData = bagInfo.bagGoodsData
	
	return bagGoodsData

func AddSaveGameData_Archive_BagList(goodsTypeID: int, bagGoodsData: int = 0) -> bool:
	var isSuccess: bool = false
	if (0 <= m_SaveGameData.archive.currentUsedIndex) and (SAVE_GAME_ARCHIVE_NUMBWE_MAX > m_SaveGameData.archive.currentUsedIndex):
		if UIManager.DOWN_PANEL_BAG_NUMBER_MAX > m_SaveGameData_ArchiveList[m_SaveGameData.archive.currentUsedIndex].saveGameData_Archive_BagList.size():
			var resultGoodsInfo: Dictionary = GetSaveGameData_Archive_BagList_BagInfoByGoodsTypeID(goodsTypeID)
			if not resultGoodsInfo.isHas:
				isSuccess = true
				
				var archive_bag: Dictionary = SAVEGAMEDATA_ARCHIVE_BAG.duplicate(true)
				archive_bag.bagGoodsTypeID = goodsTypeID
				archive_bag.bagGoodsData = bagGoodsData
				m_SaveGameData_ArchiveList[m_SaveGameData.archive.currentUsedIndex].saveGameData_Archive_BagList.append(archive_bag)
				
				SetNeedSaveGameArchive()
			else:
				HQH.Log("AddSaveGameData_Archive_BagList, has goodsTypeID: %s" % [goodsTypeID])
		else:
			HQH.Log("AddSaveGameData_Archive_BagList, UIManager.DOWN_PANEL_BAG_NUMBER_MAX: %s <= saveGameData_Archive_BagList.size(): %s" % [UIManager.DOWN_PANEL_BAG_NUMBER_MAX, m_SaveGameData_ArchiveList[m_SaveGameData.archive.currentUsedIndex].saveGameData_Archive_BagList.size()])
	
	return isSuccess

func RemoveSaveGameData_Archive_BagListByGoodsTypeID(goodsTypeID: int) -> bool:
	return RemoveSaveGameData_Archive_DataListByTypeID(SAVEGAMEDATA_ARCHIVE_LISTDATATYPE.SAVEGAMEDATA_ARCHIVE_LISTDATATYPE_BAG, goodsTypeID)

func RemoveSaveGameData_Archive_BagListByIndex(index: int) -> bool:
	return RemoveSaveGameData_Archive_DataListByIndex(SAVEGAMEDATA_ARCHIVE_LISTDATATYPE.SAVEGAMEDATA_ARCHIVE_LISTDATATYPE_BAG, index)

func UpdateSaveGameData_Archive_BagListByGoodsTypeID(goodsTypeID: int, newBagGoodsData: int) -> bool:
	var isSuccess: bool = false
	if (0 <= m_SaveGameData.archive.currentUsedIndex) and (SAVE_GAME_ARCHIVE_NUMBWE_MAX > m_SaveGameData.archive.currentUsedIndex):
		for iv in m_SaveGameData_ArchiveList[m_SaveGameData.archive.currentUsedIndex].saveGameData_Archive_BagList:
			if goodsTypeID == iv.bagGoodsTypeID:
				isSuccess = true
				
				iv.bagGoodsData = newBagGoodsData
				
				SetNeedSaveGameArchive()
				
				break
	
	return isSuccess

func UpdateSaveGameData_Archive_BagListByIndex(index: int, newBagGoodsData: int) -> bool:
	var isSuccess: bool = false
	if (0 <= m_SaveGameData.archive.currentUsedIndex) and (SAVE_GAME_ARCHIVE_NUMBWE_MAX > m_SaveGameData.archive.currentUsedIndex):
		if (0 <= index) and (m_SaveGameData_ArchiveList[m_SaveGameData.archive.currentUsedIndex].saveGameData_Archive_BagList.size() > index):
			isSuccess = true
			
			m_SaveGameData_ArchiveList[m_SaveGameData.archive.currentUsedIndex].saveGameData_Archive_BagList[index].bagGoodsData = newBagGoodsData
			
			SetNeedSaveGameArchive()
	
	return isSuccess

func GetSaveGameData_Archive_DataList(listDataType: int) -> Array:
	var dataList: Array = []
	if (0 <= m_SaveGameData.archive.currentUsedIndex) and (SAVE_GAME_ARCHIVE_NUMBWE_MAX > m_SaveGameData.archive.currentUsedIndex):
		match listDataType:
			SAVEGAMEDATA_ARCHIVE_LISTDATATYPE.SAVEGAMEDATA_ARCHIVE_LISTDATATYPE_AVATAR:
				dataList = m_SaveGameData_ArchiveList[m_SaveGameData.archive.currentUsedIndex].saveGameData_Archive_AvatarList
			
			SAVEGAMEDATA_ARCHIVE_LISTDATATYPE.SAVEGAMEDATA_ARCHIVE_LISTDATATYPE_GOODSUSED:
				dataList = m_SaveGameData_ArchiveList[m_SaveGameData.archive.currentUsedIndex].saveGameData_Archive_GoodsUsedList
		
			SAVEGAMEDATA_ARCHIVE_LISTDATATYPE.SAVEGAMEDATA_ARCHIVE_LISTDATATYPE_BAG:
				dataList = m_SaveGameData_ArchiveList[m_SaveGameData.archive.currentUsedIndex].saveGameData_Archive_BagList
			
			SAVEGAMEDATA_ARCHIVE_LISTDATATYPE.SAVEGAMEDATA_ARCHIVE_LISTDATATYPE_SCENE:
				dataList = m_SaveGameData_ArchiveList[m_SaveGameData.archive.currentUsedIndex].saveGameData_Archive_SceneList
			
			SAVEGAMEDATA_ARCHIVE_LISTDATATYPE.SAVEGAMEDATA_ARCHIVE_LISTDATATYPE_TASK:
				dataList = m_SaveGameData_ArchiveList[m_SaveGameData.archive.currentUsedIndex].saveGameData_Archive_TaskList
	
	return dataList

func GetSaveGameData_Archive_DataList_DataInfoByIndex(listDataType: int, index: int) -> Dictionary:
	var dataInfo: Dictionary = {}
	var dataList: Array = GetSaveGameData_Archive_DataList(listDataType)
	if (0 <= index) and (dataList.size() > index):
		dataInfo = dataList[index]
	
	return dataInfo

func GetSaveGameData_Archive_DataList_DataInfoByTypeID(listDataType: int, typeID: int) -> Dictionary:
	var isHas: bool = false
	var index: int = 0
	var dataInfo: Dictionary = {}
	var dataList: Array = GetSaveGameData_Archive_DataList(listDataType)
	for iv in dataList:
		var dataTypeID: int = 0
		match listDataType:
			SAVEGAMEDATA_ARCHIVE_LISTDATATYPE.SAVEGAMEDATA_ARCHIVE_LISTDATATYPE_AVATAR:
				dataTypeID = iv.avatarTypeID
			
			SAVEGAMEDATA_ARCHIVE_LISTDATATYPE.SAVEGAMEDATA_ARCHIVE_LISTDATATYPE_GOODSUSED:
				dataTypeID = iv.goodsTypeID
			
			SAVEGAMEDATA_ARCHIVE_LISTDATATYPE.SAVEGAMEDATA_ARCHIVE_LISTDATATYPE_BAG:
				dataTypeID = iv.bagGoodsTypeID
			
			SAVEGAMEDATA_ARCHIVE_LISTDATATYPE.SAVEGAMEDATA_ARCHIVE_LISTDATATYPE_SCENE:
				dataTypeID = iv.sceneTypeID
			
			SAVEGAMEDATA_ARCHIVE_LISTDATATYPE.SAVEGAMEDATA_ARCHIVE_LISTDATATYPE_TASK:
				dataTypeID = iv.wrangleDialogTypeID
		
		if typeID == dataTypeID:
			isHas = true
			
			dataInfo = iv
			
			break
		
		index += 1
	
	return {"isHas": isHas, "index": index, "dataInfo": dataInfo}

func RemoveSaveGameData_Archive_DataListByIndexBase(listDataType: int, index: int):
	if 0 > m_SaveGameData.archive.currentUsedIndex:
		HQH.AssertLog("RemoveSaveGameData_Archive_DataListByIndexBase, 0 > m_SaveGameData.archive.currentUsedIndex: %s" % m_SaveGameData.archive.currentUsedIndex)
		
		return
	
	match listDataType:
		SAVEGAMEDATA_ARCHIVE_LISTDATATYPE.SAVEGAMEDATA_ARCHIVE_LISTDATATYPE_AVATAR:
			m_SaveGameData_ArchiveList[m_SaveGameData.archive.currentUsedIndex].saveGameData_Archive_AvatarList.remove(index)
		
		SAVEGAMEDATA_ARCHIVE_LISTDATATYPE.SAVEGAMEDATA_ARCHIVE_LISTDATATYPE_GOODSUSED:
			m_SaveGameData_ArchiveList[m_SaveGameData.archive.currentUsedIndex].saveGameData_Archive_GoodsUsedList.remove(index)
	
		SAVEGAMEDATA_ARCHIVE_LISTDATATYPE.SAVEGAMEDATA_ARCHIVE_LISTDATATYPE_BAG:
			m_SaveGameData_ArchiveList[m_SaveGameData.archive.currentUsedIndex].saveGameData_Archive_BagList.remove(index)
		
		SAVEGAMEDATA_ARCHIVE_LISTDATATYPE.SAVEGAMEDATA_ARCHIVE_LISTDATATYPE_SCENE:
			m_SaveGameData_ArchiveList[m_SaveGameData.archive.currentUsedIndex].saveGameData_Archive_SceneList.remove(index)
		
		SAVEGAMEDATA_ARCHIVE_LISTDATATYPE.SAVEGAMEDATA_ARCHIVE_LISTDATATYPE_TASK:
			m_SaveGameData_ArchiveList[m_SaveGameData.archive.currentUsedIndex].saveGameData_Archive_TaskList.remove(index)

func RemoveSaveGameData_Archive_DataListByTypeID(listDataType: int, typeID: int) -> bool:
	var isSuccess: bool = false
	var resultAvatarInfo: Dictionary = GetSaveGameData_Archive_DataList_DataInfoByTypeID(listDataType, typeID)
	if resultAvatarInfo.isHas:
		isSuccess = true
		
		RemoveSaveGameData_Archive_DataListByIndexBase(listDataType, resultAvatarInfo.index)
		
		SetNeedSaveGameArchive()
	
	return isSuccess

func RemoveSaveGameData_Archive_DataListByIndex(listDataType: int, index: int) -> bool:
	var isSuccess: bool = false
	if (0 <= m_SaveGameData.archive.currentUsedIndex) and (SAVE_GAME_ARCHIVE_NUMBWE_MAX > m_SaveGameData.archive.currentUsedIndex):
		if (0 <= index) and (GetSaveGameData_Archive_DataList(listDataType).size() > index):
			isSuccess = true
			
			RemoveSaveGameData_Archive_DataListByIndexBase(listDataType, index)
			
			SetNeedSaveGameArchive()
	
	return isSuccess

func GetSaveGameData_Archive_GoodsUsedList_GoodsUsedInfoByGoodsTypeID(goodsTypeID: int) -> Dictionary:
	return GetSaveGameData_Archive_DataList_DataInfoByTypeID(SAVEGAMEDATA_ARCHIVE_LISTDATATYPE.SAVEGAMEDATA_ARCHIVE_LISTDATATYPE_GOODSUSED, goodsTypeID)

func AddSaveGameData_Archive_GoodsUsedList(goodsTypeID: int, goodsData1: int = 0, goodsData2: int = 0) -> bool:
	var isSuccess: bool = false
	if (0 <= m_SaveGameData.archive.currentUsedIndex) and (SAVE_GAME_ARCHIVE_NUMBWE_MAX > m_SaveGameData.archive.currentUsedIndex):
		if UIManager.DOWN_PANEL_BAG_NUMBER_MAX > m_SaveGameData_ArchiveList[m_SaveGameData.archive.currentUsedIndex].saveGameData_Archive_GoodsUsedList.size():
			var resultGoodsUsedInfo: Dictionary = GetSaveGameData_Archive_GoodsUsedList_GoodsUsedInfoByGoodsTypeID(goodsTypeID)
			if not resultGoodsUsedInfo.isHas:
				isSuccess = true
				
				var archive_goodsUsed: Dictionary = SAVEGAMEDATA_ARCHIVE_GOODSUSED.duplicate(true)
				archive_goodsUsed.goodsTypeID = goodsTypeID
				archive_goodsUsed.goodsData1 = goodsData1
				archive_goodsUsed.goodsData2 = goodsData2
				m_SaveGameData_ArchiveList[m_SaveGameData.archive.currentUsedIndex].saveGameData_Archive_GoodsUsedList.append(archive_goodsUsed)
				
				SetNeedSaveGameArchive()
			else:
				HQH.Log("AddSaveGameData_Archive_GoodsUsedList, has goodsTypeID: %s" % [goodsTypeID])
		else:
			HQH.Log("AddSaveGameData_Archive_GoodsUsedList, AvatarManager.CREATEAVATARINFOLIST_NUMBER_MAX: %s <= saveGameData_Archive_GoodsUsedList.size(): %s" % [AvatarManager.CREATEAVATARINFOLIST_NUMBER_MAX, m_SaveGameData_ArchiveList[m_SaveGameData.archive.currentUsedIndex].saveGameData_Archive_GoodsUsedList.size()])
	
	return isSuccess

func UpdateSaveGameData_Archive_GoodsUsedList(goodsTypeID: int, goodsData1: int, goodsData2: int) -> bool:
	var isSuccess: bool = false
	if (0 <= m_SaveGameData.archive.currentUsedIndex) and (SAVE_GAME_ARCHIVE_NUMBWE_MAX > m_SaveGameData.archive.currentUsedIndex):
		if UIManager.DOWN_PANEL_BAG_NUMBER_MAX > m_SaveGameData_ArchiveList[m_SaveGameData.archive.currentUsedIndex].saveGameData_Archive_GoodsUsedList.size():
			for iv in m_SaveGameData_ArchiveList[m_SaveGameData.archive.currentUsedIndex].saveGameData_Archive_GoodsUsedList:
				if goodsTypeID == iv.goodsTypeID:
					isSuccess = true
					
					iv.goodsData1 = goodsData1
					iv.goodsData2 = goodsData2
					
					SetNeedSaveGameArchive()
					
					break
		else:
			HQH.Log("UpdateSaveGameData_Archive_GoodsUsedList, AvatarManager.CREATEAVATARINFOLIST_NUMBER_MAX: %s <= saveGameData_Archive_GoodsUsedList.size(): %s" % [AvatarManager.CREATEAVATARINFOLIST_NUMBER_MAX, m_SaveGameData_ArchiveList[m_SaveGameData.archive.currentUsedIndex].saveGameData_Archive_GoodsUsedList.size()])
	
	return isSuccess

func RemoveSaveGameData_Archive_GoodsUsedListByGoodsTypeID(goodsTypeID: int) -> bool:
	return RemoveSaveGameData_Archive_DataListByTypeID(SAVEGAMEDATA_ARCHIVE_LISTDATATYPE.SAVEGAMEDATA_ARCHIVE_LISTDATATYPE_GOODSUSED, goodsTypeID)

func IsGoodsUsedHas(goodsTypeID: int) -> bool:
	var resultGoodsUsedInfo: Dictionary = GetSaveGameData_Archive_GoodsUsedList_GoodsUsedInfoByGoodsTypeID(goodsTypeID)
	
	return resultGoodsUsedInfo.isHas 

func IsGoodsUsedHas_Foot() -> bool:
	return IsGoodsUsedHas(TableManager.GOODSTYPEID_FOOT)

func IsGoodsUsedHas_Telescope() -> bool:
	return IsGoodsUsedHas(TableManager.GOODSTYPEID_TELESCOPE)

func IsGoodsUsedHas_Bag() -> bool:
	return IsGoodsUsedHas(TableManager.GOODSTYPEID_BAG)

func IsGoodsUsedHas_JournalRecordBook() -> bool:
	return IsGoodsUsedHas(TableManager.GOODSTYPEID_JOURNALRECORDBOOK)

func GetSaveGameData_Archive_VisualFieldDistance() -> int:
	var resultGoodsUsedInfo: Dictionary = GetSaveGameData_Archive_GoodsUsedList_GoodsUsedInfoByGoodsTypeID(TableManager.GOODSTYPEID_TELESCOPE)
	if resultGoodsUsedInfo.isHas:
		return resultGoodsUsedInfo.dataInfo.goodsData1 # visualFieldDistance
	
	return GetSaveGameData_Archive_AvatarAttribute_VisualFieldDistance()

func GetSaveGameData_Archive_AvatarAttribute_VisualFieldDistance() -> int:
	var visualFieldDistance: int = HQH.VISUAL_FIELD_DISTANCE_MIN
	if (0 <= m_SaveGameData.archive.currentUsedIndex) and (SAVE_GAME_ARCHIVE_NUMBWE_MAX > m_SaveGameData.archive.currentUsedIndex):
		visualFieldDistance = m_SaveGameData_ArchiveList[m_SaveGameData.archive.currentUsedIndex].avatarAttribute.visualFieldDistance
	
	return visualFieldDistance

func GetSaveGameData_Archive_VisualFieldSharpType() -> int:
	var resultGoodsUsedInfo: Dictionary = GetSaveGameData_Archive_GoodsUsedList_GoodsUsedInfoByGoodsTypeID(TableManager.GOODSTYPEID_TELESCOPE)
	if resultGoodsUsedInfo.isHas:
		return resultGoodsUsedInfo.dataInfo.goodsData2 # visualFieldSharpType
	
	return GetSaveGameData_Archive_AvatarAttribute_VisualFieldSharpType()

func GetSaveGameData_Archive_AvatarAttribute_VisualFieldSharpType() -> int:
	var visualFieldSharpType: int = HQH.VISUAL_FIELD_SHARP_TYPE.RHOMBUS
	if (0 <= m_SaveGameData.archive.currentUsedIndex) and (SAVE_GAME_ARCHIVE_NUMBWE_MAX > m_SaveGameData.archive.currentUsedIndex):
		visualFieldSharpType = m_SaveGameData_ArchiveList[m_SaveGameData.archive.currentUsedIndex].avatarAttribute.visualFieldSharpType
	
	return visualFieldSharpType

func SetSaveGameData_Archive_Info_InitAvatarTypeID(initAvatarTypeID: int):
	if (0 <= m_SaveGameData.archive.currentUsedIndex) and (SAVE_GAME_ARCHIVE_NUMBWE_MAX > m_SaveGameData.archive.currentUsedIndex):
		m_SaveGameData_ArchiveList[m_SaveGameData.archive.currentUsedIndex].info.initAvatarTypeID = initAvatarTypeID

func GetSaveGameData_Archive_Info_InitAvatarTypeID() -> int:
	var initAvatarTypeID: int = 0
	if (0 <= m_SaveGameData.archive.currentUsedIndex) and (SAVE_GAME_ARCHIVE_NUMBWE_MAX > m_SaveGameData.archive.currentUsedIndex):
		initAvatarTypeID = m_SaveGameData_ArchiveList[m_SaveGameData.archive.currentUsedIndex].info.initAvatarTypeID
	
	return initAvatarTypeID

func IsContinueGame() -> bool:
	var isContinueGame: bool = false
	var archive_currentUsedIndex: int = GetSaveData_archive_currentUsedIndex()
	if 0 <= archive_currentUsedIndex:
		var isEmpty: bool = GetSaveGameArchiveByIndex_IsEmpty(archive_currentUsedIndex)
		if not isEmpty:
			isContinueGame = true
	
	return isContinueGame

func GetSaveGameData_Archive_SceneList() -> Array:
	return GetSaveGameData_Archive_DataList(SAVEGAMEDATA_ARCHIVE_LISTDATATYPE.SAVEGAMEDATA_ARCHIVE_LISTDATATYPE_SCENE)

func GetSaveGameData_Archive_SceneList_SceneInfoByIndex(index: int) -> Dictionary:
	return GetSaveGameData_Archive_DataList_DataInfoByIndex(SAVEGAMEDATA_ARCHIVE_LISTDATATYPE.SAVEGAMEDATA_ARCHIVE_LISTDATATYPE_SCENE, index)

func GetSaveGameData_Archive_SceneList_SceneInfoBySceneTypeID(sceneTypeID: int) -> Dictionary:
	return GetSaveGameData_Archive_DataList_DataInfoByTypeID(SAVEGAMEDATA_ARCHIVE_LISTDATATYPE.SAVEGAMEDATA_ARCHIVE_LISTDATATYPE_SCENE, sceneTypeID)

func IsHasSaveGameData_Archive_SceneList_SceneDataWarFogCellsList_SceneInfoBySceneTypeIDCellXCellY(sceneDataWarFogCellsList: Array, cellX: int, cellY: int) -> bool:
	var isHas: bool = false
	for iv in sceneDataWarFogCellsList:
		if (cellX == iv.cellX) and (cellY == iv.cellY):
			isHas = true
			
			break
	
	return isHas

func IsHasSaveGameData_Archive_SceneList_SceneInfoBySceneTypeIDCellXCellY(sceneTypeID: int, cellX: int, cellY: int) -> bool:
	var isHas: bool = false
	var resultSceneInfo: Dictionary = GetSaveGameData_Archive_SceneList_SceneInfoBySceneTypeID(sceneTypeID)
	if resultSceneInfo.isHas:
		isHas = IsHasSaveGameData_Archive_SceneList_SceneDataWarFogCellsList_SceneInfoBySceneTypeIDCellXCellY(resultSceneInfo.dataInfo.sceneDataWarFogCellsList, cellX, cellY)
	
	return isHas

func AddSaveGameData_Archive_SceneList(sceneTypeID: int, cellX: int, cellY: int) -> bool:
	var isSuccess: bool = false
	if (0 <= m_SaveGameData.archive.currentUsedIndex) and (SAVE_GAME_ARCHIVE_NUMBWE_MAX > m_SaveGameData.archive.currentUsedIndex):
		if TableManager.SCENE_GAMEPLAY_SCENETYPEID_LIST.size() >= m_SaveGameData_ArchiveList[m_SaveGameData.archive.currentUsedIndex].saveGameData_Archive_SceneList.size():
			if sceneTypeID in TableManager.SCENE_GAMEPLAY_SCENETYPEID_LIST:
				var resultSceneInfo: Dictionary = GetSaveGameData_Archive_SceneList_SceneInfoBySceneTypeID(sceneTypeID)
				if not resultSceneInfo.isHas:
					isSuccess = true
					
					var archive_scene_warfogcell: Dictionary = SAVEGAMEDATA_ARCHIVE_SCENE_WARFOGCELL.duplicate(true)
					archive_scene_warfogcell.cellX = cellX
					archive_scene_warfogcell.cellY = cellY
					
					var archive_scene: Dictionary = SAVEGAMEDATA_ARCHIVE_SCENE.duplicate(true)
					archive_scene.sceneTypeID = sceneTypeID
					archive_scene.sceneDataWarFogCellsList.append(archive_scene_warfogcell)
					m_SaveGameData_ArchiveList[m_SaveGameData.archive.currentUsedIndex].saveGameData_Archive_SceneList.append(archive_scene)
					
					SetNeedSaveGameArchive()
				else:
					var isHas: bool = IsHasSaveGameData_Archive_SceneList_SceneDataWarFogCellsList_SceneInfoBySceneTypeIDCellXCellY(resultSceneInfo.dataInfo.sceneDataWarFogCellsList, cellX, cellY)
					if not isHas:
						isSuccess = true
						
						var archive_scene_warfogcell: Dictionary = SAVEGAMEDATA_ARCHIVE_SCENE_WARFOGCELL.duplicate(true)
						archive_scene_warfogcell.cellX = cellX
						archive_scene_warfogcell.cellY = cellY
						
						resultSceneInfo.dataInfo.sceneDataWarFogCellsList.append(archive_scene_warfogcell)
						
						SetNeedSaveGameArchive()
			else:
				HQH.AssertLog("sceneTypeID: %s not in TableManager.SCENE_GAMEPLAY_SCENETYPEID_LIST" % [sceneTypeID])
		else:
			HQH.Log("AddSaveGameData_Archive_SceneList, TableManager.SCENE_GAMEPLAY_SCENETYPEID_LIST.size(): %s < saveGameData_Archive_SceneList.size(): %s" % [TableManager.SCENE_GAMEPLAY_SCENETYPEID_LIST.size(), m_SaveGameData_ArchiveList[m_SaveGameData.archive.currentUsedIndex].saveGameData_Archive_SceneList.size()])
	
	return isSuccess

func GetSaveGameData_Archive_TaskList() -> Array:
	return GetSaveGameData_Archive_DataList(SAVEGAMEDATA_ARCHIVE_LISTDATATYPE.SAVEGAMEDATA_ARCHIVE_LISTDATATYPE_TASK)

func GetSaveGameData_Archive_TaskList_TaskInfoByIndex(index: int) -> Dictionary:
	return GetSaveGameData_Archive_DataList_DataInfoByIndex(SAVEGAMEDATA_ARCHIVE_LISTDATATYPE.SAVEGAMEDATA_ARCHIVE_LISTDATATYPE_TASK, index)

func GetSaveGameData_Archive_TaskList_TaskInfoByWrangleDialogTypeID(wrangleDialogTypeID: int) -> Dictionary:
	return GetSaveGameData_Archive_DataList_DataInfoByTypeID(SAVEGAMEDATA_ARCHIVE_LISTDATATYPE.SAVEGAMEDATA_ARCHIVE_LISTDATATYPE_TASK, wrangleDialogTypeID)

func IsHasSaveGameData_Archive_TaskList_TaskInfoByWrangleDialogTypeIDAndlastChoiceWrangleDialogTypeID(wrangleDialogTypeID: int, currentWrangleDialogTypeID: int) -> bool:
	var isHas: bool = false
	if 0 < wrangleDialogTypeID:
		var resultTaskInfo: Dictionary = GetSaveGameData_Archive_TaskList_TaskInfoByWrangleDialogTypeID(wrangleDialogTypeID)
		if resultTaskInfo.isHas:
			if currentWrangleDialogTypeID == resultTaskInfo.dataInfo.lastChoiceWrangleDialogTypeID:
				isHas = true
	
	return isHas

func AddSaveGameData_Archive_TaskList(wrangleDialogTypeID: int, lastChoiceWrangleDialogTypeID: int) -> bool:
	var isSuccess: bool = false
	if (0 <= m_SaveGameData.archive.currentUsedIndex) and (SAVE_GAME_ARCHIVE_NUMBWE_MAX > m_SaveGameData.archive.currentUsedIndex):
		var WRANGLEDIALOG_MAX: int = TableManager.WRANGLEDIALOG_MAP.size()
		if WRANGLEDIALOG_MAX > m_SaveGameData_ArchiveList[m_SaveGameData.archive.currentUsedIndex].saveGameData_Archive_TaskList.size():
			if (0 < wrangleDialogTypeID) and (0 < lastChoiceWrangleDialogTypeID):
				var resultTaskInfo: Dictionary = GetSaveGameData_Archive_TaskList_TaskInfoByWrangleDialogTypeID(wrangleDialogTypeID)
				if not resultTaskInfo.isHas:
					isSuccess = true
					
					var archive_task: Dictionary = SAVEGAMEDATA_ARCHIVE_TASK.duplicate(true)
					archive_task.wrangleDialogTypeID = wrangleDialogTypeID
					archive_task.lastChoiceWrangleDialogTypeID = lastChoiceWrangleDialogTypeID
					m_SaveGameData_ArchiveList[m_SaveGameData.archive.currentUsedIndex].saveGameData_Archive_TaskList.append(archive_task)
					
					SetNeedSaveGameArchive()
				else:
					for iv in m_SaveGameData_ArchiveList[m_SaveGameData.archive.currentUsedIndex].saveGameData_Archive_TaskList:
						if wrangleDialogTypeID == iv.wrangleDialogTypeID:
							isSuccess = true
							
							iv.lastChoiceWrangleDialogTypeID = lastChoiceWrangleDialogTypeID
							
							SetNeedSaveGameArchive()
							
							break
			else:
				HQH.AssertLog("not ((0 < wrangleDialogTypeID: %s) and (0 < lastChoiceWrangleDialogTypeID: %s))" % [wrangleDialogTypeID, lastChoiceWrangleDialogTypeID])
		else:
			HQH.Log("AddSaveGameData_Archive_TaskList, WRANGLEDIALOG_MAX: %s <= saveGameData_Archive_TaskList.size(): %s" % [WRANGLEDIALOG_MAX, m_SaveGameData_ArchiveList[m_SaveGameData.archive.currentUsedIndex].saveGameData_Archive_TaskList.size()])
	
	return isSuccess

func Is12MonsterSuccess() -> bool:
	var initBeginWrangleDialogTypeID: int = TableManager.WRANGLEDIALOGTYPEID_MONSTER_INIT_BEGIN
	var successBeingWrangleDialogTypeID: int = TableManager.WRANGLEDIALOGTYPEID_MONSTER_SUCCESS_BEGIN
	var wrangleDialogTypeIDLength: int = TableManager.WRANGLEDIALOGTYPEID_MONSTER_INIT_END - TableManager.WRANGLEDIALOGTYPEID_MONSTER_INIT_BEGIN + 1
	var isHasSuccess: bool = false
	for i in wrangleDialogTypeIDLength:
		isHasSuccess = IsHasSaveGameData_Archive_TaskList_TaskInfoByWrangleDialogTypeIDAndlastChoiceWrangleDialogTypeID(initBeginWrangleDialogTypeID + i, successBeingWrangleDialogTypeID + i)
		if not isHasSuccess:
			break
	
	return isHasSuccess

func AddSaveGameData_Archive_TaskList_Swallow(avatarTypeID: int):
	var wrangleDialogTypeID_Swallow: int = TableManager.GetAvatarWrangleDialogTypeID_Swallow(avatarTypeID)
	if 0 == wrangleDialogTypeID_Swallow:
		HQH.AssertLog("AddSaveGameData_Archive_TaskList_Swallow, 0 == wrangleDialogTypeID_Swallow, avatarTypeID: %s" % avatarTypeID)
	
	AddSaveGameData_Archive_TaskList(wrangleDialogTypeID_Swallow, wrangleDialogTypeID_Swallow)

func SwallowInfoList_SortFunction(a, b):
	return a.index < b.index

func GetSaveGameData_Archive_TaskList_Swallow() -> Array:
	var swallowInfoList: Array = []
	var swallowBegin: int = TableManager.WRANGLEDIALOGTYPEID_SWALLOW_BEGIN
	var swallowLength: int = TableManager.WRANGLEDIALOGTYPEID_SWALLOW_END - TableManager.WRANGLEDIALOGTYPEID_SWALLOW_BEGIN + 1
	for i in swallowLength:
		var wrangleDialogTypeID: int = i + swallowBegin
		var resultTaskInfo: Dictionary = SaveGameManager.GetSaveGameData_Archive_TaskList_TaskInfoByWrangleDialogTypeID(wrangleDialogTypeID)
		if resultTaskInfo.isHas:
			if (0 < resultTaskInfo.dataInfo.lastChoiceWrangleDialogTypeID) and (TableManager.WRANGLEDIALOGTYPEID_SWALLOW_INVALID != resultTaskInfo.dataInfo.lastChoiceWrangleDialogTypeID):
				var swallowInfo: Dictionary = SWALLOW_INFO.duplicate()
				swallowInfo.index = resultTaskInfo.index
				swallowInfo.wrangleDialogTypeID_Swallow = wrangleDialogTypeID
				swallowInfoList.append(swallowInfo)
	
	swallowInfoList.sort_custom(self, "SwallowInfoList_SortFunction")
	
	return swallowInfoList

func GetSaveGameData_Archive_TaskList_SwallowLastAvatarTypeID() -> int:
	var lastAvatarTypeID: int = 0
	var swallowInfoList: Array = SaveGameManager.GetSaveGameData_Archive_TaskList_Swallow()
	if not swallowInfoList.empty():
		var swallowInfo: Dictionary = swallowInfoList.back()
		if (0 < swallowInfo.wrangleDialogTypeID_Swallow) and (TableManager.WRANGLEDIALOGTYPEID_SWALLOW_INVALID != swallowInfo.wrangleDialogTypeID_Swallow):
			for k in TableManager.GetAvatarTypeMap():
				if swallowInfo.wrangleDialogTypeID_Swallow == TableManager.GetAvatarWrangleDialogTypeID_Swallow(k):
					lastAvatarTypeID = k
					
					break
	
	return lastAvatarTypeID

func GetSwallowPopLastAvatarTypeID() -> int:
	var lastAvatarTypeID: int = GetSaveGameData_Archive_TaskList_SwallowLastAvatarTypeID()
	if 0 == lastAvatarTypeID:
		var avatarTypeIDFinal: int = TableManager.SWALLOW_POP_LAST_AVATARTYPEID
		var resultAvatarInfo: Dictionary = GetSaveGameData_Archive_AvatarList_AvatarInfoByAvatarTypeID(avatarTypeIDFinal)
		if not resultAvatarInfo.isHas:
			lastAvatarTypeID = avatarTypeIDFinal
	
	return lastAvatarTypeID

func GetSwallowPopAssignAvatarTypeID(avatarTypeID: int) -> int:
	var lastAvatarTypeID: int = avatarTypeID
	if TableManager.SWALLOW_POP_LAST_AVATARTYPEID == avatarTypeID:
		lastAvatarTypeID = GetSwallowPopLastAvatarTypeID()
	
	return lastAvatarTypeID

func InvalidSaveGameData_Archive_TaskList_SwallowLastAvatarTypeID():
	var swallowInfoList: Array = SaveGameManager.GetSaveGameData_Archive_TaskList_Swallow()
	if not swallowInfoList.empty():
		var swallowInfo: Dictionary = swallowInfoList.back()
		AddSaveGameData_Archive_TaskList(swallowInfo.wrangleDialogTypeID_Swallow, TableManager.WRANGLEDIALOGTYPEID_SWALLOW_INVALID)

func GetSaveGameData_Archive_TaskList_SwallowActionIsStart() -> bool:
	return IsHasSaveGameData_Archive_TaskList_TaskInfoByWrangleDialogTypeIDAndlastChoiceWrangleDialogTypeID(TableManager.WRANGLEDIALOGTYPEID_SWALLOW_ACTION_IS_START, TableManager.WRANGLEDIALOGTYPEID_SWALLOW_ACTION_IS_START)

func SetSaveGameData_Archive_TaskList_SwallowActionIsStart():
	AddSaveGameData_Archive_TaskList(TableManager.WRANGLEDIALOGTYPEID_SWALLOW_ACTION_IS_START, TableManager.WRANGLEDIALOGTYPEID_SWALLOW_ACTION_IS_START)

func SetSaveGameData_Archive_TaskList_SwallowActionIsStartNo():
	AddSaveGameData_Archive_TaskList(TableManager.WRANGLEDIALOGTYPEID_SWALLOW_ACTION_IS_START, TableManager.WRANGLEDIALOGTYPEID_SWALLOW_ACTION_IS_START_NO)

func GetSaveGameData_Archive_TaskList_SwallowActionIsFinish() -> bool:
	return IsHasSaveGameData_Archive_TaskList_TaskInfoByWrangleDialogTypeIDAndlastChoiceWrangleDialogTypeID(TableManager.WRANGLEDIALOGTYPEID_SWALLOW_Action_IS_FINISH, TableManager.WRANGLEDIALOGTYPEID_SWALLOW_Action_IS_FINISH)

func SetSaveGameData_Archive_TaskList_SwallowActionIsFinish():
	AddSaveGameData_Archive_TaskList(TableManager.WRANGLEDIALOGTYPEID_SWALLOW_Action_IS_FINISH, TableManager.WRANGLEDIALOGTYPEID_SWALLOW_Action_IS_FINISH)

func SetSaveGameData_Archive_TaskList_SwallowActionIsFinishNo():
	AddSaveGameData_Archive_TaskList(TableManager.WRANGLEDIALOGTYPEID_SWALLOW_Action_IS_FINISH, TableManager.WRANGLEDIALOGTYPEID_SWALLOW_Action_IS_FINISH_NO)
