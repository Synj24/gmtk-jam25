extends CharacterBody2D

const SPEED = 300.0
const JUMP_VELOCITY = -600.0

var count = 0

# A Dictionary to store our position
var movement_data = {}

func _ready():
	#Ititial position
	movement_data[0] = global_position

func _physics_process(delta: float) -> void:
	record_movement()
	
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
	
	# Handle looping off screen right
	if position.x > 1150:
		SignalBus.player_looped.emit(movement_data)
		position.x = 0
		# Reset movement data
		#movement_data.clear()
	
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()

func record_movement():
	count += 1
	movement_data[count] = global_position
