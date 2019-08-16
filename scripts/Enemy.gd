extends "res://scripts/Person.gd"


export (int) var level
export (Color) var color

enum state {walk, stalk, stop}
var current_state
var min_distance
var canPunch = true;
var cont = 0;

func _ready():
	min_distance = 85
	randomize_state()
	pass # Replace with function body.
func randomize_state():
	current_state = randi()%len(state)
	Utils.set_time_out(self, "randomize_state", randi()%3+1)	
	pass

func _process(delta):
	ai_controller()
	ai_atack()
	pass

func ai_controller():
	if current_state == state.walk:
		moveLeft  = (position.x > GManager.player_1.position.x + min_distance)
		moveRight = (position.x < GManager.player_1.position.x - min_distance)
	elif current_state == state.stalk:
		moveLeft  = (position.x > GManager.player_1.position.x + min_distance)
		moveRight = (position.x < GManager.player_1.position.x - min_distance)
		moveUp    = (position.y < GManager.player_1.position.y)
		moveDown  = (position.y > GManager.player_1.position.y)
	elif current_state == state.stop:
		moveRight = false
		moveLeft  = false
		moveUp    = false
		moveDown  = false
		
	
	
	pass
	
func ai_atack():
	punch = false
	if canPunch && position.distance_to(GManager.player_1.position)< min_distance:
		punch = true
		canPunch = false
		Utils.set_time_out(self, "anable_punch", 1)
	pass
	
#	print(punch)
	
func anable_punch():
	canPunch = true
	pass