extends Node2D

@export var starting_room: Room


func _ready() -> void:
	Global.bind_camera.emit(starting_room.rect())