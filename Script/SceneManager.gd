extends Node

const SIMULATED_DELAY_SEC: int = 200
var m_Thread:Thread = null

var m_IsPrintInputEvent: bool = false
var m_CurrentInputMotionDirection: Vector2 = Vector2.ZERO
const MOTION_SPEED: float = 160.0 # Pixels/second.
const AVATAR_MOTION_SPEED_SCALE_INIT: float = HQH.SCALE_INIT
const AVATAR_MOTION_SPEED_SCALE_MIN: float = HQH.SCALE_MIN
const AVATAR_MOTION_SPEED_SCALE_MAX: float = HQH.SCALE_MAX
var m_AvatarMotionSpeedScale: float = AVATAR_MOTION_SPEED_SCALE_INIT
const MOTION_LENGTH_SQUARED_MIN_60: float = stepify(MOTION_SPEED / HQH.PHYSICS_PROCESS_FRAME_NUMBER, 0.1) # From MOTION_SPEED, 160.0/60 is 2.7
const MOTION_LENGTH_SQUARED_MIN_30: float = stepify(MOTION_SPEED / HQH.VIEW_PROCESS_FRAME_NUMBER, 0.1) # From MOTION_SPEED, 160.0/30 is 5.3
var m_PathInWorldCurrentUsedIndex: int = 0

var m_IsShowLoadingScenePanel: bool = true
var m_IsInBootScene: bool = true # true: in BootScene. false: not in BootScene.游戏启动时，一定是启动BootScene，BootScene只会被启动一次。
var m_IsBootSceneRunFinished: bool = false # true: BootScene run finished. false: BootScene in run.

var m_IsBeginChangeToScene: bool = false # true: begin change scene. false: not change scene.
var m_CurrentSceneTypeID: int = TableManager.SCENETYPEID_HUB
var m_CurrentSceneShowName: String = ""

var m_LoadingSceneStartTimeInMilliseconds: int = 0
var m_LoadingSceneEndTimeInMilliseconds: int = 0

var m_IsCanHandleCurrentInputMotionDirection: bool = true
const ISCANHANDLECURRENTINPUTMOTIONDIRECTION_AVATAR_CAN_NOT_MOVE_TIMER_STEP: float = 1.0
var m_IsCanHandleCurrentInputMotionDirection_AVATAR_CAN_NOT_MOVE_Timer: float = ISCANHANDLECURRENTINPUTMOTIONDIRECTION_AVATAR_CAN_NOT_MOVE_TIMER_STEP

const CHANGE_SCENE_FROM_TRIGGER_INFO: Dictionary = {
	"changeToSceneTypeID": 0,
	"changeSceneToTriggerTypeID": 0,
}
var m_ChangeSceneFromTriggerInfo: Dictionary = CHANGE_SCENE_FROM_TRIGGER_INFO.duplicate(true)

var m_DoorOpened_NPCArticleTriggerTypeIDList: Array = []

const UPDATE_SCENE_INFO: Dictionary = {
	"isProducedNPC": false,
}
var m_UpdateSceneInfo: Dictionary = UPDATE_SCENE_INFO.duplicate()

func _ready():
	var currentSceneName: String = get_tree().current_scene.name
	m_CurrentSceneTypeID = TableManager.GetSceneTypeID(currentSceneName)
	HQH.Log("InitSceneTypeID: %s, InitSceneName: %s" % [m_CurrentSceneTypeID, currentSceneName])
	
	set_process_input(true)
	
	AvatarManager.InitCurrentActiveAvatarInfoList()

func _input(event: InputEvent):
	if m_IsInBootScene:
		return
	
	if m_IsBeginChangeToScene:
		return
	
	DebugManager.DisposeInput(event)
	UIManager.DisposeInput(event)
	NavigationManager.DisposeInput(event)
	
	if m_IsPrintInputEvent:
		HQH.Log("_input, event.as_text(): %s" % event.as_text())

