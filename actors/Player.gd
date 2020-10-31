extends KinematicBody2D

class_name Player

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

export var speed= 200.0
var v_dir: Vector2

func _is_current_anim_idle():
	return $AnimationPlayer.current_animation.find("Idle")!= -1

func _input(event):
	if event is InputEventKey:
		if event.is_action_pressed("ui_accept"):
			_take_item()
	pass

enum Face {W, N, E, S}
var last_face
func _process(delta):
#	if Input.is_action_pressed("ui_accept"):
#		_take_item()
	
	v_dir= Vector2.ZERO
	if Input.is_action_pressed("ui_left"):
		v_dir= v_dir+ Vector2.LEFT
		last_face= Face.W
	if Input.is_action_pressed("ui_right"):
		v_dir= v_dir+ Vector2.RIGHT
		last_face= Face.E
	if Input.is_action_pressed("ui_up"):
		v_dir= v_dir+ Vector2.UP
		last_face= Face.N
	if Input.is_action_pressed("ui_down"):
		v_dir= v_dir+ Vector2.DOWN
		last_face= Face.S
	v_dir= v_dir.normalized()
	
	if v_dir.length()< 0.00001:
		match last_face:
			Face.W:
				$AnimationPlayer.play("Idle_W")
			Face.N:
				$AnimationPlayer.play("Idle_N")
			Face.E:
				$AnimationPlayer.play("Idle_E")
			Face.S:
				$AnimationPlayer.play("Idle_S")
	else:	
		match last_face:
			Face.W:
				$AnimationPlayer.play("Walk_W")
			Face.N:
				$AnimationPlayer.play("Walk_N")
			Face.E:
				$AnimationPlayer.play("Walk_E")
			Face.S:
				$AnimationPlayer.play("Walk_S")
	
			 
	
#	if rad2deg(abs(Vector2.LEFT.angle_to(v_dir)))< 45.0:
#		if v_dir.length()< 0.00001:
#			$AnimationPlayer.play("Idle_W")
#		else:
#			$AnimationPlayer.play("Walk_W")
#	elif rad2deg(abs(Vector2.RIGHT.angle_to(v_dir)))< 45.0:
#		if v_dir.length()< 0.00001:
#			$AnimationPlayer.play("Idle_E")
#		else:
#			$AnimationPlayer.play("Walk_E")
#	elif rad2deg(abs(Vector2.UP.angle_to(v_dir)))< 45.0:
#		if v_dir.length()< 0.00001:
#			$AnimationPlayer.play("Idle_N")
#		else:
#			$AnimationPlayer.play("Walk_N")
#	elif rad2deg(abs(Vector2.DOWN.angle_to(v_dir)))< 45.0:
#		if v_dir.length()< 0.00001:
#			$AnimationPlayer.play("Idle_S")
#		else:
#			$AnimationPlayer.play("Walk_S")
	pass

func _physics_process(delta):
	move_and_slide(v_dir* speed, Vector2.UP)
	pass

var item	
func _item_enter(newitem):
	print("item enter")
	item= newitem
	pass
	
func _item_exit(item):
	print("item exit")
	item= null
	pass
	
signal take_item
func _take_item():
	if item!= null:
		print("emit take item")
		emit_signal("take_item", self, item)
	pass
	
