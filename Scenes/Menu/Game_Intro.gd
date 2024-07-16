extends Control
@onready var video_stream_player = $VideoStreamPlayer

var next_scene = preload("res://Scenes/Menu/Main_Menu.tscn")

func _on_video_stream_player_finished():
	get_tree().change_scene_to_packed(next_scene)

func _process(delta):
	if Input.is_action_just_pressed("menu"):
		get_tree().change_scene_to_packed(next_scene)
