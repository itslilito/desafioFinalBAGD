extends Area2D

func colision_personaje(cuerpo):
	if cuerpo.name == "murciegalito":
		cuerpo.esta_en_trampa = true
		#print("ESTÁ EN ÁREA")

func exit_colision_personaje(cuerpo):
	if cuerpo.name == "murciegalito":
		cuerpo.esta_en_trampa = false
		#print("YA NO ESTÁ EN ÁREA")
