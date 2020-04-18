extends FoodPickup

func _process(delta):
	if(Global.player.pickup == self):
		$AnimatedSprite.playing = false;
		$AnimatedSprite.frame = 0;
	else:
		$AnimatedSprite.playing = true;

func on_eaten():
	queue_free();
	QuestManager.complete(QuestManager.RAT_QUEST);
	if(Global.player.pickup == self):
		Global.player.pickup = null;
	
func get_food():
	return FoodTypes.RAT;
