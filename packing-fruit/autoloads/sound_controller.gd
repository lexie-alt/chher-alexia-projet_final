extends Node2D

@onready var home_music: AudioStreamPlayer = $HomeMusic
@onready var cave_music: AudioStreamPlayer = $CaveMusic
@onready var game_music: AudioStreamPlayer = $GameMusic
@onready var credit_music: AudioStreamPlayer = $CreditMusic


@onready var sfx_select: AudioStreamPlayer = $SfxSelect
@onready var sfx_jump: AudioStreamPlayer = $SfxJump
@onready var sfx_disappear: AudioStreamPlayer = $SfxDisappear
@onready var sfx_coin: AudioStreamPlayer = $SfxCoin
@onready var sfx_passage: AudioStreamPlayer = $SfxPassage


func stop_music():
	print("stopmusic bg")
	for node in get_tree().get_nodes_in_group("music"):
		if node is AudioStreamPlayer:
			node.stop()

#Activer home music bg
func playhome_bgm():
	print("homemusic bg")
	home_music.stream = preload("res://assets/sound/HomeMusic.mp3")
	home_music.play()

#Activer cave music bg
func playcave_bgm():
	print("cavemusic bg")
	cave_music.stream = preload("res://assets/sound/CaveMusic.mp3")
	cave_music.play()
	
#Activer game music bg
func playgame_bgm():
	print("gamemusic bg")
	game_music.stream = preload("res://assets/sound/GameMusic.mp3")
	game_music.play()
	
#Activer credit music bg
func playcredit_bgm():
	print("creditmusic bg")
	game_music.stream = preload("res://assets/sound/CreditMusic.mp3")
	game_music.play()


#Bruit selection
func select_effect():
	print("select sound")
	sfx_select.stream = preload("res://assets/sound/sfx_select.ogg")
	sfx_select.play()
	await sfx_select.finished
	
	
#Bruit sauter
func jump_effect():
	print("jump sound")
	sfx_jump.stream = preload("res://assets/sound/sfx_jump.ogg")
	sfx_jump.play()
	await sfx_jump.finished

#Bruit tomber
func tomber_effect():
	print("tomber sound")
	sfx_disappear.stream = preload("res://assets/sound/sfx_disappear.ogg")
	sfx_disappear.play()
	await sfx_disappear.finished
	
#Bruit passage
func passage_effect():
	print("passage sound")
	sfx_passage.stream = preload("res://assets/sound/sfx_passage.ogg")
	sfx_passage.play()
	await sfx_passage.finished
	
#Bruit ramasser coin
func coin_effect():
	print("coin sound")
	sfx_coin.stream = preload("res://assets/sound/sfx_coin.ogg")
	sfx_coin.play()
	await sfx_coin.finished
	
	
	
	
	
	
