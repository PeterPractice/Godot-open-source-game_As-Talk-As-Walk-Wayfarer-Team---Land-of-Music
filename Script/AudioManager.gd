extends Node

const BGMUSIC_PITCH_SCALE_INIT: float = HQH.SCALE_INIT
const BGMUSIC_PITCH_SCALE_MIN: float = HQH.SCALE_MIN
const BGMUSIC_PITCH_SCALE_MAX: float = HQH.SCALE_MAX

enum BUTTON_PRESSED_AUDIO_TYPE {
	NONE,
	ITEM_PRESSED,
	INTERACTION,
	PLAYCHESS,
	JOURNALRECORD,
	BAG,
}

onready var m_BGMusic: AudioStreamPlayer = AudioStreamPlayer.new()
onready var m_SoundEffect: AudioStreamPlayer = AudioStreamPlayer.new()
onready var m_SoundEffectPlay1Hit: AudioStreamPlayer = AudioStreamPlayer.new()

var m_BGMusic_CurrentValue: float = HQH.AUDIO_MIN_VALUE
var m_BGMusic_EndValue: float = HQH.MUSIC_VALUE_DEFAULT
var m_BGMusic_TimeOfDuration: float = 5
var m_BGMusic_IsPrint_StartEndCurrentValue: bool = false
var BGMUSIC_WAITTIMERSTEP_MIN: int = 3 * 60 # in seconds
var BGMUSIC_WAITTIMERSTEP_MAX: int = 10 * 60 # in seconds
var m_BGMusic_WaitTimerStep: float = 0.0
var m_BGMusic_WaitTimer: float = 0.0

func _ready():
	self.add_child(m_BGMusic)
	self.add_child(m_SoundEffect)
	self.add_child(m_SoundEffectPlay1Hit)
	
	var musicIsMute: bool = SaveGameManager.GetSaveData_option_musicIsMute()
	var musicValue: int = 0
	if not musicIsMute:
		musicValue = SaveGameManager.GetSaveData_option_musicValue()
	
	SetVolumeSize_Music(musicValue)
	
	var soundEffectIsMute: bool = SaveGameManager.GetSaveData_option_soundEffectIsMute()
	var soundEffectValue: int = 0
	if not soundEffectIsMute:
		soundEffectValue = SaveGameManager.GetSaveData_option_soundEffectValue()
	
	SetVolumeSize_SoundEffect(soundEffectValue)

func _process(delta: float):
	if SceneManager.GetIsInBootScene():
		return
	
	if SceneManager.GetIsBeginChangeToScene():
		return
	
	if m_BGMusic.playing:
		var BGMusic_DifferentValue: float = m_BGMusic_EndValue - m_BGMusic_CurrentValue
		if HQH.FLOAT_EPSILON < BGMusic_DifferentValue:
			if m_BGMusic_IsPrint_StartEndCurrentValue:
				if HQH.AUDIO_MIN_VALUE == m_BGMusic_CurrentValue:
					HQH.Log("Start change m_BGMusic_CurrentValue: %s" % m_BGMusic_CurrentValue)
			
			var BGMusic_StepValue: float = BGMusic_DifferentValue * (delta / m_BGMusic_TimeOfDuration)
			SetVolumeSize_BGMusic_CurrentValue(m_BGMusic_CurrentValue + BGMusic_StepValue)
			
			if m_BGMusic_IsPrint_StartEndCurrentValue:
				BGMusic_DifferentValue = m_BGMusic_EndValue - m_BGMusic_CurrentValue
				if not(HQH.FLOAT_EPSILON < BGMusic_DifferentValue):
					HQH.Log("End change m_BGMusic_CurrentValue: %s" % m_BGMusic_CurrentValue)
	else:
		if m_BGMusic.stream:
			m_BGMusic_WaitTimer += delta
			if m_BGMusic_WaitTimerStep < m_BGMusic_WaitTimer:
				CheckPlayBGMusic()

func StopBGMusic():
	HQH.Log("AudioManager, StopBGMusic")
	
	m_BGMusic.stop()

func CheckPlayBGMusic():
	var isCanPlayBGMusic: bool = HQH.RandomBool()
	var sceneClinkerValleyInfo: Dictionary = UIManager.GetSceneClinkerValleyInfo()
	if SceneManager.IsInHubScene() or sceneClinkerValleyInfo.isCloseEye:
		isCanPlayBGMusic = true
	
	if isCanPlayBGMusic:
		PlayBGMusic()
	
	m_BGMusic_WaitTimerStep = HQH.RandomModRange(BGMUSIC_WAITTIMERSTEP_MIN, BGMUSIC_WAITTIMERSTEP_MAX)
	m_BGMusic_WaitTimer = 0.0

func PlayBGMusic():
	HQH.Log("AudioManager, PlayBGMusic")
	
	SetVolumeSize_BGMusic_CurrentValue(HQH.AUDIO_MIN_VALUE)
	m_BGMusic.play()

