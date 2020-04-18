extends Node
class_name Pickup

var canPickup = false;

func _process(delta):
	if(canPickup && !Global.player.pickup && Global.player.pickupDelay <= 0):
		if(Input.is_action_just_released("activate")):
			$"..".remove_child(self);
			Global.player.add_child(self);
			Global.player.pickup = self;
			Global.player.pickupDelay = 0.3;
			self.position = Vector2(0, -8);
	
func _on_Area2D_body_entered(body):
	if(body is Player):
		canPickup = true;

func _on_Area2D_body_exited(body):
	if(body is Player):
		canPickup = false;
