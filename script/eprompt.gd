extends Sprite

var age = 0;
func _process(delta):
	age += delta;
	
	offset.y = sin(age * 5) * 1.5;
	
	pass;
