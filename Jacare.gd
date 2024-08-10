extends KinematicBody2D

onready var alvo = get_node("/root/Main/Player")
var dpers = 1000
var speed = 100
var controledano = 0

func _ready():
	pass

func _physics_process(_delta):
	var dist = position.distance_to(alvo.position) # Obtém a distância como um número
	if dist < dpers:
		var vel = (alvo.position - position).normalized()
		move_and_slide(vel * speed)
		
		if alvo.position.x > position.x:
			$AnimatedSprite.flip_h = true
		else:
			$AnimatedSprite.flip_h = false
				
		if dist <= 120:
			$AnimatedSprite.animation = "morte"
			$morte.start()
			if controledano == 0:
				alvo.tomadano()
				controledano = 1		

func morte():
	queue_free()

func _on_morte_timeout():
	morte()
	
	
