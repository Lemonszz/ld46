extends HBoxContainer

var enabled = false;
var time = 0.25;

func _process(delta):
	if(enabled):
		time -= delta;
		if(time <= 0):
			time = 0.25;
			visible = !visible;
	else:
		visible = false;
