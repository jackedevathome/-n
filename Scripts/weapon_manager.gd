extends Node3D

var weapon = null

var weapon_ready = false
var holding_gun = true
var magazine_empty : bool = false
var magazine_size = -1
var current_magazine = 0

var UI_mag_label

func _ready() -> void:
	UI_mag_label = $"../../../../CanvasLayer/EquipmentInfo/HBoxContainer/VBoxContainer/Label"
	ready_weapon()

func ready_weapon():
	weapon = get_child(0)
	magazine_size = weapon.magazine_size
	current_magazine = magazine_size

func shoot():
	if holding_gun and not magazine_empty:
		current_magazine -= 1
		if current_magazine <= 0:
			magazine_empty = true
		UI_mag_label.text = str(current_magazine) + "/" + str(magazine_size)
		print("Pew Pew")

func reload():
	current_magazine = magazine_size
	UI_mag_label.text = str(current_magazine) + "/" + str(magazine_size)
	if magazine_empty:
		magazine_empty = false
