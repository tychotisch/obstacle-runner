extends Node2D

var bird := preload("res://obstacles/bird.tscn")
var barrel := preload("res://obstacles/barrel.tscn")
var rock := preload("res://obstacles/rock.tscn")
var stump := preload("res://obstacles/stump.tscn")
var obstacles_list := [barrel, rock, stump]

@onready var dino: CharacterBody2D = $"../Dino"

func _ready() -> void:
	randomize()

func spawn_bird():
	var obstacle_bird = bird.instantiate()
	add_child(obstacle_bird)
	obstacle_bird.position.y = randi() % 400 + 45
	obstacle_bird.position.x = dino.position.x + 1000

func spawn_obstacle():
	var obstacle_type = obstacles_list[randi() % obstacles_list.size()]
	var obstacle_to_place = obstacle_type.instantiate()
	add_child(obstacle_to_place)
	obstacle_to_place.position.y = 510
	obstacle_to_place.position.x = dino.position.x + 900

func _on_timer_timeout() -> void:
	spawn_obstacle()

func _on_bird_timer_timeout() -> void:
	spawn_bird()
