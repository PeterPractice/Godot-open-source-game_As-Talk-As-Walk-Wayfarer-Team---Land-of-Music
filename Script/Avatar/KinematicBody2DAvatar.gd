extends KinematicBody2D
class_name KinematicBody2DAvatar

const COLLISIONSHAPE2D1_SHAPE_RADIUS_NORMAL: int = 31
const COLLISIONSHAPE2D1_SHAPE_RADIUS_SMALL: int = COLLISIONSHAPE2D1_SHAPE_RADIUS_NORMAL - 2

onready var spriteIdleToLeft = $spriteIdleToLeft
onready var spriteWalkToLeft = $spriteWalkToLeft
onready var spriteTalkToLeft = $spriteTalkToLeft
onready var spriteAttackToLeft = $spriteAttackToLeft

enum AVATAR_STATE {
	IDLE,
	WALK,
	TALK,
	ATTACK,
	FOLLOW_IDLE,
	FOLLOW_WALK,
}
var m_CurrentAvatarState: int = AVATAR_STATE.IDLE
#For each Avatar State, also need 3 function(example: IDLE):
#func CheckStateIn_IDLE()
#func ChangeToState_IDLE()
#func DoStateActionIn_IDLE()

var m_CurrentMotionDirection: Vector2 = Vector2.ZERO
var m_SpriteToLeft_flip_h: bool = false
var m_SpriteToLeft_flip_h_TimerStep: float = 0.0
var m_SpriteToLeft_flip_h_Timer: float = 0.0
var m_AvatarObjectID: int = 0 # 0: invalid ID. 1-n: valid ID.
var m_AvatarTypeID: int = 0
var m_IsNPC: bool = false
var m_NPCManner: int = HQH.NPC_MANNER_TYPE.NPC_MANNER_FRIENDLY
var m_NPCTrigger: Node2D = null

func _ready():
	spriteIdleToLeft.material = spriteIdleToLeft.material.duplicate(true)
	spriteWalkToLeft.material = spriteWalkToLeft.material.duplicate(true)
	spriteTalkToLeft.material = spriteTalkToLeft.material.duplicate(true)
	spriteAttackToLeft.material = spriteAttackToLeft.material.duplicate(true)
	
	self.input_pickable = true
	
	AvatarStart_IDLE()

func DisposePhysicsProcess(delta: float):
	if IsAvatarInState_FOLLOW():
		var avatarInfo: Dictionary = AvatarManager.GetAvatarInfo_From_CurrentActiveAvatarInfoList_By_AvatarObjectID(m_AvatarObjectID)
		var motion: Vector2 = Vector2.ZERO
		if not avatarInfo.empty():
			motion = Vector2(avatarInfo.walkPosition.x - self.position.x, avatarInfo.walkPosition.y - self.position.y)
			m_CurrentMotionDirection = motion.normalized()
			m_SpriteToLeft_flip_h = avatarInfo.spriteToLeft_flip_h
		
		if AvatarManager.GetIsNeedCompleteAll_FOLLOW_WALK(m_AvatarObjectID):
			if not avatarInfo.empty():
#				if (SceneManager.MOTION_LENGTH_SQUARED_MIN_30 > abs(motion.x)) and (SceneManager.MOTION_LENGTH_SQUARED_MIN_30 > abs(motion.y)):
					AvatarManager.AddNeedCompleteAll_FOLLOW_WALK_DelayIndexNumber(m_AvatarObjectID)
			else:
				AvatarManager.SetIsNeedCompleteAll_FOLLOW_WALK(m_AvatarObjectID, false)
				AvatarManager.ResetNeedCompleteAll_FOLLOW_WALK_DelayIndexNumber(m_AvatarObjectID)
				if AvatarManager.GetIsAll_NeedCompleteAll_FOLLOW_WALK_false():
					AvatarManager.ResetCurrentActiveAvatarInfoList()
					
					UIManager.SetUI_INPUT_ACTION_EVENT_TYPE_COMMONBUTTONITEM_TEXTUREBUTTON1_PRESSED_EVENT_Stop()
	else:
		if m_IsNPC:
			m_CurrentMotionDirection = Vector2.ZERO
			if UIManager.GetIsInInteraction():
				if 0.0 < m_SpriteToLeft_flip_h_TimerStep:
