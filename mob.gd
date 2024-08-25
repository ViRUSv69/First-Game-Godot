extends CharacterBody2D
class_name Enemy

var health = 3
var Damage = 5

@onready var player= get_node("/root/Game/Player")

func _ready() -> void:
	%Slime.play_walk()

func _physics_process(delta):
	var direction = global_position.direction_to(player.global_position)
	velocity = direction * 300
	move_and_slide()

func kill():
	queue_free()
	const SMOKE =  preload("res://smoke_explosion/smoke_explosion.tscn")
	var smoke = SMOKE.instantiate()
	get_parent().add_child(smoke)
	smoke.global_position = global_position

func take_damage(attack: Attack):
	health -= attack.attack_damage
	%MobHealthBar.value = health
	%Slime.play_hurt()
	
	if health <= 0:
		kill()
