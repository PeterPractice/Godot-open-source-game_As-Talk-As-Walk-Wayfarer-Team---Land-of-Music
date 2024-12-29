extends Node

const CREATEAVATARINFOLIST_NUMBER_MAX: int = 11 # 11
const DELAYINDEXNUMBER_1_STEP: int = 30
const AVATAR_FOLLOW_NUMBER_MAX: int = CREATEAVATARINFOLIST_NUMBER_MAX - 1 # 10
const CURRENTACTIVEAVATARINFOLIST_MAX_SIZE: int = (DELAYINDEXNUMBER_1_STEP * AVATAR_FOLLOW_NUMBER_MAX) + DELAYINDEXNUMBER_1_STEP # 330
var m_CurrentActiveAvatarInfoListCurrentIndex: int = 0
const CURRENT_ACTIVE_AVATAR_INFO: Dictionary = {
	"walkPosition": Vector2.ZERO,
	"spriteToLeft_flip_h": false,
}
var m_CurrentActiveAvatarInfoList: Array = [] # CURRENT_ACTIVE_AVATAR_INFO Array
var m_CurrentActiveAvatarInfoListCount: int = 0
var m_CurrentActiveAvatarInstance: KinematicBody2DAvatar = null
const CREATE_AVATAR_INFO: Dictionary = {
	"index": 0,
	"avatarTypeID": 0, 		# from AVATAR_TYPE_MAP.avatarTypeID
	"initPosition": Vector2.ZERO,
	"equipTypeID": 0, 		# from EQUIPTABLE1_DATA_INFO.equipTypeID
	"isNeedCompleteAll_FOLLOW_WALK": false,
	"needCompleteAll_FOLLOW_WALK_DelayIndexNumber": 0,
}
var m_CreateAvatarInfoList: Array = [] # CREATE_AVATAR_INFO Array. index[n - 1]: walk Avatar. index[(n - 2) to 0]: follow the index[n - 1] Avatar in order.
const ACTIVEAVATAR_NUMBER: int = 1
var m_AvatarObjectIDEmitter: int = 0 # increase from 1 to n
var m_CurrentActiveAvatarInstance_IsTalkStart: bool = false
const CURRENTACTIVEAVATARINSTANCE_TALKTIMER_MIN: float = 0.1
const CURRENTACTIVEAVATARINSTANCE_TALKTIMER_MAX: float = 1.0
const CURRENTACTIVEAVATARINSTANCE_TALKTIMER_COUNT: float = 10.0
var m_CurrentActiveAvatarInstance_TalkTimer: float = 0.0
var m_CurrentActiveAvatarInstance_IsAttackStart: bool = false
const CURRENTACTIVEAVATARINSTANCE_ATTACKTIMER_STEP: float = 1.0
var m_CurrentActiveAvatarInstance_AttackTimer: float = 0.0
var m_InteractionNPC_IsTalkStart: bool = false
var m_InteractionNPC_TalkTimer: float = 0.0
var m_InteractionNPC_IsAttackStart: bool = false
var m_InteractionNPC_AttackTimer: float = 0.0

func _process(delta: float):
	if m_InteractionNPC_IsTalkStart:
		m_InteractionNPC_TalkTimer -= delta
		if 0.0 > m_InteractionNPC_TalkTimer:
			m_InteractionNPC_IsTalkStart = false
			m_InteractionNPC_TalkTimer = 0.0
			
			var interactionInfo: Dictionary = UIManager.GetInteractionInfo()
			if is_instance_valid(interactionInfo.interactionNPC):
				if interactionInfo.interactionNPC.has_method("AvatarStop_TALK"):
					if not interactionInfo.interactionNPC.IsAvatarInState_FOLLOW():
						interactionInfo.interactionNPC.AvatarStop_TALK()
	
	if m_InteractionNPC_IsAttackStart:
		m_InteractionNPC_AttackTimer -= delta
		if 0.0 > m_InteractionNPC_AttackTimer:
			m_InteractionNPC_IsAttackStart = false
			m_InteractionNPC_AttackTimer = 0.0
			
			var interactionInfo: Dictionary = UIManager.GetInteractionInfo()
			if is_instance_valid(interactionInfo.interactionNPC):
				if interactionInfo.interactionNPC.has_method("AvatarStop_ATTACK"):
					interactionInfo.interactionNPC.AvatarStop_ATTACK()
	
	if m_CurrentActiveAvatarInstance_IsTalkStart:
		m_CurrentActiveAvatarInstance_TalkTimer -= delta
		if 0.0 > m_CurrentActiveAvatarInstance_TalkTimer:
			m_CurrentActiveAvatarInstance_IsTalkStart = false
			m_CurrentActiveAvatarInstance_TalkTimer = 0.0
			
			m_CurrentActiveAvatarInstance.AvatarStop_TALK()
	
	if m_CurrentActiveAvatarInstance_IsAttackStart:
		m_CurrentActiveAvatarInstance_AttackTimer -= delta
		if 0.0 > m_CurrentActiveAvatarInstance_AttackTimer:
			m_CurrentActiveAvatarInstance_IsAttackStart = false
			m_CurrentActiveAvatarInstance_AttackTimer = 0.0
			
			m_CurrentActiveAvatarInstance.AvatarStop_ATTACK()
			UIManager.DownPanel_on_commonTextureButtonPlayChess1_pressed_PlayAttackStop()

