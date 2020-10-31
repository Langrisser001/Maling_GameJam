extends Node2D

var objDone: = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pause_mode = Node.PAUSE_MODE_PROCESS
	$TileMap/Player.connect("take_item", self, "_player_take_item")
	$TileMap/Player.connect("item_exit", self, "_player_item_exit")
	pass # Replace with function body.

var puzzle_node
func _player_take_item(player, item):
	print("PLAYER TAKE ITEM")
	if item.use_puzzle:
		var puzzle_res= preload("res://scenes/puzzles/Puzzle#1.tscn")
		puzzle_node= puzzle_res.instance()
		puzzle_node.connect("puzzle_done", self, "_puzzle_done")
		$Control/NodePuzzle.add_child(puzzle_node)
		pass
	pass

func _puzzle_done():
	$Control/NodePuzzle.remove_child(puzzle_node)
	pass

func _player_item_exit():
	print("PLAYER ITEM EXIT")
	$Control/NodePuzzle.remove_child(puzzle_node)
	pass
	
func _process(delta):
	if Input.is_action_just_pressed("ui_cancel"):
		$Menu.visible= !$Menu.visible
		get_tree().paused= $Menu.visible
		pass
	pass

func _on_Area2DExit_body_entered(body):
	if body is Player:
		pass
	pass # Replace with function body.

func _on_Area2D_Exit_body_entered(body):
	if body is Player:
		if objDone:
			get_tree().paused= true
			$Done.visible= true
		pass
	pass # Replace with function body.
