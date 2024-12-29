extends Control

var m_IsNeedToCheck_IsUIPanelHadConsumed_Event_FocusClick: bool = true

func _ready():
	set_process_input(true)

func _input(event: InputEvent):
	if SceneManager.GetIsInBootScene():
		return
	
	if SceneManager.GetIsBeginChangeToScene():
		return
	
	if m_IsNeedToCheck_IsUIPanelHadConsumed_Event_FocusClick:
		var panelRectangle: Rect2 = Rect2(Vector2.ZERO, rect_size)
		UIManager.CheckAndSet_IsUIPanelHadConsumed_Event_FocusClick(event, self, panelRectangle)

func SetFalse_IsNeedToCheck_IsUIPanelHadConsumed_Event_FocusClick():
	m_IsNeedToCheck_IsUIPanelHadConsumed_Event_FocusClick = false
