extends CanvasLayer


func _on_restart_btn_pressed() -> void:
	HealthManager.Player_Health=HealthManager.Max_Player_Health;
	get_tree().change_scene_to_file("res://game.tscn")


func _on_exit_btn_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/start.tscn")
