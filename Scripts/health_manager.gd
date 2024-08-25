extends Node

signal health_finished

@export var Max_Player_Health = 100.0
var Player_Health

func _ready() -> void:
	Player_Health = Max_Player_Health
	
	
func decrease_heath(health_amount):
	Player_Health -= health_amount
	print(Player_Health)
	
	if Player_Health <=0:
		health_finished.emit() 
		print_debug("Player died")
