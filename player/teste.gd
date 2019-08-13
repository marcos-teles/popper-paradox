extends CollisionShape2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var cont = 0
# Called when the node enters the scene tree for the first time.
var achou = false
func _ready():
	
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("atack"):
		cont = 0
		achou = false
		self.disabled = false
		
	
	cont+=1
	
	if (cont == 30):
		self.disabled = true

	if get_parent().get_overlapping_bodies( ).size()>0 && !achou:
		achou = true
		self.disabled = true
		print("hit")
	
	
	pass
