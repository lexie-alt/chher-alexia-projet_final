extends CharacterBody2D
@export var speed := 10
@export var change_time := 3.0

var direction := -1
var timer := 0.0
var can_damage := true

func _physics_process(delta):

	timer += delta
	if timer >= change_time:
			timer = 0.0
			direction *= -1
		
	velocity.x = direction * speed
	$AnimatedSprite2D.play("walking")
	move_and_slide()

	if is_on_wall():
		direction *= -1
	
	if velocity.x > 0:
		$AnimatedSprite2D.flip_h = true
	if velocity.x < 0:
		$AnimatedSprite2D.flip_h = false
