extends Control

@onready var title_animation: AnimationPlayer = $GameTitle/title_animation
@onready var button_align: VBoxContainer = $ButtonAlign
@onready var home_music: AudioStreamPlayer = $home_music


func _ready() -> void:
	SoundController.stop_music()
	button_align.hide()
	appear_title()
	
#Animation intro
func appear_title():
	title_animation.play("title_animation")
	await title_animation.animation_finished
	SoundController.playhome_bgm()
	appear_menu()
	
	
#Apparaitre menu
func appear_menu():
	button_align.show()
	
	
func _on_jouer_pressed() -> void:
	print("jouer")
	SoundController.select_effect()
	get_tree().change_scene_to_file("res://scene/scn_level/scn_main.tscn")
	

func _on_tutoriel_pressed() -> void:
	print("tutoriel")
	SoundController.select_effect()
	get_tree().change_scene_to_file("res://scene/menu/04_instructions.tscn")


func _on_credits_pressed() -> void:
	print("credit")
	SoundController.select_effect()
	get_tree().change_scene_to_file("res://scene/menu/05_credits.tscn")
