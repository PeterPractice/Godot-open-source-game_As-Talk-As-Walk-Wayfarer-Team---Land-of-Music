extends Node

var m_IsAStarCanRun: bool = false

onready var astar_node: AStar2D = AStar2D.new()
var _point_path: PoolVector2Array = []
var m_PathInWorld: Array = []
var _half_cell_size: Vector2 = Vector2(64, 64)
var path_start_position: Vector2 = Vector2.ZERO
var path_end_position: Vector2 = Vector2.ZERO
var m_TileMapGround: TileMap = null
var m_TileMapGroundUsedCells: Array = []
var m_TileMapGroundUsedRect: Rect2 = Rect2(Vector2.ZERO, Vector2.ZERO)
var m_TileMapNavigation: TileMap = null
var m_TileMapCollision: TileMap = null
var m_TileMapCollisionUsedCells: Array = []
enum ASTAR_NAVIGATION_DIRECTION_TYPE {
	TOWARD_UP,
	TOWARD_DOWN,
	TOWARD_LEFT,
	TOWARD_RIGHT,
}
var m_AStarNavigationDirection: int = ASTAR_NAVIGATION_DIRECTION_TYPE.TOWARD_UP

func CheckIsAStarCanRun():
	if SaveGameManager.IsGoodsUsedHas_Foot():
		SetIsAStarCanRun(true)
	else:
		SetIsAStarCanRun(false)

func GetIsAStarCanRun() -> bool:
	return m_IsAStarCanRun

func SetIsAStarCanRun(isAStarCanRun: bool):
	m_IsAStarCanRun = isAStarCanRun
	
	UIManager.SetIsUIPanelHadConsumed_Event_FocusClick(false)

func IsAStarGroundValid() -> bool:
	return (m_TileMapGround and m_TileMapNavigation and m_TileMapCollision)

func AStarCookData():
	astar_node.clear()
	_point_path = []
	m_PathInWorld = []
	
	m_TileMapGround = SceneManager.GetCurrentSceneTileMapGround()
	m_TileMapNavigation = SceneManager.GetCurrentSceneTileMapNavigation()
	m_TileMapCollision = SceneManager.GetCurrentSceneTileMapCollision()
	if IsAStarGroundValid():
		m_TileMapGroundUsedCells = m_TileMapGround.get_used_cells()
		m_TileMapGroundUsedRect = m_TileMapGround.get_used_rect()
		_half_cell_size = m_TileMapGround.cell_size / 2
		m_TileMapCollisionUsedCells = m_TileMapCollision.get_used_cells()
		var walkable_cells_list: Array = astar_add_walkable_cells(m_TileMapGroundUsedCells, m_TileMapCollisionUsedCells)
		astar_connect_walkable_cells(walkable_cells_list)
		
		HQH.Log("AStarCookData, point count: %s" % astar_node.get_point_count())

func calculate_point_index(point: Vector2) -> int:
	# AStar point index(ID) can't work with negative value
	var pointTemp: Vector2 = point - m_TileMapGroundUsedRect.position
	return int(pointTemp.x + (m_TileMapGroundUsedRect.size.x * pointTemp.y))

func is_outside_map_bounds(point: Vector2) -> bool:
	return not(point in m_TileMapGroundUsedCells)

# Loops through all cells within the map's bounds and
# adds all points to the astar_node, except the obstacles.
func astar_add_walkable_cells(groundList: Array, obstacle_list: Array) -> Array:
	var points_array: Array = []
	for point in groundList:
		if point in obstacle_list:
			continue
		
		points_array.append(point)
		# The AStar class references points with indices.
		# Using a function to calculate the index from a point's coordinates
		# ensures we always get the same index with the same input point.
		var point_index: int = calculate_point_index(point)
		# AStar works for both 2d and 3d, so we have to convert the point
		# coordinates from and to Vector3s.
#		astar_node.add_point(point_index, Vector3(point.x, point.y, 0.0))
		astar_node.add_point(point_index, Vector2(point.x, point.y))
	
	return points_array

# Once you added all points to the AStar node, you've got to connect them.
# The points don't have to be on a grid: you can use this class
# to create walkable graphs however you'd like.
# It's a little harder to code at first, but works for 2d, 3d,
# orthogonal grids, hex grids, tower defense games...
func astar_connect_walkable_cells(points_array: Array):
	for point in points_array:
		var point_index: int = calculate_point_index(point)
		# For every cell in the map, we check the one to the top, right.
		# left and bottom of it. If it's in the map and not an obstalce.
		# We connect the current point with it.
		var points_relative: PoolVector2Array = PoolVector2Array([
			point + Vector2.RIGHT,
			point + Vector2.LEFT,
			point + Vector2.DOWN,
			point + Vector2.UP,
		])
		for point_relative in points_relative:
			var point_relative_index: int = calculate_point_index(point_relative)
			if is_outside_map_bounds(point_relative):
				continue
			
			if not astar_node.has_point(point_relative_index):
				continue
			
			# Note the 3rd argument. It tells the astar_node that we want the
			# connection to be bilateral: from point A to B and B to A.
			# If you set this value to false, it becomes a one-way path.
			# As we loop through all points we can set it to false.
			astar_node.connect_points(point_index, point_relative_index, false)

func IsValidPathPosition(value: Vector2) -> bool:
	if value in m_TileMapCollisionUsedCells:
		return false
	
	if is_outside_map_bounds(value):
		return false
	
	return true

