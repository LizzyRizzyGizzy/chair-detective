extends Control

var ClueMenu = preload("res://GUI/cluesystem/cluemenu.tscn")
var DialougeSystem = preload("res://GUI/dialouges/DialougeSystem.tscn")

var node_to_load

func _ready() -> void:
	#load order of GUI
	node_to_load = ClueMenu.instantiate()
	add_child(node_to_load)
	
	
