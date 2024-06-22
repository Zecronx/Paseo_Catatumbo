extends Control

var next_scene = preload("res://Scenes/juego.tscn")

func _on_play_pressed():
	get_tree().change_scene_to_packed(next_scene)

func _on_exit_pressed():
	get_tree().quit()
