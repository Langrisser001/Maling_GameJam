extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

export var use_puzzle: = true
export var is_required= true
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _on_Area2D_body_entered(body):
	if(body is Player):
		$Item.visible= true
		body._item_enter(self)
	pass # Replace with function body.

func _on_Area2D_body_exited(body):
	if(body is Player):
		$Item.visible= false
		body._item_exit(self)
	pass # Replace with function body.
