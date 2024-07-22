extends Area3D
@onready var area_default = $"../../AreaDefault"
@onready var barreras = $"../../Barreras"
@onready var area_default_2 = $"../../AreaDefault2"
@onready var area_default_3 = $"../../AreaDefault3"
@onready var puerta = $"../../puerta"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_body_entered(body):
	if "player" in str(body):
		#barreras.process_mode = Node.PROCESS_MODE_INHERIT
		if get_parent().name == "TPsIncorrectos1":
			body.global_position = area_default.global_position
			print(get_parent().name)
		elif get_parent().name == "TPsIncorrectos2":
			body.global_position = area_default_2.global_position
		elif get_parent().name == "TPsIncorrectos3":
			body.global_position = area_default_3.global_position
		#await get_tree().create_timer(0.2).timeout
		#barreras.process_mode = Node.PROCESS_MODE_DISABLED
