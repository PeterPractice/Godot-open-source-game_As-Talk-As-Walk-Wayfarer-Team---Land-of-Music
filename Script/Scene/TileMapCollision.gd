extends TileMap

func _ready():
	if HQH.IS_DEBUG:
		self.visible = DebugManager.GetTileMapDebugData_collisionVisible()
	else:
		self.visible = false

func SetVisible(isVisible: bool):
	self.visible = isVisible
