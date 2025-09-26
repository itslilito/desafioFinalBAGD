extends StaticBody2D

@export var area : Area2D
@export var calavera : PackedScene
@export var animacion_texto : AnimationPlayer

var hueso_dado = false

func colision_jugador(cuerpo):
	if cuerpo.name == "murciegalito":
		if hueso_dado == false && cuerpo.hablo_con_slime_hueso == true:
			animacion_texto.play("texto_con_slime")
			var calavera = calavera.instantiate()
			await get_tree().create_timer(6.5).timeout
			add_child(calavera)
			calavera.position.x += 800
			calavera.position.y += 800
			hueso_dado = true
		elif hueso_dado == false && cuerpo.hablo_con_slime_hueso == false:
			animacion_texto.play("texto_sin_slime")
