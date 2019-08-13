extends KinematicBody2D

export (float) var speed
export (int) var life

var velocity
var moveRight
var moveLeft
var moveUp
var moveDown

func _ready():
	print(self.name)
	speed    *=100
	velocity  = Vector2()
	moveRight = false
	moveLeft  = false
	moveUp    = false
	moveDown  = false
	pass # Replace with function body.


func _process(delta):
	_movement(delta)
	pass

func _movement(delta):
	velocity   = Vector2();
	velocity.x = int(moveRight) - int(moveLeft)
	velocity.y = int(moveUp) - int(moveDown)
	move_and_collide(velocity*speed*delta)
	pass
	
func take_damage(value):
	print(self.name," damage ", value)
	pass

func die():
	print(self.name, "die")
	pass

func punch():
	pass