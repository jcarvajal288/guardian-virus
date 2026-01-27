class_name PlayerShip extends CharacterBody2D

const SHOT_1 = preload("res://Shmup/Actors/PlayerShip/Shot1/Shot1.tscn")

const SPEED = GameStats.PLAYER_SHIP_SPEED

var can_shoot = true


func _ready() -> void:
	Global.player = self
	z_index = Global.RenderOrder.PLAYER
	$ShotTimer.timeout.connect(expire_shot_cooldown)
	$Hurtbox.on_hit.connect(_on_hit)
	$Health.set_health(GameStats.PLAYER_STARTING_HEALTH)
	$Health.on_death.connect(_on_death)


func expire_shot_cooldown() -> void:
	can_shoot = true


func _physics_process(_delta: float) -> void:
	move()
	shoot()
	animate()


func get_movement_vector() -> Vector2:
	var mv = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	var snapped_vector = Vector2(
		snapped(mv.x, 0.5), 
		snapped(mv.y, 0.5)
	).normalized()
	return snapped_vector


func move() -> void:
	var movement_vector = get_movement_vector()
	velocity = movement_vector * SPEED
	move_and_slide()


func shoot() -> void:
	if can_shoot and Input.is_action_pressed("shoot"):
		var shot = SHOT_1.instantiate()
		shot.global_position = global_position
		shot.global_position.y -= 8.0
		get_tree().root.add_child(shot)
		Sounds.play_sound.emit(Sounds.SoundEffect.PLAYER_SHOT, global_position)
		can_shoot = false


func animate() -> void:
	var movement_vector = get_movement_vector()
	if movement_vector.x != 0:
		$Sprite2D.frame = 1
	else:
		$Sprite2D.frame = 0
	$Sprite2D.flip_h = movement_vector.x < 0


func _on_hit(damage: float) -> void:
	Sounds.play_sound.emit(Sounds.SoundEffect.PLAYER_SHIELD, global_position)
	$Health._on_hit(damage)
	Global.player_health_changed.emit($Health.current_health, $Health.max_health)

	$Shield.visible = true
	$Hurtbox.set_deferred("monitoring", false)
	$Hurtbox.set_deferred("monitorable", false)
	$Sprite2D.modulate.a = 0.5

	await get_tree().create_timer(GameStats.PLAYER_HIT_INVULN_IN_SECS).timeout

	$Shield.visible = false
	$Hurtbox.set_deferred("monitoring", true)
	$Hurtbox.set_deferred("monitorable", true)
	$Sprite2D.modulate.a = 1.0


func _on_death() -> void:
	$DeathExplosion.start()
	Sounds.play_sound.emit(Sounds.SoundEffect.PLAYER_EXPLOSION, global_position)
