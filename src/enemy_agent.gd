extends CharacterBody2D

var AttackLogic = load("res://src/logic/attack_logic.gd").new()

const SPEED = 20.0
@export var currentHealth:int = 100

@onready var navigationAgent := $NavigationAgent2D as NavigationAgent2D

var attackTarget:CharacterBody2D
var isInAttackRange:bool = false

var heroesInRange : Array = []

var isDead:bool = false

func setup(unit_data):
	self.add_to_group('enemy')
	pass

func _physics_process(delta):
	
	if attackTarget == null:
		find_new_attack_target()
		
	if getIsDead() == true:
		die()
		return
		
	
	update_healthbar()
	
	var dir = to_local(navigationAgent.get_next_path_position()).normalized()
	velocity = dir * SPEED
	move_and_slide()
	
	if attackTarget == null or attackTarget.get_is_dead() == true or attackTarget.visible == false:	
		self.heroesInRange.erase(attackTarget)
		print("in range:", self.heroesInRange)
		$AttackTimer.stop()
		find_new_attack_target()
	
func getIsDead():
	return self.isDead
	
func checkIfDead():
	if self.currentHealth <= 0:
		self.isDead = true


func update_healthbar():
	var healthBar = $HealthBar
	healthBar.value = self.currentHealth

func update_navigation_path():
	self.navigationAgent.target_position = self.attackTarget.global_position

func _on_update_path_timer_timeout():
	update_navigation_path()

func die():
	self.visible = false
	$AttackTimer.stop()
	$UpdatePathTimer.stop()
	pass

func find_new_attack_target():
	var all_heroes = get_tree().get_nodes_in_group("hero")
	print(all_heroes)
	for hero in all_heroes:
		if hero.get_is_dead() == false:
			self.attackTarget = hero
			$UpdatePathTimer.start()
			if self.attackTarget in self.heroesInRange:
				$AttackTimer.start()
				


func _on_attack_range_body_entered(body):
	if body.is_in_group("hero"):
		self.heroesInRange.append(body)
		
	if body.is_in_group("hero") && body == attackTarget:
		self.isInAttackRange = true
		$AttackTimer.start()
	print("in range:", self.heroesInRange)


func _on_attack_range_body_exited(body):
	if body.is_in_group("hero"):
		self.heroesInRange.erase(body)
	print("in range:", self.heroesInRange)


func _on_attack_timer_timeout():
	if attackTarget != null:
		AttackLogic.attack(self, attackTarget)
