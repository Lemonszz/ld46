extends StaticBody2D
class_name Plant

var health : Healthbar = Healthbar.new(100);
var decayAmount = 1;
var decayTimeMax = 10;
var decayTime = decayTimeMax;
var growth = 0;

func _process(delta):
	decayTime -= delta;
	if(decayTime <= 0):
		health.damage(decayAmount);
		decayTime = decayTimeMax;
	
	if(health.is_dead()):
		#Game Over
		pass;

func can_eat(food : FoodObject):
	return food.requiredSize <= growth;

func feed(food : FoodObject):
	if(can_eat(food)):
		health.heal(food.amount);
		growth += 1;
		return true;
	return false;
