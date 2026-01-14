extends Area2D

var speed = 100.0
var direction = Vector2.DOWN


func _ready() -> void:
	z_index = Global.RenderOrder.BULLET
	if direction == Global.TOWARDS_PLAYER:
		direction = (Global.player.global_position - global_position).normalized()


func _physics_process(delta: float) -> void:
	var displacement = speed * direction * delta	
	global_position += displacement
