extends CharacterBody2D
class_name Player

var speed = 200
@export var gravity = 400
@export var jump_force = 300
@export var friction = 10
@onready var animated_sprite = $AnimatedSprite2D

func _physics_process(delta):
	# Yerçekimi etkisi
	if not is_on_floor():
		velocity.y += gravity * delta

	# Zıplama
	if Input.is_action_just_pressed("jump") and is_on_floor():
		jump(jump_force)
	
	# Hareket girişi
	var direction = Input.get_axis("left", "right")
	
	# Karakterin yönünü ayarlama
	if direction != 0:
		animated_sprite.flip_h = (direction == -1)
	
	# Hareket uygulama
	velocity.x = direction * speed
	
	# Sürtünmeyi uygula
	if direction == 0 and is_on_floor():
		velocity.x = move_toward(velocity.x, 0, friction * delta)
	

	# Animasyonları güncelle
	update_animations(direction)
	
	# Hareketi uygula
	move_and_slide()

func jump(force):
	velocity.y = -force

func update_animations(direction):
	if is_on_floor():
		if direction == 0:
			animated_sprite.play("idle")
		else:
			animated_sprite.play("run")
	else:
		if velocity.y < 0:
			animated_sprite.play("jump")
