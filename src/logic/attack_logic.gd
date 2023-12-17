extends Node



# Called every frame. 'delta' is the elapsed time since the previous frame.
func attack(attacker, target):
	if target.get_is_dead() == false:
		print('target is taking damage')
		target.current_health = target.current_health - 10
		target.check_if_dead()
		print('target has:' + str(target.current_health))
	
