extends CharacterBody2D

@export var animacion : AnimatedSprite2D
@export var area : Area2D
@export var llave : PackedScene
@export var animacion_texto : AnimationPlayer

var llave_dada = false

func _process(delta):
	animacion.play("idle")

func colision_jugador(cuerpo):
	if cuerpo.name == "murciegalito":
		if cuerpo.monedas > 0 && llave_dada == false:
			var llave_1 = llave.instantiate()
			add_child(llave_1)
			llave_1.position.y += -800
			cuerpo.monedas = 0
		elif cuerpo.monedas <= 0 && llave_dada == false:
			animacion_texto.play("texto_sin_moneda")
			
		
