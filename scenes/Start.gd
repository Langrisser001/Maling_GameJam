extends Node2D

func _ready():
	pass

func _on_ButtonStart_pressed():
	get_tree().change_scene("res://scenes/Main.tscn")
	pass # Replace with function body.

func _on_ButtonCredit_pressed():
	get_tree().change_scene("res://scenes/Credits.tscn")
	pass # Replace with function body.

func _on_ButtonExit_pressed():
	get_tree().quit()
	pass # Replace with function body.
