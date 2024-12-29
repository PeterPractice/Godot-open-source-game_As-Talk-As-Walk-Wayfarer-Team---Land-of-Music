extends Control

export var isCircle: bool = true # true: is Cirlce. false: is Square.
export var tileSize: Vector2 = Vector2(300.0, 300.0)
export var waterColor: Color = HQH.COLORPALETTE_SCENE.COLOR_WATER # Color(0.262745, 0.333333, 0.349019, 1.0)
export var water2Color: Color = HQH.COLORPALETTE_SCENE.COLOR_WATER2 # Color(0.2078431, 0.274509, 0.301960, 1.0)
export var foamColor: Color = HQH.COLORPALETTE_SCENE.COLOR_WATER_FOAM # Color(0.396078, 0.466666, 0.482352, 1.0)
export var timeFactor: Vector2 = Vector2(1.0, 1.0)
export var offsetFactor = Vector2(1.0, 1.0)
export var amplitude = Vector2(0.05, 0.05)
export var directionX: int = 1 # Rang: 1, or -1 
export var directionY: int = 1 # Rang: 1, or -1

onready var colorRectCircle = $colorRectCircle
onready var colorRectSquare = $colorRectSquare

var m_ColorRectCurrent: ColorRect = null

func _ready():
	SetWater()

func SetWater():
	if isCircle:
		colorRectCircle.visible = true
		colorRectSquare.visible = false
		
		m_ColorRectCurrent = colorRectCircle
	else:
		colorRectCircle.visible = false
		colorRectSquare.visible = true
		
		m_ColorRectCurrent = colorRectSquare
	
	m_ColorRectCurrent.rect_size = self.rect_size
	
	m_ColorRectCurrent.material.set_shader_param("tile", m_ColorRectCurrent.rect_size / tileSize)
	
	m_ColorRectCurrent.material.set_shader_param("WATER_COL", waterColor)
	m_ColorRectCurrent.material.set_shader_param("WATER2_COL", water2Color)
	m_ColorRectCurrent.material.set_shader_param("FOAM_COL", foamColor)
	m_ColorRectCurrent.material.set_shader_param("time_factor", timeFactor)
	m_ColorRectCurrent.material.set_shader_param("offset_factor", offsetFactor)
	m_ColorRectCurrent.material.set_shader_param("amplitude", amplitude)
	m_ColorRectCurrent.material.set_shader_param("directionX", directionX)
	m_ColorRectCurrent.material.set_shader_param("directionX", directionX)

func SetRandom():
	var randomD2: int = HQH.RandomD2()
	
	var TILESIZE_MIN: int = 100
	var TILESIZE_MAX: int = 500
	tileSize.x = HQH.RandomModRange(TILESIZE_MIN, TILESIZE_MAX)
	tileSize.y = tileSize.x
	HQH.Log("SuanLaTang, tileSize: %s" % tileSize)
	
	var WATERCOLOR_MIN: int = HQH.COLORPALETTE_SCENE.COLOR_WATER.b * 255 - 10
	var WATERCOLOR_MAX: int = HQH.COLORPALETTE_SCENE.COLOR_WATER.b * 255 + 30
	waterColor.b = HQH.RandomModRange(WATERCOLOR_MIN, WATERCOLOR_MAX) / float(255)
	HQH.Log("SuanLaTang, waterColor.b: %s(%s)" % [waterColor.b, waterColor.b * float(255)])

	var WATER2COLOR_MIN: int = HQH.COLORPALETTE_SCENE.COLOR_WATER2.b * 255 - 10
	var WATER2COLOR_MAX: int = HQH.COLORPALETTE_SCENE.COLOR_WATER2.b * 255 + 30
	water2Color.b = HQH.RandomModRange(WATER2COLOR_MIN, WATER2COLOR_MAX) / float(255)
	HQH.Log("SuanLaTang, water2Color.b: %s(%s)" % [water2Color.b, water2Color.b * float(255)])
	
	var FOAMCOLOR_MIN: int = HQH.COLORPALETTE_SCENE.COLOR_WATER_FOAM.b * 255 - 10
	var FOAMCOLOR_MAX: int = HQH.COLORPALETTE_SCENE.COLOR_WATER_FOAM.b * 255 + 10
	foamColor.b = HQH.RandomModRange(FOAMCOLOR_MIN, FOAMCOLOR_MAX) / float(255)
	HQH.Log("SuanLaTang, foamColor.b: %s(%s)" % [foamColor.b, foamColor.b * float(255)])
	
	var TIMEFACTOR_MIN: int = 8
	var TIMEFACTOR_MAX: int = 12
	var TIMEFACTOR_MULTIPLE: int = 10
	timeFactor.x = HQH.RandomModRange(TIMEFACTOR_MIN, TIMEFACTOR_MAX) / float(TIMEFACTOR_MULTIPLE)
	timeFactor.y = timeFactor.x
	HQH.Log("SuanLaTang, timeFactor: %s" % timeFactor)
	
	var OFFSETFACTOR_MIN: int = 20
	var OFFSETFACTOR_MAX: int = 30
	offsetFactor.x = HQH.RandomModRange(OFFSETFACTOR_MIN, OFFSETFACTOR_MAX)
	offsetFactor.y = offsetFactor.x
	HQH.Log("SuanLaTang, offsetFactor: %s" % offsetFactor)
	
	randomD2 = HQH.RandomD2()
	if 0 == randomD2:
		directionX = 1
	else:
		directionX = -1
	
	HQH.Log("SuanLaTang, directionX: %s" % directionX)
	
	randomD2 = HQH.RandomD2()
	if 0 == randomD2:
		directionY = 1
	else:
		directionY = -1
	
	HQH.Log("SuanLaTang, directionY: %s" % directionY)
	
	SetWater()
	
	HQH.Log("SuanLaTang, end SetRandom")
