extends AudioStreamPlayer
class_name MusicPlayer

func _ready():
	Global.music = self;

func _on_AudioStreamPlayer_finished():
	play();
