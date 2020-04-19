extends StaticBody2D

func _on_Area2D_body_entered(body):
	if(body is Player):
		if(Global.player.pickup is BucketPickup):
			if(!Global.player.pickup.isFull):
				Global.player.pickup.isFull = true;
				$AudioStreamPlayer.play();
		elif(Global.player.pickup is AttackerPickup):
			Global.player.pickup.queue_free();
			Global.player.pickup = null;
			$AudioStreamPlayer.play();
	pass 
