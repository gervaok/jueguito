extends Node

var score = 0
var lives = 3
var current_level = 1
var max_levels = 2

var sounds = {}

func _ready():
	add_to_group("game_manager")
	set_as_physics_process_owner(true)

func add_score(points: int):
	score += points
	if has_node("/root/Level/HUD"):
		get_node("/root/Level/HUD").update_score(score)

func lose_life():
	lives -= 1
	if has_node("/root/Level/HUD"):
		get_node("/root/Level/HUD").update_lives(lives)

func next_level():
	current_level += 1
	if current_level <= max_levels:
		get_tree().change_scene_to_file("res://scenes/levels/level_%d.tscn" % current_level)
	else:
		show_game_completed()

func reset_level():
	get_tree().reload_current_scene()

func show_game_completed():
	print("¡Felicidades! ¡Completaste el juego con %d puntos!" % score)
	get_tree().change_scene_to_file("res://scenes/ui/menu.tscn")

func play_sound(sound_name: String):
	print("Playing sound: ", sound_name)

func reset_game():
	score = 0
	lives = 3
	current_level = 1
