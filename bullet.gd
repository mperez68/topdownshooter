extends Area2D

var direction: Vector2 = Vector2.ZERO

@export var speed: float = 64
var shooter: CharacterBody2D

func _physics_process(delta: float) -> void:
	position += direction * speed * delta
	rotation = direction.angle()
	

func _on_life_timer_timeout() -> void:
	queue_free()

func _on_body_entered(body: Node2D) -> void:
	if body != shooter:
		queue_free()
