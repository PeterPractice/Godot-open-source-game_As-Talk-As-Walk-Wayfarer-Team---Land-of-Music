extends TileMap

onready var m_UsedCells: Array = get_used_cells()
enum TILE_INDEX_VISUAL_FIELD_TYPE {
	LUCENCY = -1, # INVALID_CELL
	BLACK = 0,
	TRANSLUCENCE_BLACK = 1,
}
var m_LastActiveAvatarPositionInMap: Vector2  = Vector2.INF
const PROCESS_DELTA_STEP: float = 0.6 # cell width: 64 / SceneManager.MOTION_SPEED: 160, is 0.4. 0.6 is 1.5 cell
var m_ProcessDelta: float = 0.0
var m_AvatarVisualFieldDistance: int = HQH.VISUAL_FIELD_DISTANCE_MIN
var m_AvatarVisualFieldSharpType: int = HQH.VISUAL_FIELD_SHARP_TYPE.RHOMBUS

func GetAvatarVisualFieldRhombus7(avatarPositionInMap: Vector2)-> Array:
	var avatarVisualField: Array = [
		{"visualFieldPosition": Vector2(avatarPositionInMap.x + 0, avatarPositionInMap.y - 3), "visualFieldType": TILE_INDEX_VISUAL_FIELD_TYPE.TRANSLUCENCE_BLACK},
		
		{"visualFieldPosition": Vector2(avatarPositionInMap.x - 1, avatarPositionInMap.y - 2), "visualFieldType": TILE_INDEX_VISUAL_FIELD_TYPE.TRANSLUCENCE_BLACK},
		{"visualFieldPosition": Vector2(avatarPositionInMap.x + 0, avatarPositionInMap.y - 2), "visualFieldType": TILE_INDEX_VISUAL_FIELD_TYPE.LUCENCY},
		{"visualFieldPosition": Vector2(avatarPositionInMap.x + 1, avatarPositionInMap.y - 2), "visualFieldType": TILE_INDEX_VISUAL_FIELD_TYPE.TRANSLUCENCE_BLACK},
		
		{"visualFieldPosition": Vector2(avatarPositionInMap.x - 2, avatarPositionInMap.y - 1), "visualFieldType": TILE_INDEX_VISUAL_FIELD_TYPE.TRANSLUCENCE_BLACK},
		{"visualFieldPosition": Vector2(avatarPositionInMap.x - 1, avatarPositionInMap.y - 1), "visualFieldType": TILE_INDEX_VISUAL_FIELD_TYPE.LUCENCY},
		{"visualFieldPosition": Vector2(avatarPositionInMap.x + 0, avatarPositionInMap.y - 1), "visualFieldType": TILE_INDEX_VISUAL_FIELD_TYPE.LUCENCY},
		{"visualFieldPosition": Vector2(avatarPositionInMap.x + 1, avatarPositionInMap.y - 1), "visualFieldType": TILE_INDEX_VISUAL_FIELD_TYPE.LUCENCY},
		{"visualFieldPosition": Vector2(avatarPositionInMap.x + 2, avatarPositionInMap.y - 1), "visualFieldType": TILE_INDEX_VISUAL_FIELD_TYPE.TRANSLUCENCE_BLACK},
		
		{"visualFieldPosition": Vector2(avatarPositionInMap.x - 3, avatarPositionInMap.y + 0), "visualFieldType": TILE_INDEX_VISUAL_FIELD_TYPE.TRANSLUCENCE_BLACK},
		{"visualFieldPosition": Vector2(avatarPositionInMap.x - 2, avatarPositionInMap.y + 0), "visualFieldType": TILE_INDEX_VISUAL_FIELD_TYPE.LUCENCY},
		{"visualFieldPosition": Vector2(avatarPositionInMap.x - 1, avatarPositionInMap.y + 0), "visualFieldType": TILE_INDEX_VISUAL_FIELD_TYPE.LUCENCY},
		{"visualFieldPosition": Vector2(avatarPositionInMap.x + 0, avatarPositionInMap.y + 0), "visualFieldType": TILE_INDEX_VISUAL_FIELD_TYPE.LUCENCY},
		{"visualFieldPosition": Vector2(avatarPositionInMap.x + 1, avatarPositionInMap.y + 0), "visualFieldType": TILE_INDEX_VISUAL_FIELD_TYPE.LUCENCY},
		{"visualFieldPosition": Vector2(avatarPositionInMap.x + 2, avatarPositionInMap.y + 0), "visualFieldType": TILE_INDEX_VISUAL_FIELD_TYPE.LUCENCY},
		{"visualFieldPosition": Vector2(avatarPositionInMap.x + 3, avatarPositionInMap.y + 0), "visualFieldType": TILE_INDEX_VISUAL_FIELD_TYPE.TRANSLUCENCE_BLACK},
		
		{"visualFieldPosition": Vector2(avatarPositionInMap.x - 2, avatarPositionInMap.y + 1), "visualFieldType": TILE_INDEX_VISUAL_FIELD_TYPE.TRANSLUCENCE_BLACK},
		{"visualFieldPosition": Vector2(avatarPositionInMap.x - 1, avatarPositionInMap.y + 1), "visualFieldType": TILE_INDEX_VISUAL_FIELD_TYPE.LUCENCY},
		{"visualFieldPosition": Vector2(avatarPositionInMap.x + 0, avatarPositionInMap.y + 1), "visualFieldType": TILE_INDEX_VISUAL_FIELD_TYPE.LUCENCY},
		{"visualFieldPosition": Vector2(avatarPositionInMap.x + 1, avatarPositionInMap.y + 1), "visualFieldType": TILE_INDEX_VISUAL_FIELD_TYPE.LUCENCY},
		{"visualFieldPosition": Vector2(avatarPositionInMap.x + 2, avatarPositionInMap.y + 1), "visualFieldType": TILE_INDEX_VISUAL_FIELD_TYPE.TRANSLUCENCE_BLACK},
		
		{"visualFieldPosition": Vector2(avatarPositionInMap.x - 1, avatarPositionInMap.y + 2), "visualFieldType": TILE_INDEX_VISUAL_FIELD_TYPE.TRANSLUCENCE_BLACK},
		{"visualFieldPosition": Vector2(avatarPositionInMap.x + 0, avatarPositionInMap.y + 2), "visualFieldType": TILE_INDEX_VISUAL_FIELD_TYPE.LUCENCY},
		{"visualFieldPosition": Vector2(avatarPositionInMap.x + 1, avatarPositionInMap.y + 2), "visualFieldType": TILE_INDEX_VISUAL_FIELD_TYPE.TRANSLUCENCE_BLACK},
		
		{"visualFieldPosition": Vector2(avatarPositionInMap.x + 0, avatarPositionInMap.y + 3), "visualFieldType": TILE_INDEX_VISUAL_FIELD_TYPE.TRANSLUCENCE_BLACK},
		]
	
	return avatarVisualField

