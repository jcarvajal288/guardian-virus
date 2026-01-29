extends Area2D

const SPEED = 300.0
const DAMAGE = 1


func _ready() -> void:
	z_index = Global.RenderOrder.SHOT
	body_entered.connect(_on_hit)
	area_entered.connect(_on_area_hit)


func _physics_process(delta: float) -> void:
	var displacement = SPEED * Vector2.UP * delta	
	global_position += displacement


func _on_hit(body: Node2D) -> void:
	if body is CharacterBody2D:
		body.take_damage(DAMAGE)
	queue_free()


func _on_area_hit(area: Area2D) -> void:
	if area is Hurtbox:
		area.register_hit(DAMAGE)
		queue_free()