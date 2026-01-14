extends Area2D

const SPEED = 300.0


func _ready() -> void:
	z_index = Global.RenderOrder.SHOT
	body_entered.connect(_on_hit)


func _physics_process(delta: float) -> void:
	var displacement = SPEED * Vector2.UP * delta	
	global_position += displacement


func _on_hit(_body: Node2D) -> void:
	queue_free()