extends Area2D

func colision_personaje(cuerpo):
	if cuerpo.name == "murciegalito":
		cuerpo.esta_en_trampa2 = true
		#print("ESTÁ EN ÁREA")

func exit_colision_personaje(cuerpo):
	if cuerpo.name == "murciegalito":
		cuerpo.esta_en_trampa2 = false
		#print("YA NO ESTÁ EN ÁREA")
