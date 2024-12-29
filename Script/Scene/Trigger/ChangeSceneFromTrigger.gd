extends Node2D

export var changeToSceneTypeID: int = 0
export var changeToChangeSceneToTriggerTypeID: int = 0

onready var colorRect1 = $colorRect1

func  _ready():
	colorRect1.visible = false

func _on_area2D1_body_entered(_body: Node2D):
	HQH.Log("ChangeSceneFromTrigger, _on_area2D1_body_entered, changeSceneTypeID: %s, changeToChangeSceneToTriggerTypeID: %s" % [changeToSceneTypeID, changeToChangeSceneToTriggerTypeID])
	
	SceneManager.ChangeSceneFromTrigger(changeToSceneTypeID, changeToChangeSceneToTriggerTypeID)
