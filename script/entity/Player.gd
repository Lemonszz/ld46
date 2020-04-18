extends Entity
class_name Player

var pickup = null;
var pickupDelay = 0;

func _ready():
	Global.player = self;
	QuestManager.start();
	
func _process(delta):	
	pickupDelay -= delta;
	if(pickup && Input.is_action_just_pressed("activate") && pickupDelay <= 0):
		remove_child(pickup);
		$"..".add_child(pickup);
		pickup.position = position;
		pickup = null;
		pickupDelay = 0.3;
	
		
	if(abs(velocity.length()) > 0.01):
		if(pickup):
			if($AnimatedSprite.animation != "WalkArm"):
				$AnimatedSprite.animation = "WalkArm";
		else:
			if($AnimatedSprite.animation != "Walk"):
				$AnimatedSprite.animation = "Walk";
	else:
		if(pickup):
			if($AnimatedSprite.animation != "StandArm"):
				$AnimatedSprite.animation = "StandArm";
		else:
			if($AnimatedSprite.animation != "Stand"):	
				$AnimatedSprite.animation = "Stand";
		

func get_movement_direction():
	var dir = Vector2();
	
	if(Input.is_action_pressed("up")):
		dir.y -= 1;
		
	if(Input.is_action_pressed("down")):
		dir.y += 1;
		
	if(Input.is_action_pressed("left")):
		dir.x -= 1;
	
	if(Input.is_action_pressed("right")):
		dir.x += 1;
	
	if(dir.x > 0):
		$AnimatedSprite.flip_h = false;
	elif(dir.x < 0):
		$AnimatedSprite.flip_h = true;
	
	return dir;
