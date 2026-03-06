extends RigidBody2D
var player:Node2D
@export var SPEED_MAX = 300
var speed = 0

func _ready() -> void:
	player = get_tree().get_first_node_in_group('player')
func _physics_process(delta: float) -> void:
	look_at(player.position)
	move_and_collide(Vector2(player.position.x-position.x,player.position.y-position.y).normalized()*speed)
	
