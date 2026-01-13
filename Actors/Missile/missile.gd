extends CharacterBody2D


const SPEED = 100.0


func _physics_process(_delta: float) -> void:
	velocity = Vector2(0, SPEED)
	move_and_slide()