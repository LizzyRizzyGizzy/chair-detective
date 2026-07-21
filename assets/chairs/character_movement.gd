extends CharacterBody3D


@export var SPEED : float = 5.0
@export var ROTATION_SPEED : float = 1.5
@export var JUMP_VELOCITY : float = 8

@onready var player_camera = $camera_origin/Camera3D
@onready var pivot = $camera_origin
@export var sens = 0.5
var rotation_direction = 0

func _ready() -> void:
	player_camera.make_current()
	CameraManager.PlayerCamera = player_camera
	#Input.mouse_mode = Input.MOUSE_MODE_CAPTURED

#func _input(event):
	#if event is InputEventMouseMotion:
	#	rotate_y(deg_to_rad(-event.relative.x * sens))
	#	pivot.rotate_x(deg_to_rad(-event.relative.y * sens))
	#	pivot.rotation.x = clamp(pivot.rotation.x, deg_to_rad(-90), deg_to_rad(45))

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir := Input.get_axis("forward", "back")
	var direction := (transform.basis * Vector3(input_dir, 0, 0)).normalized()
	if direction:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)
	
	rotation_direction = Input.get_axis("right", "left")
	rotation.y += rotation_direction * ROTATION_SPEED * delta
	move_and_slide()
