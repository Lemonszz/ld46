extends Sprite
class_name SmokeEffect

var angle = -90 + (-45 + rand_range(0, 90));
var speed = randf() * 12;
var alpha = -0.25 + (randf() - 0.25);
var life = 0.25 + (randf() * 2);
var dir = Vector2.ZERO;

func _ready():
	var r = deg2rad(angle);
	dir = Vector2(cos(r), sin(r));
	frame = randi() % hframes

func _physics_process(delta):
	alpha -= (delta / 2);
	modulate = Color(1, 1, 1, alpha);
	position += (dir * speed) * delta;
	
	if(alpha <= 0):
		queue_free();
