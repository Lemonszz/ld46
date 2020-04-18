extends Pickup;
class_name BucketPickup

var isFull = false;
onready var TEX_FULL = load("res://assets/pickup/bucketwater.png");
onready var TEX_EMPTY = load("res://assets/pickup/bucketempty.png");

func _process(delta):
	if(isFull):
		texture = TEX_FULL;
	else:
		texture = TEX_EMPTY;
