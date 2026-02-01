extends Enemy


func _ready() -> void:
	$Eye2x2.z_index = z_index + 1
