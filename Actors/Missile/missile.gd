extends CharacterBody2D


const SPEED = 100.0
const HORIZONTAL_ACCEL = 20.0


func _ready() -> void:
	$Hurtbox.on_hit.connect(_on_hit)
	velocity = Vector2(0, SPEED)


func _physics_process(delta: float) -> void:
	var acceleration = HORIZONTAL_ACCEL * delta
	if Global.player.global_position.x < global_position.x:
		acceleration *= -1
	velocity.x += acceleration
	move_and_slide()


func _on_hit() -> void:
	queue_free()