extends Node

@onready var rng = RandomNumberGenerator.new()

const INFINITE = 999999999999

const TOWARDS_PLAYER = Vector2.ZERO

var player: CharacterBody2D = null

enum CollisionLayer {
	PLAYER = 1,
	ENEMY = 2,
	BULLET = 3,
	SHOT = 4,
}

enum RenderOrder {
	PLAYER = 5,
	SHOT = 1,
	ENEMY = 9,
	BULLET = 10,
	TOP = 20,
}


func wait_for_sec(secs: float) -> void:
	await get_tree().create_timer(secs).timeout