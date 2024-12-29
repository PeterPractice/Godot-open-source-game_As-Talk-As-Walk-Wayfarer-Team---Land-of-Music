extends Node

const CURRENTCAMERA_OFFSET_Y: int = 100

var m_CurrentCamera: Camera2D = Camera2D.new()

func _ready():
	m_CurrentCamera.make_current()
	SetCurrentCameraOffsetNormal()

func MountCurrentCamera():
	var currentActiveAvatar: KinematicBody2DAvatar = AvatarManager.GetCurrentActiveAvatarInstance()
	if is_instance_valid(currentActiveAvatar):
		currentActiveAvatar.add_child(m_CurrentCamera)

func UnmountCurrentCamera():
	var currentActiveAvatar: KinematicBody2DAvatar = AvatarManager.GetCurrentActiveAvatarInstance()
	if is_instance_valid(currentActiveAvatar):
		currentActiveAvatar.remove_child(m_CurrentCamera)

func SetCurrentCameraOffset(offset: Vector2):
	m_CurrentCamera.offset = offset

func SetCurrentCameraOffsetNormal():
	SetCurrentCameraOffset(Vector2(0, CURRENTCAMERA_OFFSET_Y))
