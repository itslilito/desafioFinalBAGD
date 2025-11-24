extends Area2D

@export var pantalla_creditos : CanvasLayer

func colision_final(cuerpo):
	if cuerpo.name == "murciegalito":
		pantalla_creditos.visible = true
		await get_tree().create_timer(10).timeout
		get_tree().change_scene_to_file("res://scenes/menu_titulo.tscn")
