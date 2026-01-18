extends Node2D

const SPAWN_TOP_LEFT = Vector2(10.0, -20)
const SPAWN_TOP_HALF_LEFT = Vector2(45.0, -20)
const SPAWN_TOP_MIDDLE = Vector2(80, -20)
const SPAWN_TOP_HALF_RIGHT = Vector2(115, -20)
const SPAWN_TOP_RIGHT = Vector2(150.0, -20)

const MISSILE: PackedScene = preload("res://Actors/Missile/Missile.tscn")
const SPIDER: PackedScene = preload("res://Actors/Spider/Spider.tscn")

func _ready() -> void:
	pass
	$MissileSpawnTimer.timeout.connect(spawn_missile)
	$SpiderSpawnTimer.timeout.connect(spawn_spider)


func spawn_missile() -> void:
	var spawns = [SPAWN_TOP_HALF_LEFT, SPAWN_TOP_MIDDLE, SPAWN_TOP_HALF_RIGHT]
	var spawn = Global.rng.randi_range(0, spawns.size() - 1)
	var missile = MISSILE.instantiate()

	var move_pattern = MovementPatterns.DOWNWARDS_TOWARDS_PLAYER.instantiate()
	move_pattern.subject = missile
	move_pattern.speed = 100.0
	move_pattern.horizontal_accel = 20.0

	missile.global_position = spawns[spawn]
	missile.add_child(move_pattern)
	get_parent().add_child.call_deferred(missile)


func spawn_spider() -> void:
	var spawns = [SPAWN_TOP_LEFT, SPAWN_TOP_RIGHT]
	var spawn = Global.rng.randi_range(0, spawns.size() - 1)
	var spider = SPIDER.instantiate()

	var move_pattern = MovementPatterns.STRAIGHT_AT_PLAYER.instantiate()
	move_pattern.subject = spider
	move_pattern.speed = 50.0

	var bullet_pattern = BulletPatterns.SINGLE_SHOT.instantiate()
	bullet_pattern.bullet_type = BulletPatterns.BALL_BULLET
	bullet_pattern.speed = 75.0
	bullet_pattern.direction = Global.TOWARDS_PLAYER
	bullet_pattern.startup_time = 0.5
	bullet_pattern.repeat_time = 1.0

	spider.global_position = spawns[spawn]
	spider.add_child(move_pattern)
	spider.add_child(bullet_pattern)
	get_parent().add_child.call_deferred(spider)
