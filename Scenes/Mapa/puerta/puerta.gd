extends StaticBody3D

var open = false
var in_animation = false
@onready var animation_player = $AnimationPlayer


func interact():
	if !in_animation:
		in_animation = true
		if !open:
			animation_player.play("abrir")
			open = true
		elif open:
			animation_player.play("cerrar")
			open = false
		await get_tree().create_timer(0.3,false).timeout
		in_animation = false
