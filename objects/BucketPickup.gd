extends "res://script/Pickup.gd"
class_name BucketPickup

var isFull = false;
onready var TEX_FULL = load("res://assets/bucketwater.png");
onready var TEX_EMPTY = load("res://assets/bucketempty.png");


func _process(delta):
	print(isFull);
	if(isFull):
		texture = TEX_FULL;
	else:
		texture = TEX_EMPTY;
