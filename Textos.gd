extends Node3D

@onready var label_3d = $"."
@onready var sprite_3d = $Sprite3D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	look_at(Player.player_position)
	pass