func AddNPCToCurrentScene(avatarInstance: KinematicBody2DAvatar, position: Vector2, avatarTypeID: int, nPCManner: int, spriteToLeft_flip_h_TimerStep: float):
	var node2DNPC: Node = SceneManager.GetCurrentSceneNode2DNPC()
	node2DNPC.add_child(avatarInstance)
	avatarInstance.SetPosition(position)
	var avatarObjectID: int = GetAvatarObjectIDEmitter()
	avatarInstance.SetAvatarObjectID(avatarObjectID)
	avatarInstance.SetAvatarTypeID(avatarTypeID)
	
	if not((HQH.NPC_MANNER_TYPE.NPC_MANNER_BEGIN <= nPCManner) and (HQH.NPC_MANNER_TYPE.NPC_MANNER_END > nPCManner)):
		HQH.AssertLog("AddNPCToCurrentScene, nPCManner: %s is out og range[%s, %s)" % [nPCManner, HQH.NPC_MANNER_TYPE.NPC_MANNER_BEGIN, HQH.NPC_MANNER_TYPE.NPC_MANNER_END])
		nPCManner = HQH.NPC_MANNER_TYPE.NPC_MANNER_BEGIN
	
	avatarInstance.SetIsNPC(true, nPCManner)
	avatarInstance.SetSpriteToLeft_flip_h_TimerStep(spriteToLeft_flip_h_TimerStep)

func SetCurrentActiveAvatarInstance(avatarInstance: KinematicBody2DAvatar):
	if is_instance_valid(avatarInstance):
		m_CurrentActiveAvatarInstance = avatarInstance
		m_CurrentActiveAvatarInstance.SetCurrentActive()
		m_CurrentActiveAvatarInstance.AvatarStart_IDLE()
	else:
		HQH.AssertLog("SetCurrentActiveAvatarInstance, not is_instance_valid(avatarInstance)")

func ClearCurrentActiveAvatarInstance():
	m_CurrentActiveAvatarInstance = null

func AddAvatarToCurrentScene(avatarInstance: KinematicBody2DAvatar, position: Vector2, isCurrentActive: bool, avatarTypeID: int):
	var node2DAvatar: Node = SceneManager.GetCurrentSceneNode2DAvatar()
	node2DAvatar.add_child(avatarInstance)
	avatarInstance.SetPosition(position)
	var avatarObjectID: int = GetAvatarObjectIDEmitter()
	avatarInstance.SetAvatarObjectID(avatarObjectID)
	avatarInstance.SetAvatarTypeID(avatarTypeID)
	if isCurrentActive:
		SetCurrentActiveAvatarInstance(avatarInstance)

func RemoveCurrentSceneAllAvatar():
	if not SceneManager.IsCurrentSceneNode2DAvatarValid():
		return
	
	if is_instance_valid(m_CurrentActiveAvatarInstance):
		m_CurrentActiveAvatarInstance.SetCurrentUnactive()
	
	var node2DAvatar: Node = SceneManager.GetCurrentSceneNode2DAvatar()
	var node2DAvatarChildren: Array = SceneManager.GetCurrentSceneNode2DAvatarChildren()
	for iv in node2DAvatarChildren:
		node2DAvatar.remove_child(iv)
		iv.queue_free()
		iv = null
	
	ClearCurrentActiveAvatarInstance()

func DisposeCurrentSceneAllAvatarPhysicsProcess(delta: float):
	var node2DAvatarChildren: Array = SceneManager.GetCurrentSceneNode2DAvatarChildren()
	for iv in node2DAvatarChildren:
		iv.DisposePhysicsProcess(delta)

func DisposeCurrentSceneAllNPCPhysicsProcess(delta: float):
	if SceneManager.IsCurrentSceneNode2DNPCValid():
		var node2DNPCChildren: Array = SceneManager.GetCurrentSceneNode2DNPCChildren()
		for iv in node2DNPCChildren:
			iv.DisposePhysicsProcess(delta)

func GetCreateAvatarInfoListOneElement(index: int) -> Dictionary:
	var createAvatarInfo: Dictionary = {}
	if((0 <= index) and (m_CreateAvatarInfoList.size() > index)):
		createAvatarInfo = m_CreateAvatarInfoList[index]
	
	return createAvatarInfo

func GetCreateAvatarInfoListOneElementByAvatarTypeID(avatarTypeID: int) -> Dictionary:
	var createAvatarInfo: Dictionary = {}
	for iv in m_CreateAvatarInfoList:
		if avatarTypeID == iv.avatarTypeID:
			createAvatarInfo = iv
			
			break
	
	return createAvatarInfo

func GetCreateAvatarInfoList() -> Array:
	return m_CreateAvatarInfoList

