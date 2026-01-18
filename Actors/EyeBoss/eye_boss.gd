extends Node2D

enum Phase {
	ENTERING,
	FIGHTING
}

var phase: Phase = Phase.ENTERING

const ENTER_SPEED = 10.0


func _ready() -> void:
	set_children_processing_mode(ProcessMode.PROCESS_MODE_DISABLED)


func set_children_processing_mode(mode: ProcessMode) -> void:
	$Eye.process_mode = mode
	$MissileLauncher.process_mode = mode
	$MissileLauncher2.process_mode = mode
	$EnergyTurret.process_mode = mode
	$EnergyTurret2.process_mode = mode
	$EnergyTurret3.process_mode = mode
	$EnergyTurret4.process_mode = mode


func _physics_process(delta: float) -> void:
	if phase == Phase.ENTERING and global_position.y >= 16.0:
		phase = Phase.FIGHTING
		set_children_processing_mode(ProcessMode.PROCESS_MODE_INHERIT)
	elif phase == Phase.ENTERING:
		global_position.y += ENTER_SPEED * delta