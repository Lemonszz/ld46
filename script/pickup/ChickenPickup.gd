extends PickupEntity

var startPos : Vector2;
var targetPos : Vector2;
var targetTime;
var restrict = true;

func _ready():
	var s = self;
	startPos = s.position;
	switch_target();

func _process(delta):
	._process(delta);
	var s = self;
	targetTime -= delta;
	if(targetTime <= 0):
		switch_target();
	
func switch_target():
	var s = self;
	targetTime = rand_range(2, 5);
	var distance = 25;
	if(!restrict):
		distance = 100;
	
	if(restrict):
		targetPos = Vector2(startPos.x + rand_range(-distance, distance), startPos.y + rand_range(-distance, distance));
	else:
		var i1 = 1;
		if(randi() % 2 == 1):
			i1 = -1
		var i2 = 1;
		if(randi() % 2 == 1):
			i2 = -1
		var xDistance = 25 + rand_range(0, distance) * i1;
		var yDistance = 25 + rand_range(0, distance) * i1;
		targetPos = Vector2(s.position.x + xDistance, s.position.y + yDistance);
		
func get_movement_direction():
	var s = self;
	var t = s.get_angle_to(targetPos);
	if(targetPos.distance_to(s.position) < 5 || Global.player.pickup == self):
		return Vector2.ZERO;
	
	return Vector2(cos(t), sin(t)).normalized();
	
func get_food():
	return FoodTypes.CHICKEN;
	
func _on_Area2D_body_entered(body):
	._on_Area2D_body_entered(body);
	if(body is Player):
		targetTime = 0;
		restrict = false;

func _on_Area2D_body_exited(body):
	._on_Area2D_body_exited(body)
	if(body is Player):
		restrict = true;

