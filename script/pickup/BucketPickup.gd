extends FoodPickup;
class_name BucketPickup

var isFull = false;
onready var TEX_FULL = load("res://assets/pickup/bucketwater.png");
onready var TEX_EMPTY = load("res://assets/pickup/bucketempty.png");

func _process(delta):
	if(isFull):
		texture = TEX_FULL;
	else:
		texture = TEX_EMPTY;

func can_give():
	return isFull;

func on_eaten():
	isFull = false;
	QuestManager.complete(QuestManager.WATER_QUEST);
	
func get_food():
	return FoodTypes.WATER;
