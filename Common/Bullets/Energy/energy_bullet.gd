extends Bullet

const TURN_RATE = 0.5
const LIFETIME = 6.0


func _ready() -> void:
	speed = 40
	direction = Global.TOWARDS_PLAYER
	$LifetimeTimer.timeout.connect(queue_free)
	$LifetimeTimer.start(LIFETIME)
	super()


func _physics_process(delta: float) -> void:
	var direction_to_player = (Global.player.global_position - global_position).normalized()
	var turn = direction.angle_to(direction_to_player) / TURN_RATE * delta
	direction = direction.rotated(turn)
	super(delta)
