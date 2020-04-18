extends FoodPickup;
class_name PickupEntity

export var acceleration = 0.1;
export var friction = 0.5;
export var speed = 75;

var velocity = Vector2();

func _process(delta):
	._process(delta);
	var s = self;
	var b = Global.player.pickup != self;
	s.set_collision_layer_bit(0, b);
	s.set_collision_mask_bit(0, b);
	
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
	var k = self;
	velocity = k.move_and_slide(velocity);
