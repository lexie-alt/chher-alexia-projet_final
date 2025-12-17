extends Node


func _ready() -> void:
	$ascenceur_foret/ascenceur_animation.play("moving_ascenceur_foret")
	SoundController.stop_music()
	SoundController.playgame_bgm()
	#hud.show
	
