extends Parallax2D


func _process(_delta: float) -> void:
	if scroll_offset.y >= 143:
		autoscroll = Vector2.ZERO
		repeat_size = Vector2.ZERO
