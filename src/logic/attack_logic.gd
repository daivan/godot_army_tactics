extends Node



# Called every frame. 'delta' is the elapsed time since the previous frame.
func attack(attacker, target):
	if target.getIsDead() == false:
		print('target is taking damage')
		target.currentHealth = target.currentHealth - 10
		target.checkIfDead()
		print('target has:' + str(target.currentHealth))
	