func AddNeedCompleteAll_FOLLOW_WALK_DelayIndexNumber(avatarObjectID: int):
	var index: int = SceneManager.GetIndex_From_CurrentSceneNode2DAvatarChildren(avatarObjectID)
	var createAvatarInfo: Dictionary = GetCreateAvatarInfoListOneElement(index)
	if createAvatarInfo.isNeedCompleteAll_FOLLOW_WALK:
		createAvatarInfo.needCompleteAll_FOLLOW_WALK_DelayIndexNumber = createAvatarInfo.needCompleteAll_FOLLOW_WALK_DelayIndexNumber + 1

func ResetNeedCompleteAll_FOLLOW_WALK_DelayIndexNumber(avatarObjectID: int):
	var index: int = SceneManager.GetIndex_From_CurrentSceneNode2DAvatarChildren(avatarObjectID)
	var createAvatarInfo: Dictionary = GetCreateAvatarInfoListOneElement(index)
	createAvatarInfo.needCompleteAll_FOLLOW_WALK_DelayIndexNumber = 0

func GetDelayIndexNumber(avatarObjectID: int) -> int:
	var delayIndexNumber: int = 0
	var node2DAvatarChildrenSize: int = SceneManager.GetCurrentSceneNode2DAvatarChildrenSize()
	var index: int = SceneManager.GetIndex_From_CurrentSceneNode2DAvatarChildren(avatarObjectID)
	if (0 <= index) and ((node2DAvatarChildrenSize - ACTIVEAVATAR_NUMBER) > index):
		delayIndexNumber = DELAYINDEXNUMBER_1_STEP * (node2DAvatarChildrenSize - ACTIVEAVATAR_NUMBER - index)
	
	var createAvatarInfo: Dictionary = GetCreateAvatarInfoListOneElement(index)
	if createAvatarInfo.isNeedCompleteAll_FOLLOW_WALK:
		delayIndexNumber = delayIndexNumber - createAvatarInfo.needCompleteAll_FOLLOW_WALK_DelayIndexNumber
		if 0 > delayIndexNumber:
			HQH.AssertLog("0 > delayIndexNumber")
	
	return delayIndexNumber

func GetAvatarObjectIDEmitter() -> int:
	m_AvatarObjectIDEmitter = m_AvatarObjectIDEmitter + 1
	
	return m_AvatarObjectIDEmitter

func AddCurrentActiveAvatarInfoList(walkPositionX: float, walkPositionY: float, spriteToLeft_flip_h: bool):
	SetCurrentActiveAvatarInfoList(m_CurrentActiveAvatarInfoListCurrentIndex, walkPositionX, walkPositionY, spriteToLeft_flip_h)
	m_CurrentActiveAvatarInfoListCurrentIndex = m_CurrentActiveAvatarInfoListCurrentIndex + 1
	if CURRENTACTIVEAVATARINFOLIST_MAX_SIZE <= m_CurrentActiveAvatarInfoListCurrentIndex:
		m_CurrentActiveAvatarInfoListCurrentIndex = 0
		
	m_CurrentActiveAvatarInfoListCount = m_CurrentActiveAvatarInfoListCount + 1
#	HQH.Log("m_CurrentActiveAvatarInfoListCount: %s" % m_CurrentActiveAvatarInfoListCount)

func SetCurrentActiveAvatarInfoList(i: int, walkPositionX: float, walkPositionY: float, spriteToLeft_flip_h: bool):
	if (0 <= i) and (CURRENTACTIVEAVATARINFOLIST_MAX_SIZE > i):
		m_CurrentActiveAvatarInfoList[i].walkPosition.x = walkPositionX
		m_CurrentActiveAvatarInfoList[i].walkPosition.y = walkPositionY
		m_CurrentActiveAvatarInfoList[i].spriteToLeft_flip_h = spriteToLeft_flip_h

func GetCurrentActiveAvatarInfoList(delayIndexNumber: int) -> Dictionary:
	var delayIndex: int = (m_CurrentActiveAvatarInfoListCurrentIndex - delayIndexNumber + CURRENTACTIVEAVATARINFOLIST_MAX_SIZE) % CURRENTACTIVEAVATARINFOLIST_MAX_SIZE
	
	return m_CurrentActiveAvatarInfoList[delayIndex]

func GetAvatarInfo_From_CurrentActiveAvatarInfoList_By_AvatarObjectID(avatarObjectID: int) -> Dictionary:
	var delayPosition: Dictionary = {}
	var delayIndexNumber: int = GetDelayIndexNumber(avatarObjectID)
	if 0 < delayIndexNumber:
		delayPosition = GetCurrentActiveAvatarInfoList(delayIndexNumber)
	
	return delayPosition

func InitCurrentActiveAvatarInfoList():
	for _iv in range(CURRENTACTIVEAVATARINFOLIST_MAX_SIZE):
		m_CurrentActiveAvatarInfoList.append(CURRENT_ACTIVE_AVATAR_INFO.duplicate())

