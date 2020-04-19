extends StaticBody2D
class_name Plant

var health : Healthbar = Healthbar.new(100);
var decayAmount = 3;
var decayTimeMax = 2;
var decayTime = decayTimeMax;
var growth = 0;
var attackersPrev = 1;
var playerInRange = false;
var fadeAll = false;
var gAl = 1.0;
var dead = false;
var canAttack = false;
var attackTime = 0;

onready var stages = [
	$st1,
	$st2,
	$st3,
	$st4,
	$st5,
	$st6,
	$st7,
	$st8,
	$st9,
	$st10
];

func _ready():
	Global.plant = self;

func _process(delta):
	
	if(canAttack && !fadeAll):
		attackTime -= delta;
		if(attackTime < 0):
			spawn_attackers(rand_range(1, 2 + (growth / 2)));
	
	var scale = 1;
	for i in range(Global.game.get_children().size()):
		var n = Global.game.get_children()[i];
		if(n.is_in_group("attacker")):
			scale += 0.5;
	
	Global.game.get_node("ui/AttackedBox").enabled = scale > 1 && !fadeAll;
		
	if(scale == 1 && attackersPrev != 1):
		QuestManager.complete(QuestManager.ATTACKER_QUEST);
	attackersPrev = scale;
	
	decayTime -= delta * scale;
	if(decayTime <= 0 && !fadeAll):
		health.damage(decayAmount);
		decayTime = decayTimeMax;
		
	if(QuestManager.current is YouQuest && playerInRange):
		$eprompt.visible = true;
		if(Input.is_action_just_pressed("activate")):
			Global.player.visible = false;
			Global.player.position = position;
			Global.player.freeze = true;
			QuestManager.complete(QuestManager.YOU_QUEST);
			feed(FoodTypes.YOU);
			
			for i in range(Global.game.get_node("ui").get_children().size()):
				var n = Global.game.get_node("ui").get_children()[i];
				n.visible = false;
			
			fadeAll = true;	
	else:
		$eprompt.visible = false;
		
	if(fadeAll):
		gAl -= delta;
		Global.game.modulate = Color(1, 1, 1, gAl);
	
	if(health.is_dead()):
		dead = true;
		visible = false;
		Global.game.get_node("ui/WinLabel").visible = true;
		pass;
	for i in range(stages.size()):
		stages[i].visible = floor(growth) == i || floor(growth) >= stages.size() && i == stages.size() - 1;

func can_eat(food : FoodObject):
	return food.requiredSize <= growth;

func feed(food : FoodObject):
	if(can_eat(food)):
		health.heal(food.amount);
		if(floor(growth) == food.requiredSize):
			growth += 1;
			on_grow();
			$AudioStreamPlayer.play();
		return true;
	return false;

func on_grow():
	for i in range(10 + randi() % 20):
		var smoke = SMOKE_EFFECT.instance();
		add_child(smoke);
		smoke.position = Vector2(-3 + rand_range(0, 6), -3 + rand_range(0, 6));

func spawn_attackers(amt : int):
	canAttack = true;
	attackTime = rand_range(15, 30);
	Global.player.play_attacked_sound();
	for i in range(amt):
		var attacker = ATTACKER.instance();
		Global.game.add_child(attacker);
		var offX = rand_range(15, 25) * 1 if randi() % 2 == 0 else -1;
		var offY = rand_range(15, 25) * 1 if randi() % 2 == 0 else -1;
		attacker.position = Vector2(position.x + offX, position.y + offY);

func _on_Area2D_body_entered(body):
	if(!(body is Player) || dead):
		return;
	
	playerInRange = true;
	
	var pickup = Global.player.pickup;
	if(pickup is FoodPickup):
		if(pickup.can_give()):
			if(feed(pickup.get_food())):
				pickup.on_eaten();
				
onready var SMOKE_EFFECT = load("res://objects/Smoke.tscn");
onready var ATTACKER = load("res://objects/AttackingVillagerPickup.tscn");


func _on_Area2D_body_exited(body):
	if(!(body is Player)):
		return;
		
	playerInRange = false;
