extends Node2D

@onready var enemy_fly: AnimatedSprite2D = $enemy_fly
@onready var vision: Area2D = $enemy_fly/vision
@onready var vision_collision: CollisionShape2D = $enemy_fly/vision/CollisionShape2D
@onready var flying_animation: AnimationPlayer = $flying_animation

var alert : bool = false
var hero : hero

func _ready() -> void:
	flying_animation.seek(randf_range(0, flying_animation.current_animation_length))
	vision_collision.shape.radius = 100
	vision.body_entered.connect(_on_vision_body_entered)
	vision.body_exited.connect(_on_vision_body_exited)

func _physics_process(delta: float) -> void:
	if alert == true:
		change_direction()

func change_direction() -> void:
	if position.x - hero.position.x > 0:
		enemy_fly.flip_h = false
	elif position.x - hero.position.x < 0:
		enemy_fly.flip_h = true
		
func _on_vision_body_entered(body):
	if body is hero:
		print("enemy touched")
		alert = true
		hero = body
	
func _on_vision_body_exited(body):
	if body is hero:
		alert = false
		hero = null
