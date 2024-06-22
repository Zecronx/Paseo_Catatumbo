extends Control

var next_scene = preload("res://Scenes/Menu/Main_Menu.tscn")

func _on_video_stream_player_finished():
	get_tree().change_scene_to_packed(next_scene)
