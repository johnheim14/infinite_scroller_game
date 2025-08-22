extends CharacterBody2D

@export var speed = 400.0

var bullet_scene = preload("res://Scenes/Player/bullet.tscn")
@onready var fire_rate_timer = $FireRateTimer
@onready var muzzle = $Muzzle

func _physics_process(delta):
	var direction = Input.get_vector("Player_Left", "Player_Right","Player_Up", "Player_Down")
	
	velocity = direction * speed
	
	move_and_slide()
	
	var screen_size = get_viewport_rect().size
	position = position.clamp(Vector2.ZERO, screen_size)
	
	if Input.is_action_just_pressed("Shoot") and fire_rate_timer.is_stopped():
		shoot()
		
func shoot():
	var bullet = bullet_scene.instantiate()
	#bullet.position = self.position
	bullet.global_position = muzzle.global_position
	get_parent().add_child(bullet)
	fire_rate_timer.start()
	
