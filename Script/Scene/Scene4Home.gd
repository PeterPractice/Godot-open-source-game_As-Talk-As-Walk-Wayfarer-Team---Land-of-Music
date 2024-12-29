extends Node2D

onready var nPCArticleTriggerBag = $node2DNPCArticleTrigger/nPCArticleTriggerBag
onready var nPCArticleTriggerJournalRecordBook = $node2DNPCArticleTrigger/nPCArticleTriggerJournalRecordBook
onready var nPCArticleTriggerDoor = $node2DNPCArticleTrigger/nPCArticleTriggerDoor
onready var nPCArticleTrigger9 = $node2DNPCArticleTrigger/nPCArticleTrigger9
onready var nPCTrigger1 = $node2DNPCTrigger/nPCTrigger1

func _ready():
	UpdateScene()

func UpdateScene():
	if SaveGameManager.IsGoodsUsedHas_Bag():
		nPCArticleTriggerBag.SetInvalid()
	
	if SaveGameManager.IsGoodsUsedHas_JournalRecordBook():
		nPCArticleTriggerJournalRecordBook.SetInvalid()
	
	nPCTrigger1.CheckInvalid(0, TableManager.WRANGLEDIALOGTYPEID_SILVERCARP1_INIT, TableManager.WRANGLEDIALOGTYPEID_SILVERCARP1_SUCCESS)
	
	nPCArticleTriggerDoor.TrySetDoorOpened()
	
	nPCArticleTrigger9.CheckInvalid(TableManager.WRANGLEDIALOGTYPEID_FOOT_INIT, TableManager.WRANGLEDIALOGTYPEID_FOOT_SUCCESS)