func ResetCurrentActiveAvatarInfoList():
	var walkPositionX: float = m_CurrentActiveAvatarInstance.GetPosition().x
	var walkPositionY: float = m_CurrentActiveAvatarInstance.GetPosition().y
	var spriteToLeft_flip_h: bool = m_CurrentActiveAvatarInstance.GetSpriteToLeft_flip_h()
	
	m_CurrentActiveAvatarInfoListCurrentIndex = 0
	for iv in range(CURRENTACTIVEAVATARINFOLIST_MAX_SIZE):
		SetCurrentActiveAvatarInfoList(iv, walkPositionX, walkPositionY, spriteToLeft_flip_h)
	
	m_CurrentActiveAvatarInfoListCount = 0

func GetCurrentActiveAvatarInfoListCount() -> int:
	return m_CurrentActiveAvatarInfoListCount

func CheckCurrentActiveAvatarInfoListCount(avatarObjectID: int) -> bool:
	var isOK: bool = false
	var delayIndexNumber: int = GetDelayIndexNumber(avatarObjectID)
	if 0 < delayIndexNumber:
		if delayIndexNumber <= m_CurrentActiveAvatarInfoListCount:
			isOK = true
	
	return isOK

func GetIsNeedCompleteAll_FOLLOW_WALK(avatarObjectID: int) -> bool:
	var index: int = SceneManager.GetIndex_From_CurrentSceneNode2DAvatarChildren(avatarObjectID)
	var createAvatarInfo: Dictionary = GetCreateAvatarInfoListOneElement(index)
	return createAvatarInfo.isNeedCompleteAll_FOLLOW_WALK

func SetIsNeedCompleteAll_FOLLOW_WALK(avatarObjectID: int, isNeedCompleteAll_FOLLOW_WALK: bool):
	var index: int = SceneManager.GetIndex_From_CurrentSceneNode2DAvatarChildren(avatarObjectID)
	var createAvatarInfo: Dictionary = GetCreateAvatarInfoListOneElement(index)
	createAvatarInfo.isNeedCompleteAll_FOLLOW_WALK = isNeedCompleteAll_FOLLOW_WALK

func GetIsAll_NeedCompleteAll_FOLLOW_WALK_false() -> bool:
	var isAll_NeedCompleteAll_FOLLOW_WALK_false: bool = true
	if m_CreateAvatarInfoList.empty():
		isAll_NeedCompleteAll_FOLLOW_WALK_false = false
	else:
		var i: int = 0
		var currentActiveIndex: int = GetActiveAvatarIndexInCreateAvatarInfoList()
		for iv in m_CreateAvatarInfoList:
			var isCurrentActive: bool = (currentActiveIndex == i)
			if not isCurrentActive:
				if iv.isNeedCompleteAll_FOLLOW_WALK:
					isAll_NeedCompleteAll_FOLLOW_WALK_false = false
					
					break
			
			i = i + 1
	
	return isAll_NeedCompleteAll_FOLLOW_WALK_false

func IsCurrentActiveAvatarInState_IDLE() -> bool:
	var isAvatarInState_IDLE: bool = false
	if is_instance_valid(m_CurrentActiveAvatarInstance):
		isAvatarInState_IDLE = m_CurrentActiveAvatarInstance.IsAvatarInState_IDLE()
	
	return isAvatarInState_IDLE

func IsCurrentActiveAvatarInState_WALK(avatarObjectID: int) -> bool:
	var isAvatarInState_WALK: bool = false
	if is_instance_valid(m_CurrentActiveAvatarInstance):
		isAvatarInState_WALK = m_CurrentActiveAvatarInstance.IsAvatarInState_WALK()
	
	if GetIsNeedCompleteAll_FOLLOW_WALK(avatarObjectID):
		isAvatarInState_WALK = true
	
	return isAvatarInState_WALK

func IsCurrentActiveAvatarValid() -> bool:
	return is_instance_valid(m_CurrentActiveAvatarInstance)

func IsCurrentActiveAvatar(avatarObjectID: int) -> bool:
	var isCurrentActiveAvatar: bool = false
	if is_instance_valid(m_CurrentActiveAvatarInstance):
		isCurrentActiveAvatar = (m_CurrentActiveAvatarInstance.GetAvatarObjectID() == avatarObjectID)
	
	return isCurrentActiveAvatar

func GetCurrentActiveAvatarInstance() -> KinematicBody2DAvatar:
	return m_CurrentActiveAvatarInstance

func GetCurrentActiveAvatarTypeID() -> int:
	return m_CurrentActiveAvatarInstance.GetAvatarTypeID()

func GetCurrentActiveAvatarObjectID() -> int:
	return m_CurrentActiveAvatarInstance.GetAvatarObjectID()

func GetCurrentActiveAvatarPosition() -> Vector2:
	return m_CurrentActiveAvatarInstance.GetPosition()

