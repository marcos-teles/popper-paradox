extends Node

func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func set_time_out(ref, function, time):
	var timer = Timer.new()
	timer.one_shot = true;
	timer.set_wait_time(time)
	timer.connect("timeout", ref, function)
	timer.start()
	add_child(timer)
	pass

#func _process(delta):
#	pass
