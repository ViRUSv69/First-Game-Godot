extends CanvasLayer

func _ready() -> void:
	var game:Game = Game.new()
	var game_version = game.GAME_VERSION
	print(game_version)
	$ColorRect/Game_Version.text = game_version

func _on_start_btn_pressed() -> void:
	get_tree().change_scene_to_file("res://game.tscn")

func _on_exit_btn_pressed() -> void:
	get_tree().quit()
