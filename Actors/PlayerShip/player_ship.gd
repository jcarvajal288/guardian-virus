class_name PlayerShip extends CharacterBody2D


const SPEED = 150


func _physics_process(_delta: float) -> void:
	move()
	# shoot()
	animate()


func move() -> void:
	var movement_vector = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	var snapped_vector = Vector2(
		snapped(movement_vector.x, 0.5), 
		snapped(movement_vector.y, 0.5)
	).normalized()
	velocity = snapped_vector * SPEED
	move_and_slide()
	# Global.PLAYER_LOCATION = global_position


func animate() -> void:
	if velocity.x != 0:
		$Sprite2D.frame = 1
	else:
		$Sprite2D.frame = 0
	$Sprite2D.flip_h = velocity.x < 0
