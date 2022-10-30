extends KinematicBody2D

const MAX_SPEED = 100
const ACCELERATION = 400
const FRICTION = 400

var velocity: = Vector2.ZERO


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var input_vector = Vector2.ZERO
	
	input_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	input_vector.y = Input.get_action_raw_strength("ui_down") - Input.get_action_strength("ui_up")
	
	# To normalized the vector if the character goes to sideway, ex: north west so the movement speed is the same with going to east
	input_vector = input_vector.normalized()
	
	# Make sure the character stop when not pressing anything
	if input_vector != Vector2.ZERO:
		# velocity = input_vector * MAX_SPEED
		
		# Using acceleration example
		velocity += input_vector * ACCELERATION * delta
	else:
		# velocity = Vector2.ZERO
		
		# Applying friction to slow down when not pressing anything
		velocity = velocity.move_toward(Vector2.ZERO, FRICTION * delta)
	
	move_and_collide(velocity * delta)
