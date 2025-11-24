extends TextureButton

@export var sonido_click : AudioStreamPlayer
@export var pantalla_creditos : Control

func boton_presionado():
	sonido_click.play()
	await get_tree().create_timer(0.1).timeout
	pantalla_creditos.visible = true
