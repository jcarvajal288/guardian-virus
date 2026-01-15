extends Enemy

func _ready() -> void:
	$Hitbox.on_hitbox_triggered.connect(_on_hitbox_triggered)


func _on_hitbox_triggered() -> void:
	queue_free()