# Min visual field distance is 3
func GetAvatarVisualFieldByDistance(avatarPositionInMap: Vector2, distance: int, VisualFieldSharpType: int)-> Array:
	var avatarVisualField: Array = []
	var halfDistance: int = int(distance * 0.5)
	var OneAndHalfDistance: int = distance + halfDistance
	var modRemain2: int = (distance + 1) % 2
	for i in distance:
		var jNumber: int = 0
		if HQH.VISUAL_FIELD_SHARP_TYPE.EGG == VisualFieldSharpType:
			# Egg
			var xLength: int = int(abs(halfDistance - i))
#			jNumber = distance - (xLength * 2)
#			jNumber = jNumber + (halfDistance - xLength)
			jNumber = OneAndHalfDistance - (xLength * 3)
			if modRemain2 == (jNumber % 2):
				jNumber = jNumber + 1
			
			jNumber = int(min(distance, jNumber))
		else:
			# Rhombus
			jNumber = distance - (int(abs(halfDistance - i)) * 2)
		
		var halfJNumber: int = int(jNumber * 0.5)
		var jNumber_1: int = jNumber - 1
		var offSetY: int = i - halfDistance
		for j in jNumber:
			var offSetX: int = j - halfJNumber
			var visualFieldType: int = TILE_INDEX_VISUAL_FIELD_TYPE.TRANSLUCENCE_BLACK
			if (0 != j) and (jNumber_1 != j):
				visualFieldType = TILE_INDEX_VISUAL_FIELD_TYPE.LUCENCY
			
			avatarVisualField.append({"visualFieldPosition": Vector2(avatarPositionInMap.x + offSetX, avatarPositionInMap.y + offSetY), "visualFieldType": visualFieldType})
	
	return avatarVisualField

