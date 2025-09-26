extends Button

@export var sonido_click : AudioStreamPlayer

func boton_presionado():
	sonido_click.play()
	await get_tree().create_timer(0.4).timeout
	get_tree().quit()
