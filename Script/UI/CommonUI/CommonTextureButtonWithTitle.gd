extends "res://Script/UI/CommonUI/CommonTextureButtonWithLabel.gd"

onready var titleLabelCenter = $titleLabelCenter

func SetCenterText(s: String):
	titleLabelCenter.text = s
