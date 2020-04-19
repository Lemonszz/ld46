extends "res://script/VillagerPickup.gd"

func get_food():
	return FoodTypes.CHILD;

func on_eaten():
	queue_free();
	QuestManager.complete(QuestManager.CHILD_QUEST);
	if(Global.player.pickup == self):
		Global.player.pickup = null;
