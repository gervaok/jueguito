extends CharacterBody2D

@export var speed = 150.0
@export var gravity = 980.0
@export var patrol_range = 200.0
@export var detection_range = 300.0

var start_position = Vector2.ZERO
var direction = 1
var is_chasing = false
var player = null

@onready var sprite = $Sprite2D
@onready var animation_player = $AnimationPlayer
@onready var detection_area = $DetectionArea

func _ready():
	start_position = global_position
	player = get_tree().get_first_node_in_group("player")


func _physics_process(delta):
	# Aplicar gravedad
	velocity.y += gravity * delta
	
	# Detectar al jugador
	if player:
		var distance = global_position.distance_to(player.global_position)
		if distance < detection_range:
			is_chasing = true
		else:
			is_chasing = false
	
	if is_chasing:
		# Perseguir al jugador
		if player.global_position.x > global_position.x:
			direction = 1
			sprite.flip_h = false
		else:
			direction = -1
			sprite.flip_h = true
		velocity.x = direction * speed * 1.5
		play_animation("run")
	else:
		# Patrullar
		if abs(global_position.x - start_position.x) > patrol_range:
			direction *= -1
		
		velocity.x = direction * speed
		sprite.flip_h = direction < 0
		play_animation("walk")
	
	# Cambiar dirección al tocar pared
	move_and_slide()
	
	if is_on_wall():
		direction *= -1

func play_animation(anim_name: String):
	if animation_player and animation_player.current_animation != anim_name:
		animation_player.play(anim_name)
