extends Area2D


func _on_Area2D_body_entered(body):
	if body is Player:
		print("HIT!")
	pass # Replace with function body.
