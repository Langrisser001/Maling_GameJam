extends Node2D

export var obj_done= false

# Called when the node enters the scene tree for the first time.
func _ready():
	#pause_mode = Node.PAUSE_MODE_PROCESS
	$TileMap/Player.connect("take_item", self, "_player_take_item")
	$TileMap/Player.connect("item_exit", self, "_player_item_exit")
	
	for child in $TileMap.get_children():
		if child is SecurityActor:
			child.connect("player_hit", self, "_on_player_hit")
			pass
		pass
	
	pass # Replace with function body.

var puzzle_node
var last_item
func _player_take_item(player, item):
	print("PLAYER TAKE ITEM")
	last_item= item
	if item.use_puzzle:
		var puzzle_res= preload("res://scenes/puzzles/Puzzle#1.tscn")
		puzzle_node= puzzle_res.instance()
		puzzle_node.connect("puzzle_done", self, "_puzzle_done")
		$NodePuzzle.add_child(puzzle_node)
		pass
	pass

export var item_required_counter= 1
func _puzzle_done():
	$NodePuzzle.remove_child(puzzle_node)
	if last_item.is_required:
		item_required_counter= item_required_counter- 1
		pass
	pass

func _player_item_exit():
	print("PLAYER ITEM EXIT")
	$NodePuzzle.remove_child(puzzle_node)
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
		if item_required_counter<= 0:
			var win_res= load("res://scenes/Win.tscn")
			var node= win_res.instance()
			$NodeWin.add_child(node)
			get_tree().paused= true
		pass
	pass # Replace with function body.

var lose_node
func _on_player_hit():
	var lose_res= load("res://scenes/Lose.tscn")
	lose_node= lose_res.instance()
	$NodeLose.add_child(lose_node)
	get_tree().paused= true
	pass
