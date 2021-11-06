extends Control

const DEFAULT_PORT = 28960
const MAX_CLIENTS = 6

func _ready() -> void:
	get_tree().connect("server_disconnected", self, "_server_disconnected")
	get_tree().connect("connection_failed", self, "_connection_failed")

func load_game():
	var lobby = load("res://scenes/lobby.tscn").instance()
	get_tree().get_root().add_child(lobby)
	hide()

func create_server():
	var server = NetworkedMultiplayerENet.new()
	server.create_server(DEFAULT_PORT, MAX_CLIENTS)
	get_tree().set_network_peer(server)

func create_client():
	var server = NetworkedMultiplayerENet.new()
	server.create_client("127.0.0.1", DEFAULT_PORT)
	get_tree().set_network_peer(server)
	
func _server_disconnected():
	print("Disconnected from the server")

func _connection_failed():
	print("failed")

remote func register_player(info):
	var id = get_tree().get_rpc_sender_id()
	print(id)

func _on_HostButton_pressed():
	self.create_server()
	load_game()

func _on_ClientButton_pressed():
	self.create_client()
