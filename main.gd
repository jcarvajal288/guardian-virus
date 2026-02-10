extends Node2D

@export var first_level_scene: PackedScene
@export var game_over_scene: PackedScene


func _ready() -> void:
	$GameWindow.change_level(first_level_scene)
	Global.game_over.connect(_on_game_over)
	Global.reset.connect(_on_reset)


func _on_game_over() -> void:
	await Global.wait_for_sec(2.0)	
	$GameWindow.change_level(game_over_scene)


func _on_reset() -> void:
	$GameWindow.change_level(first_level_scene)
