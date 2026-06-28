extends CanvasLayer

var GAME_SCENE_PATH = "res://Scenes/world.tscn"

var loading = false
var progress = []

func _process(_delta: float) -> void:
	if loading:
		var load_status = ResourceLoader.load_threaded_get_status(GAME_SCENE_PATH, progress)
		print("Loading: " + str(progress[0]))
		if load_status == ResourceLoader.THREAD_LOAD_LOADED:
			var scene_to_load = ResourceLoader.load_threaded_get(GAME_SCENE_PATH)
			var instance = scene_to_load.instantiate()
			get_tree().root.add_child(instance)
			self.queue_free()

func _on_play_button_pressed() -> void:
	ResourceLoader.load_threaded_request(GAME_SCENE_PATH)
	loading = true

func _on_quit_button_pressed() -> void:
	get_tree().quit()
	
