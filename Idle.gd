extends State


@export var fall_state: State
@export var jump_state: State
@export var move_state: State

@onready var move_col: CollisionShape2D = $"../../MoveCol"
@onready var duck_col: CollisionShape2D = $"../../DuckCol"

func enter() -> void:
	super()
	parent.velocity.x = 0
	change_collision()


func process_input(_event: InputEvent) -> State:
	if Input.is_action_just_pressed('jump') and parent.is_on_floor():
		return jump_state
	if Input.is_action_just_pressed('move_left') or Input.is_action_just_pressed('move_right'):
		return move_state
	return null

func process_physics(delta: float) -> State:
	parent.velocity.y += gravity * delta
	parent.move_and_slide()
	
	if !parent.is_on_floor():
		return fall_state
	return null

func change_collision():
	move_col.visible = true
	duck_col.visible = false
