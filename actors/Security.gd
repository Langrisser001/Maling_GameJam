extends KinematicBody2D

var rng
var light_lenght
func _ready():
	rng= RandomNumberGenerator.new()
	rng.randomize()
	
	light_lenght= $Spotlight.position.length()
	pass # Replace with function body.

export var mov_speed= 40.0
export var fast_mov_speed= 80.0 
export var timer= 5.0

var timer_counter= -0.1

var mov_dir= Vector2.ZERO

enum Face {W, N, E, S}
var last_face

func _process(delta):
	timer_counter= timer_counter- delta
	if (timer_counter)<= 0:
		timer_counter= timer
		mov_dir= Vector2(rng.randf_range(-1, 1), rng.randf_range(-1, 1))
		mov_dir= mov_dir.normalized()
		
		match _move_dir_to_face(mov_dir):
			Face.W:
				$AnimationPlayer.play("walk_W")
			Face.N:
				$AnimationPlayer.play("walk_N")
			Face.E:
				$AnimationPlayer.play("walk_E")
			Face.S:
				$AnimationPlayer.play("walk_S")
		
		pass
	$Spotlight.position= mov_dir* light_lenght
	pass

func _physics_process(delta):
		
	move_and_slide(mov_dir* mov_speed)
	
	pass

func _move_dir_to_face(movedir):
	if rad2deg(abs(Vector2.LEFT.angle_to(movedir)))< 45.0:
		return Face.W
	elif rad2deg(abs(Vector2.UP.angle_to(movedir)))< 45.0:
		return Face.N
	elif rad2deg(abs(Vector2.RIGHT.angle_to(movedir)))< 45.0:
		return Face.E
	else:
		return Face.S
	pass
