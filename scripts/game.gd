extends Node2D

@onready var start_position = $Start
@onready var label = $Timer/TimeLabel
@onready var timer = $Timer/Timer
@onready var exit = $Exit
var player = null
@onready var ui = $ui
@export var next_level: PackedScene = null
@export var is_final_level: bool = false

func _ready():
	#timer.start()
	player = get_tree().get_first_node_in_group("player")
	if player != null:
		player.global_position = start_position.get_spawn_pos()
	var traps = get_tree().get_nodes_in_group("traps")
	for trap in traps:
		trap.connect("touched_player", _on_saw_touched_player)
	
	exit.body_entered.connect(_on_exit_body_entered)

func _process(_delta):
	#label.text = "%02d:%02d" % time_left_to_live()
	pass

func _on_death_zone_body_entered(body):
	$hurt.play()
	reset_player()

# character spawn point
func reset_player():
	$hurt.play()
	player.velocity = Vector2.ZERO
	player.global_position = start_position.get_spawn_pos()
func _on_saw_touched_player():
	reset_player()

func _on_exit_body_entered(body):
	if body is Player:
		if is_final_level || (next_level != null):
			player.active = false
			await get_tree().create_timer(1).timeout
			if is_final_level:
				ui.show_win_screen(true)
			else:
				get_tree().change_scene_to_packed(next_level)

## timer
#func time_left_to_live():
	#var time_left = timer.time_left
	#var minute = floor(time_left /60)
	#var second = int(time_left) % 60
	#return [minute, second]
##timeout
#func _on_timer_timeout():
	#if timer.time_left <= 0:
		#reset_player()
		
