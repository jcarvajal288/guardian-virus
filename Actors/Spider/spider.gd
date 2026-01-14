extends CharacterBody2D


func _ready() -> void:
	$Hurtbox.on_hit.connect(_on_hit)


func _physics_process(_delta: float) -> void:
	move_and_slide()


func _on_hit() -> void:
	queue_free()
