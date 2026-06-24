extends CharacterBody2D

@export var speed = 120.0
@export var bob_speed = 2.0
@export var bob_range = 20.0
@export var detection_range = 250.0

var start_position = Vector2.ZERO
var direction = 1
var bob_offset = 0.0
var is_chasing = false
var player = null

@onready var sprite = $Sprite2D
@onready var animation_player = $AnimationPlayer

func _ready():
	start_position = global_position
	player = get_tree().get_first_node_in_group("player")

func _physics_process(delta):
	if player:
		var distance = global_position.distance_to(player.global_position)
		if distance < detection_range:
			is_chasing = true
		else:
			is_chasing = false
	
	if is_chasing:
		# Perseguir al jugador
		var direction_to_player = (player.global_position - global_position).normalized()
		velocity = direction_to_player * speed * 1.2
		
		if direction_to_player.x > 0:
			sprite.flip_h = false
		else:
			sprite.flip_h = true
			
		play_animation("fly")
	else:
		# Volar en patrón
		bob_offset += bob_speed * delta
		var bob_y = sin(bob_offset) * bob_range
		
		if direction == 1:
			velocity.x = speed
			if global_position.x > start_position.x + 150:
				direction = -1
		else:
			velocity.x = -speed
			if global_position.x < start_position.x - 150:
				direction = 1
		
		velocity.y = bob_y
		sprite.flip_h = direction < 0
		play_animation("fly")
	
	move_and_slide()

func play_animation(anim_name: String):
	if animation_player and animation_player.current_animation != anim_name:
		animation_player.play(anim_name)
