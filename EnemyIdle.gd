extends EnemyState


@export var fall_state: EnemyState
@export var jump_state: EnemyState
@export var move_state: EnemyState

@onready var vision_left: RayCast2D = $"../../VisionLeft"
@onready var vision_right: RayCast2D = $"../../VisionRight"


func enter() -> void:
	super()
	parent.velocity.x = 0
	


func process_input(_event: InputEvent) -> EnemyState:
#	if Input.is_action_just_pressed('jump') and parent.is_on_floor():
#		return jump_state
		
	if vision_left.is_colliding() or vision_right.is_colliding():
#	if Input.is_action_just_pressed('move_left') or Input.is_action_just_pressed('move_right'):
		return move_state
	return null

func process_physics(delta: float) -> EnemyState:
	parent.velocity.y += gravity * delta
	parent.move_and_slide()
	
	if !parent.is_on_floor():
		return fall_state
	return null
