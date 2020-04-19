extends Quest;
class_name AttackerQuest

func on_quest_start():
	Global.plant.spawn_attackers(2);

func get_quest_name():
	return "The Killagers";
	
func get_quest_description():
	return "The plant is under attack by those jealous villagers! Throw them in the well!";
	
func get_short_description():
	return "Those jealous villagers are attacking! Throw them in the well!";
	
func get_quest_icon():
	return load("res://assets/villager/villager_1.png");
	
func get_next():
	return QuestManager.DOG_QUEST;
