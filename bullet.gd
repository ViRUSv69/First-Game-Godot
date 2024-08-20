extends Area2D

var travelled_distane = 0

@export var bullet_damage  = 1

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
	var attack = Attack.new()
	attack.attack_damage = bullet_damage 
	if body is Enemy:
		body.take_damage(attack)
