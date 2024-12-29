extends Button
class_name CommonButton

var m_IsPlayAudio_Pressed: bool = true
var m_IsFirstHovered: bool = false

var m_PressedAudioType: int = AudioManager.BUTTON_PRESSED_AUDIO_TYPE.NONE

func _ready():
	UIManager.SetNewStyleBoxFlat(self, "normal", UIManager.COMMONBUTTON_STYLE.STYLEBOXFLAT_NORMAL_BG_COLOR, UIManager.COMMONBUTTON_STYLE.STYLEBOXFLAT_NORMAL_BORDER_WIDTH, UIManager.COMMONBUTTON_STYLE.STYLEBOXFLAT_NORMAL_BORDER_COLOR, UIManager.COMMONBUTTON_STYLE.STYLEBOXFLAT_NORMAL_CORNER_RADIUS)
	UIManager.SetNewStyleBoxFlat(self, "hover", UIManager.COMMONBUTTON_STYLE.STYLEBOXFLAT_HOVER_BG_COLOR, UIManager.COMMONBUTTON_STYLE.STYLEBOXFLAT_HOVER_BORDER_WIDTH, UIManager.COMMONBUTTON_STYLE.STYLEBOXFLAT_HOVER_BORDER_COLOR, UIManager.COMMONBUTTON_STYLE.STYLEBOXFLAT_HOVER_CORNER_RADIUS)
	UIManager.SetNewStyleBoxFlat(self, "pressed", UIManager.COMMONBUTTON_STYLE.STYLEBOXFLAT_PRESSED_BG_COLOR, UIManager.COMMONBUTTON_STYLE.STYLEBOXFLAT_PRESSED_BORDER_WIDTH, UIManager.COMMONBUTTON_STYLE.STYLEBOXFLAT_PRESSED_BORDER_COLOR, UIManager.COMMONBUTTON_STYLE.STYLEBOXFLAT_PRESSED_CORNER_RADIUS)
	UIManager.SetNewStyleBoxFlat(self, "focus", UIManager.COMMONBUTTON_STYLE.STYLEBOXFLAT_FOCUS_BG_COLOR, UIManager.COMMONBUTTON_STYLE.STYLEBOXFLAT_FOCUS_BORDER_WIDTH, UIManager.COMMONBUTTON_STYLE.STYLEBOXFLAT_FOCUS_BORDER_COLOR, UIManager.COMMONBUTTON_STYLE.STYLEBOXFLAT_FOCUS_CORNER_RADIUS)
	
	self.add_color_override("font_color", UIManager.COMMONBUTTON_STYLE.FONT_COLOR)
	self.add_color_override("font_color_hover", UIManager.COMMONBUTTON_STYLE.FONT_COLOR_HOVER)
	self.add_color_override("font_color_pressed", UIManager.COMMONBUTTON_STYLE.FONT_COLOR_PRESSED)
	
	UIManager.SetDynamicFontProperties(self)

func SetButtonText(textString: String):
	var string_BUTTON_MARGIN_LEFT_RIGHT: String = TableManager.CHARACTER_SPACE
	self.text = "%s%s%s" % [string_BUTTON_MARGIN_LEFT_RIGHT, textString, string_BUTTON_MARGIN_LEFT_RIGHT]

func SetPressedAudioType(pressedAudioType: int):
	m_PressedAudioType = pressedAudioType

func _pressed():
	if m_IsPlayAudio_Pressed:
		AudioManager.ButtonPressedPlayByType(m_PressedAudioType)

func SetPlayAudio_Pressed_false():
	m_IsPlayAudio_Pressed = false

func _process(_delta: float):
	if is_hovered():
		if not m_IsFirstHovered:
			m_IsFirstHovered = true
			
			AudioManager.PlayByName_ButtonHover()
	else:
		m_IsFirstHovered = false
