extends ParallaxBackground

@export var bg_texture : CompressedTexture2D = preload("res://assets/textures/bg/Green.png")
@export var base_scroll_speed : Vector2 = Vector2(30,30)
@export var scroll_speed = 30
@onready var sprite = $ParallaxLayer/Sprite2D

func _ready():
	sprite.texture = bg_texture

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	# arka plan hareketi
	#scroll_base_offset += base_scroll_speed * delta
	
	#arka plan hareketi 2
	sprite.region_rect.position += Vector2(scroll_speed,scroll_speed) * delta
	
	
	#if scroll_base_offset >= Vector2(64,64):
		#scroll_base_offset = Vector2.ZERO
