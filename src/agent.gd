extends CharacterBody2D

@export var team:String = ""
@export var target:String = ""

@export var maxHealth:int = 100
@export var currentHealth:int = 100

var attackTarget:CharacterBody2D
var isInAttackRange:bool = false

var AttackLogic = load("res://src/logic/attack_logic.gd").new()
var enemiesInRange : Array = []

var isDead = false

const SPEED = 20.0
const JUMP_VELOCITY = -400.0

@onready var nav_agent := $NavigationAgent2D as NavigationAgent2D

func setup(unit_data):
	#self.add_to_group('hero')
	pass
	
func _ready():
	if attackTarget == null:
		find_new_attack_target()
	

func _physics_process(delta):
	# Add the gravity.

	if getIsDead() == true:
		die()
		return
		
	if attackTarget != null and isInAttackRange == false:
		var dir = to_local(nav_agent.get_next_path_position()).normalized()
		velocity = dir * SPEED
		move_and_slide()

	if attackTarget == null or attackTarget.getIsDead() == true or attackTarget.visible == false:	
		self.enemiesInRange.erase(attackTarget)
		print("in range:", self.enemiesInRange)
		$AttackTimer.stop()
		find_new_attack_target()
		
	update_healthbar()
	
func makepath() -> void:
	if attackTarget != null:
		nav_agent.target_position = self.attackTarget.global_position

func _on_attack_range_body_entered(body):
	if body.is_in_group("enemy"):
		self.enemiesInRange.append(body)
		
	if body.is_in_group("enemy") && body == attackTarget:
		self.isInAttackRange = true
		$AttackTimer.start()
	print("in range:", self.enemiesInRange)

func _on_attack_range_body_exited(body):
	if body.is_in_group("enemy"):
		self.enemiesInRange.erase(body)
	print("in range:", self.enemiesInRange)

func getIsDead():
	return self.isDead
	
func checkIfDead():
	if self.currentHealth < 1:
		self.isDead = true


func _on_attack_timer_timeout():
	if attackTarget != null:
		AttackLogic.attack(self, attackTarget)


func find_new_attack_target():
	var all_enemy = get_tree().get_nodes_in_group("enemy")
	for enemy in all_enemy:
		if enemy.getIsDead() == false:
			self.attackTarget = enemy
			if self.attackTarget in self.enemiesInRange:
				$AttackTimer.start()


func _on_update_path_timer_timeout():
	makepath()

func update_healthbar():
	var healthBar = $HealthBar
	healthBar.value = self.currentHealth

func die():
	self.visible = false
	$AttackTimer.stop()
	$UpdatePathTimer.stop()
	pass
