extends StaticBody3D
@export var imagen = CompressedTexture2D
@export var audio: AudioStream
@onready var audio_stream_player = $AudioStreamPlayer
@onready var timer_entered = $Timer_entered
@onready var timer_exited = $Timer_exited
@onready var sprite_3d = $Sprite3D

# Called when the node enters the scene tree for the first time.
func _ready():
	sprite_3d.texture = imagen
	if audio != null:
		audio_stream_player.stream = audio
	
func _on_area_3d_body_entered(body):
	if "player" in str(body):
			timer_entered.start()

func _on_area_3d_body_exited(body):
	#timerend.start
	if "player" in str(body):
		timer_exited.start()
		
func _on_timer_timeout():
	audio_stream_player.play()
	pass # Replace with function body.

func _on_timer_exited_timeout():
	audio_stream_player.stop()
	pass # Replace with function body.
