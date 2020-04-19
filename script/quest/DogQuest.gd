extends Quest;
class_name DogQuest

func get_quest_name():
	return "Anything is paw-sible!";
	
func get_quest_description():
	return "The plant demands a dog. I doubt the villagers will mind, it's for the plant. Everyone loves theplant!";
	
func get_short_description():
	return "Hmm. A dog? I'm sure I saw one around here somewhere!'";
	
func get_quest_icon():
	return load("res://assets/dog/dog.png");

func get_next():
	return QuestManager.CHILD_QUEST;
