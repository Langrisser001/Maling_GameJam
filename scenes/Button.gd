extends Button

export var ref_ = ""
export(bool) var focus_= false

func _ready():
	if(focus_):
		grab_focus()
		
	connect("mouse_entered",self,"_on_Button_mouse_entered")
	connect("pressed",self,"_on_Button_Pressed")

func _on_Button_mouse_entered():
	grab_focus()

func _on_Button_Pressed():
	if(ref_ != ""):
		get_tree().change_scene(ref_)
	else:
		get_tree().quit()
