class_name Healthbar

var maxValue
var currentValue;

func _init(maxValue):
	self.maxValue = maxValue;
	self.currentValue = maxValue;
	
func set_health(val):
	currentValue = clamp(val, 0, maxValue);
	
func damage(amt):
	currentValue = clamp(currentValue - amt, 0, maxValue);
	
func heal(amt):
	currentValue = clamp(currentValue + amt, 0, maxValue);
	
func is_dead():
	return currentValue <= 0;
