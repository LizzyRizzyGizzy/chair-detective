extends CanvasLayer

@export var btn_group : ButtonGroup
var dia_choices : Dictionary

signal next_id(id: String)

func _ready() -> void:
	# Sets the signlas for the buttons
	btn_group.pressed.connect(btn_press)

# Sets the dictionary for the script
func set_choices(choices: Dictionary):
	dia_choices = choices
	var index = 0
	var buttons = btn_group.get_buttons()
	for c in choices.keys():
		buttons[index].text = c
		index += 1
	hide_unused_btns(index)

# Attempt to hide the unused buttons
func hide_unused_btns(index : int):
	var buttons = btn_group.get_buttons()
	if index == 4:
		pass
	else:
		for x in range(4):
			if x <= index:
				x+=1
			if x >= index:
				buttons[x].hide()

# the function for button press
func btn_press(btn : Button):
	var choice = dia_choices[btn.text]
	next_id.emit(choice)
