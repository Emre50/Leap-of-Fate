extends Node2D

@onready var start_position = $Start

func _on_death_zone_body_entered(body):
	body.velocity = Vector2.ZERO
	body.global_position = start_position.global_position
