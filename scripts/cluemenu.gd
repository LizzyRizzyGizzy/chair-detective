extends Control

@onready var ClueList: ItemList = $CanvasLayer/MarginContainer/HBoxContainer/ItemList
@onready var ClueText: TextEdit = $CanvasLayer/MarginContainer/HBoxContainer/TextEdit



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_item_list_item_selected(index: int):
	match index:
		0:
			ClueText.text = "This is Clue 1"
		1:
			ClueText.text = "This is Clue 2"
