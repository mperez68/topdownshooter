extends Node2D

@export var player: ShooterCharacter
var camera_offset: float = 300

func _ready() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED

func _process(_delta: float) -> void:
	$Camera2D.position.x = max($Camera2D.position.x, player.position.x + camera_offset)
