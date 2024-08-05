extends Node2D

@onready var start_position = $Start
var player = null


func _ready():
	player = get_tree().get_first_node_in_group("player")
	if player != null:
		player.global_position = start_position.get_spawn_pos()
	var traps = get_tree().get_nodes_in_group("traps")
	for trap in traps:
		trap.connect("touched_player", _on_saw_touched_player)

func _on_death_zone_body_entered(body):
	reset_player()

# Karakterin yeniden dogma noktasi
func reset_player():
	player.velocity = Vector2.ZERO
	player.global_position = start_position.get_spawn_pos()
func _on_saw_touched_player():
	reset_player()

