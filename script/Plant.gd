extends StaticBody2D
class_name Plant

var health : Healthbar = Healthbar.new(100);
var decayAmount = 1;
var decayTimeMax = 2;
var decayTime = decayTimeMax;
var growth = 0;

onready var stages = [
	$st1,
	$st2,
	$st3,
	$st4
];

func _ready():
	Global.plant = self;

func _process(delta):
	decayTime -= delta;
	if(decayTime <= 0):
		health.damage(decayAmount);
		decayTime = decayTimeMax;
	
	if(health.is_dead()):
		#Game Over
		pass;
	for i in range(stages.size()):
		stages[i].visible = floor(growth) == i || floor(growth) >= stages.size() && i == stages.size() - 1;

func can_eat(food : FoodObject):
	return food.requiredSize <= growth;

func feed(food : FoodObject):
	if(can_eat(food)):
		health.heal(food.amount);
		growth += 1;
		on_grow();
		return true;
	return false;

func on_grow():
	for i in range(10 + randi() % 20):
		var smoke = SMOKE_EFFECT.instance();
		add_child(smoke);
		smoke.position = Vector2(-3 + rand_range(0, 6), -3 + rand_range(0, 6));

func _on_Area2D_body_entered(body):
	if(!(body is Player)):
		return;
	
	var pickup = Global.player.pickup;
	if(pickup is FoodPickup):
		if(pickup.can_give()):
			if(feed(pickup.get_food())):
				pickup.on_eaten();
				
onready var SMOKE_EFFECT = load("res://objects/Smoke.tscn");
