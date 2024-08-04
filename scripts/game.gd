extends Node2D

@onready var start_position = $Start
@onready var player = $Player


func _ready():
	var traps = get_tree().get_nodes_in_group("traps")
	for trap in traps:
		trap.connect("touched_player", _on_saw_touched_player)

func _on_death_zone_body_entered(body):
	reset_player()

# Karakterin yeniden dogma noktasi
func reset_player():
	player.velocity = Vector2.ZERO
	player.global_position = start_position.global_position

func _on_saw_touched_player():
	reset_player()

