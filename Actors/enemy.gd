extends CharacterBody2D


func _physics_process(_delta: float) -> void:
	move_and_slide()


func do_damage(_dmg: int) -> void:
	queue_free()
