extends LinkButton
class_name CommonLinkButton

var m_IsPlayAudio_Pressed: bool = true
var m_IsFirstHovered: bool = false

func _ready():
	self.add_color_override("font_color", UIManager.COMMONLINKBUTTON_STYLE.FONT_COLOR)
	self.add_color_override("font_color_hover", UIManager.COMMONLINKBUTTON_STYLE.FONT_COLOR_HOVER)
	self.add_color_override("font_color_pressed", UIManager.COMMONLINKBUTTON_STYLE.FONT_COLOR_PRESSED)

func _pressed():
	if m_IsPlayAudio_Pressed:
		AudioManager.PlayByName_ButtonPressed()

func _process(_delta: float):
	if is_hovered():
		if not m_IsFirstHovered:
			m_IsFirstHovered = true
			
			AudioManager.PlayByName_ButtonHover()
	else:
		m_IsFirstHovered = false
