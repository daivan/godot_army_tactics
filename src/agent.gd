extends CharacterBody2D

@export var team:String = ""
@export var target:String = ""

@export var maxHealth:int = 100
@export var currentHealth:int = 100

var attackTarget:CharacterBody2D

var isDead = false

const SPEED = 50.0
const JUMP_VELOCITY = -400.0

func _ready():
	if attackTarget == null:
		find_new_attack_target()
	
var AttackLogic = load("res://src/logic/attack_logic.gd").new()

func _physics_process(delta):
	# Add the gravity.
	
	if attackTarget != null:
		
		if attackTarget.getIsDead() == true:
			find_new_attack_target()
			$AttackTimer.stop()
		else:
			var target_position = self.attackTarget.get_position()
			var direction = global_position.direction_to(target_position)
		
			velocity = direction * self.SPEED
			move_and_slide()


func _on_attack_range_body_entered(body):
	if body.is_in_group("enemy"):
		$AttackTimer.start()

func getIsDead():
	return self.isDead
	
func checkIfDead():
	if self.currentHealth < 1:
		self.isDead = true


func _on_attack_timer_timeout():
	AttackLogic.attack(self, attackTarget)
	#print($AttackRange.get_overlapping_bodies())
	pass

func find_new_attack_target():
	var all_enemy = get_tree().get_nodes_in_group("enemy")
	for enemy in all_enemy:
		if enemy.getIsDead() == false:
			self.attackTarget = enemy
