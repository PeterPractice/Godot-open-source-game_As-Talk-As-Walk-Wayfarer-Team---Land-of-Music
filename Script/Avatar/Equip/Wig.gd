extends "res://Script/Avatar/Equip/Equip.gd"

const HAIR_COLOR_MIN: float = 0.0
const HAIR_COLOR_MAX: float = 1.0
var m_HairColor_R: float = HAIR_COLOR_MIN
var m_HairColor_G: float = HAIR_COLOR_MIN
var m_HairColor_B: float = HAIR_COLOR_MIN
const HAIR_COLOR_STEP_MIN: float = 0.001
const HAIR_COLOR_STEP_MAX: float = 0.1
var m_HairColor_R_Step: float = 0.1
var m_HairColor_G_Step: float = 0.01
var m_HairColor_B_Step: float = 0.001
var m_IsChangingColor: bool = false

func SetHairColorStep():
	m_HairColor_R_Step = HQH.RandomModRangeFloat(HAIR_COLOR_STEP_MIN, HAIR_COLOR_STEP_MAX)
	m_HairColor_G_Step = HQH.RandomModRangeFloat(HAIR_COLOR_STEP_MIN, HAIR_COLOR_STEP_MAX)
	m_HairColor_B_Step = HQH.RandomModRangeFloat(HAIR_COLOR_STEP_MIN, HAIR_COLOR_STEP_MAX)

func SetHairColorBase(hairColor: Color):
	for iv in self.get_children():
		for iiv in iv.get_children():
			for iiiv in iiv.get_children():
				if iiiv is Line2D:
					iiiv.default_color = hairColor

func SetHairColor(equipTypeID: int):
	var equipTypeIDString: String = String(equipTypeID)
	var valueString = TableManager.TableGetValue_EquipTable1_Base(equipTypeIDString, TableManager.EQUIPTABLE1_DATA_INDEX_COLOR)
	if HQH.COLORPALETTE_EQUIP_COLOR_CHANGING_COLOR == valueString:
		m_IsChangingColor = true
		SetHairColorStep()
	else:
		var colorString: String = TableManager.TableGetValue_EquipTable1_ColorString(equipTypeIDString)
		SetHairColorBase(Color(colorString))

func _process(_delta: float):
	if m_IsChangingColor:
		m_HairColor_R += m_HairColor_R_Step
		if HAIR_COLOR_MAX < m_HairColor_R:
			m_HairColor_R = HAIR_COLOR_MIN
		
		m_HairColor_G += m_HairColor_G_Step
		if HAIR_COLOR_MAX < m_HairColor_G:
			m_HairColor_G = HAIR_COLOR_MIN
		
		m_HairColor_B += m_HairColor_B_Step
		if HAIR_COLOR_MAX < m_HairColor_B:
			m_HairColor_B = HAIR_COLOR_MIN
		
		var hairColor: Color = Color(m_HairColor_R, m_HairColor_G, m_HairColor_B)
		SetHairColorBase(hairColor)
