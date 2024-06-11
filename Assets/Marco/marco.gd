extends StaticBody3D
@export var audio: AudioStream
@onready var audio_stream_player = $AudioStreamPlayer

# Called when the node enters the scene tree for the first time.
func _ready():
	if audio != null:
		audio_stream_player.stream = audio
	
func _on_area_3d_body_entered(body):
	if "player" in str(body):
		print("ALGO ENTRO AL AREA")
		audio_stream_player.play()
	pass # Replace with function body.

func _on_area_3d_body_exited(body):
	if "player" in str(body):
		print("ALGO salio AL AREA")
		audio_stream_player.stop()
		
