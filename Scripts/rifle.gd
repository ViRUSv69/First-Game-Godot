extends Area2D

@export var DAMAGE = 0.5

func _physics_process(delta):
	look_at(get_global_mouse_position()) 
 

func shoot():
	const BULLET = preload("res://bullet.tscn")
	var new_bullet = BULLET.instantiate()
	%RifleShootPoint.add_child(new_bullet)
	new_bullet.global_position = %RifleShootPoint.global_position
	new_bullet.global_rotation = %RifleShootPoint.global_rotation


func _on_timer_timeout() -> void:
	shoot()
