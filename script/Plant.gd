extends StaticBody2D
class_name Plant

var health : Healthbar = Healthbar.new(100);
var decayAmount = 1;
var decayTimeMax = 10;
var decayTime = decayTimeMax;
var growth = 0;

onready var stages = [
	$st1,
	$st2
];

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
		return true;
	return false;


func _on_Area2D_body_entered(body):
	if(!(body is Player)):
		return;
	
	var pickup = Global.player.pickup;
	if(pickup is BucketPickup && pickup.isFull):
		pickup.isFull = false;
		feed(FoodTypes.WATER);
