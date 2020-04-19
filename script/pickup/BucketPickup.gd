extends FoodPickup;
class_name BucketPickup

var isFull = false;
onready var TEX_FULL = load("res://assets/pickup/bucketwater.png");
onready var TEX_EMPTY = load("res://assets/pickup/bucketempty.png");

func _process(delta):
	var s = self;
	if(isFull):
		s.texture = TEX_FULL;
	else:
		s.texture = TEX_EMPTY;
		
func on_pickup():
	if(QuestManager.current == QuestManager.WATER_QUEST):
		Global.player.get_node("sounds_other/well").play();
	else:
		Global.player.play_pickup_sound();

func can_give():
	return isFull;

func on_eaten():
	isFull = false;
	QuestManager.complete(QuestManager.WATER_QUEST);
	
func get_food():
	return FoodTypes.WATER;
