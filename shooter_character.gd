class_name ShooterCharacter extends CharacterBody2D

const bullet = preload("res://bullet.tscn")

@onready var anim: AnimatedSprite2D = $AnimatedSprite2D
@onready var weap: Timer = $WeaponTimer
@onready var nav: NavigationAgent2D = $NavigationAgent2D

@export var target_player: ShooterCharacter
@export var target_position: Vector2

var move_vector: Vector2 = Vector2.ZERO
var shoot_vector: Vector2 = Vector2.ZERO
@export var speed: int = 256

#func _ready() -> void:
	#nav.target_position = position


func _physics_process(_delta: float) -> void:
	# Pathfinding
	if nav.is_target_reached():
		target_position = Vector2.ZERO
		
	if target_player:
		target_position = target_player.position
	
	if target_position != Vector2.ZERO:
		nav.target_position = target_position
		nav.velocity = nav.get_next_path_position() - position
	
	# Movement
	move_vector.limit_length(1)
	if move_vector != Vector2.ZERO:
		rotation = move_vector.normalized().angle()
		velocity = move_vector * speed
		anim.animation = "run"
	else:
		velocity = Vector2.ZERO
		anim.animation = "stand"
	
	move_and_slide()
	
	# Shooting
	if shoot_vector != Vector2.ZERO:
		if weap.is_stopped():
			_on_weapon_timer_timeout()
			weap.start()
	else:
		weap.stop()


func _on_weapon_timer_timeout() -> void:
	var new_bullet = bullet.instantiate()
	new_bullet.direction = shoot_vector
	new_bullet.position = position
	new_bullet.shooter = self
	add_sibling(new_bullet)


func _on_navigation_agent_2d_velocity_computed(safe_velocity: Vector2) -> void:
	move_vector = safe_velocity.limit_length()
