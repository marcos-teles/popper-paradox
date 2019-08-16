extends KinematicBody2D

export (float) var speed
export (int) var life

var velocity
var moveRight
var moveLeft
var moveUp
var moveDown
var punch
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
	punch     = false
	punch_coll = $Body/Punch/Collision
	body = $Body
	self.scale = Vector2(0.6, 0.6);
	pass # Replace with function body.

func _process(delta):
	movement(delta)
	check_punch_hit()
	pass

func movement(delta):
	velocity   = Vector2();
	velocity.x = int(moveRight) - int(moveLeft)
	velocity.y = int(moveUp) - int(moveDown)
	move_and_collide(velocity.normalized()*speed*delta)
	
	if(velocity.x !=0):
		body.scale.x = velocity.x
	pass
	
func _take_damage(value):
	life -= value
	if life <=0:
		life = 0
		_die()
	print(self.name," life ", life)
	pass

func _die():
	print(self.name, " die")
	visible = false
	pass

func check_punch_hit():
	
	if punch && punch_coll.disabled:
		punch_coll.disabled = false
		Utils.set_time_out(self, "disable_hit", 0.1)
		
	if punch_coll.disabled == false:
		var targets = punch_coll.get_parent().get_overlapping_bodies()
		if targets.size()>0:
			give_damage(targets)
			disable_hit()
		
	pass

func disable_hit():
	punch = false
	punch_coll.disabled = true
	pass
	

func give_damage(targets):
	for target in targets:
		target._take_damage(10)
	pass
	
	