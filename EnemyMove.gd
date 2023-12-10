extends EnemyState

@export var fall_state: EnemyState
@export var idle_state: EnemyState
@export var jump_state: EnemyState

@onready var vision_left: RayCast2D = $"../../VisionLeft"
@onready var vision_right: RayCast2D = $"../../VisionRight"

var movement := 0

func process_input(_event: InputEvent) -> EnemyState:
#	if Input.is_action_just_pressed('jump') and parent.is_on_floor():
#		return jump_state

	return null

func process_physics(delta: float) -> EnemyState:
	parent.velocity.y += gravity * delta
	
	if vision_left.is_colliding():
		movement = -1 * move_speed
	elif !vision_left.is_colliding():
		movement = 0
	if vision_right.is_colliding():
		movement = 1 * move_speed
	
	if movement == 0:
		return idle_state
	
	parent.animations.flip_h = movement < 0
	parent.velocity.x = movement
	parent.move_and_slide()
	
	if !parent.is_on_floor():
		return fall_state
	return null
