extends Area2D

var travelled_distane = 0

func _physics_process(delta):
	var SPEED = 1000
	var RANGE = 1200
	
	var direction = Vector2.RIGHT.rotated(rotation)
	position += direction * SPEED * delta
	
	travelled_distane += SPEED * delta
	if travelled_distane > RANGE:
		queue_free()




func _on_body_entered(body) -> void:
	queue_free()
	if body.has_method("take_damage"):
		body.take_damage()
