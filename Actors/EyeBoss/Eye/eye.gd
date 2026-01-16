extends Node2D

const EYE_LOOK_DOWN = 1
const EYE_LOOK_LEFT = 2
const EYE_LOOK_RIGHT = 3

const FRAME_BOUNDARY_LEFT = 57
const FRAME_BOUNDARY_RIGHT = 103

func _ready() -> void:
	$Eye.frame = EYE_LOOK_DOWN


func _process(_delta: float) -> void:
	var player_pos_x = Global.player.global_position.x
	if player_pos_x < FRAME_BOUNDARY_LEFT:
		$Eye.frame = EYE_LOOK_LEFT
	elif player_pos_x > FRAME_BOUNDARY_RIGHT:
		$Eye.frame = EYE_LOOK_RIGHT
	else:
		$Eye.frame = EYE_LOOK_DOWN



