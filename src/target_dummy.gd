extends CharacterBody2D

@export var currentHealth:int = 100
var isDead:bool = false

func getIsDead():
	return self.isDead
	
func checkIfDead():
	if self.currentHealth < 1:
		self.isDead = true

func _physics_process(delta):
	update_health_bar()
	pass
	
	
func update_health_bar():
	var healthBar = $HealthBar
	healthBar.value = self.currentHealth
