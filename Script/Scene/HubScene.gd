extends Node2D

onready var colorRect1 = $node2D1/colorRect1

var m_IsHadSetAvatarScaleAndPosition: bool = false

func _ready():
	SceneManager.HubScene_OnReady()

func UpdateScene():
	m_IsHadSetAvatarScaleAndPosition = false

func draw2():
	if not SceneManager.IsCurrentSceneNode2DAvatarValid():
		return
	
	var node2DAvatarChildren: Array = SceneManager.GetCurrentSceneNode2DAvatarChildren()
	var node2DAvatarChildren_size: int = node2DAvatarChildren.size()
	for i in node2DAvatarChildren_size:
		var node2DAvatarChild: KinematicBody2DAvatar = node2DAvatarChildren[node2DAvatarChildren_size - i - 1]
		var positionFrom: Vector2 = node2DAvatarChild.position
		var positionTo: Vector2 = colorRect1.rect_global_position
		var colorTemp: Color = TableManager.GetAvatarFlagColor(node2DAvatarChild.GetAvatarTypeID())
		var lineWidth: float = AvatarManager.CREATEAVATARINFOLIST_NUMBER_MAX - i
		match i:
			0:
				lineWidth = (AvatarManager.CREATEAVATARINFOLIST_NUMBER_MAX - i) * 5.0
			
			1:
				lineWidth = (AvatarManager.CREATEAVATARINFOLIST_NUMBER_MAX - i) * 4.0
			
			2:
				lineWidth = (AvatarManager.CREATEAVATARINFOLIST_NUMBER_MAX - i) * 3.0
			
			3:
				lineWidth = (AvatarManager.CREATEAVATARINFOLIST_NUMBER_MAX - i) * 2.0
			
			4:
				lineWidth = (AvatarManager.CREATEAVATARINFOLIST_NUMBER_MAX - i) * 1.0
			
			5:
				lineWidth = AvatarManager.CREATEAVATARINFOLIST_NUMBER_MAX - i
			
			6:
				lineWidth = AvatarManager.CREATEAVATARINFOLIST_NUMBER_MAX - i
			
			7:
				lineWidth = AvatarManager.CREATEAVATARINFOLIST_NUMBER_MAX - i
			
			8:
				lineWidth = AvatarManager.CREATEAVATARINFOLIST_NUMBER_MAX - i
			
			9:
				lineWidth = AvatarManager.CREATEAVATARINFOLIST_NUMBER_MAX - i
			
			10:
				lineWidth = AvatarManager.CREATEAVATARINFOLIST_NUMBER_MAX - i
		
		draw_line(positionFrom, positionTo, colorTemp, lineWidth)

func draw1():
	var t: int = HQH.Time() % 360 # [0, 359]
	var speed: float = 30.0
	var t360: float = t * speed
	var radian360: float = deg2rad(t360)
	var centerX: float = 1200.0
	var centerY: float = -400.0
	var radius: float = 100.0
	
	var node2DAvatarChildren: Array = SceneManager.GetCurrentSceneNode2DAvatarChildren()
	var node2DAvatarChildren_size: int = node2DAvatarChildren.size()
	for i in node2DAvatarChildren_size:
		var node2DAvatarChild: KinematicBody2DAvatar = node2DAvatarChildren[i]
		var positionFrom: Vector2 = node2DAvatarChild.position
		var positionTo: Vector2 = Vector2(centerX + (radius * cos(radian360)), centerY + (radius * sin(radian360)))
		draw_line(positionFrom, positionTo, Color("#00FF00"), AvatarManager.CREATEAVATARINFOLIST_NUMBER_MAX - (node2DAvatarChildren_size - i - 1))

func _draw():
	if SaveGameManager.IsContinueGame():
		# Continue game
		draw2()
	else:
		# New game
		pass

func SetAvatarScaleAndPosition():
	if not SceneManager.IsCurrentSceneNode2DAvatarValid():
		return
	
	if not m_IsHadSetAvatarScaleAndPosition:
		m_IsHadSetAvatarScaleAndPosition = true
		
		SetCamera1()
		
		var node2DAvatarChildren: Array = SceneManager.GetCurrentSceneNode2DAvatarChildren()
		var node2DAvatarChildren_size: int = node2DAvatarChildren.size()
		for i in node2DAvatarChildren_size:
			var node2DAvatarChild: KinematicBody2DAvatar = node2DAvatarChildren[i]
			match node2DAvatarChildren_size - i - 1:
				0:
					node2DAvatarChild.SetScale(Vector2(5.0, 5.0))
					node2DAvatarChild.SetPosition(Vector2(-460, 280))
				
				1:
					node2DAvatarChild.SetScale(Vector2(4.0, 4.0))
					node2DAvatarChild.SetPosition(Vector2(-230, 200))
				
				2:
					node2DAvatarChild.SetScale(Vector2(3.0, 3.0))
					node2DAvatarChild.SetPosition(Vector2(-80, 140))
				
				3:
					node2DAvatarChild.SetScale(Vector2(2.0, 2.0))
					node2DAvatarChild.SetPosition(Vector2(-210, 0))
				
				4:
					node2DAvatarChild.SetScale(Vector2(1.0, 1.0))
					node2DAvatarChild.SetPosition(Vector2(-340, -50))
				
				5:
					node2DAvatarChild.SetScale(Vector2(0.9, 0.9))
					node2DAvatarChild.SetPosition(Vector2(-270, -130))
				
				6:
					node2DAvatarChild.SetScale(Vector2(0.8, 0.8))
					node2DAvatarChild.SetPosition(Vector2(-190, -160))
				
				7:
					node2DAvatarChild.SetScale(Vector2(0.7, 0.7))
					node2DAvatarChild.SetPosition(Vector2(-115, -180))
				
				8:
					node2DAvatarChild.SetScale(Vector2(0.6, 0.6))
					node2DAvatarChild.SetPosition(Vector2(-45, -190))
				
				9:
					node2DAvatarChild.SetScale(Vector2(0.5, 0.5))
					node2DAvatarChild.SetPosition(Vector2(20, -195))
				
				10:
					node2DAvatarChild.SetScale(Vector2(0.4, 0.4))
					node2DAvatarChild.SetPosition(Vector2(85, -200))
	
	update()

func _process(_delta: float):
	SetAvatarScaleAndPosition()

func _exit_tree():
	CameraManager.SetCurrentCameraOffsetNormal()

func SetCamera1():
	CameraManager.SetCurrentCameraOffset(Vector2(440.0, -160.0))
