extends Node2D

onready var node2DNPCTrigger = $node2DNPCTrigger
onready var nPCTrigger18 = $node2DNPCTrigger/nPCTrigger18
onready var nPCTrigger19 = $node2DNPCTrigger/nPCTrigger19
onready var nPCTrigger20 = $node2DNPCTrigger/nPCTrigger20
onready var nPCTrigger21 = $node2DNPCTrigger/nPCTrigger21
onready var nPCTrigger22 = $node2DNPCTrigger/nPCTrigger22
onready var nPCTrigger23 = $node2DNPCTrigger/nPCTrigger23
onready var nPCTrigger24 = $node2DNPCTrigger/nPCTrigger24
onready var nPCTrigger25 = $node2DNPCTrigger/nPCTrigger25
onready var nPCTrigger26 = $node2DNPCTrigger/nPCTrigger26
onready var nPCTrigger27 = $node2DNPCTrigger/nPCTrigger27
onready var nPCTrigger28 = $node2DNPCTrigger/nPCTrigger28
onready var nPCTrigger29 = $node2DNPCTrigger/nPCTrigger29

func _ready():
	UpdateScene()

func UpdateScene():
	var isHasSuccess_WRANGLEDIALOGTYPEID_THREEHEADSDRAGON3_SUCCESS: bool = SaveGameManager.IsHasSaveGameData_Archive_TaskList_TaskInfoByWrangleDialogTypeIDAndlastChoiceWrangleDialogTypeID(TableManager.WRANGLEDIALOGTYPEID_THREEHEADSDRAGON3_INIT, TableManager.WRANGLEDIALOGTYPEID_THREEHEADSDRAGON3_SUCCESS)
	if isHasSuccess_WRANGLEDIALOGTYPEID_THREEHEADSDRAGON3_SUCCESS:
		nPCTrigger18.CheckInvalid(0, TableManager.WRANGLEDIALOGTYPEID_MONSTER1_INIT, TableManager.WRANGLEDIALOGTYPEID_MONSTER1_SUCCESS, true)
		nPCTrigger19.CheckInvalid(0, TableManager.WRANGLEDIALOGTYPEID_MONSTER2_INIT, TableManager.WRANGLEDIALOGTYPEID_MONSTER2_SUCCESS, true)
		nPCTrigger20.CheckInvalid(0, TableManager.WRANGLEDIALOGTYPEID_MONSTER3_INIT, TableManager.WRANGLEDIALOGTYPEID_MONSTER3_SUCCESS, true)
		nPCTrigger21.CheckInvalid(0, TableManager.WRANGLEDIALOGTYPEID_MONSTER4_INIT, TableManager.WRANGLEDIALOGTYPEID_MONSTER4_SUCCESS, true)
		nPCTrigger22.CheckInvalid(0, TableManager.WRANGLEDIALOGTYPEID_MONSTER5_INIT, TableManager.WRANGLEDIALOGTYPEID_MONSTER5_SUCCESS, true)
		nPCTrigger23.CheckInvalid(0, TableManager.WRANGLEDIALOGTYPEID_MONSTER6_INIT, TableManager.WRANGLEDIALOGTYPEID_MONSTER6_SUCCESS, true)
		nPCTrigger24.CheckInvalid(0, TableManager.WRANGLEDIALOGTYPEID_MONSTER7_INIT, TableManager.WRANGLEDIALOGTYPEID_MONSTER7_SUCCESS, true)
		nPCTrigger25.CheckInvalid(0, TableManager.WRANGLEDIALOGTYPEID_MONSTER8_INIT, TableManager.WRANGLEDIALOGTYPEID_MONSTER8_SUCCESS, true)
		nPCTrigger26.CheckInvalid(0, TableManager.WRANGLEDIALOGTYPEID_MONSTER9_INIT, TableManager.WRANGLEDIALOGTYPEID_MONSTER9_SUCCESS, true)
		nPCTrigger27.CheckInvalid(0, TableManager.WRANGLEDIALOGTYPEID_MONSTER10_INIT, TableManager.WRANGLEDIALOGTYPEID_MONSTER10_SUCCESS, true)
		
		nPCTrigger28.CheckInvalid(0, TableManager.WRANGLEDIALOGTYPEID_MONSTER11_INIT, TableManager.WRANGLEDIALOGTYPEID_MONSTER11_SUCCESS)
		nPCTrigger29.CheckInvalid(0, TableManager.WRANGLEDIALOGTYPEID_MONSTER12_INIT, TableManager.WRANGLEDIALOGTYPEID_MONSTER12_SUCCESS)
	else:
		for iv in node2DNPCTrigger.get_children():
			if iv.has_method("GetNPCTriggerTypeID"):
				if (TableManager.NPCTRIGGERTYPEID_MONSTER_BEGIN <= iv.GetNPCTriggerTypeID()) and (TableManager.NPCTRIGGERTYPEID_MONSTER_END >= iv.GetNPCTriggerTypeID()):
					iv.SetInvalid()
