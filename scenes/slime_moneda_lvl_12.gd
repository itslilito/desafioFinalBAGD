extends CharacterBody2D

@export var animacion : AnimatedSprite2D
@export var area : Area2D
@export var animacion_texto : AnimationPlayer
@export var ticket : PackedScene

var explicacion_dada = false
var ticket_dado = false

func _process(delta):
	animacion.play("idle")

func colision_jugador(cuerpo):
	if cuerpo.name == "murciegalito":
		if explicacion_dada == false:
			animacion_texto.play("explicacion_inicio")
			await animacion_texto.animation_finished
			explicacion_dada = true
		elif cuerpo.sabe_cuantos_huesos == false && explicacion_dada == true:
			animacion_texto.play("pregunta")
		elif cuerpo.sabe_cuantos_huesos == true && explicacion_dada == true && ticket_dado == false:
			ticket_dado = true
			animacion_texto.play("ganaste")
			await animacion_texto.animation_finished
			
			#crea el ticket
			var ticket_1 = ticket.instantiate()
			add_child(ticket_1)
			ticket_1.position.y += -800
			ticket_1.position.x += 800
