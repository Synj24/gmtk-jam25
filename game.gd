extends Node2D

@export var ghost_scene : PackedScene

func _ready():
	SignalBus.player_looped.connect(_on_player_looped)

func _on_player_looped(movement_data):
	var ghost = ghost_scene.instantiate()
	ghost.movement_data = movement_data
	add_child(ghost)