func _recalculate_path():
	var start_point_index: int = calculate_point_index(path_start_position)
	var end_point_index: int = calculate_point_index(path_end_position)
	# This method gives us an array of points. Note you need the start and
	# end points' indices as input.
	_point_path = astar_node.get_point_path(start_point_index, end_point_index)

func get_astar_path(world_start: Vector2, world_end: Vector2):
	m_PathInWorld = []
	
	var worldStartInMap: Vector2 = m_TileMapGround.world_to_map(world_start)
	if not IsValidPathPosition(worldStartInMap):
		HQH.Log("Not Valid Path Start Position")
		
		UIManager.DownPanel_AddJournalRecordWithStringKey("CURRENT_STANDING_POSITION_CANNOT_START_PATHFINDING")
		
		return
	
	var worldEndInMap: Vector2 = m_TileMapGround.world_to_map(world_end)
	if not IsValidPathPosition(worldEndInMap):
		HQH.Log("Not Valid Path End Position")
		
		UIManager.DownPanel_AddJournalRecordWithStringKey("NAVIGATIONMANAGER_NOT_VALID_PATH_END_POSITION")
		
		return
	
	self.path_start_position = worldStartInMap
	self.path_end_position = worldEndInMap
	_recalculate_path()
	
	for index in range(1, len(_point_path)):
		var point_world: Vector2 = m_TileMapGround.map_to_world(Vector2(_point_path[index].x, _point_path[index].y)) + _half_cell_size
		m_PathInWorld.append(point_world)

func DisposeInput(event: InputEvent):
#	HQH.Log("NavigationManager.DisposeInput")
	if not GetIsAStarCanRun():
		return
	
	if event.is_action_pressed("focus_click"):
		HQH.Log("NavigationManager.DisposeInput, GetIsUIPanelHadConsumed_Event_FocusClick")
		if UIManager.GetIsUIPanelHadConsumed_Event_FocusClick():
			UIManager.SetIsUIPanelHadConsumed_Event_FocusClick(false)
			
			return
		
		HQH.Log("NavigationManager.DisposeInput, focus_click")
		if IsAStarGroundValid():
			var currentActiveAvatar: KinematicBody2DAvatar = AvatarManager.GetCurrentActiveAvatarInstance()
			var world_start: Vector2 = currentActiveAvatar.position
			var global_mouse_pos: Vector2 = currentActiveAvatar.get_global_mouse_position()
			get_astar_path(world_start, global_mouse_pos)
			
			if AStarIsBegin():
				HQH.Log("Navigation Begin")
				
				AudioManager.PlayByName_NavigationBegin()
				
				var navigationDirection: Vector2 = self.path_end_position - self.path_start_position
#				HQH.Log("navigationDirection: %s" % navigationDirection)
				if 0 > navigationDirection.y:
					# toward up
					if 0 > navigationDirection.x:
						# toward left
#						HQH.Log("toward up left")
						if abs(navigationDirection.x) > abs(navigationDirection.y):
#							HQH.Log("TOWARD_LEFT")
							m_AStarNavigationDirection = ASTAR_NAVIGATION_DIRECTION_TYPE.TOWARD_LEFT
						else:
#							HQH.Log("TOWARD_UP")
							m_AStarNavigationDirection = ASTAR_NAVIGATION_DIRECTION_TYPE.TOWARD_UP
					else:
						# toward right
#						HQH.Log("toward up right")
						if abs(navigationDirection.x) > abs(navigationDirection.y):
#							HQH.Log("TOWARD_RIGHT")
							m_AStarNavigationDirection = ASTAR_NAVIGATION_DIRECTION_TYPE.TOWARD_RIGHT
						else:
#							HQH.Log("TOWARD_UP")
							m_AStarNavigationDirection = ASTAR_NAVIGATION_DIRECTION_TYPE.TOWARD_UP
				else:
					# toward down
					if 0 > navigationDirection.x:
						# toward left
#						HQH.Log("toward down left")
						if abs(navigationDirection.x) > abs(navigationDirection.y):
#							HQH.Log("TOWARD_LEFT")
							m_AStarNavigationDirection = ASTAR_NAVIGATION_DIRECTION_TYPE.TOWARD_LEFT
						else:
#							HQH.Log("TOWARD_DOWN")
							m_AStarNavigationDirection = ASTAR_NAVIGATION_DIRECTION_TYPE.TOWARD_DOWN
					else:
						# toward right
#						HQH.Log("toward down right")
						if abs(navigationDirection.x) > abs(navigationDirection.y):
#							HQH.Log("TOWARD_RIGHT")
							m_AStarNavigationDirection = ASTAR_NAVIGATION_DIRECTION_TYPE.TOWARD_RIGHT
						else:
#							HQH.Log("TOWARD_DOWN")
							m_AStarNavigationDirection = ASTAR_NAVIGATION_DIRECTION_TYPE.TOWARD_DOWN
			
			CallTileMapNavigationDraw()
			SceneManager.ResetPathInWorldCurrentUsedIndex()

func GetPathInWorld() -> Array:
	return m_PathInWorld

func CallTileMapNavigationDraw():
	if is_instance_valid(m_TileMapNavigation):
		m_TileMapNavigation.update()

func AStarIsBegin() -> bool:
	return not m_PathInWorld.empty()

func AStarEnd():
	if AStarIsBegin():
		HQH.Log("Navigation End")
		
		m_PathInWorld = []
		CallTileMapNavigationDraw()

func GetAStarNavigationDirection() -> int:
	return m_AStarNavigationDirection
