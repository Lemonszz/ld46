extends Quest;
class_name AdultQuest

func get_quest_name():
	return "Adultery";
	
func get_quest_description():
	return "These villagers are getting annoying an the plants knows it!";
	
func get_short_description():
	return "Alright, lets get rid of some villagers!";
	
func get_quest_icon():
	return load("res://assets/villager/villager_2.png");

func get_next():
	return QuestManager.HORSE_QUEST;

