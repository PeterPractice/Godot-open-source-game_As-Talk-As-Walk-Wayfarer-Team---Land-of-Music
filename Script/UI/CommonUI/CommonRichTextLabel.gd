extends RichTextLabel

export var fontColorType: int = 1

func _ready():
	UIManager.ApplyFontColorType(self, "default_color", fontColorType)
	
	UIManager.ControlSetCommonScroll(self)

func AddText(s: String):
	self.append_bbcode(s)

func AddNewLine():
	self.newline()

func GetLineCount() -> int:
	return self.get_line_count()

func RemoveLine(line: int) -> bool:
	return self.remove_line(line)

func _on_CommonRichTextLabel_meta_clicked(meta):
	AudioManager.PlayByName_ButtonPressed()
	
	UIManager.UIInputActionEventHandle(meta)

func _on_CommonRichTextLabel_meta_hover_started(_meta):
	AudioManager.PlayByName_ButtonHover()

func SetFontColorType(fontColorTypeValue: int):
	fontColorType = fontColorTypeValue