#					var currentActiveAvatar: KinematicBody2DAvatar = AvatarManager.GetCurrentActiveAvatarInstance() # Here can not use KinematicBody2DAvatar type. Otherwise it will cause "ERROR: Resources still in use at exit", when close the project.
					var currentActiveAvatar: KinematicBody2D = AvatarManager.GetCurrentActiveAvatarInstance()
					if currentActiveAvatar.position.x < self.position.x:
						m_SpriteToLeft_flip_h = false
					else:
						m_SpriteToLeft_flip_h = true
			else:
				if 0.0 < m_SpriteToLeft_flip_h_TimerStep:
					m_SpriteToLeft_flip_h_Timer += delta
					if m_SpriteToLeft_flip_h_TimerStep < m_SpriteToLeft_flip_h_Timer:
						m_SpriteToLeft_flip_h_Timer = 0.0
						
						m_SpriteToLeft_flip_h = HQH.RandomBool()
		else:
			m_CurrentMotionDirection = SceneManager.GetCurrentInputMotionDirection()
			if 0.0 < m_CurrentMotionDirection.x:
				m_SpriteToLeft_flip_h = true
			elif 0.0 > m_CurrentMotionDirection.x:
				m_SpriteToLeft_flip_h = false
	
	CheckState()
	DoStateAction()

func CheckStateIn_IDLE():
	if HQH.IsVector2AbsGreaterThan0(m_CurrentMotionDirection):
		AvatarStart_WALK()

func ChangeToState_IDLE():
	pass

func DoStateActionIn_IDLE():
	DoStateAction_IDLE()

func SetSpriteIdleToLeft_flip_h(flip_h: bool):
	spriteIdleToLeft.flip_h = flip_h

func DoStateAction_IDLE():
	spriteIdleToLeft.flip_h = m_SpriteToLeft_flip_h
	SetEquipFlipH()
	
	$animationPlayer1.play("idleToLeft")

func CheckStateIn_WALK():
	if (0.0 == m_CurrentMotionDirection.x) and (0.0 == m_CurrentMotionDirection.y):
		AvatarStart_IDLE()

func ChangeToState_WALK():
	pass

func DoStateActionIn_WALK():
	DoStateAction_WALK()
	
	if AvatarManager.IsCurrentActiveAvatar(m_AvatarObjectID):
		AvatarManager.AddCurrentActiveAvatarInfoList(self.position.x, self.position.y, m_SpriteToLeft_flip_h)

func DoStateAction_WALK():
	spriteWalkToLeft.flip_h = m_SpriteToLeft_flip_h
	SetEquipFlipH()
	
	$animationPlayer1.play("walkToLeft")
	
	move_and_slide(m_CurrentMotionDirection * SceneManager.GetAvatarMotionSpeed())

func CheckStateIn_TALK():
	pass

func ChangeToState_TALK():
	pass

func DoStateActionIn_TALK():
	DoStateAction_TALK()

func DoStateAction_TALK():
	spriteTalkToLeft.flip_h = m_SpriteToLeft_flip_h
	SetEquipFlipH()
	
	$animationPlayer1.play("talkToLeft")

func CheckStateIn_ATTACK():
	pass

func ChangeToState_ATTACK():
	pass

func DoStateActionIn_ATTACK():
	DoStateAction_ATTACK()

func DoStateAction_ATTACK():
	spriteAttackToLeft.flip_h = m_SpriteToLeft_flip_h
	SetEquipFlipH()
	
	$animationPlayer1.play("attackToLeft")

func CheckStateIn_FOLLOW_IDLE():
	if AvatarManager.IsCurrentActiveAvatarInState_WALK(m_AvatarObjectID):
		var isOK: bool = AvatarManager.CheckCurrentActiveAvatarInfoListCount(m_AvatarObjectID)
		if isOK:
			AvatarStart_FOLLOW_WALK()

func ChangeToState_FOLLOW_IDLE():
	pass

func DoStateActionIn_FOLLOW_IDLE():
	DoStateAction_IDLE()

func CheckStateIn_FOLLOW_WALK():
	if not AvatarManager.IsCurrentActiveAvatarInState_WALK(m_AvatarObjectID):
		AvatarStop_FOLLOW_WALK()

func ChangeToState_FOLLOW_WALK():
	pass

func DoStateActionIn_FOLLOW_WALK():
	DoStateAction_WALK()

func ShowSpriteByState(showState: int):
	spriteIdleToLeft.visible = ((AVATAR_STATE.IDLE == showState) or (AVATAR_STATE.FOLLOW_IDLE == showState))
	spriteWalkToLeft.visible = ((AVATAR_STATE.WALK == showState) or (AVATAR_STATE.FOLLOW_WALK == showState))
	spriteTalkToLeft.visible = (AVATAR_STATE.TALK == showState)
	spriteAttackToLeft.visible = (AVATAR_STATE.ATTACK == showState)

func CheckState():
	match m_CurrentAvatarState:
		AVATAR_STATE.IDLE:
			CheckStateIn_IDLE()
		
		AVATAR_STATE.WALK:
			CheckStateIn_WALK()
		
		AVATAR_STATE.TALK:
			CheckStateIn_TALK()
		
		AVATAR_STATE.ATTACK:
			CheckStateIn_ATTACK()
		
		AVATAR_STATE.FOLLOW_IDLE:
			CheckStateIn_FOLLOW_IDLE()
		
		AVATAR_STATE.FOLLOW_WALK:
			CheckStateIn_FOLLOW_WALK()

