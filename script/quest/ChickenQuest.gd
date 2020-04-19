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

func get_next():
	return QuestManager.CAT_QUEST;

func on_quest_end():
	Global.music.stop();
	Global.music.stream = NEXT_MUSIC;
	
var NEXT_MUSIC = load("res://assets/audio/plantbg4.wav");
