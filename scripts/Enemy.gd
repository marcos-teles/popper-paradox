extends "res://scripts/Person.gd"


export (int) var level
export (Color) var color
var body

func _ready():
	body = $Body
	print(body)
	pass # Replace with function body.


#func _process(delta):
#	pass
