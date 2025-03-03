class_name NPC extends ShooterCharacter

@onready var aggro_range = $ShapeCast2D

func _physics_process(delta: float) -> void:
	for collision in aggro_range.collision_result:
		if target_player == null:
			target_player = collision.collider
	
	super(delta)

func _process(_delta: float) -> void:
	if target_player:
		shoot_vector = (target_player.position - position).limit_length()
