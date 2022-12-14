extends KinematicBody2D

const MAX_SPEED = 80
const ACCELERATION = 500
const FRICTION = 500

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
		velocity = velocity.move_toward(input_vector * MAX_SPEED, ACCELERATION * delta)
	else:
		# Applying friction to slow down when not pressing anything
		velocity = velocity.move_toward(Vector2.ZERO, FRICTION * delta)
	
	velocity = move_and_slide(velocity)
