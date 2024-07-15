extends Area3D
@onready var area_default_2 = $"../../AreaDefault2"
@onready var area_default_3 = $"../../AreaDefault3"
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_body_entered(body):
	if "player" in str(body):
		print("entro")

		if get_parent().name == "TP1":
			body.global_position = area_default_2.global_position
		elif get_parent().name == "TP2":
			body.global_position = area_default_3.global_position
		else:
			body.global_position += Vector3(0,0,-2)


