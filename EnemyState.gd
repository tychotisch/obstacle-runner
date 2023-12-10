class_name EnemyState
extends Node

@export var animation_name: String
@export var move_speed: int = 200

## Hold a reference to the parent so that it can be controlled by the state
var parent: Enemy
var gravity: int = ProjectSettings.get_setting("physics/2d/default_gravity")

func enter() -> void:
	parent.animations.play(animation_name)

func exit() -> void:
	pass

func process_input(_event: InputEvent) -> EnemyState:
	return null

func process_frame(_delta: float) -> EnemyState:
	return null

func process_physics(_delta: float) -> EnemyState:
	return null
