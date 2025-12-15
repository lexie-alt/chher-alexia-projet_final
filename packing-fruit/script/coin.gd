extends Area2D
func _ready():
	$AnimatedSprite2D.animation = "default"
	$AnimatedSprite2D.play()

func collecter_coin(body: Node2D) -> void:
	if body is hero:
		print("collecter")
		$SfxCoin.play()
		# Attendre la fin du son
		await $SfxCoin.finished
		queue_free()