func _ready():
	if HQH.IS_DEBUG:
		self.visible = DebugManager.GetTileMapDebugData_warFogVisible()
	else:
		self.visible = true
	
	var sceneTypeID: int = SceneManager.GetCurrentSceneTypeID()
	var cellX: int = 0
	var cellY: int = 0
	var isHas:bool = SaveGameManager.IsHasSaveGameData_Archive_SceneList_SceneInfoBySceneTypeIDCellXCellY(sceneTypeID, cellX, cellY)
	if not isHas:
		SaveGameManager.AddSaveGameData_Archive_SceneList(sceneTypeID, cellX, cellY)
	
	if not m_UsedCells.empty():
		for iv in m_UsedCells:
			isHas = SaveGameManager.IsHasSaveGameData_Archive_SceneList_SceneInfoBySceneTypeIDCellXCellY(sceneTypeID, iv.x, iv.y)
			if isHas:
				set_cellv(iv, TILE_INDEX_VISUAL_FIELD_TYPE.TRANSLUCENCE_BLACK)
	
func _process(delta: float):
	if not self.visible:
		return
	
	if SceneManager.GetIsBeginChangeToScene():
		return
	
	var currentActiveAvatar: KinematicBody2DAvatar = AvatarManager.GetCurrentActiveAvatarInstance()
	if not is_instance_valid(currentActiveAvatar):
		return
	
	if m_UsedCells.empty():
		return
	
	m_ProcessDelta = m_ProcessDelta + delta
	if PROCESS_DELTA_STEP > m_ProcessDelta:
		return
	
	m_ProcessDelta = 0.0
	
	var currentActiveAvatarPositionInMap: Vector2 = world_to_map(currentActiveAvatar.position)
	if not m_LastActiveAvatarPositionInMap.is_equal_approx(currentActiveAvatarPositionInMap):
		m_LastActiveAvatarPositionInMap = currentActiveAvatarPositionInMap
		var currentActiveAvatarVisualField: Array = GetAvatarVisualFieldByDistance(currentActiveAvatarPositionInMap, m_AvatarVisualFieldDistance, m_AvatarVisualFieldSharpType)
		for aVisualField in currentActiveAvatarVisualField:
			var currentPositionVisualFieldType: int = get_cellv(aVisualField.visualFieldPosition)
			if (TILE_INDEX_VISUAL_FIELD_TYPE.BLACK == currentPositionVisualFieldType) or ((TILE_INDEX_VISUAL_FIELD_TYPE.TRANSLUCENCE_BLACK == currentPositionVisualFieldType) and (TILE_INDEX_VISUAL_FIELD_TYPE.LUCENCY == aVisualField.visualFieldType)):
				set_cellv(aVisualField.visualFieldPosition, aVisualField.visualFieldType)
				
				var sceneTypeID: int = SceneManager.GetCurrentSceneTypeID()
				var cellX: int = aVisualField.visualFieldPosition.x
				var cellY: int = aVisualField.visualFieldPosition.y
				SaveGameManager.AddSaveGameData_Archive_SceneList(sceneTypeID, cellX, cellY)

func SetVisible(isVisible: bool):
	self.visible = isVisible

func SetAvatarVisualFieldDistance(avatarVisualFieldDistance: int):
	m_AvatarVisualFieldDistance = avatarVisualFieldDistance

func SetAvatarVisualFieldSharpType(avatarVisualFieldSharpType: int):
	m_AvatarVisualFieldSharpType = avatarVisualFieldSharpType

func ResetLastActiveAvatarPositionInMap():
	m_LastActiveAvatarPositionInMap = Vector2.INF
