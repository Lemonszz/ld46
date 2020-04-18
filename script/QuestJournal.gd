extends Panel

onready var title = $VBoxContainer/CenterContainer/Title;
onready var text = $Text
onready var icon = $Icon;

func _ready():
	if(QuestManager.current != null):
		title.text = QuestManager.current.get_quest_name();
		text.text = QuestManager.current.get_quest_description();
		icon.texture = QuestManager.current.get_quest_icon();
	pass 

func _on_TextureButton_pressed():
	queue_free();
	$"../..".journal = null;
	pass
