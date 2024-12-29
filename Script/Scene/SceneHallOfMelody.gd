extends Node2D

onready var node2DNPCTrigger = $node2DNPCTrigger
onready var node2DNPCArticleTrigger = $node2DNPCArticleTrigger
onready var nPCTrigger6 = $node2DNPCTrigger/nPCTrigger6
onready var nPCTrigger16 = $node2DNPCTrigger/nPCTrigger16
onready var nPCArticleTrigger65 = $node2DNPCArticleTrigger/nPCArticleTrigger65
onready var nPCArticleTrigger66 = $node2DNPCArticleTrigger/nPCArticleTrigger66

var m_IsHadRunCloseDoor: bool = false

func _ready():
	var isHasSuccess_WRANGLEDIALOGTYPEID_THREEHEADSDRAGON3_SUCCESS: bool = SaveGameManager.IsHasSaveGameData_Archive_TaskList_TaskInfoByWrangleDialogTypeIDAndlastChoiceWrangleDialogTypeID(TableManager.WRANGLEDIALOGTYPEID_THREEHEADSDRAGON3_INIT, TableManager.WRANGLEDIALOGTYPEID_THREEHEADSDRAGON3_SUCCESS)
	if isHasSuccess_WRANGLEDIALOGTYPEID_THREEHEADSDRAGON3_SUCCESS:
		m_IsHadRunCloseDoor = true
	
	UpdateScene()

func UpdateScene():
	nPCTrigger6.CheckInvalid(0, TableManager.WRANGLEDIALOGTYPEID_DONKEY1_INIT, TableManager.WRANGLEDIALOGTYPEID_DONKEY1_SUCCESS)
	
	var isHasSuccess_WRANGLEDIALOGTYPEID_SISTER_2_SUCCESS: bool = SaveGameManager.IsHasSaveGameData_Archive_TaskList_TaskInfoByWrangleDialogTypeIDAndlastChoiceWrangleDialogTypeID(TableManager.WRANGLEDIALOGTYPEID_SISTER_2_SUCCESS, TableManager.WRANGLEDIALOGTYPEID_SISTER_2_SUCCESS)
	var isHasSuccess_WRANGLEDIALOGTYPEID_THREEHEADSDRAGON3_SUCCESS: bool = SaveGameManager.IsHasSaveGameData_Archive_TaskList_TaskInfoByWrangleDialogTypeIDAndlastChoiceWrangleDialogTypeID(TableManager.WRANGLEDIALOGTYPEID_THREEHEADSDRAGON3_INIT, TableManager.WRANGLEDIALOGTYPEID_THREEHEADSDRAGON3_SUCCESS)
	if isHasSuccess_WRANGLEDIALOGTYPEID_SISTER_2_SUCCESS:
		nPCTrigger16.CheckInvalid(0, TableManager.WRANGLEDIALOGTYPEID_SISTER_2_SUCCESS, TableManager.WRANGLEDIALOGTYPEID_SISTER_2_SUCCESS, true)
		
		if isHasSuccess_WRANGLEDIALOGTYPEID_THREEHEADSDRAGON3_SUCCESS:
			nPCArticleTrigger65.SetInvalid()
			nPCArticleTrigger66.SetValid()
		else:
			nPCArticleTrigger65.SetValid()
			nPCArticleTrigger66.SetInvalid()
	else:
		nPCArticleTrigger65.SetInvalid()
		nPCArticleTrigger66.SetInvalid()
	
	if isHasSuccess_WRANGLEDIALOGTYPEID_THREEHEADSDRAGON3_SUCCESS:
		if not m_IsHadRunCloseDoor:
			m_IsHadRunCloseDoor = true
			
			AvatarManager.SetAllAvatarToCurrentActiveAvatarPosition()
			SceneManager.SaveAvatarPositionByCurrentActiveAvatarPosition()
			UIManager.Goods_AddJournalRecord(TableManager.GOODSTYPEID_THREEHEADSDRAGON3, "DOOR_CLOSE")
			AudioManager.PlayByName_CloseDoor()
			SceneManager.Clear_DoorOpened_NPCArticleTriggerTypeIDList()
			for iv in node2DNPCArticleTrigger.get_children():
				if iv.has_method("GetNPCArticleTriggerTypeID"):
					if (TableManager.NPCARTICLETRIGGERTYPEID_DOOR_HALL_OF_MELODY_MIN <= iv.GetNPCArticleTriggerTypeID()) and (TableManager.NPCARTICLETRIGGERTYPEID_DOOR_HALL_OF_MELODY_MAX >= iv.GetNPCArticleTriggerTypeID()):
						iv.CloseDoor()
	
	for iv in node2DNPCArticleTrigger.get_children():
		if iv.has_method("GetNPCArticleTriggerTypeID"):
			if (TableManager.NPCARTICLETRIGGERTYPEID_DOOR_HALL_OF_MELODY_MIN <= iv.GetNPCArticleTriggerTypeID()) and (TableManager.NPCARTICLETRIGGERTYPEID_DOOR_HALL_OF_MELODY_MAX >= iv.GetNPCArticleTriggerTypeID()):
				iv.TrySetDoorOpened()
	
	var NPCTRIGGER17_STRING: String = "nPCTrigger17_"
	var nPCTrigger17_ShowName: String = ""
	if not SaveGameManager.IsBagHas(TableManager.GOODSTYPEID_WIG_CHANGING_COLOR):
		if UIManager.GetSceneHallOfMelodyInfo().isHide_CLERGY1:
			nPCTrigger17_ShowName = ""
		else:
			var nPCTrigger17_Count: int = 0
			for iv in node2DNPCTrigger.get_children():
				if NPCTRIGGER17_STRING in iv.name:
					nPCTrigger17_Count += 1
			
			var nPCTrigger17_RandomID: int = HQH.RandomModRange(1, nPCTrigger17_Count)
			nPCTrigger17_ShowName = "%s%s" % [NPCTRIGGER17_STRING, nPCTrigger17_RandomID]
			HQH.Log("nPCTrigger17_ShowName: %s" % nPCTrigger17_ShowName)
	else:
		nPCTrigger17_ShowName = ""
	
	for iv in node2DNPCTrigger.get_children():
		if NPCTRIGGER17_STRING in iv.name:
			if nPCTrigger17_ShowName == iv.name:
				iv.SetAllValid()
			else:
				iv.SetAllInvalid()
