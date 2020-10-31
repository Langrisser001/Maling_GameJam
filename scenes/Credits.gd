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
	pass # Replace with function body.


func _on_LinkMainMenuBG_pressed():
	OS.shell_open("https://www.freepik.com/free-vector/castle-column-empty-corridor-interior_5467437.htm")


func _on_LinkTiles_pressed():
	OS.shell_open("https://opengameart.org/content/lpc-modified-base-tiles")


func _on_LnkFont_pressed():
	OS.shell_open("https://fonts.google.com/specimen/Syne+Mono")


func _on_LnkFontCO_pressed():
	OS.shell_open("https://fonts.google.com/specimen/Carter+One#standard-styles")


func _on_LnkJail_pressed():
	OS.shell_open("https://www.freepik.com/free-vector/law-justice-cartoon-banners-set-with-convict-jail-bars-retro_3797925.htm")


func _on_LnkPixel_pressed():
	OS.shell_open("https://www.freepik.com/free-vector/yellow-orange-shades-pixel-background-design_9874820.htm#query=Pixel%20background&position=14")


func _on_LnkOST_pressed():
	OS.shell_open("https://incompetech.com")


func _on_LnkAnim_pressed():
	OS.shell_open("https://opengameart.org/lpc-art-entries")


func _on_LnkGenerator_pressed():
	OS.shell_open("https://sanderfrenken.github.io/Universal-LPC-Spritesheet-Character-Generator/#")


func _on_BtExit_pressed():
	get_tree().change_scene("res://scenes/Start.tscn")
