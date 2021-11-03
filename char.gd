extends KinematicBody


var gravity = 9.8 * Vector3.DOWN


func _physics_process(delta):
	move_and_slide(gravity, Vector3.UP)
