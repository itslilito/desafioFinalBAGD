extends CharacterBody2D


@export var animacion : AnimatedSprite2D
@export var area : Area2D
@export var barrera : CollisionShape2D
@export var animacion_texto : AnimationPlayer

var ticket_dado = false

func _process(delta):
	animacion.play("idle")

func colision_jugador(cuerpo):
	if cuerpo.name == "murciegalito":
		if cuerpo.ticket > 0 && ticket_dado == false:
			animacion_texto.play("pasar")
			cuerpo.ticket = cuerpo.ticket -1
			barrera.queue_free()
			ticket_dado = true
		elif cuerpo.ticket <= 0 && ticket_dado == false:
			animacion_texto.play("sin_ticket")
