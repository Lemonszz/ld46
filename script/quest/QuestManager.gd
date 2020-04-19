extends Node

var WATER_QUEST : Quest = WaterQuest.new();
var RAT_QUEST : Quest = RatQuest.new();
var CHICKEN_QUEST : Quest = ChickenQuest.new();
var CAT_QUEST : Quest = CatQuest.new();
var ATTACKER_QUEST : Quest = AttackerQuest.new();
var DOG_QUEST : Quest = DogQuest.new();
var CHILD_QUEST : Quest = ChildQuest.new();
var VILLAGER_QUEST : Quest = AdultQuest.new();
var HORSE_QUEST : Quest = HorseQuest.new();
var YOU_QUEST : Quest = YouQuest.new();

var current = null;

func start():
	current = WATER_QUEST;
	quest_change(null, current);

func complete(quest : Quest):
	if(current == quest):
		var old = current;
		current = old.get_next();
		quest_change(old, current);
				
func quest_change(oldQuest : Quest, newQuest : Quest):
	if(oldQuest != null):
		oldQuest.on_quest_end();
	
	for i in range(Global.player.get_parent().get_node("ui").get_children().size()):
		var n = Global.player.get_parent().get_node("ui").get_child(i);
		if(n.is_in_group("quest_info")):
			n.leave();

	if(newQuest == null):
		return;
	
	newQuest.on_quest_start();

	var qInfo : QuestInfo = QINFO.instance();
	qInfo.set_quest(newQuest);
	Global.player.get_parent().get_node("ui").add_child(qInfo);
	qInfo.rect_position = Vector2(-3000, 2);
	pass;

onready var QINFO = load("res://objects/QuestInfo.tscn");
