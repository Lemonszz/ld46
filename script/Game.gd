extends Node2D
class_name Game

var journal = null;
onready var questJournal = load("res://objects/QuestJournal.tscn");

func _ready():
	VisualServer.canvas_item_set_sort_children_by_y(get_canvas_item(), true);
	Global.game = self;

func _process(delta):
	$TileMap.z_index = -100;
	$TileMap2.z_index = -99;
	if(Input.is_action_just_pressed("quest")):
		if(journal == null):
			var j = questJournal.instance();
			j.rect_position = Vector2(100, 100);
			$ui.add_child(j);
			journal = j;
		else:
			journal.queue_free();
			journal = null;
