extends Quest;
class_name ChickenQuest

func get_quest_name():
	return "Poultry in motion";
	
func get_quest_description():
	return "The plant demands a chicken. The farmhouse normally has some, they can be a bit tricky to catch though!";
	
func get_short_description():
	return "The plant demands a chicken? Well alright then!";
	
func get_quest_icon():
	return load("res://assets/chicken/chicken.png");
