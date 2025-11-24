extends Area2D

@export var animacion : AnimatedSprite2D
@export var sonido : AudioStreamPlayer
@export var colision : CollisionShape2D

func _process(delta):
	animacion.play("idle")

func colision_personaje(cuerpo):
	if cuerpo.name == "murciegalito":
		cuerpo.llave_2 = cuerpo.llave_2 + 1
		colision.queue_free()
		sonido.play()
		await get_tree().create_timer(0.4).timeout
		queue_free()