func ResetCurrentActiveAvatarInstance(index: int):
	var node2DAvatar: Node = SceneManager.GetCurrentSceneNode2DAvatar()
	var node2DAvatarChildrenSize: int = SceneManager.GetCurrentSceneNode2DAvatarChildrenSize()
	var currentActiveAvatarIndex: int = node2DAvatarChildrenSize - 1
	var newActiveAvatar: KinematicBody2DAvatar = node2DAvatar.get_child(node2DAvatarChildrenSize - 1 - index)
	node2DAvatar.move_child(newActiveAvatar, currentActiveAvatarIndex)
	
	m_CurrentActiveAvatarInstance.SetCurrentUnactive()
	m_CurrentActiveAvatarInstance.AvatarStart_FOLLOW_IDLE()
	SetCurrentActiveAvatarInstance(node2DAvatar.get_child(currentActiveAvatarIndex))

func SetCurrentActiveAvatarInstanceInInteraction(isInInteraction: bool):
	m_CurrentActiveAvatarInstance.SetInInteraction(isInInteraction, false)

func ResetCreateAvatarInfoListAndTeamPanelItemAvatarIconSort(a, b):
	return a.index < b.index

func ResetCreateAvatarInfoListAndTeamPanelItemAvatarIcon(index: int):
	if not ((0 <= index) and (m_CreateAvatarInfoList.size() > index)):
		HQH.AssertLog("ResetCreateAvatarInfoListAndTeamPanelItemAvatarIcon, index: %s is out of range[0, %s)" % [index, m_CreateAvatarInfoList.size()])
		
		return
	
	var node2DAvatarChildrenSize: int = SceneManager.GetCurrentSceneNode2DAvatarChildrenSize()
	m_CreateAvatarInfoList[node2DAvatarChildrenSize - 1 - index].index = m_CreateAvatarInfoList.size()
	m_CreateAvatarInfoList.sort_custom(self, "ResetCreateAvatarInfoListAndTeamPanelItemAvatarIconSort")
	for i in m_CreateAvatarInfoList.size():
		m_CreateAvatarInfoList[i].index = i
		m_CreateAvatarInfoList[i].isNeedCompleteAll_FOLLOW_WALK = false
		m_CreateAvatarInfoList[i].needCompleteAll_FOLLOW_WALK_DelayIndexNumber = 0
	
	UIManager.TeamPanel_SetItemAvatarIcon()

func GetAvatarTypePreloadResourceInstance(avatarTypeID: int) -> KinematicBody2DAvatar:
	return TableManager.Get_PRELOAD_RESOURCE_MAP(TableManager.GetAvatarTypeInfo(avatarTypeID).preloadResource).instance()

func SpawnAvatarTransparent():
	var createAvatarInfoList: Array = []
	var createAvatarInfo: Dictionary = {
		"avatarTypeID": TableManager.AVATARTYPEID_AVATARTRANSPARENT,
		"initPosition": Vector2.ZERO,
		"equipTypeID": 0,
	}
	createAvatarInfoList.append(createAvatarInfo)
	SpawnAvatar(false, createAvatarInfoList)

func AddCreateAvatarInfoList_From_SaveGameData_Archive_AvatarList(spawnAvatarPosition: Vector2 = Vector2.INF):
	var archive_AvatarList: Array = SaveGameManager.GetSaveGameData_Archive_AvatarList()
	for iv in archive_AvatarList:
		var avatarTypeID: int = iv.avatarTypeID
		var initPosition: Vector2 = Vector2(iv.avatarPositionX, iv.avatarPositionY)
		if not spawnAvatarPosition.is_equal_approx(Vector2.INF):
			initPosition = spawnAvatarPosition
		
		var equipTypeID: int = iv.equipTypeID
		AddCreateAvatarInfoList(avatarTypeID, initPosition, equipTypeID)

func SpawnAvatar(isReadDataFromSaveData: bool, createAvatarInfoList: Array = [], spawnAvatarPosition: Vector2 = Vector2.INF):
	if not SceneManager.IsCurrentSceneNode2DAvatarValid():
		return
	
	ClearCreateAvatarInfoList()
	
	var isHasData: bool = false
	if isReadDataFromSaveData:
		# Read data from save data
		isHasData = true
		AddCreateAvatarInfoList_From_SaveGameData_Archive_AvatarList(spawnAvatarPosition)
	else:
		isHasData = not createAvatarInfoList.empty()
		for iv in createAvatarInfoList:
			var avatarTypeID: int = iv.avatarTypeID
			var initPosition: Vector2 = iv.initPosition
			var equipTypeID: int = iv.equipTypeID
			AddCreateAvatarInfoList(avatarTypeID, initPosition, equipTypeID)
	
	if not isHasData:
		# If no data, init it
		var avatarNumber: int = 11	# 11, CREATEAVATARINFOLIST_NUMBER_MAX
		for i in avatarNumber:
			var avatarInitTypeID: int = i + 1 + 11 * 0
			var avatarInitPosition: Vector2 = Vector2.ZERO
			var equipTypeID: int = 0
			AddCreateAvatarInfoList(avatarInitTypeID, avatarInitPosition, equipTypeID)
		
