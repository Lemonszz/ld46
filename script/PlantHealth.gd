extends ProgressBar

func _process(delta):
	max_value = Global.plant.health.maxValue;
	value = Global.plant.health.currentValue;
