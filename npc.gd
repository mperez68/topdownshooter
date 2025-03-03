class_name NPC extends ShooterCharacter

@onready var aggro_range = $ShapeCast2D

func _physics_process(delta: float) -> void:
	if !is_instance_valid(target_player) or target_player.is_dead():
		target_player = null
		target_position = position
	
	for result in aggro_range.collision_result:
		if target_player == null and result.collider is Player:
			target_player = result.collider
	
	if target_player:
		shoot_vector = (target_player.position - position).limit_length()
	else:
		shoot_vector = Vector2.ZERO
	
	super(delta)