#		var avatarInitTypeID1: int = 1	# 8
#		var avatarInitTypeID2: int = 2	# 7
#		var avatarInitTypeID3: int = 3	# 2
#		var avatarInitTypeID4: int = 4	# 4
#		var avatarInitTypeID5: int = 5	# 3
#		var avatarInitTypeID6: int = 6
#		var avatarInitTypeID7: int = 7
#		var avatarInitTypeID8: int = 8
#		var avatarInitTypeID9: int = 9
#		var avatarInitTypeID10: int = 10
#		var avatarInitTypeID11: int = 11
#		var avatarInitPosition1: Vector2 = Vector2.ZERO
#		var avatarInitPosition2: Vector2 = Vector2.ZERO
#		var avatarInitPosition3: Vector2 = Vector2.ZERO
#		var avatarInitPosition4: Vector2 = Vector2.ZERO
#		var avatarInitPosition5: Vector2 = Vector2.ZERO
#		var avatarInitPosition6: Vector2 = Vector2.ZERO
#		var avatarInitPosition7: Vector2 = Vector2.ZERO
#		var avatarInitPosition8: Vector2 = Vector2.ZERO
#		var avatarInitPosition9: Vector2 = Vector2.ZERO
#		var avatarInitPosition10: Vector2 = Vector2.ZERO
#		var avatarInitPosition11: Vector2 = Vector2.ZERO
#		var equipTypeID1: int = 0
#		var equipTypeID2: int = 0
#		var equipTypeID3: int = 0
#		var equipTypeID4: int = 5		# 5
#		var equipTypeID5: int = 0
#		var equipTypeID6: int = 0
#		var equipTypeID7: int = 0
#		var equipTypeID8: int = 0
#		var equipTypeID9: int = 0
#		var equipTypeID10: int = 0
#		var equipTypeID11: int = 0
#		AddCreateAvatarInfoList(avatarInitTypeID1, avatarInitPosition1, equipTypeID1)
#		AddCreateAvatarInfoList(avatarInitTypeID2, avatarInitPosition2, equipTypeID2)
#		AddCreateAvatarInfoList(avatarInitTypeID3, avatarInitPosition3, equipTypeID3)
#		AddCreateAvatarInfoList(avatarInitTypeID4, avatarInitPosition4, equipTypeID4)
#		AddCreateAvatarInfoList(avatarInitTypeID5, avatarInitPosition5, equipTypeID5)
#		AddCreateAvatarInfoList(avatarInitTypeID6, avatarInitPosition6, equipTypeID6)
#		AddCreateAvatarInfoList(avatarInitTypeID7, avatarInitPosition7, equipTypeID7)
#		AddCreateAvatarInfoList(avatarInitTypeID8, avatarInitPosition8, equipTypeID8)
#		AddCreateAvatarInfoList(avatarInitTypeID9, avatarInitPosition9, equipTypeID9)
#		AddCreateAvatarInfoList(avatarInitTypeID10, avatarInitPosition10, equipTypeID10)
#		AddCreateAvatarInfoList(avatarInitTypeID11, avatarInitPosition11, equipTypeID11)
	
	CreateAvatarInCurrentScene()
	UIManager.TeamPanel_SetItemAvatarIcon()

func GetCreateAvatarInfo(avatarTypeID: int, initPosition: Vector2, equipTypeID: int) -> Dictionary:
	var createAvatarInfo: Dictionary = CREATE_AVATAR_INFO.duplicate()
	createAvatarInfo.avatarTypeID = avatarTypeID
	createAvatarInfo.initPosition = initPosition
	createAvatarInfo.equipTypeID = equipTypeID
	
	return createAvatarInfo

func AddCreateAvatarInfoList(avatarTypeID: int, initPosition: Vector2, equipTypeID: int):
	if not TableManager.IsHasAvatarType(avatarTypeID):
		HQH.Log("Not has avatarTypeID: %s" % [avatarTypeID])
		
		return
	
	var createAvatarInfo: Dictionary = GetCreateAvatarInfo(avatarTypeID, initPosition, equipTypeID)
	createAvatarInfo.index = m_CreateAvatarInfoList.size()
	m_CreateAvatarInfoList.append(createAvatarInfo)

func ClearCreateAvatarInfoList():
	m_CreateAvatarInfoList.clear()

func GetActiveAvatarIndexInCreateAvatarInfoList() -> int:
	var avatarInfoListSize: int = m_CreateAvatarInfoList.size()
	var currentActiveIndex: int = avatarInfoListSize - ACTIVEAVATAR_NUMBER
	
	return currentActiveIndex

func CreateAvatarInCurrentScene():
	RemoveCurrentSceneAllAvatar()
	
	var i: int = 0
	var currentActiveIndex: int = GetActiveAvatarIndexInCreateAvatarInfoList()
	for iv in m_CreateAvatarInfoList:
		var resourceInstance: KinematicBody2DAvatar = AvatarManager.GetAvatarTypePreloadResourceInstance(iv.avatarTypeID)
		var isCurrentActive: bool = (currentActiveIndex == i)
		AddAvatarToCurrentScene(resourceInstance, iv.initPosition, isCurrentActive, iv.avatarTypeID)
		if not isCurrentActive:
			resourceInstance.AvatarStart_FOLLOW_IDLE()
			resourceInstance.CollisionShape2D1ShapeRadiusSetNormal()
		else:
			resourceInstance.CollisionShape2D1ShapeRadiusSetSmall()
		
		if EquipManager.IsHasEquip(iv.equipTypeID):
			EquipManager.AvatarPutOnEquip(iv.avatarTypeID, iv.equipTypeID)
		
		i = i + 1
	
	ResetCurrentActiveAvatarInfoList()

