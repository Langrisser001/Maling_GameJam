extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

signal puzzle_done
func _process(delta):
	if counter> 10:
		emit_signal("puzzle_done")
		print("success")
	pass

var counter= 0
func _unhandled_input(event):
	if event is InputEventMouseButton:
		if event.pressed:
			counter= counter+ 1
			$CanvasLayer/Control/Label.text= String(counter)
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
