extends Node2D

@onready var player = $Player
var enemy_scene = preload("res://Scenes/Enemy.tscn")


func _ready():
	var screen_size = get_viewport_rect().size
	
	player.position = Vector2(screen_size.x / 2, screen_size.y - 100)


func _on_enemy_timer_timeout() -> void:
	var enemy = enemy_scene.instantiate()
	var screen_size = get_viewport_rect().size
	var random_x = randf_range(0, screen_size.x)
	enemy.position = Vector2(random_x, -50)
	add_child(enemy)
