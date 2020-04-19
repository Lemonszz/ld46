extends StaticBody2D
class_name Plant

var health : Healthbar = Healthbar.new(100);
var decayAmount = 1;
var decayTimeMax = 2;
var decayTime = decayTimeMax;
var growth = 0;
var attackersPrev = 1;

onready var stages = [
	$st1,
	$st2,
	$st3,
	$st4,
	$st5
];

func _ready():
	Global.plant = self;

func _process(delta):
	var scale = 1;
	for i in range(get_parent().get_children().size()):
		var n = get_parent().get_children()[i];
		if(n.is_in_group("attacker")):
			scale += 1;
	
	if(scale == 1 && attackersPrev != 1):
		QuestManager.complete(QuestManager.ATTACKER_QUEST);
	attackersPrev = scale;
	
	decayTime -= delta * scale;
	if(decayTime <= 0):
		health.damage(decayAmount);
		decayTime = decayTimeMax;
	
	if(health.is_dead()):
		#Game Over
		pass;
	for i in range(stages.size()):
		stages[i].visible = floor(growth) == i || floor(growth) >= stages.size() && i == stages.size() - 1;

func can_eat(food : FoodObject):
	return food.requiredSize <= growth;

func feed(food : FoodObject):
	if(can_eat(food)):
		health.heal(food.amount);
		growth += 1;
		on_grow();
		return true;
	return false;

func on_grow():
	for i in range(10 + randi() % 20):
		var smoke = SMOKE_EFFECT.instance();
		add_child(smoke);
		smoke.position = Vector2(-3 + rand_range(0, 6), -3 + rand_range(0, 6));

func spawn_attackers(amt : int):
	for i in range(amt):
		var attacker = ATTACKER.instance();
		get_parent().add_child(attacker);
		var offX = rand_range(2, 4) * 1 if randi() % 2 == 0 else -1;
		var offY = rand_range(2, 4) * 1 if randi() % 2 == 0 else -1;
		attacker.position = Vector2(offX, offY);

func _on_Area2D_body_entered(body):
	if(!(body is Player)):
		return;
	
	var pickup = Global.player.pickup;
	if(pickup is FoodPickup):
		if(pickup.can_give()):
			if(feed(pickup.get_food())):
				pickup.on_eaten();
				
onready var SMOKE_EFFECT = load("res://objects/Smoke.tscn");
onready var ATTACKER = load("res://objects/AttackingVillagerPickup.tscn");
