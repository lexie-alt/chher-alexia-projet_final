extends CanvasLayer

@export var coin = 0

func _ready() -> void:
	%coinlabel.text = str(Main.coin)
	Main.coin_collectee.connect(retroaction_coin)	

func retroaction_coin(valeur_coin):
	%coinlabel.text = str(valeur_coin)