func _thread_load(path: String):
	var ril: ResourceInteractiveLoader = ResourceLoader.load_interactive(path)
	if not is_instance_valid(ril):
		HQH.AssertLog("_thread_load, not has path: %s" % path)
	
	if m_IsShowLoadingScenePanel:
		var total: int = ril.get_stage_count()
		# Call deferred to configure max load steps.
		UIManager.LoadingScenePanel_SetMax(total)
	
	var res: Resource = null
	
	while true: #iterate until we have a resource
		if m_IsShowLoadingScenePanel:
			# Update progress bar, use call deferred, which routes to main thread.
			UIManager.LoadingScenePanel_SetValue(ril.get_stage())
		
		# Simulate a delay.
		OS.delay_msec(SIMULATED_DELAY_SEC)
		# Poll (does a load step).
		var err = ril.poll()
		# If OK, then load another one. If EOF, it' s done. Otherwise there was an error.
		if err == ERR_FILE_EOF:
			# Loading done, fetch resource.
			res = ril.get_resource()
			break
		elif err != OK:
			# Not OK, there was an error.
			HQH.Log("There was an error loading")
			break
	
	# Send whathever we did (or did not) get.
	call_deferred("_thread_done", res)

func _thread_done(resource: Resource):
	if not is_instance_valid(resource):
		HQH.AssertLog("_thread_done, load resource failed")
	
	# Always wait for threads to finish, this required on Windows.
	m_Thread.wait_to_finish()
	
	if m_IsShowLoadingScenePanel:
		# Hide the progress bar.
		UIManager.LoadingScenePanel_Hide()
	
	HQH.Log("SceneManager._thread_done")
	
	# Instantiate new scene.
	var new_scene = resource.instance()
	# Free current scene.
	get_tree().current_scene.free()
	get_tree().current_scene = null
	# Add new one to root.
	get_tree().root.add_child(new_scene)
	# Set as current scene.
	get_tree().current_scene = new_scene
	
	m_IsBeginChangeToScene = false
	EndChangeToScene()

func SetIsShowLoadingScenePanel(isShowLoadingScenePanel: bool):
	m_IsShowLoadingScenePanel = isShowLoadingScenePanel
	
func _loadScene(sceneName: String):
	var scenePath: String = "res://Scene/%s.tscn" % sceneName
	m_Thread = Thread.new()
	m_Thread.start(self, "_thread_load", scenePath)
	
	if m_IsShowLoadingScenePanel:
		UIManager.LoadingScenePanel_Show()

func _loadSceneBySceneTypeID(sceneTypeID: int):
	var sceneName: String = ""
	if TableManager.IsHasSceneInfo(sceneTypeID):
		sceneName = TableManager.GetSceneName(sceneTypeID)
	
	if not sceneName.empty():
		HQH.Log("_loadSceneBySceneTypeID, sceneTypeID: %s, sceneName: %s" % [sceneTypeID, sceneName])
		_loadScene(sceneName)
	else:
		HQH.Log("_loadSceneBySceneTypeID, not found sceneTypeID: %s" % sceneTypeID)

func ChangeToSceneBySceneTypeID(changeToSceneTypeID: int):
	HQH.Log("ChangeToSceneBySceneTypeID, begin load scene， changeToSceneTypeID: %s" % [changeToSceneTypeID])
	
	if not TableManager.IsHasSceneInfo(changeToSceneTypeID):
		HQH.Log("Not has changeToSceneTypeID: %s" % [changeToSceneTypeID])
		
		return
	
	if m_IsBeginChangeToScene:
		HQH.Log("ChangeToSceneBySceneTypeID, began， do not load again changeToSceneTypeID: %s" % [changeToSceneTypeID])
		
		return
	
	m_IsBeginChangeToScene = true
	BeginChangeToScene(changeToSceneTypeID)
	m_CurrentSceneTypeID = changeToSceneTypeID
	_loadSceneBySceneTypeID(changeToSceneTypeID)

func GetCurrentSceneTypeID() -> int:
	return m_CurrentSceneTypeID

func GetIsBeginChangeToScene() -> bool:
	return m_IsBeginChangeToScene

