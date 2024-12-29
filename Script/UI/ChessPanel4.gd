extends "res://Script/UI/CommonUI/CommonPanel.gd"

onready var control1 = $control1

enum CHESS_TRICK_TYPE {
	POSITIONING,
	POSITIONING_REVERSE,
	POSITIONING2,
	POSITIONING2_REVERSE,
	POSITIONING3,
	POSITIONING3_REVERSE,
	
	MAX,
}
var m_ChessTrickType: int = CHESS_TRICK_TYPE.POSITIONING

const UPDATETIMERSTEP_MIN: float = 0.033
const UPDATETIMERSTEP_MAX: float = 0.1
const UPDATETIMERSTEP_LENGTH: float = UPDATETIMERSTEP_MAX - UPDATETIMERSTEP_MIN
var m_UpdateTimerStep: float = 0.1
var m_UpdateTimer: float = 0.0

var m_POSITIONING_Index: int = 0

func _ready():
	var childrenSize: int = control1.get_children().size()
	for i in childrenSize:
		control1.get_child(i).color = HQH.COLORPALETTE_UI.FONT_COLOR4
	
	m_ChessTrickType = HQH.Rand() % CHESS_TRICK_TYPE.MAX
	
	# Set m_UpdateTimerStep
	var length: float = float(HQH.RandomD10())
	var lengthPercent:float = length / float(HQH.RAND_NUMBER10 - 1)
	m_UpdateTimerStep = UPDATETIMERSTEP_MIN + (UPDATETIMERSTEP_LENGTH * lengthPercent)

func _process(delta: float):
	m_UpdateTimer += delta
	if m_UpdateTimerStep < m_UpdateTimer:
		m_UpdateTimer = 0.0
		
		match m_ChessTrickType:
			CHESS_TRICK_TYPE.POSITIONING:
				Process_POSITIONING()
			
			CHESS_TRICK_TYPE.POSITIONING_REVERSE:
				Process_POSITIONING_REVERSE()
			
			CHESS_TRICK_TYPE.POSITIONING2:
				Process_POSITIONING2()
			
			CHESS_TRICK_TYPE.POSITIONING2_REVERSE:
				Process_POSITIONING2_REVERSE()
				
			CHESS_TRICK_TYPE.POSITIONING3:
				Process_POSITIONING3()
			
			CHESS_TRICK_TYPE.POSITIONING3_REVERSE:
				Process_POSITIONING3_REVERSE()

func Process_POSITIONING():
	var childrenSize: int = control1.get_children().size()
	for i in childrenSize:
		if m_POSITIONING_Index == i:
			control1.get_child(i).color = HQH.COLORPALETTE_UI.FONT_COLOR1
		else:
			control1.get_child(i).color = HQH.COLORPALETTE_UI.FONT_COLOR4
	
	m_POSITIONING_Index += 1
	if childrenSize <= m_POSITIONING_Index:
		m_POSITIONING_Index = 0

func Process_POSITIONING_REVERSE():
	var childrenSize: int = control1.get_children().size()
	for i in childrenSize:
		if m_POSITIONING_Index == i:
			control1.get_child(i).color = HQH.COLORPALETTE_UI.FONT_COLOR1
		else:
			control1.get_child(i).color = HQH.COLORPALETTE_UI.FONT_COLOR4
	
	m_POSITIONING_Index -= 1
	if 0 > m_POSITIONING_Index:
		m_POSITIONING_Index = childrenSize - 1

func Process_POSITIONING2():
	var childrenSize: int = control1.get_children().size()
	var POSITIONING_Index2: int = m_POSITIONING_Index + 1
	if childrenSize <= POSITIONING_Index2:
		POSITIONING_Index2 = 0
	
	for i in childrenSize:
		if (m_POSITIONING_Index == i) or (POSITIONING_Index2 == i):
			control1.get_child(i).color = HQH.COLORPALETTE_UI.FONT_COLOR1
		else:
			control1.get_child(i).color = HQH.COLORPALETTE_UI.FONT_COLOR4
	
	m_POSITIONING_Index += 1
	if childrenSize <= m_POSITIONING_Index:
		m_POSITIONING_Index = 0

func Process_POSITIONING2_REVERSE():
	var childrenSize: int = control1.get_children().size()
	var POSITIONING_Index2: int = m_POSITIONING_Index - 1
	if 0 > POSITIONING_Index2:
		POSITIONING_Index2 = childrenSize - 1
	
	for i in childrenSize:
		if (m_POSITIONING_Index == i) or (POSITIONING_Index2 == i):
			control1.get_child(i).color = HQH.COLORPALETTE_UI.FONT_COLOR1
		else:
			control1.get_child(i).color = HQH.COLORPALETTE_UI.FONT_COLOR4
	
	m_POSITIONING_Index -= 1
	if 0 > m_POSITIONING_Index:
		m_POSITIONING_Index = childrenSize - 1

func Process_POSITIONING3():
	var childrenSize: int = control1.get_children().size()
	for i in childrenSize:
		if m_POSITIONING_Index == i:
			control1.get_child(i).color = HQH.COLORPALETTE_UI.FONT_COLOR4
		else:
			control1.get_child(i).color = HQH.COLORPALETTE_UI.FONT_COLOR1
	
	m_POSITIONING_Index += 1
	if childrenSize <= m_POSITIONING_Index:
		m_POSITIONING_Index = 0

func Process_POSITIONING3_REVERSE():
	var childrenSize: int = control1.get_children().size()
	for i in childrenSize:
		if m_POSITIONING_Index == i:
			control1.get_child(i).color = HQH.COLORPALETTE_UI.FONT_COLOR4
		else:
			control1.get_child(i).color = HQH.COLORPALETTE_UI.FONT_COLOR1
	
	m_POSITIONING_Index -= 1
	if 0 > m_POSITIONING_Index:
		m_POSITIONING_Index = childrenSize - 1
