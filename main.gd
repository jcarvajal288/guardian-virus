extends Node2D

@export var current_level_scene: PackedScene
@export var game_over_scene: PackedScene

var current_level: Node2D


func _ready() -> void:
	current_level = current_level_scene.instantiate()
	add_child(current_level)
	Global.game_over.connect(_on_game_over)


func _on_game_over() -> void:
	await Global.wait_for_sec(2.0)	
	current_level.queue_free()
	var game_over = game_over_scene.instantiate()
	add_child(game_over)
	current_level = game_over
