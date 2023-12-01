extends CharacterBody2D

const SPEED = 20.0
@export var currentHealth:int = 100

@export var player: Node2D

@onready var navigationAgent := $NavigationAgent2D as NavigationAgent2D

var isDead:bool = false

func _physics_process(delta):
	if getIsDead() == true:
		die()
		return
		
	
	update_healthbar()
	
	var dir = to_local(navigationAgent.get_next_path_position()).normalized()
	velocity = dir * SPEED
	move_and_slide()
	
func getIsDead():
	return self.isDead
	
func checkIfDead():
	if self.currentHealth <= 0:
		self.isDead = true


func update_healthbar():
	var healthBar = $HealthBar
	healthBar.value = self.currentHealth

func update_navigation_path():
	self.navigationAgent.target_position = self.player.global_position

func _on_update_path_timer_timeout():
	update_navigation_path()

func die():
	self.visible = false
	$UpdatePathTimer.stop()
	pass
