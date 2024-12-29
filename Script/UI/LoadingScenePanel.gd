extends Control

onready var colorRect1 = $colorRect1
onready var progressBar1 = $progressBar1

func _ready():
	progressBar1.visible = false
	
	colorRect1.color = HQH.COLORPALETTE_UI.LOADINGSCENEPANEL_BG_COLOR
	
	raise()

func SetMax(n: int):
	progressBar1.call_deferred("set_max", n)

func SetValue(n: int):
	progressBar1.call_deferred("set_value", n)