func AddAvatarFromScene(avatarTypeID: int):
	var isFound: bool = false
	var foundNPC: KinematicBody2DAvatar = null
	var node2DNPCChildren: Array = SceneManager.GetCurrentSceneNode2DNPCChildren()
	for iv in node2DNPCChildren:
		if avatarTypeID == iv.GetAvatarTypeID():
			isFound = true
			
			foundNPC = iv
			
			break
	
	if isFound:
		var teamLeaderAvatarInfo: Dictionary = SaveGameManager.GetSaveGameData_Archive_AvatarList_TeamLeaderAvatarInfo()
		var avatarSceneTypeID: int = teamLeaderAvatarInfo.avatarSceneTypeID # SceneManager.GetCurrentSceneTypeID()
		var avatarPositionX: float = teamLeaderAvatarInfo.avatarPositionX
		var avatarPositionY: float = teamLeaderAvatarInfo.avatarPositionY
		var equipTypeID: int = 0
		var isSuccess: bool = SaveGameManager.AddSaveGameData_Archive_AvatarList(avatarTypeID, avatarSceneTypeID, avatarPositionX, avatarPositionY, equipTypeID)
		if isSuccess:
			UIManager.DownPanel_AddJournalRecord(TableManager.GetLanguageString("ADDAVATARFROMSCENE_ADD_TEAM_MEMBERS") % UIManager.RichTextLabel_GetStringWithFlagColorAndClickEvent(TableManager.GetAvatarShowName(avatarTypeID), TableManager.GetAvatarFlagColor(avatarTypeID).to_html(), "%s%s" % [UIManager.UI_INPUT_ACTION_EVENT_TYPE.EVENT_AVATAR, avatarTypeID]))
			
			if is_instance_valid(foundNPC):
				foundNPC.ReparentAndMoveTo0(SceneManager.GetCurrentSceneNode2DAvatar())
				foundNPC.SetIsNPC(false, HQH.NPC_MANNER_TYPE.NPC_MANNER_FRIENDLY)
				foundNPC.AvatarStart_FOLLOW_IDLE()
				foundNPC.CollisionShape2D1ShapeRadiusSetNormal()
				foundNPC.SetNPCTriggerInvalid()
			
			ClearCreateAvatarInfoList()
			AddCreateAvatarInfoList_From_SaveGameData_Archive_AvatarList()
			
			UIManager.TeamPanel_SetItemAvatarIcon()
			
#			ResetCurrentActiveAvatarInfoList()
		else:
			HQH.Log("AddAvatarFromScene, isSuccess is false, avatarTypeID: %s" % avatarTypeID)
	else:
		HQH.AssertLog("AddAvatarFromScene, isFound is false, avatarTypeID: %s" % avatarTypeID)

func RemoveAvatarFromSceneBase(avatarTypeID: int):
	var isFound: bool = false
	var foundAvatar: KinematicBody2DAvatar = null
	var node2DAvatarChildren: Array = SceneManager.GetCurrentSceneNode2DAvatarChildren()
	for iv in node2DAvatarChildren:
		if avatarTypeID == iv.GetAvatarTypeID():
			isFound = true
			
			foundAvatar = iv
			
			break
	
	if isFound:
		var archive_AvatarList: Array = SaveGameManager.GetSaveGameData_Archive_AvatarList()
		if SaveGameManager.SWALLOW_ARCHIVE_AVATARLIST_SIZE_MIN <= archive_AvatarList.size():
			var teamLeaderAvatarInfo: Dictionary = SaveGameManager.GetSaveGameData_Archive_AvatarList_TeamLeaderAvatarInfo()
			var isTeamLeader: bool = (avatarTypeID == teamLeaderAvatarInfo.avatarTypeID)
			var isSuccess: bool = SaveGameManager.RemoveSaveGameData_Archive_AvatarListByAvatarTypeID(avatarTypeID)
			if isSuccess:
				UIManager.DownPanel_AddJournalRecord(TableManager.GetLanguageString("MEMBERS_OF_THE_TEAM_WHO_LEFT") % UIManager.GetAvatarShowNameWithColor(avatarTypeID))
				
				if isTeamLeader:
					m_CurrentActiveAvatarInstance.SetCurrentUnactive()
					var node2DAvatarChildrenNew: Array = SceneManager.GetCurrentSceneNode2DAvatarChildren()
					SetCurrentActiveAvatarInstance(node2DAvatarChildrenNew[node2DAvatarChildrenNew.size() - SaveGameManager.SWALLOW_ARCHIVE_AVATARLIST_SIZE_MIN]) # Now, teamLeader is still in array.
				
				if is_instance_valid(foundAvatar):
					var node2DAvatar: Node = SceneManager.GetCurrentSceneNode2DAvatar()
					node2DAvatar.remove_child(foundAvatar)
					foundAvatar.queue_free()
					foundAvatar = null
				
				ClearCreateAvatarInfoList()
				AddCreateAvatarInfoList_From_SaveGameData_Archive_AvatarList()
				
				UIManager.TeamPanel_SetItemAvatarIcon()
			else:
				HQH.Log("RemoveAvatarFromSceneBase, isSuccess is false, avatarTypeID: %s" % avatarTypeID)
		else:
			HQH.Log("RemoveAvatarFromSceneBase, not(SaveGameManager.SWALLOW_ARCHIVE_AVATARLIST_SIZE_MIN: %s <= archive_AvatarList.size()), archive_AvatarList.size(): %s" % [SaveGameManager.SWALLOW_ARCHIVE_AVATARLIST_SIZE_MIN, archive_AvatarList.size()])
	else:
		HQH.AssertLog("RemoveAvatarFromSceneBase, isFound is false, avatarTypeID: %s" % avatarTypeID)

