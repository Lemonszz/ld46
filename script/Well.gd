extends StaticBody2D

func _on_Area2D_body_entered(body):
	if(body is Player):
		if(Global.player.pickup is BucketPickup):
			if(!Global.player.pickup.isFull):
				Global.player.pickup.isFull = true;
	pass 
