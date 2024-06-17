extends RayCast3D


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if is_colliding():
		var collider = get_collider()
		if Input.is_action_just_pressed("interact") && collider.has_method("interact"):
			collider.interact()
