extends CharacterBody2D
@export var SPEED = 300
@export var ANGLE_SPEED = 0.1
@export var ANGLECELERATION = 0.01
@export var ANGLEDECELERATION = 0.01
@export var ACCELERATION = 10
@export var DECELERATION = 3
var angular_velocity = 0
var laps = -1
var colliding_with_enem = false
var colliding_enem_max = 0.5
var colliding_enem_current = 0
signal lapped(laps)

func _process(delta: float) -> void:
	if(colliding_with_enem):
		colliding_enem_current+=delta
		if(colliding_enem_current > colliding_enem_max):
			get_tree().reload_current_scene()
	else:
		colliding_enem_current = 0

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
		angular_velocity = move_toward(angular_velocity,ANGLE_SPEED*horizontal,ANGLECELERATION)
	else:
		angular_velocity = move_toward(angular_velocity, 0, ANGLEDECELERATION)
	
	rotate(angular_velocity)
		
	move_and_slide()


func _on_area_2d_body_entered(body: Node2D) -> void:
	laps+=1
	lapped.emit(laps)


func _on_other_car_body_entered(body: Node2D) -> void:
	colliding_with_enem = true


func _on_other_car_body_exited(body: Node2D) -> void:
	colliding_with_enem = false
