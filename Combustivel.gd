extends Area2D

onready var player = get_node("/root/Main/Player")

func _ready():
	pass


func _on_Combustivel_body_entered(body):
	if body.name == "Player" and player.get("combustivel") < 100:
		body.carrega()
		queue_free()
