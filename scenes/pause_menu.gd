extends Control


func _on_resume_pressed() -> void:
	%PauseMenu.hide()
	Engine.time_scale = 1

func _on_quit_pressed() -> void:
	get_tree().quit()
