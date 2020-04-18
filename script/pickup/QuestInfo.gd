extends Control
class_name QuestInfo

onready var icon = $HBoxContainer/TextureRect;
onready var label = $HBoxContainer/VBoxContainer/desc;
onready var title = $HBoxContainer/VBoxContainer/title;

var targetPosition
var ic;
var txt;
var ttl;

func _ready():
	icon.texture = ic;
	label.text = txt;
	title.text = ttl;
	targetPosition = Vector2(4, 2);
	pass;

func set_quest(quest : Quest):
	ic = quest.get_quest_icon();
	txt = quest.get_short_description();
	ttl = quest.get_quest_name();

func _process(delta):
	rect_position = rect_position.linear_interpolate(targetPosition, 3 * delta);
	if(rect_position.y <= -50):
		queue_free();
	pass;
	
func leave():
	targetPosition = Vector2(4, -100);
