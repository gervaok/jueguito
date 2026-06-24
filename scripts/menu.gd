extends Control

func _ready():
	GameManager.reset_game()

func _on_start_pressed():
	GameManager.current_level = 1
	get_tree().change_scene_to_file("res://scenes/levels/level_1.tscn")

func _on_quit_pressed():
	get_tree().quit()
