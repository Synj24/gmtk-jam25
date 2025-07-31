extends CharacterBody2D

var movement_data : Dictionary = Dictionary()
var count = -1

func _ready() -> void:
	if movement_data.has(0):
		global_position = movement_data[0]

func _physics_process(_delta: float) -> void:
	update_position()
	if position.x > 1150:
		queue_free()

func update_position():
	count += 1
	if movement_data.has(count):
		global_position = movement_data[count]
