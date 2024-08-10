extends Node2D

var jac = preload("res://Jacare.tscn")
var prin = preload("res://Princesa.tscn")
var noz = preload("res://Combustivel.tscn")

func _ready():
	$Player.position.x = 2000
	
func _physics_process(delta):
	$Camera2D.position.x = $Player.position.x
	$Camera2D.position.y = 250
	

func _on_gerajacare_timeout():
	var novojac = jac.instance()
	add_child(novojac)
	novojac.position.x = rand_range(0,4000)
	novojac.position.y = rand_range(0,480)

func _on_geraprincesa_timeout():
	var novoprin = prin.instance()
	add_child(novoprin)
	novoprin.position.x = rand_range(330,3600)
	novoprin.position.y = rand_range(0,480)
	
func _on_geranoz_timeout():
	var novonoz = noz.instance()
	add_child(novonoz)
	novonoz.position.x = rand_range(330,3600)
	novonoz.position.y = rand_range(0,480)
	
func _on_Fase_timeout():
	if $gerajacare.wait_time > 0.4:
		$gerajacare.wait_time -= 0.2
		$geranoz.wait_time += 0.2
	if $geranoz.wait_time < 0.4:
		$geranoz.wait_time += 0.4

func _on_reinicio_timeout():
	get_tree().change_scene("res://Gameover.tscn")

func _on_Player_morreu():
	$reinicio.start()
