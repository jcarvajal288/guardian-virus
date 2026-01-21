extends Enemy

func _ready() -> void:
	$Hitbox.on_hitbox_triggered.connect(_on_hitbox_triggered)
	$Hitbox.damage = GameStats.MISSILE_DAMAGE
	on_death.connect(_on_death)


func _on_hitbox_triggered() -> void:
	_on_death()


func _on_death() -> void:
	var explosion = Effects.EXPLOSION_16x16.instantiate()
	explosion.global_position = global_position
	get_tree().root.add_child(explosion)
	queue_free()