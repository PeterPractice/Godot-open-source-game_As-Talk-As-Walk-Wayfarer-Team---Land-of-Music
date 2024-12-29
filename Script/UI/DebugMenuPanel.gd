extends "res://Script/UI/CommonUI/CommonPanel.gd"

const LABEL_NUMBER: int = 5

onready var itemList1 = $itemList1
onready var lineEditArg1 = $lineEditArg1
onready var lineEditArg2 = $lineEditArg2
onready var lineEditArg3 = $lineEditArg3
onready var lineEditArg4 = $lineEditArg4
onready var lineEditArg5 = $lineEditArg5

func _ready():
	for iv in DebugManager.GetDebugDataList():
		itemList1.add_item(iv.label)

func _on_itemList1_item_selected(index: int):
#	HQH.Log("_on_itemList1_item_selected, index: %d" % index)
	InitArgLabel(index)

func _on_buttonRun_pressed():
	var selected_items: PoolIntArray = itemList1.get_selected_items()
#	HQH.Log("_on_buttonRun_pressed, selected_items.size(): %d" % selected_items.size())
	if 0 < selected_items.size():
		var selectedItemsIndex: int = selected_items[0]
#		HQH.Log("_on_buttonRun_pressed, selectedItemsIndex: %d" % selectedItemsIndex)
#		HQH.Log("_on_buttonRun_pressed, lineEditArg1.text: %s" % lineEditArg1.text)
		DebugManager.DebugMenuPanel_on_buttonRun_pressed(selectedItemsIndex, lineEditArg1.text, lineEditArg2.text, lineEditArg3.text, lineEditArg4.text, lineEditArg5.text)
	else:
		HQH.Log("Select one item in debug menu")

func InitArgLabel(index: int):
	var debugData: Dictionary = DebugManager.GetDebugData(index)
	HQH.Log("InitArgLabel, debugData: %s" % debugData)
	if not debugData:
		return
	
	if debugData.has("isJustRun"):
		if debugData.isJustRun:
			self._on_buttonRun_pressed()
			
			return
	
	for iv in range(1, LABEL_NUMBER + 1):
		var labelArgName: String = "labelArg%d" % iv
		var labelArg: Label = get_node(labelArgName)
		var lineEditArgName: String = "lineEditArg%d" % iv
		var lineEditArg: LineEdit = get_node(lineEditArgName)
		
		var labelArgText: String = "labelArg%dText" % iv
		var lineEditArgText: String = "lineEditArg%dText" % iv
		if debugData.has(labelArgText) and debugData.has(lineEditArgText):
			labelArg.visible = true
			lineEditArg.visible = true
			
			labelArg.text = debugData[labelArgText]
			lineEditArg.text = debugData[lineEditArgText]
		else:
			labelArg.visible = false
			lineEditArg.visible = false
