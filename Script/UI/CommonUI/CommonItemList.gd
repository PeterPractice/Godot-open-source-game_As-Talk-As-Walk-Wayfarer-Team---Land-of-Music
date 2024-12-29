extends ItemList

const PROCESSNUMBER_RUN_SET_SELECT: int = 0

var m_InitSelectIndex: int = -1
var m_ProcessNumber: int = 0
var m_IsFirstObtainFocus: bool = false

func _ready():
	UIManager.SetNewStyleBoxFlat(self, "selected_focus", UIManager.COMMONITEMLIST_STYLE.STYLEBOXFLAT_SELECTED_FOCUS_BG_COLOR, UIManager.COMMONITEMLIST_STYLE.STYLEBOXFLAT_SELECTED_FOCUS_BORDER_WIDTH, UIManager.COMMONITEMLIST_STYLE.STYLEBOXFLAT_SELECTED_FOCUS_BORDER_COLOR, UIManager.COMMONITEMLIST_STYLE.STYLEBOXFLAT_SELECTED_FOCUS_CORNER_RADIUS)
	UIManager.SetNewStyleBoxFlat(self, "bg", UIManager.COMMONITEMLIST_STYLE.STYLEBOXFLAT_BG_BG_COLOR, UIManager.COMMONITEMLIST_STYLE.STYLEBOXFLAT_BG_BORDER_WIDTH, UIManager.COMMONITEMLIST_STYLE.STYLEBOXFLAT_BG_BORDER_COLOR, UIManager.COMMONITEMLIST_STYLE.STYLEBOXFLAT_BG_CORNER_RADIUS)
	
	self.add_color_override("font_color", UIManager.COMMONITEMLIST_STYLE.FONT_COLOR)
	self.add_color_override("font_color_selected", UIManager.COMMONITEMLIST_STYLE.FONT_COLOR_SELECTED)
	
	UIManager.ControlSetCommonScroll(self)

func SetInitSelect(index: int):
	m_InitSelectIndex = index

func _process(_delta: float):
	if PROCESSNUMBER_RUN_SET_SELECT == m_ProcessNumber:
		if 0 <= m_InitSelectIndex:
			self.select(m_InitSelectIndex)
			
			# Move scroll to index
			var vScroll: VScrollBar = self.get_v_scroll()
			var lineHeight: float = vScroll.max_value / get_item_count()
			vScroll.value = lineHeight * m_InitSelectIndex
	
	m_ProcessNumber += 1
	
	if has_focus():
		if not m_IsFirstObtainFocus:
			m_IsFirstObtainFocus = true
			
			AudioManager.PlayByName_ButtonPressed()
	else:
		m_IsFirstObtainFocus = false

func Set_IsFirstObtainFocus_false():
	m_IsFirstObtainFocus = false
