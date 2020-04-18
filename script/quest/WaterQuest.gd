extends Quest;
class_name WaterQuest

func get_quest_name():
	return "Thirsty";
	
func get_quest_description():
	return "The plant demands water. I should go fill up my bucket at the town well!";
	
func get_short_description():
	return "The plant demands water!"

func get_quest_icon():
	return load("res://assets/pickup/bucketwater.png");

func get_next():
	return QuestManager.RAT_QUEST;