func BeginChangeToScene(changeToSceneTypeID: int):
	HQH.Log("BeginChangeToScene, changeToSceneTypeID: %s, m_CurrentSceneTypeID: %s" % [changeToSceneTypeID, m_CurrentSceneTypeID])
	
	m_CurrentSceneShowName = ""
	m_LoadingSceneStartTimeInMilliseconds = HQH.MilliTime()
	AudioManager.StopBGMusic()
	CameraManager.UnmountCurrentCamera()
	UIManager.BeginChangeToScene(changeToSceneTypeID)

func EndChangeToScene():
	HQH.Log("EndChangeToScene, m_CurrentSceneTypeID: %s" % m_CurrentSceneTypeID)
	
	m_LoadingSceneEndTimeInMilliseconds = HQH.MilliTime()
	
	var currentSceneShowNameKey: String = TableManager.GetSceneShowNameKey(m_CurrentSceneTypeID)
	if not currentSceneShowNameKey.empty():
		var currentSceneShowName: String = TableManager.GetLanguageString(currentSceneShowNameKey)
		if not currentSceneShowName.empty():
			m_CurrentSceneShowName = currentSceneShowName
			if not m_CurrentSceneShowName.empty():
				if UIManager.UpNamePanel_IsVisible():
					UIManager.UpNamePanel_ShowUpName(m_CurrentSceneShowName)
				
				if UIManager.DownPanel_IsVisible():
					UIManager.DownPanel_AddJournalRecord(TableManager.GetLanguageString("CURRENTSCENESHOWNAME_ENTER") % (TableManager.DISPLAY_SCENE_NAME % m_CurrentSceneShowName))
	
	NavigationManager.AStarCookData()
	NavigationManager.CheckIsAStarCanRun()
	
	if IsInHubScene():
		var archive_AvatarList: Array = SaveGameManager.GetSaveGameData_Archive_AvatarList()
		if archive_AvatarList.empty():
			AvatarManager.SpawnAvatarTransparent()
		else:
			AvatarManager.SpawnAvatar(true)
	else:
		var spawnAvatarPosition: Vector2 = Vector2.INF
		if 0 < m_ChangeSceneFromTriggerInfo.changeSceneToTriggerTypeID:
			var node2DChangeSceneTrigger: Node2D = SceneManager.GetCurrentSceneNode2DChangeSceneTrigger()
			if is_instance_valid(node2DChangeSceneTrigger):
				for iv in node2DChangeSceneTrigger.get_children():
					if iv is ChangeSceneToTrigger:
						HQH.Log("iv.GetChangeSceneToTriggerTypeID(): %s, iv.position: %s" % [iv.GetChangeSceneToTriggerTypeID(), iv.position])
						if m_ChangeSceneFromTriggerInfo.changeSceneToTriggerTypeID == iv.GetChangeSceneToTriggerTypeID():
							spawnAvatarPosition = iv.position
							
							break
		
		if HQH.IS_DEBUG:
			var avatarPositionDebugData: Dictionary = DebugManager.GetAvatarPositionDebugData()
			if 0 < avatarPositionDebugData.sceneTypeID:
				spawnAvatarPosition = avatarPositionDebugData.avatarPosition
		
		if IsDebugSceneTypeID(m_CurrentSceneTypeID):
			spawnAvatarPosition = Vector2.ZERO
		
		HQH.Log("EndChangeToScene, spawnAvatarPosition: %s" % spawnAvatarPosition)
		AvatarManager.SpawnAvatar(true, [], spawnAvatarPosition)
		SaveAvatarPosition(spawnAvatarPosition)
	
	ResetChangeSceneFromTriggerInfo()
	
	CurrentScenePlayBGMusic()
	
	TileMapWarFog_SetAvatarVisualFieldSharpType_AvatarVisualFieldSharpType_FromSaveGameData_Archive()
	
	Clear_DoorOpened_NPCArticleTriggerTypeIDList()

