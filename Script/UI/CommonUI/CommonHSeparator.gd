extends HSeparator

func _ready():
	UIManager.SetNewStyleBoxLine(self, "separator", UIManager.COMMONHSEPARATOR_STYLE.STYLEBOXLINE_SEPARATOR_COLOR, UIManager.COMMONHSEPARATOR_STYLE.STYLEBOXLINE_SEPARATOR_THICKNESS)
