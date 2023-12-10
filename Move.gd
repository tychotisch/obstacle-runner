extends State


@export var fall_state: State
@export var idle_state: State
@export var jump_state: State
@export var duck_state: State

@onready var move_col: CollisionShape2D = $"../../MoveCol"
@onready var duck_col: CollisionShape2D = $"../../DuckCol"

func enter():
	super()
	change_collision()


func process_input(_event: InputEvent) -> State:
	if Input.is_action_just_pressed('jump') and parent.is_on_floor():
		return jump_state
	if Input.is_action_just_pressed('duck') and parent.is_on_floor():
		return duck_state
	return null

func process_physics(delta: float) -> State:
	parent.velocity.y += gravity * delta
	
	var movement = Input.get_axis('move_left', 'move_right') * move_speed
	
	if movement == 0:
		return idle_state
	
	parent.animations.flip_h = movement < 0
	parent.velocity.x = movement
	parent.move_and_slide()
	
	if !parent.is_on_floor():
		return fall_state
	return null

func change_collision():
	move_col.visible = true
	duck_col.visible = false
