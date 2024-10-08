extends CharacterBody2D
class_name Player

@onready var Player_Health = 100.0

@onready var weapon: Node2D = get_node("Weaons")
var current_weapon
var weapon_counter = 0
@onready var level_bar = %LevelBar

func _ready() -> void:
	current_weapon = weapon.get_child(weapon_counter)

func _physics_process(delta):
	var direction = Input.get_vector("move_left","move_right","move_up","move_down")
	velocity = direction * 600
	move_and_slide()
	
	if velocity.length() > 0:
		get_node("HappyBoo").play_walk_animation()
	else:
		get_node("HappyBoo").play_idle_animation()	
		
	if %AttackBar.value != %AttackBar.max_value:
		%AttackBar.value = %AttackTimer.wait_time - %AttackTimer.time_left
	
	splash_attack()
	
func _on_timer_timeout() -> void:
	%AttackBar.value = %AttackBar.max_value
	%AttackNotice.visible = true

func health_filler_50():
	%HealthNotice.visible = false
	Player_Health += 50
	%PlayerHealthBar.value = Player_Health
	
func _process(delta: float) -> void:
	if level_bar.level >= 3:
		weapon_change()

func _on_hurtbox_body_entered(body: Node2D) -> void:
	if body is Enemy:
		var damage = body.Damage
		HealthManager.decrease_heath(damage)
	%PlayerHealthBar.value = HealthManager.Player_Health
		
func splash_attack():
	var splash_damage = 5
	var attack = Attack.new()
	attack.attack_damage = splash_damage
	if Input.is_action_just_pressed("attack") and %AttackBar.value == %AttackBar.max_value:
		%AttackBar.value =0
		%AttackTimer.start()
		%AttackNotice.visible = false
		var mobs_in_killzone = %Killzone.get_overlapping_bodies()
		for mob in mobs_in_killzone:
			if mob is Enemy:
				mob.take_damage(attack)

func weapon_change():
	if Input.is_action_just_pressed("change"):
		weapon_counter+=1
		if weapon_counter > weapon.get_child_count()-1:
			weapon_counter = 0
		current_weapon.process_mode = Node.PROCESS_MODE_DISABLED
		current_weapon.hide()
		
		current_weapon = weapon.get_child(weapon_counter)
		current_weapon.process_mode = Node.PROCESS_MODE_INHERIT
		current_weapon.show()
