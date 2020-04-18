extends Node2D

var journal = null;
onready var questJournal = load("res://objects/QuestJournal.tscn");

func _process(delta):
	if(Input.is_action_just_pressed("quest")):
		if(journal == null):
			var j = questJournal.instance();
			j.rect_position = Vector2(100, 100);
			$ui.add_child(j);
			journal = j;
		else:
			journal.queue_free();
			journal = null;