func ChangeToState(newState: int):
	m_CurrentAvatarState = newState
	match m_CurrentAvatarState:
		AVATAR_STATE.IDLE:
			ChangeToState_IDLE()
		
		AVATAR_STATE.WALK:
			ChangeToState_WALK()
		
		AVATAR_STATE.TALK:
			ChangeToState_TALK()
		
		AVATAR_STATE.ATTACK:
			ChangeToState_ATTACK()
		
		AVATAR_STATE.FOLLOW_IDLE:
			ChangeToState_FOLLOW_IDLE()
		
		AVATAR_STATE.FOLLOW_WALK:
			ChangeToState_FOLLOW_WALK()

func DoStateAction():
	ShowSpriteByState(m_CurrentAvatarState)
	match m_CurrentAvatarState:
		AVATAR_STATE.IDLE:
			DoStateActionIn_IDLE()
		
		AVATAR_STATE.WALK:
			DoStateActionIn_WALK()
		
		AVATAR_STATE.TALK:
			DoStateActionIn_TALK()
		
		AVATAR_STATE.ATTACK:
			DoStateActionIn_ATTACK()
		
		AVATAR_STATE.FOLLOW_IDLE:
			DoStateActionIn_FOLLOW_IDLE()
		
		AVATAR_STATE.FOLLOW_WALK:
			DoStateActionIn_FOLLOW_WALK()

func IsAvatarInState_IDLE() -> bool:
	return (AVATAR_STATE.IDLE == m_CurrentAvatarState)

func IsAvatarInState_WALK() -> bool:
	return (AVATAR_STATE.WALK == m_CurrentAvatarState)

func IsAvatarInState_TALK() -> bool:
	return (AVATAR_STATE.TALK == m_CurrentAvatarState)

func IsAvatarInState_ATTACK() -> bool:
	return (AVATAR_STATE.ATTACK == m_CurrentAvatarState)

func IsAvatarInState_FOLLOW() -> bool:
	return (IsAvatarInState_FOLLOW_IDLE() or IsAvatarInState_FOLLOW_WALK())

func IsAvatarInState_FOLLOW_IDLE() -> bool:
	return (AVATAR_STATE.FOLLOW_IDLE == m_CurrentAvatarState)

func IsAvatarInState_FOLLOW_WALK() -> bool:
	return (AVATAR_STATE.FOLLOW_WALK == m_CurrentAvatarState)

func AvatarStart_IDLE():
	ChangeToState(AVATAR_STATE.IDLE)

func AvatarStart_WALK():
	ChangeToState(AVATAR_STATE.WALK)

func AvatarStart_TALK():
	ChangeToState(AVATAR_STATE.TALK)

func AvatarStop_TALK():
	AvatarStart_IDLE()

func AvatarStart_ATTACK():
	ChangeToState(AVATAR_STATE.ATTACK)

func AvatarStop_ATTACK():
	AvatarStart_IDLE()

func AvatarStart_FOLLOW_IDLE():
	ChangeToState(AVATAR_STATE.FOLLOW_IDLE)

func CollisionShape2D1ShapeRadiusSetNormal():
	$collisionShape2D1.shape.radius = COLLISIONSHAPE2D1_SHAPE_RADIUS_NORMAL

func CollisionShape2D1ShapeRadiusSetSmall():
	$collisionShape2D1.shape.radius = COLLISIONSHAPE2D1_SHAPE_RADIUS_SMALL

func AvatarStart_FOLLOW_WALK():
	ChangeToState(AVATAR_STATE.FOLLOW_WALK)

func AvatarStop_FOLLOW_WALK():
	ChangeToState(AVATAR_STATE.FOLLOW_IDLE)

func _on_animationPlayer1_animation_finished(anim_name: String):
	if "attackToLeft" == anim_name:
#		HQH.Log("finished anim_name: %s" % anim_name)
		AvatarStop_ATTACK()

func SetCurrentActive():
#	$camera2D1.make_current()
	
	CameraManager.MountCurrentCamera()

func SetCurrentUnactive():
	CameraManager.UnmountCurrentCamera()

func SetPosition(newPosition: Vector2):
	self.position = newPosition

func SetScale(newScale: Vector2):
	self.scale = newScale

func GetPosition() -> Vector2:
	return self.position

func SetAvatarObjectID(newID: int):
	m_AvatarObjectID = newID

func GetAvatarObjectID() -> int:
	return m_AvatarObjectID

func SetAvatarTypeID(newID: int):
	m_AvatarTypeID = newID

func GetAvatarTypeID() -> int:
	return m_AvatarTypeID

func SetIsNPC(isNPC: bool, nPCManner: int):
	m_IsNPC = isNPC
	m_NPCManner = nPCManner