func SaveAvatarPosition(spawnAvatarPosition: Vector2):
	var archive_AvatarList: Array = SaveGameManager.GetSaveGameData_Archive_AvatarList()
	for iv in archive_AvatarList:
		var avatarTypeID: int = iv.avatarTypeID
		var avatarSceneTypeID: int = GetCurrentSceneTypeID()
		var avatarPositionX: float = 0.0
		var avatarPositionY: float = 0.0
		if not spawnAvatarPosition.is_equal_approx(Vector2.INF):
			avatarPositionX = spawnAvatarPosition.x
			avatarPositionY = spawnAvatarPosition.y
		else:
			avatarPositionX = iv.avatarPositionX
			avatarPositionY = iv.avatarPositionY
		
		SaveGameManager.UpdateSaveGameData_Archive_AvatarListByAvatarTypeID_Position(avatarTypeID, avatarSceneTypeID, avatarPositionX, avatarPositionY)

func SaveAvatarPositionByCurrentActiveAvatarPosition():
	SaveAvatarPosition(AvatarManager.GetCurrentActiveAvatarPosition())

func GetCurrentSceneShowName() -> String:
	return m_CurrentSceneShowName

func ResetChangeSceneFromTriggerInfo():
	m_ChangeSceneFromTriggerInfo = CHANGE_SCENE_FROM_TRIGGER_INFO.duplicate(true)

func ChangeSceneFromTrigger(changeToSceneTypeID: int, changeSceneToTriggerTypeID: int):
	HQH.Log("ChangeSceneFromTrigger, changeToSceneTypeID: %s, changeSceneToTriggerTypeID: %s" % [changeToSceneTypeID, changeSceneToTriggerTypeID])
	
	m_ChangeSceneFromTriggerInfo.changeToSceneTypeID = changeToSceneTypeID
	m_ChangeSceneFromTriggerInfo.changeSceneToTriggerTypeID = changeSceneToTriggerTypeID
	
	ChangeToSceneBySceneTypeID(changeToSceneTypeID)

func HideAllAvatarOutlineAndTips():
	if SceneManager.IsCurrentSceneNode2DAvatarValid():
		var node2DAvatarChildren: Array = SceneManager.GetCurrentSceneNode2DAvatarChildren()
		for iv in node2DAvatarChildren:
			iv.HideOutline()
	
	UIManager.UpNamePanel_HideTipsByAvatarTypeID(true, 0)

func CheckIsCurrentInputMotionDirectionAbsGreaterThan0():
	if HQH.IsVector2AbsGreaterThan0(m_CurrentInputMotionDirection):
		HideAllAvatarOutlineAndTips()

func _physics_process(delta: float):
	if m_IsInBootScene:
		return
	
	if m_IsBeginChangeToScene:
		return
	
	if not IsCurrentSceneNode2DAvatarValid():
		return
	
	if IsInHubScene():
		return
	
	m_CurrentInputMotionDirection = GetInputMotionDirection()
	CheckIsCurrentInputMotionDirectionAbsGreaterThan0()
	
	if m_IsCanHandleCurrentInputMotionDirection:
		m_IsCanHandleCurrentInputMotionDirection_AVATAR_CAN_NOT_MOVE_Timer = ISCANHANDLECURRENTINPUTMOTIONDIRECTION_AVATAR_CAN_NOT_MOVE_TIMER_STEP
		if (not UIManager.IsNoFullScreenPanelVisible()) or UIManager.GetIsInPlayChess() or (not UIManager.IsCanMoveSwallowAction()):
			# When any full screen panel show, or in play chess status, avatar can not move
			m_CurrentInputMotionDirection = Vector2.ZERO
	else:
#		HQH.Log("m_CurrentInputMotionDirection is %s" % m_CurrentInputMotionDirection)
		if HQH.IsVector2AbsGreaterThan0(m_CurrentInputMotionDirection):
			m_IsCanHandleCurrentInputMotionDirection_AVATAR_CAN_NOT_MOVE_Timer += delta
			if ISCANHANDLECURRENTINPUTMOTIONDIRECTION_AVATAR_CAN_NOT_MOVE_TIMER_STEP < m_IsCanHandleCurrentInputMotionDirection_AVATAR_CAN_NOT_MOVE_Timer:
				m_IsCanHandleCurrentInputMotionDirection_AVATAR_CAN_NOT_MOVE_Timer = 0.0
				UIManager.DownPanel_AddJournalRecordWithStringKey("AVATAR_CAN_NOT_MOVE")
		
		m_CurrentInputMotionDirection = Vector2.ZERO
	
	AvatarManager.DisposeCurrentSceneAllAvatarPhysicsProcess(delta)
	AvatarManager.DisposeCurrentSceneAllNPCPhysicsProcess(delta)

