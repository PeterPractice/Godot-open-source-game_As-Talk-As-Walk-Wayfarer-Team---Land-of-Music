extends TileMap

const BASE_LINE_WIDTH: float = 3.0
const DRAW_COLOR: Color = HQH.COLORPALETTE_SCENE.COLOR_NAVIGATION_POINT

onready var footprint1 = $footprint1

func _ready():
	HideFootprint()

func _draw():
	var isPathPointVisible: bool = false
	if HQH.IS_DEBUG:
		isPathPointVisible = DebugManager.GetTileMapDebugData_navigationPathPointVisible() 
	
	var pathInWorld: Array = NavigationManager.GetPathInWorld()
	if isPathPointVisible:
		for current_point in pathInWorld:
			draw_circle(current_point, BASE_LINE_WIDTH * 2.0, DRAW_COLOR)
	
	if pathInWorld.empty():
		HideFootprint()
	else:
		var newPosition: Vector2 = pathInWorld[pathInWorld.size() - 1]
		ShowFootprint(newPosition)

func ShowFootprint(newPosition:Vector2):
	footprint1.visible = true
	footprint1.position = newPosition
	
	var aStarNavigationDirection: int = NavigationManager.GetAStarNavigationDirection()
	if NavigationManager.ASTAR_NAVIGATION_DIRECTION_TYPE.TOWARD_DOWN == aStarNavigationDirection:
		# toward down
		footprint1.rotation_degrees = 180.0
	elif NavigationManager.ASTAR_NAVIGATION_DIRECTION_TYPE.TOWARD_LEFT == aStarNavigationDirection:
		# toward left
		footprint1.rotation_degrees = -90.0
	elif NavigationManager.ASTAR_NAVIGATION_DIRECTION_TYPE.TOWARD_RIGHT == aStarNavigationDirection:
		# toward right
		footprint1.rotation_degrees = 90.0
	else:
		# toward up
		footprint1.rotation_degrees = 0.0

func HideFootprint():
	footprint1.visible = false
