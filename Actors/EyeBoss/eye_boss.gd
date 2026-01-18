extends Node2D

enum Phase {
	ENTERING,
	FIGHTING
}

var phase: Phase = Phase.ENTERING

const ENTER_SPEED = 10.0


func _ready() -> void:
	set_children_processing_mode(ProcessMode.PROCESS_MODE_DISABLED)
	$Hurtbox.on_hit.connect($Health._on_hit)
	$Hurtbox.on_hit.connect($Eye._on_hit)
	$Health.on_death.connect(_on_death)


func set_children_processing_mode(mode: ProcessMode) -> void:
	for child in get_children():
		child.process_mode = mode


func _physics_process(delta: float) -> void:
	if phase == Phase.ENTERING and global_position.y >= 16.0:
		phase = Phase.FIGHTING
		set_children_processing_mode(ProcessMode.PROCESS_MODE_INHERIT)
	elif phase == Phase.ENTERING:
		global_position.y += ENTER_SPEED * delta


func _on_death() -> void:
	set_children_processing_mode(ProcessMode.PROCESS_MODE_DISABLED)
	$Eye.process_mode = ProcessMode.PROCESS_MODE_INHERIT
	$Eye.start_dying()
