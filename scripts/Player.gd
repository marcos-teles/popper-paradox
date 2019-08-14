extends "res://scripts/Person.gd"


func _ready():
	GManager.player_1 = self
	pass

func _process(delta):
	controller()
	pass
	
func controller():
	moveRight = Input.is_action_pressed("ui_right")
	moveLeft  = Input.is_action_pressed("ui_left")
	moveUp    = Input.is_action_pressed("ui_down")
	moveDown  = Input.is_action_pressed("ui_up")
	punch     = Input.is_action_just_pressed("atack")
	pass
