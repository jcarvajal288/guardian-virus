extends Node2D

const EYE_LOOK_DOWN = 0
const EYE_LOOK_LEFT = 1
const EYE_LOOK_RIGHT = 2
const EYE_LOOK_DOWN_DMG = 3
const EYE_LOOK_LEFT_DMG = 4
const EYE_LOOK_RIGHT_DMG = 5

const FRAME_BOUNDARY_LEFT = 57
const FRAME_BOUNDARY_RIGHT = 103

@onready var is_damage_flashing = false

func _ready() -> void:
	$EyeSprite.frame = EYE_LOOK_DOWN


func _process(_delta: float) -> void:
	var player_pos_x = Global.player.global_position.x
	if player_pos_x < FRAME_BOUNDARY_LEFT:
		if is_damage_flashing:
			$EyeSprite.frame = EYE_LOOK_LEFT_DMG
		else:
			$EyeSprite.frame = EYE_LOOK_LEFT
		$FireArc.global_position = $FireLeft.global_position
	elif player_pos_x > FRAME_BOUNDARY_RIGHT:
		if is_damage_flashing:
			$EyeSprite.frame = EYE_LOOK_RIGHT_DMG
		else:
			$EyeSprite.frame = EYE_LOOK_RIGHT
		$FireArc.global_position = $FireRight.global_position
	else:
		if is_damage_flashing:
			$EyeSprite.frame = EYE_LOOK_DOWN_DMG
		else:
			$EyeSprite.frame = EYE_LOOK_DOWN
		$FireArc.global_position = $FireDown.global_position


func _on_hit(_damage: float) -> void:
	damage_flash()


func damage_flash() -> void:
	is_damage_flashing = true
	await get_tree().create_timer(0.1).timeout
	is_damage_flashing = false
