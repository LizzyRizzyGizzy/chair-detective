extends Control

@onready var ClueList: ItemList = $ClueMenuLayer/MarginContainer/HBoxContainer/ItemList
@onready var ClueText: TextEdit = $ClueMenuLayer/MarginContainer/HBoxContainer/TextEdit
var ClueMenuLayer: CanvasLayer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	ClueMenuLayer = $ClueMenuLayer
	ClueMenuLayer.hide()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("clue_menu"):
		ClueMenuLayer.visible = !ClueMenuLayer.visible


func _on_item_list_item_selected(index: int):
	match index:
		0:
			ClueText.text = "This is Clue 1"
		1:
			ClueText.text = "This is Clue 2"
