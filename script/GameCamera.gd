extends Camera2D

var targetPosition : Vector2;

func _process(delta):
	targetPosition = Global.player.position;
	print(targetPosition);
	position = position.linear_interpolate(targetPosition, 2 * delta);
