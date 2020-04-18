extends KinematicBody2D

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
		
	return dir;
