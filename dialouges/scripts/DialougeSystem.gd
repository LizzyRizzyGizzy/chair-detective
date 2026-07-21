extends Control

@export_file("*.json") var json_file

#var samplefile = "res://dialouges/data/sample.json"
var current_block : Dictionary
var scene_script : Dictionary
var next_block : Dictionary

@export_category("UI References")
@export var npc_text : RichTextLabel
@export var npc_name : RichTextLabel

@export var main_layer : CanvasLayer
@export var choices_layer : CanvasLayer

func _ready() -> void:
	# Hides the choice layer
	choices_layer.hide()
	
	get_json(json_file)
	load_block(current_block)

# User Input handling
func _input(_event: InputEvent) -> void:
	if Input.is_action_just_pressed("ui_accept"):
		next()

# Reads the assigned JSON File to a Dictionary
func get_json(file: String): 
	var jsonfile = FileAccess.get_file_as_string(file)
	scene_script = JSON.parse_string(jsonfile)
	current_block = scene_script["start"]
	
# Loads the keys in the file and parses them further
func load_block(block: Dictionary):
	if block.has("text"): npc_text.text = block["text"]
	if block.has("name"): npc_name.text = block["name"]
	
	if block.has("next"):
		var key = block["next"]
		next_block = scene_script[key]
		
	if block.has("choices"):
		choices_layer.show()
		choices_layer.set_choices(block["choices"])

# Loads next block
func next() -> void:
	current_block = next_block
	load_block(current_block)

func _on_choices_next_id(id: String) -> void:
	next_block = scene_script[id]
	next()
	choices_layer.hide()
