extends Quest;
class_name CatQuest

func get_quest_name():
	return "We're not kitten around!";
	
func get_quest_description():
	return "The plant demands a cat. They can be tricky to catch. I'm sure little Sally will be sad, but it's for the greater good!";
	
func get_short_description():
	return "Now a cat? Alright!";
	
func get_quest_icon():
	return load("res://assets/cat/cat.png");
	
func get_next():
	return QuestManager.ATTACKER_QUEST;
