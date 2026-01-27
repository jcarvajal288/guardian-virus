extends Node2D


func _ready() -> void:
	$ShotTimer.timeout.connect(open_turret)
	$AnimationPlayer.animation_finished.connect(_on_animation_finished)
	set_shot_timer()


func set_shot_timer() -> void:
	var time = Global.rng.randf_range(1.0, 2.0)
	$ShotTimer.start(time)


func open_turret() -> void:
	$AnimationPlayer.play('fire')


func _on_animation_finished(anim_name: String) -> void:
	if anim_name == 'fire':
		fire()
		$AnimationPlayer.play('close')
	elif anim_name == 'close':
		set_shot_timer()


func fire() -> void:
	var bullet = Bullets.ENERGY_BULLET.instantiate()
	bullet.direction = Global.TOWARDS_PLAYER
	bullet.speed = 50
	bullet.global_position = global_position
	bullet.damage = GameStats.ENERGY_TURRET_DAMAGE
	get_tree().root.add_child(bullet)	
