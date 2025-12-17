extends CanvasLayer

@onready var pause_menu: Panel = $PauseMenu
@onready var continuer: Button = $PauseMenu/continuer
@onready var rejouer: Button = $PauseMenu/rejouer
@onready var retour: Button = $PauseMenu/retour
@onready var exit_button: Button = $exit_button


func _ready() -> void:
	process_mode = Node.PROCESS_MODE_ALWAYS
	exit_button.hide()
	pause_menu.hide()
	
	
func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("pause"):
		_pause()
	

func _pause() -> void:
		print("pause")
		SoundController.jump_effect()
		pause_menu.show()
		exit_button.show()
		get_tree().paused = true


func _continuegame() -> void:
	print("continuer la partie")
	SoundController.select_effect()
	pause_menu.hide()
	exit_button.hide()
	get_tree().paused = false
	
	
func _replaygame() -> void:
	print("replay")
	SoundController.select_effect()
	pause_menu.hide()
	exit_button.hide()
	get_tree().paused = false
	get_tree().change_scene_to_file("res://scene/scn_level/scn_main.tscn")
	
func _mainmenu() -> void:
	print("home")
	SoundController.select_effect()
	pause_menu.hide()
	exit_button.hide()
	get_tree().paused = false
	get_tree().change_scene_to_file("res://scene/menu/01_main_menu.tscn")
	
func _exitmenu() -> void:
	print("exit")
	SoundController.select_effect()
	pause_menu.hide()
	exit_button.hide()
	get_tree().paused = false
