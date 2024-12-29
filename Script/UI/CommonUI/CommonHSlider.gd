extends HSlider

var m_IsFirstObtainFocus: bool = false

func _ready():
	UIManager.SetNewStyleBoxFlat(self, "slider", UIManager.COMMONHSLIDER_STYLE.STYLEBOXFLAT_NORMAL_BG_COLOR, UIManager.COMMONHSLIDER_STYLE.STYLEBOXFLAT_NORMAL_BORDER_WIDTH, UIManager.COMMONHSLIDER_STYLE.STYLEBOXFLAT_NORMAL_BORDER_COLOR, UIManager.COMMONHSLIDER_STYLE.STYLEBOXFLAT_NORMAL_CORNER_RADIUS)
	UIManager.SetNewStyleBoxFlat(self, "grabber_area_highlight", UIManager.COMMONHSLIDER_STYLE.STYLEBOXFLAT_FOCUS_BG_COLOR3, UIManager.COMMONHSLIDER_STYLE.STYLEBOXFLAT_FOCUS_BORDER_WIDTH, UIManager.COMMONHSLIDER_STYLE.STYLEBOXFLAT_FOCUS_BORDER_COLOR3, UIManager.COMMONHSLIDER_STYLE.STYLEBOXFLAT_FOCUS_CORNER_RADIUS)

func _process(_delta: float):
	if has_focus():
		if not m_IsFirstObtainFocus:
			m_IsFirstObtainFocus = true
			
			AudioManager.PlayByName_ButtonPressed()
	else:
		m_IsFirstObtainFocus = false

func Set_IsFirstObtainFocus_false():
	m_IsFirstObtainFocus = false
