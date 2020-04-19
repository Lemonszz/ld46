extends Quest;
class_name ChildQuest

func get_quest_name():
	return "Children of THE PLANT";
	
func get_quest_description():
	return "The plant demands a child. I'm sure it's fine!";
	
func get_short_description():
	return "A child now? Coming right up!";
	
func get_quest_icon():
	return load("res://assets/villager/child_1.png");

func get_next():
	return QuestManager.VILLAGER_QUEST;

