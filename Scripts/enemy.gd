extends Area2D

@export var speed = 150.0
@export var health = 3

func _process(delta):
	position.y += speed * delta
	
func _on_area_entered(area):
	if area.is_in_group("bullets"):
		health -= 1
		area.queue_free()
		if health <= 0:
			queue_free()
