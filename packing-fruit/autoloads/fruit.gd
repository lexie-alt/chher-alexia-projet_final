extends Area2D

func collecter_fruit(body: Node2D) -> void:
	for node in get_tree().get_nodes_in_group("fruits"):
		if body is hero:
			print("fruit")
			SoundController.coin_effect()
			queue_free()
