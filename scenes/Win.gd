extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Button_pressed():
	get_tree().paused= false;
	Data.data["current_level"]= Data.data["current_level"]+ 1
	get_tree().change_scene(Data.data.level_entry_path[Data.data["current_level"]])	
	pass # Replace with function body.
