extends KinematicBody2D

class_name SecurityActor

var rng
var light_length
func _ready():
	rng= RandomNumberGenerator.new()
	rng.randomize()
	
	light_length= $Spotlight.position.length()
	pass # Replace with function body.

var mov_speed= 5
export var fast_mov_speed= 150.0 
export var normal_mov_speed= 40.0 

export var timer= 5.0
var timer_counter= -0.1

export var saw_time= 3.0
var saw_time_counter= 0.0


var mov_dir= Vector2.ZERO

enum Face {W, N, E, S}
var last_face

enum {PATROLLING, CHASING}
var state= PATROLLING
func _process(delta):
	match state:
		PATROLLING:
			mov_speed= normal_mov_speed
			timer_counter= timer_counter- delta
			if (timer_counter)<= 0:
				timer_counter= timer
				mov_dir= Vector2(rng.randf_range(-1, 1), rng.randf_range(-1, 1))
				mov_dir= mov_dir.normalized()
		CHASING:
			mov_speed= fast_mov_speed
			saw_time_counter= saw_time_counter- delta
			if saw_time_counter<= 0:
				state= PATROLLING
			if is_still_seen:
				mov_dir= body_player.position- position
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
	$Spotlight.position= mov_dir* light_length
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

signal player_saw
var body_player
func _on_Area2D_player_saw(body):
	pass # Replace with function body.

var is_still_seen= true
func _on_Area2D_Spotlight_body_entered(body):
	if body is Player:
		print("security saw player")
		emit_signal("player_saw")
		saw_time_counter= saw_time
		state= CHASING
		body_player= body
		is_still_seen= true
	pass # Replace with function body.

func _on_Area2D_Spotlight_body_exited(body):
	if body is Player:
		is_still_seen= false
	pass # Replace with function body.

signal player_hit
func _on_Area2D_Hit_body_entered(body):
	if body is Player:
		emit_signal("player_hit")
	pass # Replace with function body.
