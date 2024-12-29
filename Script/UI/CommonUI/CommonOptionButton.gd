extends OptionButton

var m_IsPlayAudio_Pressed: bool = true
var m_IsFirstHovered: bool = false

func _ready():
	UIManager.SetNewStyleBoxFlat(self, "normal", UIManager.COMMONOPTIONBUTTON_STYLE.STYLEBOXFLAT_NORMAL_BG_COLOR, UIManager.COMMONOPTIONBUTTON_STYLE.STYLEBOXFLAT_NORMAL_BORDER_WIDTH, UIManager.COMMONOPTIONBUTTON_STYLE.STYLEBOXFLAT_NORMAL_BORDER_COLOR, UIManager.COMMONOPTIONBUTTON_STYLE.STYLEBOXFLAT_NORMAL_CORNER_RADIUS)
	UIManager.SetNewStyleBoxFlat(self, "hover", UIManager.COMMONOPTIONBUTTON_STYLE.STYLEBOXFLAT_HOVER_BG_COLOR, UIManager.COMMONOPTIONBUTTON_STYLE.STYLEBOXFLAT_HOVER_BORDER_WIDTH, UIManager.COMMONOPTIONBUTTON_STYLE.STYLEBOXFLAT_HOVER_BORDER_COLOR, UIManager.COMMONOPTIONBUTTON_STYLE.STYLEBOXFLAT_HOVER_CORNER_RADIUS)
	UIManager.SetNewStyleBoxFlat(self, "pressed", UIManager.COMMONOPTIONBUTTON_STYLE.STYLEBOXFLAT_PRESSED_BG_COLOR, UIManager.COMMONOPTIONBUTTON_STYLE.STYLEBOXFLAT_PRESSED_BORDER_WIDTH, UIManager.COMMONOPTIONBUTTON_STYLE.STYLEBOXFLAT_PRESSED_BORDER_COLOR, UIManager.COMMONOPTIONBUTTON_STYLE.STYLEBOXFLAT_PRESSED_CORNER_RADIUS)
	UIManager.SetNewStyleBoxFlat(self, "focus", UIManager.COMMONOPTIONBUTTON_STYLE.STYLEBOXFLAT_FOCUS_BG_COLOR, UIManager.COMMONOPTIONBUTTON_STYLE.STYLEBOXFLAT_FOCUS_BORDER_WIDTH, UIManager.COMMONOPTIONBUTTON_STYLE.STYLEBOXFLAT_FOCUS_BORDER_COLOR, UIManager.COMMONOPTIONBUTTON_STYLE.STYLEBOXFLAT_FOCUS_CORNER_RADIUS)
	
	self.add_color_override("font_color", UIManager.COMMONOPTIONBUTTON_STYLE.FONT_COLOR)
	self.add_color_override("font_color_hover", UIManager.COMMONOPTIONBUTTON_STYLE.FONT_COLOR_HOVER)
	self.add_color_override("font_color_pressed", UIManager.COMMONOPTIONBUTTON_STYLE.FONT_COLOR_PRESSED)
	
	var preloadResource: Resource = TableManager.Get_PRELOAD_RESOURCE_MAP("Font")
	var popupMenu: PopupMenu = self.get_popup()
	popupMenu.set("custom_fonts/font", preloadResource)
	popupMenu.add_color_override("font_color", UIManager.COMMONOPTIONBUTTON_STYLE.FONT_COLOR)
	popupMenu.add_color_override("font_color_hover", UIManager.COMMONOPTIONBUTTON_STYLE.FONT_COLOR_HOVER)
	UIManager.SetNewStyleBoxFlat(popupMenu, "hover", UIManager.COMMONOPTIONBUTTON_STYLE.STYLEBOXFLAT_HOVER_BG_COLOR, UIManager.COMMONOPTIONBUTTON_STYLE.STYLEBOXFLAT_HOVER_BORDER_WIDTH, UIManager.COMMONOPTIONBUTTON_STYLE.STYLEBOXFLAT_HOVER_BORDER_COLOR, UIManager.COMMONOPTIONBUTTON_STYLE.STYLEBOXFLAT_HOVER_CORNER_RADIUS)
	UIManager.SetNewStyleBoxFlat(popupMenu, "panel", UIManager.COMMONOPTIONBUTTON_STYLE.STYLEBOXFLAT_NORMAL_BG_COLOR, UIManager.COMMONOPTIONBUTTON_STYLE.STYLEBOXFLAT_NORMAL_BORDER_WIDTH, UIManager.COMMONOPTIONBUTTON_STYLE.STYLEBOXFLAT_NORMAL_BORDER_COLOR, UIManager.COMMONOPTIONBUTTON_STYLE.STYLEBOXFLAT_NORMAL_CORNER_RADIUS)

func _pressed():
	if m_IsPlayAudio_Pressed:
		AudioManager.PlayByName_ButtonPressed()

func SetPlayAudio_Pressed_false():
	m_IsPlayAudio_Pressed = false

func _process(_delta: float):
	if is_hovered():
		if not m_IsFirstHovered:
			m_IsFirstHovered = true
			
			AudioManager.PlayByName_ButtonHover()
	else:
		m_IsFirstHovered = false