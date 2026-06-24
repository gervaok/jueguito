extends Node

@onready var spawn_point = $SpawnPoint
@onready var goal = $Goal

func _ready():
	add_to_group("level")
	# Conectar señales de metas
	if goal:
		goal.body_entered.connect(_on_goal_reached)

func _on_goal_reached(body):
	if body.is_in_group("player"):
		print("¡Nivel completado!")
		GameManager.next_level()
