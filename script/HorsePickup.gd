extends "res://script/pickup/DogPickup.gd"

func get_food():
	return FoodTypes.ELEPHANT;
	
func on_eaten():
	queue_free();
	QuestManager.complete(QuestManager.HORSE_QUEST);
	if(Global.player.pickup == self):
		Global.player.pickup = null;
