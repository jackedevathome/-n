class_name GameManager extends Node

@export var world_3d : Node3D
@export var world_2d : Node2D
@export var gui : Control

var current_3d_scene
var current_2d_scene
var current_gui_screen

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("dev_exit"):
		get_tree().quit()
	if event.is_action_pressed("dev_reload"):
		get_tree().reload_current_scene()

func _ready() -> void:
	Globals.game_controller = self
