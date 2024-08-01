extends Area2D

@onready var animated_sprite = $AnimatedSprite2D
@export var jump_force = 300


func _on_body_entered(_body):
	if _body is Player:
		animated_sprite.play("jump_ped")
		_body.jump(jump_force)
