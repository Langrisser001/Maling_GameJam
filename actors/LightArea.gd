extends Area2D

func _on_Area2D_body_entered(body):
	if body is Player:
		print("I saw something!")
		pass
	pass # Replace with function body.
