extends Node3D

@onready var canvas_layer = $CanvasLayer

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_host_pressed():
	canvas_layer.hide()
	pass # Replace with function body.


func _on_join_pressed():
	canvas_layer.hide()
	pass # Replace with function body.
