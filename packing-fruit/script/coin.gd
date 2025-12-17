extends Area2D
func _ready():
	$AnimatedSprite2D.animation = "default"
	$AnimatedSprite2D.play()

func collecter_coin(body: Node2D) -> void:
	if body is hero:
		print("collecter")
		SoundController.coin_effect()
		queue_free()
