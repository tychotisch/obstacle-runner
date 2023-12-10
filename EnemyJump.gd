extends EnemyState


@onready var vision_left: RayCast2D = $"../../VisionLeft"
@onready var vision_right: RayCast2D = $"../../VisionRight"

@export var fall_state: EnemyState
@export var idle_state: EnemyState
@export var move_state: EnemyState
@export var jump_force: float = 900.0

var movement := 0

func enter() -> void:
	super()
	parent.velocity.y = -jump_force

func process_physics(delta: float) -> EnemyState:
	parent.velocity.y += gravity * delta
	
	if parent.velocity.y > 0:
		return fall_state
	
	if vision_left.is_colliding():
		movement = -1 * move_speed
	elif !vision_left.is_colliding():
		movement = 0
	if vision_right.is_colliding():
		movement = 1 * move_speed

	if movement != 0:
		parent.animations.flip_h = movement < 0
	parent.velocity.x = movement
	parent.move_and_slide()
	
	if parent.is_on_floor():
		if movement != 0:
			return move_state
		return idle_state
	
	return null
