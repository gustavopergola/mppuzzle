extends KinematicBody


var gravity = 8 * Vector3.DOWN
var finalForce = gravity
var movementForce = Vector3(0,0,0)
export var speed = 8

func _physics_process(delta):
	movementForce = Vector3(0,0,0)
	
	if Input.is_action_pressed("walk_left"):
		movementForce += Vector3.LEFT
	if Input.is_action_pressed("walk_right"):
		movementForce += Vector3.RIGHT
	if Input.is_action_pressed("walk_forward"):
		movementForce += Vector3.FORWARD
	if Input.is_action_pressed("walk_backwards"):
		movementForce += Vector3.BACK
	
	movementForce = movementForce.normalized() * speed
	
	move_and_slide(movementForce + gravity, Vector3.UP)
