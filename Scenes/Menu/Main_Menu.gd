extends Control

@onready var anim = $Appear

func _ready() -> void:
	anim.play("Appear")

var next_scene = preload("res://Scenes/juego.tscn")

func _on_play_pressed():
	get_tree().change_scene_to_packed(next_scene)

func _on_exit_pressed():
	get_tree().quit()
