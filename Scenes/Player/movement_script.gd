extends CharacterBody3D
class_name Player
var speed
const WALK_SPEED = 5.0
const SPRINT_SPEED = 7.0
const JUMP_VELOCITY = 5.0
const SENSITIVITY = 0.01

#bob variables
const BOB_FREQ = 2.0
const BOB_AMPLITUDE = 0.08
var t_bob = 0.0

#fov variables
const BASE_FOV = 75.0
const FOV_CHANGE = 1.5
# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = 9.8

@onready var neck = $Neck
@onready var camera = $Neck/Camera3D
static var player_position

func _ready():
	camera.current = is_multiplayer_authority()
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func _unhandled_input(event):
	if event is InputEventMouseMotion or event == InputEventJoypadMotion:
		neck.rotate_y(-event.relative.x * SENSITIVITY)
		camera.rotate_x(-event.relative.y * SENSITIVITY)
		camera.rotation.x = clamp(camera.rotation.x, deg_to_rad(-50),deg_to_rad(60))
	
func _physics_process(delta):
	player_position = global_position
	
	if is_multiplayer_authority():
		
		# Add the gravity.
		if not is_on_floor():
			velocity.y -= gravity * delta
		if Input.is_action_pressed("menu"):
			Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		# Handle jump.
		if Input.is_action_just_pressed("jump") and is_on_floor():
			velocity.y = JUMP_VELOCITY
		
		if Input.is_action_pressed("sprint"):
			speed = SPRINT_SPEED
		else:
			speed = WALK_SPEED
		# Get the input direction and handle the movement/deceleration.
		# As good practice, you should replace UI actions with custom gameplay actions.
		var input_dir = Input.get_vector("left", "right", "up", "down")
		var direction = (neck.transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()

		if direction:
			velocity.x = direction.x * speed
			velocity.z = direction.z * speed
		else:
			velocity.x = lerp(velocity.x, direction.x * speed, delta * 15.0)
			velocity.z = lerp(velocity.z, direction.z * speed, delta * 15.0)

		#head bobbing (mueve la cabeza al caminar)
		t_bob += delta * velocity.length() * float(is_on_floor()) 
		camera.transform.origin = _headbob(t_bob)
		
		#FOV
		var velocity_clamped = clamp(velocity.length(),0.5,SPRINT_SPEED*2)
		var target_fov = BASE_FOV + FOV_CHANGE + velocity_clamped
		camera.fov = lerp(camera.fov,target_fov,delta * 10.0)
		
		move_and_slide()
	
func _headbob(time) -> Vector3:
	var pos = Vector3.ZERO
	pos.y = sin(time * BOB_FREQ) * BOB_AMPLITUDE
	pos.x = cos(time * BOB_FREQ)/3 * BOB_AMPLITUDE
	return pos

func _enter_tree():
	set_multiplayer_authority(name.to_int())
