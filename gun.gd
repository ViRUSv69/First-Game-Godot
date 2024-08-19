extends Area2D

func _physics_process(delta):
	var mobs_in_range= get_overlapping_bodies()
	if mobs_in_range.size() > 0:
		var target_mob = mobs_in_range.front()
		look_at(target_mob.global_position) 

func shoot():
	const BULLET = preload("res://bullet.tscn")
	var new_bullet = BULLET.instantiate()
	%ShootPoint.add_child(new_bullet)
	new_bullet.global_position = %ShootPoint.global_position
	new_bullet.global_rotation = %ShootPoint.global_rotation


func _on_timer_timeout() -> void:
	shoot()
