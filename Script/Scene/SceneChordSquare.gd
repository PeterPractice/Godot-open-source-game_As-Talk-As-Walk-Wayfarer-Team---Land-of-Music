extends Node2D

onready var nPCArticleTriggerDoor = $node2DNPCArticleTrigger/nPCArticleTriggerDoor
onready var nPCArticleTriggerDoor2 = $node2DNPCArticleTrigger/nPCArticleTriggerDoor2
onready var nPCArticleTrigger9 = $node2DNPCArticleTrigger/nPCArticleTrigger9
onready var nPCArticleTrigger10 = $node2DNPCArticleTrigger/nPCArticleTrigger10
onready var nPCTrigger10 = $node2DNPCTrigger/nPCTrigger10

func _ready():
	UpdateScene()

func UpdateScene():
	nPCArticleTriggerDoor.TrySetDoorOpened()
	nPCArticleTriggerDoor2.TrySetDoorOpened()
	
	nPCArticleTrigger9.CheckInvalid(TableManager.WRANGLEDIALOGTYPEID_FOOT_INIT, TableManager.WRANGLEDIALOGTYPEID_FOOT_SUCCESS)
	nPCArticleTrigger10.CheckInvalid(TableManager.WRANGLEDIALOGTYPEID_LETTER3_INIT, TableManager.WRANGLEDIALOGTYPEID_LETTER3_SUCCESS)
	
	nPCTrigger10.CheckInvalid(0, TableManager.WRANGLEDIALOGTYPEID_TURTLE1_INIT, TableManager.WRANGLEDIALOGTYPEID_TURTLE1_SUCCESS)
