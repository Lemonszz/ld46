extends Quest;
class_name HorseQuest

func get_quest_name():
	return "Horsing Around";
	
func get_quest_description():
	return "It is my duty to bring this plant a horse. I can probably find some at the farm.";
	
func get_short_description():
	return "That plant seems is so hungey, it could eat a horse!";
	
func get_quest_icon():
	return load("res://assets/horse/horse.png");

#func get_next():
#	return QuestManager.VILLAGER_QUEST;

