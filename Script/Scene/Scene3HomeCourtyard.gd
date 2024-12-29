extends Node2D

onready var nPCArticleTriggerDoor = $node2DNPCArticleTrigger/nPCArticleTriggerDoor
onready var nPCTrigger1 = $node2DNPCTrigger/nPCTrigger1

func _ready():
	UpdateScene()

func UpdateScene():
	nPCTrigger1.CheckInvalid(0, TableManager.WRANGLEDIALOGTYPEID_DOG1_INIT, TableManager.WRANGLEDIALOGTYPEID_DOG1_SUCCESS)
	
	nPCArticleTriggerDoor.TrySetDoorOpened()
