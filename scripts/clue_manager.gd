extends Node3D

var Clue1Entered: bool = false
@onready var Clue1Camera: Camera3D = $Clue1/Clue1Camera
@onready var Clue1CameraTimer: Timer = $Clue1/Clue1Camera/Clue1CameraTimer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("interact") and Clue1Entered == true:
		Clue1Camera.make_current()
		Clue1CameraTimer.start(3)

func _on_clue_1_camera_timer_timeout() -> void:
	Clue1Camera.clear_current()
	CameraManager.PlayerCamera.make_current()

func _on_clue_1_body_entered(_body: Node3D) -> void:
	Clue1Entered = true

func _on_clue_1_body_exited(_body: Node3D) -> void:
	Clue1Entered = false
