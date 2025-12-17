extends Node

@export var coin = 0
signal coin_collectee

func reset():
	coin = 0
	
func augmenter_coin():
	coin += 1
	coin_collectee.emit(coin)
	
#func reset():
	




		