func ResetPathInWorldCurrentUsedIndex():
	m_PathInWorldCurrentUsedIndex = 0

func GetIsCanHandleCurrentInputMotionDirection() -> bool:
	return m_IsCanHandleCurrentInputMotionDirection

func SetIsCanHandleCurrentInputMotionDirection(isCanHandle: bool):
	m_IsCanHandleCurrentInputMotionDirection = isCanHandle

func GetInputMotionDirection() -> Vector2:
	# Keyboard button input to move
	var motion: Vector2 = Vector2(Input.get_action_strength("move_right") - Input.get_action_strength("move_left"),
			Input.get_action_strength("move_down") - Input.get_action_strength("move_up")
	)
	if HQH.IsVector2AbsGreaterThan0(motion):
		NavigationManager.AStarEnd()
	
	# Mouse focus click input to navigation
	var pathInWorld: Array = NavigationManager.GetPathInWorld()
	if m_PathInWorldCurrentUsedIndex < pathInWorld.size():
		var pathPointInWorld: Vector2 = pathInWorld[m_PathInWorldCurrentUsedIndex]
		var currentActiveAvatar: KinematicBody2DAvatar = AvatarManager.GetCurrentActiveAvatarInstance()
		motion = pathPointInWorld - currentActiveAvatar.position
		var motion_length_squared: float = motion.length_squared()
#		HQH.Log("motion: %s, motion_length_squared: %s" % [motion, motion_length_squared])
		if MOTION_LENGTH_SQUARED_MIN_60 > motion_length_squared:
			m_PathInWorldCurrentUsedIndex = m_PathInWorldCurrentUsedIndex + 1
			if m_PathInWorldCurrentUsedIndex < pathInWorld.size():
				pathPointInWorld = pathInWorld[m_PathInWorldCurrentUsedIndex]
				motion = pathPointInWorld - currentActiveAvatar.position
				if HQH.IS_DEBUG:
					motion_length_squared = motion.length_squared()
					if MOTION_LENGTH_SQUARED_MIN_60 > motion_length_squared:
						HQH.AssertLog("pathPointInWorld should not so close to currentActiveAvatar.position")
			else:
				# Arrived final point
				motion = Vector2.ZERO
				NavigationManager.AStarEnd()
	
	return motion.normalized()

func GetCurrentInputMotionDirection() -> Vector2:
	return m_CurrentInputMotionDirection

func GetCurrentSceneNode2DAvatarName() -> String:
	return TableManager.GetNode2DAvatarName(m_CurrentSceneTypeID)

func GetCurrentSceneNode2DNPCName() -> String:
	return TableManager.GetNode2DNPCName(m_CurrentSceneTypeID)

func CurrentScenePlayBGMusic():
	HQH.Log("CurrentScenePlayBGMusic")
	
	AudioManager.PlayByName(TableManager.GetBGMusicName(m_CurrentSceneTypeID))

func IsInGameScene() -> bool:
	return (not m_IsInBootScene) and (not m_IsBeginChangeToScene) and (not IsInHubScene())

func IsInHubScene() -> bool:
	return IsHubSceneTypeID(m_CurrentSceneTypeID)

func IsHubSceneTypeID(sceneTypeID: int) -> bool:
	return TableManager.SCENETYPEID_HUB == sceneTypeID

func IsDebugSceneTypeID(sceneTypeID: int) -> bool:
	return (TableManager.SCENETYPEID_DEBUG1 == sceneTypeID) or (TableManager.SCENETYPEID_DEBUG2 == sceneTypeID)

