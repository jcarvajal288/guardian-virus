extends Node2D

const SPAWN_TOP_LEFT = Vector2(10.0, -20)
const SPAWN_TOP_HALF_LEFT = Vector2(45.0, -20)
const SPAWN_TOP_MIDDLE = Vector2(80, -20)
const SPAWN_TOP_HALF_RIGHT = Vector2(115, -20)
const SPAWN_TOP_RIGHT = Vector2(150.0, -20)

const MISSILE: PackedScene = preload("res://Actors/Missile/Missile.tscn")
const SPIDER: PackedScene = preload("res://Actors/Spider/Spider.tscn")

func _ready() -> void:
	$MissileSpawnTimer.timeout.connect(spawn_missile)
	$SpiderSpawnTimer.timeout.connect(spawn_spider)


func spawn_missile() -> void:
	var spawns = [SPAWN_TOP_HALF_LEFT, SPAWN_TOP_MIDDLE, SPAWN_TOP_HALF_RIGHT]
	var spawn = Global.rng.randi_range(0, spawns.size() - 1)
	var missile = MISSILE.instantiate()
	missile.global_position = spawns[spawn]
	get_parent().add_child.call_deferred(missile)


func spawn_spider() -> void:
	var spawns = [SPAWN_TOP_LEFT, SPAWN_TOP_RIGHT]
	var spawn = Global.rng.randi_range(0, spawns.size() - 1)
	var spider = SPIDER.instantiate()
	spider.global_position = spawns[spawn]
	get_parent().add_child.call_deferred(spider)
