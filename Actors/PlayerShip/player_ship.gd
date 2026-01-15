class_name PlayerShip extends CharacterBody2D

const SHOT_1 = preload("res://Actors/PlayerShip/Shot1/Shot1.tscn")

const SPEED = 150

var can_shoot = true


func _ready() -> void:
	Global.player = self
	z_index = Global.RenderOrder.PLAYER
	$ShotTimer.timeout.connect(expire_shot_cooldown)
	$Hurtbox.on_hit.connect(_on_hit)


func expire_shot_cooldown() -> void:
	can_shoot = true


func _physics_process(_delta: float) -> void:
	move()
	shoot()
	animate()


func move() -> void:
	var movement_vector = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	var snapped_vector = Vector2(
		snapped(movement_vector.x, 0.5), 
		snapped(movement_vector.y, 0.5)
	).normalized()
	velocity = snapped_vector * SPEED
	move_and_slide()


func shoot() -> void:
	if can_shoot and Input.is_action_pressed("shoot"):
		var shot = SHOT_1.instantiate()
		shot.global_position = global_position
		shot.global_position.y -= 8.0
		get_tree().root.add_child(shot)
		can_shoot = false


func animate() -> void:
	var movement_vector = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	if movement_vector.x != 0:
		$Sprite2D.frame = 1
	else:
		$Sprite2D.frame = 0
	$Sprite2D.flip_h = movement_vector.x < 0


func _on_hit(_dmg: int) -> void:
	$Shield.visible = true
	$Hurtbox.set_deferred("monitoring", false)
	$Hurtbox.set_deferred("monitorable", false)
	$Sprite2D.modulate.a = 0.5

	await get_tree().create_timer(2.0).timeout

	$Shield.visible = false
	$Hurtbox.set_deferred("monitoring", true)
	$Hurtbox.set_deferred("monitorable", true)
	$Sprite2D.modulate.a = 1.0
