extends KinematicBody2D
class_name Entity

export var acceleration = 0.5;
export var friction = 0.25;
export var speed = 150;

var velocity = Vector2();

func update_speed():
	var movementDir : Vector2 = get_movement_direction();
	movementDir = movementDir.normalized() * speed;
	
	if(movementDir.length()  > 0 ):
		velocity = velocity.linear_interpolate(movementDir, acceleration);
	else:
		velocity = velocity.linear_interpolate(Vector2.ZERO, friction);

func get_movement_direction():
	return Vector2.ZERO;

func _physics_process(delta):
	update_speed();
	velocity = move_and_slide(velocity);
