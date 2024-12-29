extends Label
class_name CommonLabel

export var fontColorType: int = 1

func _ready():
	UIManager.ApplyFontColorType(self, "font_color", fontColorType)
	
	UIManager.SetDynamicFontProperties(self)

func SetFontColorType(fontColorTypeValue: int):
	fontColorType = fontColorTypeValue

func SetColor(newColor: Color):
	self.add_color_override("font_color", newColor)
