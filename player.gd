class_name Player extends ShooterCharacter

func _physics_process(delta: float) -> void:
	if nav.is_target_reached():
		move_vector = Input.get_vector("move_left", "move_right", "move_up", "move_down")
		shoot_vector = Input.get_vector("shoot_left", "shoot_right", "shoot_up", "shoot_down").normalized()
	
	super(delta)
