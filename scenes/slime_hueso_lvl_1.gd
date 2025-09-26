extends CharacterBody2D

@export var animacion : AnimatedSprite2D
@export var area : Area2D
@export var animacion_texto : AnimationPlayer

var hueso_dado = false

func _process(delta):
	animacion.play("idle")

func colision_jugador(cuerpo):
	if cuerpo.name == "murciegalito":
		if cuerpo.calavera > 0:
			hueso_dado = true
			cuerpo.calavera = cuerpo.calavera -1
			cuerpo.sabe_cuantos_huesos = true
			animacion_texto.play("respuesta")
		elif cuerpo.calavera <= 0 && hueso_dado == false:
			animacion_texto.play("mostrar_texto_sin_hueso")
			cuerpo.hablo_con_slime_hueso = true
		elif hueso_dado == true:
			animacion_texto.play("respuesta")
