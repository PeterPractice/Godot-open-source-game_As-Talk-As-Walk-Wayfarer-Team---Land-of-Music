extends Node2D
class_name ChangeSceneToTrigger

export var changeSceneToTriggerTypeID: int = 0

onready var colorRect1 = $colorRect1

func  _ready():
	colorRect1.visible = false

func GetChangeSceneToTriggerTypeID() -> int:
	return changeSceneToTriggerTypeID
