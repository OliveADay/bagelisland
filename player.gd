extends CharacterBody2D
@export var SPEED = 300
@export var ANGLE_SPEED = 0.1

@export var ACCELERATION = 3
@export var DECELERATION = 3
var angular_velocity = 0


func _physics_process(delta: float) -> void:
	var horizontal=Input.get_axis("left","right")
	var vertical = Input.get_axis("backward","forward")
	if(vertical!=0):
		velocity.x = move_toward(velocity.x,SPEED*cos(rotation)*vertical,ACCELERATION)
		velocity.y = move_toward(velocity.y,SPEED*sin(rotation)*vertical,ACCELERATION)
	else:
		velocity.x = move_toward(velocity.x,0,DECELERATION)
		velocity.y = move_toward(velocity.y,0,DECELERATION)
	
	if(horizontal!=0):
		angular_velocity = move_toward(angular_velocity,ANGLE_SPEED*horizontal,ACCELERATION/velocity.length())
	else:
		angular_velocity = move_toward(angular_velocity, 0, DECELERATION)
	
	rotate(angular_velocity)
		
	move_and_slide()
