extends FoodPickup

func _process(delta):
	if(Global.player.pickup == self):
		$AnimatedSprite.playing = false;
		$AnimatedSprite.frame = 0;
	else:
		$AnimatedSprite.playing = true;

func on_eaten():
	queue_free();
	
func get_food():
	return FoodTypes.RAT;
