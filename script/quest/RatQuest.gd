extends Quest;
class_name RatQuest

func get_quest_name():
	return "Rodent Round Up";
	
func get_quest_description():
	return "The plant demands rats. I didn't know plants ate meat, but what do I know anyway?";
	
func get_short_description():
	return "The plant demands rats";
	
func get_quest_icon():
	return load("res://assets/rat/rat2.png");