func IsCanShowDownPanelAndOtherHangPanels(sceneTypeID: int) -> bool:
	return not(IsHubSceneTypeID(sceneTypeID) or IsDebugSceneTypeID(sceneTypeID))
	
func IsCurrentSceneNodeValid(nodeName: String) -> bool:
	if not is_instance_valid(get_tree().current_scene):
		return false
	
	if not get_tree().current_scene.has_node(nodeName):
		return false
	
	return true

func GetCurrentScene() -> Node:
	if not is_instance_valid(get_tree().current_scene):
		return null
	
	return get_tree().current_scene

func GetUpdateSceneInfo() -> Dictionary:
	return m_UpdateSceneInfo

func SetUpdateSceneInfo(isProducedNPC: bool):
	m_UpdateSceneInfo.isProducedNPC = isProducedNPC
	
func UpdateCurrentScene():
	GetCurrentScene().UpdateScene()

func GetCurrentSceneNode(nodeName: String) -> Node:
	if not IsCurrentSceneNodeValid(nodeName):
		return null
	
	return get_tree().current_scene.get_node(nodeName)

func GetCurrentSceneTileMapGround() -> Node:
	return GetCurrentSceneNode(TableManager.SCENELAYER_TILEMAPGROUND_NAME)

func IsCurrentSceneTileMapCollisionValid() -> bool:
	return IsCurrentSceneNodeValid(TableManager.SCENELAYER_TILEMAPCOLLISION_NAME)

func GetCurrentSceneTileMapCollision() -> Node:
	return GetCurrentSceneNode(TableManager.SCENELAYER_TILEMAPCOLLISION_NAME)

func GetCurrentSceneTileMapNavigation() -> Node:
	return GetCurrentSceneNode(TableManager.SCENELAYER_TILEMAPNAVIGATION_NAME)

func GetCurrentSceneTileMapWarFog() -> Node:
	return GetCurrentSceneNode(TableManager.SCENELAYER_TILEMAPWARFOG_NAME)

func GetCurrentSceneNode2DChangeSceneTrigger() -> Node:
	return GetCurrentSceneNode(TableManager.SCENELAYER_NODE2DCHANGESCENETRIGGER_NAME)

func IsCurrentSceneNode2DAvatarValid() -> bool:
	return IsCurrentSceneNodeValid(GetCurrentSceneNode2DAvatarName())

func GetCurrentSceneNode2DAvatar() -> Node:
	return GetCurrentSceneNode(GetCurrentSceneNode2DAvatarName())

func GetCurrentSceneNode2DAvatarChildren() -> Array:
	var node2DAvatar: Node = GetCurrentSceneNode2DAvatar()
	return node2DAvatar.get_children()

func GetCurrentSceneNode2DAvatarChildrenSize() -> int:
	var node2DAvatarChildren: Array = GetCurrentSceneNode2DAvatarChildren()
	return node2DAvatarChildren.size()

func IsCurrentSceneNode2DNPCValid() -> bool:
	return IsCurrentSceneNodeValid(GetCurrentSceneNode2DNPCName())

func GetCurrentSceneNode2DNPC() -> Node:
	return GetCurrentSceneNode(GetCurrentSceneNode2DNPCName())

func GetCurrentSceneNode2DNPCChildren() -> Array:
	var node2DNPC: Node = GetCurrentSceneNode2DNPC()
	return node2DNPC.get_children()

func GetCurrentSceneNode2DNPCChildrenSize() -> int:
	var node2DNPCChildren: Array = GetCurrentSceneNode2DNPCChildren()
	return node2DNPCChildren.size()

func GetIndex_From_CurrentSceneNode2DAvatarChildren(avatarObjectID: int) -> int:
	var index: int = -1
	var i: int = 0
	var node2DAvatarChildren: Array = GetCurrentSceneNode2DAvatarChildren()
	for iv in node2DAvatarChildren:
		if avatarObjectID == iv.GetAvatarObjectID():
			index = i
			
			break
		
		i = i + 1
	
	return index

