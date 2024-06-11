extends Node3D

@onready var label_3d = $Sprite3D
@onready var audio_stream_player = $AudioStreamPlayer

func _on_timer_timeout():
	pass # Replace with function body.


func _on_area_3d_body_entered(body):
	if "player" in str(body):
		print("ALGO ENTRO AL AREA")
		audio_stream_player.play()
	pass # Replace with function body.


func _on_area_3d_body_exited(body):
	if "player" in str(body):
		print("ALGO salio AL AREA")
		audio_stream_player.stop()
