extends Node3D

@onready var label_3d = $Sprite3D

func _on_timer_timeout():
	#label_3d.rotation_degrees = Vector3(0,-180,0)
	label_3d.process_mode = Node.PROCESS_MODE_INHERIT
	pass # Replace with function body.
