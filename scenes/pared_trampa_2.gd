extends StaticBody2D

@export var area_colision : Area2D
@export var jugador : CharacterBody2D

func _process(delta):
	if jugador.patron_trampa2 ==true:
		queue_free()