func GetIsNPC() -> bool:
	return m_IsNPC

func SetSpriteToLeft_flip_h_TimerStep(timerStep: float):
	m_SpriteToLeft_flip_h_TimerStep = timerStep

func SetInInteraction(isInInteraction: bool, isNeedShowOutline: bool = true):
	if isNeedShowOutline:
		if isInInteraction:
			ShowOutline()
		else:
			HideOutline()

func GetSpriteToLeft_flip_h() -> bool:
	return m_SpriteToLeft_flip_h

func SetEquipFlipH():
	if 0 < $node2DEquip_Head.get_child_count():
		for iv in $node2DEquip_Head.get_children():
			iv.SetFlipH(m_SpriteToLeft_flip_h)

func RemoveEquip() -> bool:
	var isRemoveSuccess: bool = false
	if 0 < $node2DEquip_Head.get_child_count():
		isRemoveSuccess = true
		for iv in $node2DEquip_Head.get_children():
			$node2DEquip_Head.remove_child(iv)
			iv.queue_free()
			iv = null
	
	return isRemoveSuccess

func PutOnEquip(equipTypeID: int):
	RemoveEquip()
	
	var equipTypeIDString: String = String(equipTypeID)
	var preloadResourcePath: String = TableManager.TableGetValue_EquipTable1_PreloadResourcePath(equipTypeIDString)
	var preloadResource: Resource = TableManager.Get_PRELOAD_RESOURCE_MAP(preloadResourcePath)
	var equipInstance = preloadResource.instance()
	equipInstance.SetHairColor(equipTypeID)
	
	$node2DEquip_Head.add_child(equipInstance)

func ShowOutline():
	spriteIdleToLeft.material.shader = TableManager.Get_PRELOAD_RESOURCE_MAP("Shader_SpriteOutline")
	var OUTLINE_WIDTH: float = 1.5
	spriteIdleToLeft.material.set_shader_param("outline_width", OUTLINE_WIDTH)
	if m_IsNPC:
		match m_NPCManner:
			HQH.NPC_MANNER_TYPE.NPC_MANNER_FRIENDLY:
				spriteIdleToLeft.material.set_shader_param("outline_color", HQH.COLORPALETTE_AVATAR.COLOR_NPC_FRIENDLY_OUTLINE)
			
			HQH.NPC_MANNER_TYPE.NPC_MANNER_HOSTILITY:
				spriteIdleToLeft.material.set_shader_param("outline_color", HQH.COLORPALETTE_AVATAR.COLOR_NPC_HOSTILITY_OUTLINE)
			
			HQH.NPC_MANNER_TYPE.NPC_MANNER_ARTICLE:
				spriteIdleToLeft.material.set_shader_param("outline_color", HQH.COLORPALETTE_AVATAR.COLOR_NPC_ARTICLE_OUTLINE)
	else:
		spriteIdleToLeft.material.set_shader_param("outline_color", HQH.COLORPALETTE_AVATAR.COLOR_AVATAR_OUTLINE)

func HideOutline():
	spriteIdleToLeft.material.shader = null

func _on_KinematicBody2DAvatar_input_event(_viewport: Object, event: InputEvent, _shape_idx: int):
	if event.is_action_pressed("focus_click"):
		HQH.Log("_on_KinematicBody2DAvatar_input_event, m_AvatarTypeID: %s" % m_AvatarTypeID)
		
		var clickAudioResource: String = TableManager.GetAvatarClickAudioResource(m_AvatarTypeID)
		if not clickAudioResource.empty():
			AudioManager.PlayByName(clickAudioResource)

func _on_KinematicBody2DAvatar_mouse_entered():
	HQH.Log("_on_KinematicBody2DAvatar_mouse_entered, m_AvatarTypeID: %s" % m_AvatarTypeID)
	
	AudioManager.PlayByName_ButtonHover()
	ShowOutline()
	UIManager.UpNamePanel_ShowTipsByAvatarTypeID(m_AvatarTypeID)

func _on_KinematicBody2DAvatar_mouse_exited():
	HQH.Log("_on_KinematicBody2DAvatar_mouse_exited, m_AvatarTypeID: %s" % m_AvatarTypeID)
	
	HideOutline()
	UIManager.UpNamePanel_HideTipsByAvatarTypeID(false, m_AvatarTypeID)

func ReparentAndMoveTo0(newParent: Node2D):
	get_parent().remove_child(self)
	newParent.add_child(self)
	newParent.move_child(self, 0)

func SetNPCTrigger(nPCTrigger: Node2D):
	m_NPCTrigger = nPCTrigger

func SetNPCTriggerInvalid():
	if is_instance_valid(m_NPCTrigger):
		m_NPCTrigger.SetInvalid()

func SetInvalid():
	self.visible = false

func SetValid():
	self.visible = true
