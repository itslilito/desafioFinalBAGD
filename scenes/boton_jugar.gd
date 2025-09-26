extends Button

@export var sonido_click : AudioStreamPlayer

func boton_presionado():
	sonido_click.play()
	await get_tree().create_timer(0.1).timeout
	get_tree().change_scene_to_file("res://scenes/juego.tscn")
