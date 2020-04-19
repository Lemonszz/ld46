extends Entity
class_name Player

var pickup = null;
var pickupDelay = 0;
var freeze = false;
var startSoundTime = 1;

func _ready():
	Global.player = self;
	QuestManager.start();

func _process(delta):	
	if(startSoundTime > 0):
		startSoundTime -= delta;
		if(startSoundTime <= 0):
			$sounds_other/bucket.play();
	
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
		

func play_pickup_sound():
	play_sounds($sounds_pickup);
	
func play_quest_start_sound():
	play_sounds($sounds_quest_start);
		
func play_attacked_sound():
	play_sounds($sounds_attacked);
	
func play_sounds(node : Node):
	var i = rand_range(0, node.get_child_count());
	node.get_child(i).play();


func get_movement_direction():
	var dir = Vector2();
	if(freeze):
		return dir;
	
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
