extends Enemy


func _ready() -> void:
	on_death.connect(_on_death)


func _on_death() -> void:
	var explosion = Effects.EXPLOSION_8x8.instantiate()
	explosion.global_position = global_position
	get_tree().root.add_child(explosion)
	queue_free()
