extends TextureButton

var m_IsPlayAudio_Pressed: bool = true
var m_IsPlayAudio_Hover: bool = true
var m_IsFirstHovered: bool = false

var m_PressedAudioType: int = AudioManager.BUTTON_PRESSED_AUDIO_TYPE.NONE

func _pressed():
	if m_IsPlayAudio_Pressed:
		AudioManager.ButtonPressedPlayByType(m_PressedAudioType)

func SetPlayAudio_Pressed_false():
	m_IsPlayAudio_Pressed = false
	
func SetPlayAudio_Hover_false():
	m_IsPlayAudio_Hover = false

func _process(_delta: float):
	if is_hovered():
		if not m_IsFirstHovered:
			m_IsFirstHovered = true
			
			if m_IsPlayAudio_Hover:
				AudioManager.PlayByName_ButtonHover()
	else:
		m_IsFirstHovered = false

func SetPressedAudioType(pressedAudioType: int):
	m_PressedAudioType = pressedAudioType
