extends KinematicBody

var path = [] #list of 3d points
var path_index = 0 #which node we are on
const movespeed = 12
onready var nav = get_parent() #ref to navigation node

func move_to(target_pos):
	path = nav.get_simple_path(global_transform.origin,target_pos) #this will return list of 3d points
	path_index = 0 # start at beginning 
	
func _physics_process(delta):
	if path_index < path.size(): #still travelling along, havent reached end
		var move_vec = (path[path_index] - global_transform.origin)
		if move_vec.length() < 0.1: #very close
			path_index+=1 #go to next point
		else: #move towards it at movement speed
			move_and_slide(move_vec.normalized()* movespeed, Vector3 (0,1,0))
		