func PlayByName(audioName: String):
	HQH.Log("PlayByName, audioName: %s" % audioName, 10 * HQH.MILLISECOND_NUMBER)
	
	if audioName.empty():
		HQH.Log("PlayByName, audioName is empty")
		
		return
	
	var preloadResource: Resource = TableManager.Get_PRELOAD_RESOURCE_MAP(audioName)
	var audioInfo: Dictionary = TableManager.GetInfoByName_AUDIO_INFO_LIST(audioName)
	if audioInfo.empty():
		return
	
	if IsBGMusic(audioInfo):
		preloadResource.loop = false
		m_BGMusic.set_stream(preloadResource)
		
		CheckPlayBGMusic()
	elif IsPlay1Hit(audioInfo):
		preloadResource.loop = false
		m_SoundEffectPlay1Hit.set_stream(preloadResource)
		m_SoundEffectPlay1Hit.play()
	else:
		preloadResource.loop = false
		m_SoundEffect.set_stream(preloadResource)
		m_SoundEffect.play()

func PlayByIndex(index: int):
	var audioName: String = TableManager.GetNameByIndex_AUDIO_INFO_LIST_keys(index)
	if not audioName.empty():
		PlayByName(audioName)

func IsBGMusic(audioInfo: Dictionary) -> bool:
	if audioInfo.empty():
		return false
	
	if not audioInfo.has("isBGMusic"):
		return false
	
	return audioInfo.isBGMusic

func IsPlay1Hit(audioInfo: Dictionary) -> bool:
	if audioInfo.empty():
		return false
	
	if not audioInfo.has("isPlay1Hit"):
		return false
	
	return audioInfo.isPlay1Hit

func VolumeSizeToVolumeDb(volumeSize: int) -> float:
	return linear2db(float(volumeSize) / float(HQH.AUDIO_MAX_VALUE))
	
func SetVolumeSize_Music(volumeSize: int):
	var volumeSizeTemp: int = GetClampVolumeSize(volumeSize)
	m_BGMusic_EndValue = volumeSizeTemp
	SetVolumeSize_BGMusic_CurrentValue(volumeSizeTemp)

func SetVolumeSize_SoundEffect(volumeSize: int):
	var volumeSizeTemp: int = GetClampVolumeSize(volumeSize)
	var volume_db: float = VolumeSizeToVolumeDb(volumeSizeTemp)
	m_SoundEffect.volume_db = volume_db
	m_SoundEffectPlay1Hit.volume_db = volume_db

func SetVolumeSize_BGMusic_CurrentValue(volumeSize: float):
	m_BGMusic_CurrentValue = volumeSize
	m_BGMusic.volume_db = VolumeSizeToVolumeDb(int(m_BGMusic_CurrentValue))

func GetClampVolumeSize(volumeSize: int) -> int:
	return int(clamp(volumeSize, HQH.AUDIO_MIN_VALUE, HQH.AUDIO_MAX_VALUE))

func PlayByName_ButtonPressed():
	PlayByName("Audio_projector-button-push-6258_4")

func PlayByName_ButtonHover():
	PlayByName("Audio_fast-simple-chop-5-6270")

func ButtonPressedPlayByType(buttonPressedAudioType: int):
	match buttonPressedAudioType:
		AudioManager.BUTTON_PRESSED_AUDIO_TYPE.ITEM_PRESSED:
			AudioManager.PlayByName_ButtonItemPressed()
		
		AudioManager.BUTTON_PRESSED_AUDIO_TYPE.INTERACTION:
			AudioManager.PlayByName_Interaction()
		
		AudioManager.BUTTON_PRESSED_AUDIO_TYPE.PLAYCHESS:
			AudioManager.PlayByName_PlayChess()
		
		AudioManager.BUTTON_PRESSED_AUDIO_TYPE.JOURNALRECORD:
			AudioManager.PlayByName_JournalRecord()
		
		AudioManager.BUTTON_PRESSED_AUDIO_TYPE.BAG:
			AudioManager.PlayByName_Bag()
		
		_:
			PlayByName_ButtonPressed()

func PlayByName_ButtonItemPressed():
	PlayByName("Audio_065594_coach-whistle-88613_2")

func PlayByName_Interaction():
	PlayByName("Audio_grunt-106134")

func PlayByName_PlayChess():
	PlayByName("Audio_ceramic_mug_cup-31808_2")

func PlayByName_JournalRecord():
	PlayByName("Audio_turning-pages-in-a-book-96504_2")

func PlayByName_Bag():
	PlayByName("Audio_zipping-pencil-case-37454_2")

func SetBGMusic_pitch_scale(pitch_scale: float):
	m_BGMusic.pitch_scale = clamp(pitch_scale, BGMUSIC_PITCH_SCALE_MIN, BGMUSIC_PITCH_SCALE_MAX)

func SetBGMusic_pitch_scale_Init():
	SetBGMusic_pitch_scale(BGMUSIC_PITCH_SCALE_INIT)

func PlayByName_PlayChessDiceChange():
	PlayByName("Audio_dice_shake-96201")

func PlayByName_PlayChessSuccess():
	PlayByName("Audio_hybrid-monster-growl-90325")

func PlayByName_PlayChessFailure():
	PlayByName("Audio_stingers-001-6294")

func PlayByName_NavigationBegin():
	PlayByName("Audio_steps-in-corridor-104456_2")

func PlayByName_OpenDoor():
	PlayByName("Audio_door-open-close-45475_2")

func PlayByName_OpenHomeDoor():
	PlayByName("Audio_dorm-door-opening-6038")

func PlayByName_CloseDoor():
	PlayByName("Audio_door-opening-and-closing-18398_2")
