extends Node2D

onready var control1 = $control1
onready var control3 = $control3
onready var control4 = $control4

const IS_SHOW_NOTE: bool = false

func _ready():
	for iv in control1.get_children():
		iv.color = HQH.COLORPALETTE_SCENE.COLOR_ODETOJOY_BG
		iv.mouse_filter = Control.MOUSE_FILTER_IGNORE
	
	for iv in control3.get_children():
		iv.mouse_filter = Control.MOUSE_FILTER_IGNORE
	
	for iv in control4.get_children():
		iv.color = HQH.COLORPALETTE_SCENE.COLOR_ODETOJOY_BG
		iv.mouse_filter = Control.MOUSE_FILTER_IGNORE
	
	if IS_SHOW_NOTE:
		control3.visible = true
		control4.visible = true
	else:
		control3.visible = false
		control4.visible = false
