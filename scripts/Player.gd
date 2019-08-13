extends "res://scripts/Person.gd"


func _ready():
	pass # Replace with function body.

func controller():
	moveRight = Input.is_action_pressed("ui_right")
	moveLeft  = Input.is_action_pressed("ui_left")
	moveUp    = Input.is_action_pressed("ui_down")
	moveDown  = Input.is_action_pressed("ui_up")
	pass

func _process(delta):
	controller()
	pass
