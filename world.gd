extends Node2D

@export var player: ShooterCharacter
var camera_offset: float = 300


# Engine
func _process(_delta: float) -> void:
	if player and !player.is_dead():
		Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	else:
		Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
		
	if is_instance_valid(player):
		$Camera2D.position.x = max($Camera2D.position.x, player.position.x + camera_offset)
