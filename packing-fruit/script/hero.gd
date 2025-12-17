class_name hero extends CharacterBody2D

const SPEED = 100.0
const JUMP_VELOCITY = -400.0
const glisser_mur_mod = 0.15

@export var etat_courant = Etat.REPOS


enum Etat {
	REPOS,
	PROMENER,
	SAUT,
	GLISSE_MUR
}

# fonction base
func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		if is_on_wall() and velocity.y > 0:
			etat_courant = Etat.GLISSE_MUR
			velocity += get_gravity() * delta * glisser_mur_mod
			$AnimatedSprite2D.play("wall")
			if Input.is_action_just_pressed("jump"):
				velocity.y = JUMP_VELOCITY
				velocity.x = move_toward(velocity.x, 0, sign(velocity.x) * SPEED)
		else:
			etat_courant = Etat.SAUT
			velocity += get_gravity() * delta
			$AnimatedSprite2D.play("jumping")
	else:
		if velocity.x == 0:
			etat_courant = Etat.REPOS
			$AnimatedSprite2D.play("idle")
		else:
			etat_courant = Etat.PROMENER
			$AnimatedSprite2D.play("walking")
	
	if velocity.x > 0:
		$AnimatedSprite2D.flip_h = false
	if velocity.x < 0:
		$AnimatedSprite2D.flip_h = true
	
	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		SoundController.jump_effect()
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	var direction := Input.get_axis("walk left", "walk right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()

# fonction passsage cave
func passage_cave(body: Node2D) -> void:
	if body is hero:
		SoundController.passage_effect()
		get_tree().change_scene_to_file("res://scene/scn_level/scn_cave.tscn")
		print("entrer cave") 
	
	
# fonction vide
func tomber_vide(body: Node2D) -> void:
		if body is hero:
			print("tomber vide")
			SoundController.tomber_effect()
			await get_tree().process_frame
			get_tree().change_scene_to_file("res://scene/scn_level/scn_main.tscn")
