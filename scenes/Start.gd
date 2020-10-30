extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _on_Button_pressed():
	changeScene()
	pass # Replace with function body.

func changeScene():
	var res= get_tree().change_scene("res://scenes/Main.tscn")
	if res!= OK:
		print("Error loading scene")
		get_tree().quit()
	pass