func GetIsPrintInputEvent() -> bool:
	return m_IsPrintInputEvent

func SetIsPrintInputEvent(isPrintInputEvent: bool):
	m_IsPrintInputEvent = isPrintInputEvent

func HubScene_OnReady():
	var isFirstTimeSaveGameData: bool = SaveGameManager.GetIsFirstTimeSaveGameData()
	if isFirstTimeSaveGameData:
		UIManager.LanguagePanel_Show()
	else:
		UIManager.StartGamePanel_Show()

func SetIsInBootScene_false():
	m_IsInBootScene = false

func GetIsInBootScene() -> bool:
	return m_IsInBootScene

func BootScene_OnReady():
	var videoResolutionRatioInfo: Dictionary = UIManager.GetVideoResolutionRatioInfo()
	var width: int = videoResolutionRatioInfo.videoResolutionRatio.width
	var height: int = videoResolutionRatioInfo.videoResolutionRatio.height
	var isFullScreen: bool = SaveGameManager.GetSaveData_option_windowIsFullScreen()
	var projectSettings_fullscreen: bool = ProjectSettings.get_setting("display/window/size/fullscreen")
	if not projectSettings_fullscreen:
		HQH.AssertLog("projectSettings_fullscreen should always be true")
	
	if projectSettings_fullscreen != isFullScreen:
		HQH.SetVideoResolutionRatio(isFullScreen, width, height)
		if OS.is_debug_build():
			var newScreenIndex: int = 1
			HQH.Log("Set window to the other side screen, newScreenIndex: %s" % [newScreenIndex])
			OS.set_current_screen(newScreenIndex)
		else:
			HQH.Log("Set window to the center of the screen")
			var screenSize: Vector2 = OS.get_screen_size()
			var windowSize: Vector2 = OS.get_window_size()
			OS.set_window_position((screenSize * 0.5) - (windowSize * 0.5))
	
	var projectSettings_stretch_mode: String = ProjectSettings.get_setting("display/window/stretch/mode")
	if "disabled" != projectSettings_stretch_mode: # SceneTree.STRETCH_MODE_DISABLED is default
		HQH.AssertLog("projectSettings_stretch_mode should always be disabled(SceneTree.STRETCH_MODE_DISABLED)")
	
	var isWindowStretch: bool = SaveGameManager.GetSaveData_option_windowIsWindowStretch()
	HQH.Log("VideoResolution, isFullScreen: %s, width: %s, height: %s, isWindowStretch: %s" % [isFullScreen, width, height, isWindowStretch])
	if isWindowStretch:
		SetWindowStretch(true)

func BootScene_SetRunFinished():
	if m_IsBootSceneRunFinished:
		return
	
	m_IsBootSceneRunFinished = true
	
	ChangeToSceneBySceneTypeID(TableManager.SCENETYPEID_HUB)

func BootScene_OnExitTree():
	SetIsInBootScene_false()

func GetLoadingSceneTimeInMilliseconds() -> int: 
	if 0 == m_LoadingSceneStartTimeInMilliseconds:
		return 0
	
	if (0 == m_LoadingSceneEndTimeInMilliseconds) or (m_LoadingSceneEndTimeInMilliseconds < m_LoadingSceneStartTimeInMilliseconds):
		return HQH.MilliTime() - m_LoadingSceneStartTimeInMilliseconds
	
	return m_LoadingSceneEndTimeInMilliseconds - m_LoadingSceneStartTimeInMilliseconds

func ShowTileMapCollision(isVisible: bool):
	var tileMapCollision: TileMap = GetCurrentSceneTileMapCollision()
	if is_instance_valid(tileMapCollision):
		tileMapCollision.SetVisible(isVisible)

func ShowTileMapWarFog(isVisible: bool):
	var tileMapWarFog: TileMap = GetCurrentSceneTileMapWarFog()
	if is_instance_valid(tileMapWarFog):
		tileMapWarFog.SetVisible(isVisible)

