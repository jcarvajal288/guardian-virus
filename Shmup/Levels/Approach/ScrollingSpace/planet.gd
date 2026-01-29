extends Parallax2D

const time_to_complete = 60.0


func _init() -> void:
	autoscroll = Vector2(0, repeat_size.y / 60.0)
	print(autoscroll)


func _process(_delta: float) -> void:
	if scroll_offset.y >= 143:
		autoscroll = Vector2.ZERO
		repeat_size = Vector2.ZERO
