extends CharacterBody2D

# Movimiento
@export var speed = 300.0
@export var jump_force = -400.0
@export var acceleration = 15.0
@export var friction = 20.0

# Gravedad
@export var gravity = 980.0
@export var max_fall_speed = 500.0

# Estado
var is_jumping = false
var can_jump = true
var input_direction = 0.0

# Animación
@onready var sprite = $Sprite2D
@onready var animation_player = $AnimationPlayer
@onready var jump_particles = $JumpParticles
@onready var dust_particles = $DustParticles

func _physics_process(delta):
	# Entrada
	input_direction = Input.get_axis("ui_left", "ui_right")
	
	# Movimiento horizontal
	if input_direction != 0:
		velocity.x = move_toward(velocity.x, input_direction * speed, acceleration)
		if is_on_floor():
			play_animation("run")
			if input_direction > 0:
				sprite.flip_h = false
			else:
				sprite.flip_h = true
			
			if dust_particles and randi() % 3 == 0:
				dust_particles.emitting = true
	else:
		velocity.x = move_toward(velocity.x, 0, friction)
		if is_on_floor():
			play_animation("idle")
		dust_particles.emitting = false

	# Salto
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = jump_force
		is_jumping = true
		can_jump = false
		play_animation("jump")
		if jump_particles:
			jump_particles.emitting = true
		GameManager.play_sound("jump")

	# Gravedad
	if not is_on_floor():
		velocity.y += gravity * delta
		velocity.y = min(velocity.y, max_fall_speed)
		if velocity.y > 0 and is_jumping:
			is_jumping = false
			if input_direction == 0:
				play_animation("fall")
	else:
		if velocity.y > 0:
			can_jump = true
			velocity.y = 0

	# Aplicar movimiento
	move_and_slide()
	
	# Envolver pantalla
	wrap_screen()

func play_animation(anim_name: String):
	if animation_player and animation_player.current_animation != anim_name:
		animation_player.play(anim_name)

func wrap_screen():
	if global_position.x < -50:
		global_position.x = get_viewport_rect().size.x + 50
	elif global_position.x > get_viewport_rect().size.x + 50:
		global_position.x = -50

func take_damage():
	GameManager.lose_life()
	if GameManager.lives > 0:
		global_position = get_node("/root/Level/SpawnPoint").global_position
	else:
		game_over()

func game_over():
	get_tree().reload_current_scene()
