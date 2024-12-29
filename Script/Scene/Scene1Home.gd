extends Node2D

onready var nPCArticleTriggerBag = $node2DNPCArticleTrigger/nPCArticleTriggerBag
onready var nPCArticleTriggerJournalRecordBook = $node2DNPCArticleTrigger/nPCArticleTriggerJournalRecordBook
onready var nPCArticleTriggerDoor = $node2DNPCArticleTrigger/nPCArticleTriggerDoor
onready var nPCTrigger1 = $node2DNPCTrigger/nPCTrigger1

var m_NPCTrigger1_NPCTriggerTypeID: int = 0

func _ready():
	var isHas_SNAKE1: bool = nPCTrigger1.CheckInvalidResult(TableManager.AVATARTYPEID_SNAKE1, TableManager.WRANGLEDIALOGTYPEID_SNAKE1_INIT, TableManager.WRANGLEDIALOGTYPEID_SNAKE1_SUCCESS)
	
	var isHas_SNAKE2: bool = false
	if isHas_SNAKE1:
		isHas_SNAKE2 = nPCTrigger1.CheckInvalidResult(TableManager.AVATARTYPEID_SNAKE2, TableManager.WRANGLEDIALOGTYPEID_SNAKE2_INIT, TableManager.WRANGLEDIALOGTYPEID_SNAKE2_SUCCESS)
	
	var isHas_SNAKE3: bool = false
	if isHas_SNAKE2:
		isHas_SNAKE3 = nPCTrigger1.CheckInvalidResult(TableManager.AVATARTYPEID_SNAKE3, TableManager.WRANGLEDIALOGTYPEID_SNAKE3_INIT, TableManager.WRANGLEDIALOGTYPEID_SNAKE3_SUCCESS)
	
	if not isHas_SNAKE1:
		m_NPCTrigger1_NPCTriggerTypeID = TableManager.NPCTRIGGERTYPEID_SNAKE1
	elif not isHas_SNAKE2:
		m_NPCTrigger1_NPCTriggerTypeID = TableManager.NPCTRIGGERTYPEID_SNAKE2
	elif not isHas_SNAKE3:
		m_NPCTrigger1_NPCTriggerTypeID = TableManager.NPCTRIGGERTYPEID_SNAKE3
	
	if 0 < m_NPCTrigger1_NPCTriggerTypeID:
		nPCTrigger1.SetNPCTriggerTypeID(m_NPCTrigger1_NPCTriggerTypeID)
	else:
		nPCTrigger1.SetInvalid()
	
	UpdateScene()

func UpdateScene():
	if SaveGameManager.IsGoodsUsedHas_Bag():
		nPCArticleTriggerBag.SetInvalid()
	
	if SaveGameManager.IsGoodsUsedHas_JournalRecordBook():
		nPCArticleTriggerJournalRecordBook.SetInvalid()
	
	if 0 < m_NPCTrigger1_NPCTriggerTypeID:
		var nPCTriggerAvatarTypeID: int = 0
		var wrangleDialogTypeID: int = 0
		var currentWrangleDialogTypeID: int = 0
		match m_NPCTrigger1_NPCTriggerTypeID:
			TableManager.NPCTRIGGERTYPEID_SNAKE1:
				nPCTriggerAvatarTypeID = TableManager.AVATARTYPEID_SNAKE1
				wrangleDialogTypeID = TableManager.WRANGLEDIALOGTYPEID_SNAKE1_INIT
				currentWrangleDialogTypeID = TableManager.WRANGLEDIALOGTYPEID_SNAKE1_SUCCESS
			
			TableManager.NPCTRIGGERTYPEID_SNAKE2:
				nPCTriggerAvatarTypeID = TableManager.AVATARTYPEID_SNAKE2
				wrangleDialogTypeID = TableManager.WRANGLEDIALOGTYPEID_SNAKE2_INIT
				currentWrangleDialogTypeID = TableManager.WRANGLEDIALOGTYPEID_SNAKE2_SUCCESS
			
			TableManager.NPCTRIGGERTYPEID_SNAKE3:
				nPCTriggerAvatarTypeID = TableManager.AVATARTYPEID_SNAKE3
				wrangleDialogTypeID = TableManager.WRANGLEDIALOGTYPEID_SNAKE3_INIT
				currentWrangleDialogTypeID = TableManager.WRANGLEDIALOGTYPEID_SNAKE3_SUCCESS
		
		nPCTrigger1.CheckInvalid(nPCTriggerAvatarTypeID, wrangleDialogTypeID, currentWrangleDialogTypeID)
	
	nPCArticleTriggerDoor.TrySetDoorOpened()