func TileMapWarFog_SetAvatarVisualFieldDistance(avatarVisualFieldDistance: int):
	var tileMapWarFog: TileMap = GetCurrentSceneTileMapWarFog()
	if is_instance_valid(tileMapWarFog):
		tileMapWarFog.SetAvatarVisualFieldDistance(avatarVisualFieldDistance)

func TileMapWarFog_SetAvatarVisualFieldSharpType(avatarVisualFieldSharpType: int):
	var tileMapWarFog: TileMap = GetCurrentSceneTileMapWarFog()
	if is_instance_valid(tileMapWarFog):
		tileMapWarFog.SetAvatarVisualFieldSharpType(avatarVisualFieldSharpType)

func TileMapWarFog_ResetLastActiveAvatarPositionInMap():
	var tileMapWarFog: TileMap = GetCurrentSceneTileMapWarFog()
	if is_instance_valid(tileMapWarFog):
		tileMapWarFog.ResetLastActiveAvatarPositionInMap()

func TileMapWarFog_SetAvatarVisualFieldSharpType_AvatarVisualFieldSharpType_FromSaveGameData_Archive():
	TileMapWarFog_SetAvatarVisualFieldDistance(SaveGameManager.GetSaveGameData_Archive_VisualFieldDistance())
	TileMapWarFog_SetAvatarVisualFieldSharpType(SaveGameManager.GetSaveGameData_Archive_VisualFieldSharpType())

func SetWindowStretch(isWindowStretch: bool):
	var mode = SceneTree.STRETCH_MODE_DISABLED 
	var minsize: Vector2 = Vector2.ZERO
	if isWindowStretch:
		mode = SceneTree.STRETCH_MODE_2D
		
		var width: int = 0
		var height: int = 0
		if UIManager.OptionPanel_IsVisible():
			var videoInfo: Dictionary = UIManager.OptionPanel_GetInfo_OPTION_PANEL_DATA_TABLE_INFO_videoResolutionRatioList(UIManager.OptionPanel_GetVideoResolutionRatioListCurrentSelectIndex())
			width = videoInfo.videoResolutionRatio.width
			height = videoInfo.videoResolutionRatio.height
		else:
			var videoResolutionRatioInfo: Dictionary = UIManager.GetVideoResolutionRatioInfo()
			width = videoResolutionRatioInfo.videoResolutionRatio.width
			height = videoResolutionRatioInfo.videoResolutionRatio.height
		
		minsize = Vector2(width, height)
	else:
		mode = SceneTree.STRETCH_MODE_DISABLED
		minsize = OS.get_window_size()
	
	HQH.Log("SetWindowStretch, isWindowStretch: %s, mode: %s, minsize: %s" % [isWindowStretch, mode, minsize])
	get_tree().set_screen_stretch(mode, SceneTree.STRETCH_ASPECT_EXPAND, minsize)

func GetAvatarMotionSpeed() -> float:
	return MOTION_SPEED * m_AvatarMotionSpeedScale

func SetAvatarMotionSpeedScale(avatarMotionSpeedScale: float):
	m_AvatarMotionSpeedScale = clamp(avatarMotionSpeedScale, AVATAR_MOTION_SPEED_SCALE_MIN, AVATAR_MOTION_SPEED_SCALE_MAX)

func SetAvatarMotionSpeedScaleInit():
	SetAvatarMotionSpeedScale(AVATAR_MOTION_SPEED_SCALE_INIT)

func Clear_DoorOpened_NPCArticleTriggerTypeIDList():
	m_DoorOpened_NPCArticleTriggerTypeIDList.clear()

func IsHas_DoorOpened_NPCArticleTriggerTypeIDList(nPCArticleTriggerTypeID: int) -> bool:
	return m_DoorOpened_NPCArticleTriggerTypeIDList.has(nPCArticleTriggerTypeID)

func Add_DoorOpened_NPCArticleTriggerTypeIDList(nPCArticleTriggerTypeID: int):
	if not IsHas_DoorOpened_NPCArticleTriggerTypeIDList(nPCArticleTriggerTypeID):
		m_DoorOpened_NPCArticleTriggerTypeIDList.append(nPCArticleTriggerTypeID)
