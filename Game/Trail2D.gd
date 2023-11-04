extends Line2D

@export var length = 10
var point = Vector2()
var offset = Vector2()

func _process(delta):
	global_position = Vector2(0,0)
	global_rotation = 0
	
	point = get_parent().global_position
	offset = get_parent().transform.x.rotated(-PI*1.0/4.0)
	
	point -= offset*10
	add_point(point)
	while get_point_count()>length:
		remove_point(0)
	
# Called when the node enters the scene tree for the first time.
