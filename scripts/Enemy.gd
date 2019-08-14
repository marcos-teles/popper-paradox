extends "res://scripts/Person.gd"


export (int) var level
export (Color) var color

enum state {walk, stalk, stop}
var current_state

func _ready():
	randomize_state()
	pass # Replace with function body.
func randomize_state():
	current_state = randi()%len(state)
	Utils.set_time_out(self, "randomize_state", randi()%3+1)
	print(current_state)
	pass

func _process(delta):
	ai_controller()
	pass

func ai_controller():
	if current_state == state.walk:
		moveLeft  = (position.x > GManager.player_1.position.x)
		moveRight = (position.x < GManager.player_1.position.x)
	elif current_state == state.stalk:
		moveLeft  = (position.x > GManager.player_1.position.x)
		moveRight = (position.x < GManager.player_1.position.x)
		moveUp    = (position.y < GManager.player_1.position.y)
		moveDown  = (position.y > GManager.player_1.position.y)
	elif current_state == state.stop:
		moveRight = false
		moveLeft  = false
		moveUp    = false
		moveDown  = false
	pass