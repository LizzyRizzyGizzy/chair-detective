extends Node3D

var PoliceDialougeAreaEntered: bool = false
signal change_visibility #change dialouge system visibility
signal change_jumping #turn off jumping in dialouge
@onready var PoliceCamera: Camera3D = $Police/PoliceCamera3D
@onready var DetectiveChairPhelps: CharacterBody3D = $DetectiveChairPhelps

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("interact") and PoliceDialougeAreaEntered == true:
		PoliceCamera.make_current()
		change_visibility.emit()
		change_jumping.emit()

func _on_police_trigger_area_body_entered(_body: CharacterBody3D = DetectiveChairPhelps):
	PoliceDialougeAreaEntered = true

func _on_police_trigger_area_body_exited(_body: CharacterBody3D = DetectiveChairPhelps):
	PoliceDialougeAreaEntered = false
