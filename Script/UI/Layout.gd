extends Node2D

enum CANVASLAYER_INDEX_TYPE {
	UI = 10,
	UI_LOADING,
	DEBUGUI,
}
const CANVASLAYER_UI_NAME: String = "CanvasLayerUI"
const CANVASLAYER_UI_LOADING_NAME: String = "CanvasLayerUILoading"
const CANVASLAYER_DEBUGUI_NAME: String = "CanvasLayerDebugUI"

var m_CanvasLayerUI = CanvasLayer.new()
var m_CanvasLayerUILoading = CanvasLayer.new()
var m_CanvasLayerDebugUI = CanvasLayer.new()

func _ready():
	CanvasLayerAddChild(m_CanvasLayerUI, CANVASLAYER_UI_NAME, CANVASLAYER_INDEX_TYPE.UI)
	CanvasLayerAddChild(m_CanvasLayerUILoading, CANVASLAYER_UI_LOADING_NAME, CANVASLAYER_INDEX_TYPE.UI_LOADING)
	CanvasLayerAddChild(m_CanvasLayerDebugUI, CANVASLAYER_DEBUGUI_NAME, CANVASLAYER_INDEX_TYPE.DEBUGUI)

func CanvasLayerAddChild(canvasLayerObject, canvasLayerName: String, canvasLayerIndex: int):
	canvasLayerObject.name = canvasLayerName
	canvasLayerObject.layer = canvasLayerIndex
	add_child(canvasLayerObject)

func CanvasLayerRemoveChild(_canvasLayerObject, _canvasLayerName: String, _canvasLayerIndex: int):
	HQH.AssertLog("CanvasLayerRemoveChild, _canvasLayerName: %s, _canvasLayerIndex: %s" % [_canvasLayerName, _canvasLayerIndex])

func CanvasLayerUIAddChild(instanceObject):
	m_CanvasLayerUI.add_child(instanceObject)

func CanvasLayerUIRemoveChild(instanceObject):
	m_CanvasLayerUI.remove_child(instanceObject)

func CanvasLayerUILoadingAddChild(instanceObject):
	m_CanvasLayerUILoading.add_child(instanceObject)

func CanvasLayerUILoadingRemoveChild(instanceObject):
	m_CanvasLayerUILoading.remove_child(instanceObject)

func CanvasLayerDebugUIAddChild(instanceObject):
	m_CanvasLayerDebugUI.add_child(instanceObject)

func CanvasLayerDebugUIRemoveChild(instanceObject):
	m_CanvasLayerDebugUI.remove_child(instanceObject)

