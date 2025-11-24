extends StaticBody2D

@export var sonido : AudioStreamPlayer

func colision_jugador(cuerpo):
	if cuerpo.name == "murciegalito":
		sonido.play()
		cuerpo.monedas = cuerpo.monedas +1
