extends Node2D

onready var node2DNPCTrigger = $node2DNPCTrigger
onready var nPCTrigger30 = $node2DNPCTrigger/nPCTrigger30
onready var nPCTrigger31 = $node2DNPCTrigger/nPCTrigger31
onready var nPCTrigger32 = $node2DNPCTrigger/nPCTrigger32
onready var nPCTrigger33 = $node2DNPCTrigger/nPCTrigger33
onready var nPCTrigger34 = $node2DNPCTrigger/nPCTrigger34

var m_IsHasSuccess_WRANGLEDIALOGTYPEID_SISTER_5_SUCCESS: bool = false

func _ready():
	m_IsHasSuccess_WRANGLEDIALOGTYPEID_SISTER_5_SUCCESS = SaveGameManager.IsHasSaveGameData_Archive_TaskList_TaskInfoByWrangleDialogTypeIDAndlastChoiceWrangleDialogTypeID(TableManager.WRANGLEDIALOGTYPEID_CLINKERVALLEY_SISTER_INIT, TableManager.WRANGLEDIALOGTYPEID_SISTER_5_SUCCESS)
	nPCTrigger31.SetInvalid()
	nPCTrigger32.SetInvalid()
	nPCTrigger33.SetInvalid()
	nPCTrigger34.SetInvalid()
	
	SetAssignAvatarTypeID()
	UpdateScene()

func SetAssignAvatarTypeID():
	var lastAvatarTypeID: int = SaveGameManager.GetSwallowPopLastAvatarTypeID()
	if 0 < lastAvatarTypeID:
		if nPCTrigger30.GetAssignAvatarTypeID() != lastAvatarTypeID:
			nPCTrigger30.SetAssignAvatarTypeID(lastAvatarTypeID)
			
			nPCTrigger30.SetValid()
			nPCTrigger30.SetIsHadProducedNPCFalse()
	else:
		nPCTrigger30.SetInvalid()

func UpdateScene():
	if not nPCTrigger30.GetIsValid():
		var updateSceneInfo: Dictionary = SceneManager.GetUpdateSceneInfo()
		if updateSceneInfo.isProducedNPC: 
			SceneManager.SetUpdateSceneInfo(false)
			
			SetAssignAvatarTypeID()
	
	var NPCTRIGGER5_STRING: String = "nPCTrigger5_"
	var nPCTrigger5_ShowName: String = ""
	var isHasSuccess_WRANGLEDIALOGTYPEID_SISTER_6_SUCCESS: bool = SaveGameManager.IsHasSaveGameData_Archive_TaskList_TaskInfoByWrangleDialogTypeIDAndlastChoiceWrangleDialogTypeID(TableManager.WRANGLEDIALOGTYPEID_CLINKERVALLEY_SISTER_INIT, TableManager.WRANGLEDIALOGTYPEID_SISTER_6_SUCCESS)
	if not isHasSuccess_WRANGLEDIALOGTYPEID_SISTER_6_SUCCESS:
		var nPCTrigger5_Count: int = 0
		for iv in node2DNPCTrigger.get_children():
			if NPCTRIGGER5_STRING in iv.name:
				nPCTrigger5_Count += 1
		
		var nPCTrigger5_RandomID: int = HQH.RandomModRange(1, nPCTrigger5_Count)
		nPCTrigger5_ShowName = "%s%s" % [NPCTRIGGER5_STRING, nPCTrigger5_RandomID]
		HQH.Log("nPCTrigger5_ShowName: %s" % nPCTrigger5_ShowName)
	else:
		nPCTrigger5_ShowName = ""
	
	for iv in node2DNPCTrigger.get_children():
		if NPCTRIGGER5_STRING in iv.name:
			if nPCTrigger5_ShowName == iv.name:
				iv.SetAllValid()
			else:
				iv.SetAllInvalid()
	
	var isHasSuccess_WRANGLEDIALOGTYPEID_SISTER_5_SUCCESS = SaveGameManager.IsHasSaveGameData_Archive_TaskList_TaskInfoByWrangleDialogTypeIDAndlastChoiceWrangleDialogTypeID(TableManager.WRANGLEDIALOGTYPEID_CLINKERVALLEY_SISTER_INIT, TableManager.WRANGLEDIALOGTYPEID_SISTER_5_SUCCESS)
	if (not m_IsHasSuccess_WRANGLEDIALOGTYPEID_SISTER_5_SUCCESS) and isHasSuccess_WRANGLEDIALOGTYPEID_SISTER_5_SUCCESS:
		nPCTrigger31.SetValid()
		nPCTrigger32.SetValid()
		nPCTrigger33.SetValid()
		nPCTrigger34.SetValid()
