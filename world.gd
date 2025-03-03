extends Node2D

@export var player: ShooterCharacter
var camera_offset: float = 300


# Engine
func _ready() -> void:
	$Camera2D.limit_right = $TileMapLayer.get_used_rect().end.x * 64
	pass

func _process(_delta: float) -> void:
	if player and !player.is_dead():
		Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	else:
		Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
		
	if is_instance_valid(player):
		$Camera2D.position.x = max($Camera2D.position.x, player.position.x + camera_offset)

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("restart"):
		get_tree().reload_current_scene()
