extends Node2D

var m_DelayShowTimer: float = 0.0

func _ready():
	if SceneManager.IsInHubScene():
		self.visible = false

func _process(_delta: float):
	if SceneManager.IsInHubScene():
		m_DelayShowTimer += _delta
		var DELAYSHOWTIMER_MAX: float = 1.0
		if DELAYSHOWTIMER_MAX < m_DelayShowTimer:
			self.visible = true
		
		var YSTEP: float = 10.0
		var i: int = 0
		for iv in self.get_children():
			if iv is RigidBody2D:
				iv.scale = Vector2.ONE
				iv.position = Vector2(iv.position.x, (i * YSTEP))
				
				i += 1
