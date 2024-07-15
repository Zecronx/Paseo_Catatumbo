extends Area3D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_body_entered(body):
	if "player" in str(body):
		print("entro")
		#body.set_position(Vector3(1,1,1))
		body.global_position += Vector3(0,0,-2)
