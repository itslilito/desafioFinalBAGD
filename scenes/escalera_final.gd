extends Area2D

func colision_final(cuerpo):
	if cuerpo.name == "murciegalito":
		cuerpo.calavera = 0
		cuerpo.llave_1 = 0
		cuerpo.llave_2 = 0
		cuerpo.contador_trampa = 0
		cuerpo.monedas = 0
		#get_tree().change_scene_to_file("res://scenes/menu_titulo.tscn")
		cuerpo.position = Vector2(29600.0,1045)
