extends Node3D

@export var player: PackedScene
@onready var canvas_layer = $CanvasLayer
var peer: ENetMultiplayerPeer
var Direccion =  "192.168.32.90"


func _ready():
	peer = ENetMultiplayerPeer.new()

func _on_host_pressed():
	peer.create_server(1027, 10)
	multiplayer.multiplayer_peer = peer
	multiplayer.peer_connected.connect(add_player)
	multiplayer.peer_disconnected.connect(delete_player)
	add_player(multiplayer.get_unique_id())
	canvas_layer.hide()

func _on_join_pressed(): 
	peer.create_client(Direccion, 1027)
	multiplayer.multiplayer_peer = peer
	canvas_layer.hide()

func add_player(id = 1):
	var jugador = player.instantiate()
	jugador.name = "player"+str(id)
	call_deferred("add_child",jugador)

func delete_player(id):
	rpc("_delete_player", id)

@rpc("any_peer", "call_local")
func _delete_player(id):
	if get_node_or_null(str(id)):
		get_node(str(id)).queue_free()
