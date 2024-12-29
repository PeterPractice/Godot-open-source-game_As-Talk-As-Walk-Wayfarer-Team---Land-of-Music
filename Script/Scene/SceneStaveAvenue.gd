extends Node2D

onready var nPCArticleTriggerDoor26 = $node2DNPCArticleTrigger/nPCArticleTriggerDoor26
onready var nPCArticleTriggerDoor27 = $node2DNPCArticleTrigger/nPCArticleTriggerDoor27

func _ready():
	UpdateScene()

func UpdateScene():
	nPCArticleTriggerDoor26.TrySetDoorOpened()
	nPCArticleTriggerDoor27.TrySetDoorOpened()
