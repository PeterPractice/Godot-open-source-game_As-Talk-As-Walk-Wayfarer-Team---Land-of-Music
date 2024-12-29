extends Node2D

var m_NewX0: int = 12
var m_Flip_h: bool = false
var m_InitX: Array = []

func _ready():
	for iv in self.get_children():
		m_InitX.append(iv.position.x)

func SetFlipH(flip_h: bool):
	if m_Flip_h != flip_h:
		m_Flip_h = flip_h
		if m_Flip_h:
			var i: int = 0
			for iv in self.get_children():
				iv.position.x = m_NewX0 + (m_NewX0 - m_InitX[i])
				i += 1
		else:
			var i: int = 0
			for iv in self.get_children():
				iv.position.x = m_InitX[i]
				i += 1
