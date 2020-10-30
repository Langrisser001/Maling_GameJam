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

func _process(delta):
	v_dir= Vector2.ZERO
	if Input.is_action_pressed("ui_left"):
#		if idle:
#			pass
		v_dir= v_dir+ Vector2.LEFT
	if Input.is_action_pressed("ui_right"):
		v_dir= v_dir+ Vector2.RIGHT
	if Input.is_action_pressed("ui_up"):
		v_dir= v_dir+ Vector2.UP
	if Input.is_action_pressed("ui_down"):
		v_dir= v_dir+ Vector2.DOWN
	v_dir= v_dir.normalized()
	
	if v_dir.length()< 0.00001:
		#idle
		pass
	
	pass

func _physics_process(delta):
	move_and_slide(v_dir* speed, Vector2.UP)
	pass
	
func _item_enter(item):
	print("item enter")
	pass
	
func _item_exit(item):
	print("item exit")
	pass
	
func _take_item():
	pass
	