func RemoveAvatarFromScene(avatarTypeID: int):
	NavigationManager.AStarEnd()
	SetAllAvatarToCurrentActiveAvatarPosition()
	RemoveAvatarFromSceneBase(avatarTypeID)

func CurrentActiveAvatarPlayTalk(stringLength: int):
	if is_instance_valid(m_CurrentActiveAvatarInstance):
		if not m_CurrentActiveAvatarInstance.IsAvatarInState_TALK():
			m_CurrentActiveAvatarInstance.AvatarStart_TALK()
			
			m_CurrentActiveAvatarInstance_IsTalkStart = true
			var talkTime: float = float(stringLength) / CURRENTACTIVEAVATARINSTANCE_TALKTIMER_COUNT
			m_CurrentActiveAvatarInstance_TalkTimer = clamp(talkTime, CURRENTACTIVEAVATARINSTANCE_TALKTIMER_MIN, CURRENTACTIVEAVATARINSTANCE_TALKTIMER_MAX)

func CurrentActiveAvatarPlayAttack():
	if is_instance_valid(m_CurrentActiveAvatarInstance):
		if not m_CurrentActiveAvatarInstance.IsAvatarInState_ATTACK():
			m_CurrentActiveAvatarInstance.AvatarStart_ATTACK()
			
			m_CurrentActiveAvatarInstance_IsAttackStart = true
			m_CurrentActiveAvatarInstance_AttackTimer = CURRENTACTIVEAVATARINSTANCE_ATTACKTIMER_STEP

func InteractionNPCPlayTalk(stringLength: int):
	var interactionInfo: Dictionary = UIManager.GetInteractionInfo()
	if TableManager.NPC_TRIGGER_TYPE.NPC_AVATAR == interactionInfo.npcTriggerType:
		if is_instance_valid(interactionInfo.interactionNPC):
			if not interactionInfo.interactionNPC.IsAvatarInState_TALK():
				interactionInfo.interactionNPC.AvatarStart_TALK()
				
				m_InteractionNPC_IsTalkStart = true
				var talkTime: float = float(stringLength) / CURRENTACTIVEAVATARINSTANCE_TALKTIMER_COUNT
				m_InteractionNPC_TalkTimer = clamp(talkTime, CURRENTACTIVEAVATARINSTANCE_TALKTIMER_MIN, CURRENTACTIVEAVATARINSTANCE_TALKTIMER_MAX)

func InteractionNPCPlayAttack():
	var interactionInfo: Dictionary = UIManager.GetInteractionInfo()
	if TableManager.NPC_TRIGGER_TYPE.NPC_AVATAR == interactionInfo.npcTriggerType:
		if is_instance_valid(interactionInfo.interactionNPC):
			if not interactionInfo.interactionNPC.IsAvatarInState_ATTACK():
				interactionInfo.interactionNPC.AvatarStart_ATTACK()
				
				m_InteractionNPC_IsAttackStart = true
				m_InteractionNPC_AttackTimer = CURRENTACTIVEAVATARINSTANCE_ATTACKTIMER_STEP

func GetAllAvatarPower() -> Dictionary:
	var avatarPowerMin: int = TableManager.POWER_MIN
	var avatarPowerMax: int = 0
	for iv in AvatarManager.GetCreateAvatarInfoList():
		avatarPowerMin = int(min(avatarPowerMin, TableManager.GetAvatarPowerMin(iv.avatarTypeID)))
		avatarPowerMax += TableManager.GetAvatarPowerMax(iv.avatarTypeID)
	
	return {"avatarPowerMin": avatarPowerMin, "avatarPowerMax": avatarPowerMax}

func SetAllAvatarToCurrentActiveAvatarPosition():
	var node2DAvatarChildren: Array = SceneManager.GetCurrentSceneNode2DAvatarChildren()
	for iv in node2DAvatarChildren:
		if GetCurrentActiveAvatarTypeID() != iv.GetAvatarTypeID():
			iv.SetPosition(GetCurrentActiveAvatarPosition())
	
	ResetCurrentActiveAvatarInfoList()
