extends StaticBody2D

@export var area : Area2D
@export var animacion_texto : AnimationPlayer

func colision_jugador(cuerpo):
	if cuerpo.name == "murciegalito":
		animacion_texto.play("texto")
