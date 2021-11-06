extends Node

func _ready():
	yield(get_tree().get_root(), "ready")
	start_game()
	

func start_game():
	var menu = load("res://scenes/menu.tscn").instance()
	get_tree().get_root().add_child(menu)
