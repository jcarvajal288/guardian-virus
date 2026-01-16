extends Node2D

const EYE_LOOK_DOWN = 1
const EYE_LOOK_LEFT = 2
const EYE_LOOK_RIGHT = 3

const FRAME_BOUNDARY_LEFT = 57
const FRAME_BOUNDARY_RIGHT = 103

func _ready() -> void:
	$EyeSprite.frame = EYE_LOOK_DOWN


func _process(_delta: float) -> void:
	var player_pos_x = Global.player.global_position.x
	if player_pos_x < FRAME_BOUNDARY_LEFT:
		$EyeSprite.frame = EYE_LOOK_LEFT
		$FireArc.global_position = $FireLeft.global_position
	elif player_pos_x > FRAME_BOUNDARY_RIGHT:
		$EyeSprite.frame = EYE_LOOK_RIGHT
		$FireArc.global_position = $FireRight.global_position
	else:
		$EyeSprite.frame = EYE_LOOK_DOWN
		$FireArc.global_position = $FireDown.global_position
