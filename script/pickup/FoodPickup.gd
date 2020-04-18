extends Pickup;
class_name FoodPickup
	
func can_give():
	return true;
	
func on_eaten():
	pass;

func get_food():
	return null;
