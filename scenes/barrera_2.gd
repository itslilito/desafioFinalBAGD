extends StaticBody2D

@export var animacion : AnimatedSprite2D
@export var animacion_desvanecer : AnimationPlayer

func _process(delta):
	animacion.play("idle")

func colision_jugador(cuerpo):
	if cuerpo.name == "murciegalito":
		if cuerpo.llave_2 > 0:
			cuerpo.llave_2 = cuerpo.llave_2 -1
			animacion_desvanecer.play("desvanecer")
			await get_tree().create_timer(2.0).timeout
			queue_free()
