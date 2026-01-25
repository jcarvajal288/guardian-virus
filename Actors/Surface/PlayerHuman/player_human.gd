extends CharacterBody2D


const SPEED = GameStats.PLAYER_WALK_SPEED

var facing = "Down"


func _ready() -> void:
	Global.player = self
	z_index = Global.RenderOrder.PLAYER


func _physics_process(_delta: float) -> void:
	var movement_vector = get_movement_vector()
	move(movement_vector)
	animate(movement_vector)


func get_movement_vector() -> Vector2:
	var mv = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	var snapped_vector = Vector2(
		snapped(mv.x, 0.5), 
		snapped(mv.y, 0.5)
	).normalized()
	return snapped_vector


func move(movement_vector: Vector2) -> void:
	calculate_facing(movement_vector)
	velocity = movement_vector * SPEED
	move_and_slide()


func calculate_facing(movement_vector: Vector2) -> void:
	if movement_vector == Vector2.RIGHT:
		facing = "Right"
	elif movement_vector == Vector2.LEFT:
		facing = "Left"
	elif movement_vector == Vector2.UP:
		facing = "Up"
	elif movement_vector == Vector2.DOWN:
		facing = "Down"
	# elif facing == "Down" and movement_vector.y > 1:
	# 	return
	# elif facing == "Up" and movement_vector.y < 1:
	# 	return
	# elif facing == "Right" and movement_vector.x > 1:
	# 	return
	# elif facing == "Left" and movement_vector.x < 1:
	# 	return


func animate(movement_vector: Vector2) -> void:
	if movement_vector == Vector2.ZERO:
		$AnimationPlayer.play("idle" + facing)
	else:
		$AnimationPlayer.play("walk" + facing)

