extends StaticBody3D

@onready var collision_shape_3d = $CollisionShape3D
@onready var area_3d = $Area3D
@onready var ray_cast_3d = $RayCast3D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if ray_cast_3d.is_colliding():
		print(ray_cast_3d.get_collider())
		var player = ray_cast_3d.get_collider()
		player.global_position += $Trenvia.global_position
	pass


func _on_area_3d_body_entered(body):
	print("hay coño")
	print(body)
	#body.global_position = global_position
	pass # Replace with function body.
