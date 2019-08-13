extends KinematicBody2D

export (float) var speed
export (int) var life

var velocity
var moveRight
var moveLeft
var moveUp
var moveDown
var punch_coll
var body


func _ready():
	print(self.name)
	speed    *=100
	velocity  = Vector2()
	moveRight = false
	moveLeft  = false
	moveUp    = false
	moveDown  = false
	punch_coll = $Body/Punch/Collision
	body = $Body
	pass # Replace with function body.

func _process(delta):
	movement(delta)
	check_punch_hit()
	pass

func movement(delta):
	velocity   = Vector2();
	velocity.x = int(moveRight) - int(moveLeft)
	velocity.y = int(moveUp) - int(moveDown)
	move_and_collide(velocity*speed*delta)
	
	if(velocity.x !=0):
		body.scale.x = velocity.x
	pass
	
func _take_damage(value):
	print(self.name," damage ", value)
	pass

func _die():
	print(self.name, "die")
	pass

func _punch():
	if punch_coll.disabled:
		punch_coll.disabled = false
		Utils.set_time_out(self, "disable_hit", 0.1)	
	pass

func check_punch_hit():
	if punch_coll.disabled == false && punch_coll.get_parent().get_overlapping_bodies().size()>0:
		disable_hit()
		print("hit")
	pass

func disable_hit():
	punch_coll.disabled = true
	pass