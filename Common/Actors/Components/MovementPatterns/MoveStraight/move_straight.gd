extends Node

@export var subject: CharacterBody2D
@export var velocity: Vector2


func _ready() -> void:
	subject.velocity = velocity


func _physics_process(_delta: float) -> void:
	subject.move_and_slide()


