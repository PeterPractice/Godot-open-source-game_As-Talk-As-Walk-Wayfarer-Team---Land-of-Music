extends Control

onready var labelFPS = $labelFPS
onready var labelLoadingSceneTime = $labelLoadingSceneTime
onready var labelMemory = $labelMemory

func _ready():
	mouse_filter = MOUSE_FILTER_IGNORE

func _process(_delta: float):
	labelFPS.set_text("FPS: %d" % Engine.get_frames_per_second())
	
	var loadingSceneTimeInMilliseconds: int = SceneManager.GetLoadingSceneTimeInMilliseconds()
	labelLoadingSceneTime.set_text("Loading scene time: %2.1fs" % [float(loadingSceneTimeInMilliseconds) / HQH.MILLISECOND_NUMBER])
	
	labelMemory.set_text("Memory: %3.1fMiB(Max: %3.1fMiB)" % [OS.get_static_memory_usage() / 1048576.0, OS.get_static_memory_peak_usage() / 1048576.0])
