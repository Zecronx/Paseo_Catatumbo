extends Area3D
@onready var pregunta_1 = $"../Pregunta1"
var entrar = true

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_body_entered(body):
	if "player" in str(body):
		if entrar:
			pregunta_1.visible = true
			entrar = false
		else:
			pregunta_1.visible = false
			entrar = true
