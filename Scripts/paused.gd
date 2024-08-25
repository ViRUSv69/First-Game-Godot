extends Node

func _on_resume_pressed() -> void:
	%Paused.hide()
	Engine.time_scale = 1

func _on_quit_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/start.tscn")
