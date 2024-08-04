extends Node2D

@onready var start_position = $Start
@onready var player = $Player

func _on_death_zone_body_entered(body):
	reset_player()

func reset_player():
	player.velocity = Vector2.ZERO
	player.global_position = start_position.global_position

func _on_saw_touched_player():
	reset_player()

