extends Node3D

var detective_chair_phelps = preload("res://chairs/detective_chair_phelps_characterbody.tscn")

var node_to_load

func _ready() -> void:
	#load in detective chair phelps
	node_to_load = detective_chair_phelps.instantiate()
	add_child(node_to_load)
	node_to_load.position.y -= 3
	
	
