extends Spatial

func _ready():
	get_tree().connect("network_peer_connected", self, "_player_connected")
	
func _player_connected(id):
	var player = preload("res://char.tscn").instance()
	player.set_network_master(id)
	add_child(player)
	player.name = str(id)
