extends Control

func _ready() -> void:
	SoundController.stop_music()
	SoundController.playcredit_bgm()
	
func _on_retour_pressed() -> void:
	print("retour")
	SoundController.select_effect()
	get_tree().change_scene_to_file("res://scene/menu/01_main_menu.tscn")
