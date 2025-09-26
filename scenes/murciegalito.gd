extends CharacterBody2D

#exports
@export var animacion : AnimatedSprite2D

#exports UI
@export var icono_calavera : TextureRect
@export var icono_llave1 : TextureRect
@export var icono_llave2 : TextureRect
@export var icono_moneda : TextureRect
@export var icono_ticket : TextureRect
@export var cantidad_monedas : Label

#declaración de variables
var direccion = Vector2(0,0)
var velocidad = 1080
var ultimo_input = 0

#items
var llave_1 = 0
var llave_2 = 0
var calavera = 0
var monedas = 0
var ticket = 0

#variables para paredes trampa
var contador_trampa = 0
var esta_en_trampa = false
var patron_trampa = false
var esta_en_trampa2 = false
var patron_trampa2 = false

var hablo_con_slime_hueso = false
var sabe_cuantos_huesos = false

func _process(delta):
	
	#settings de la UI
	if calavera > 0:
		icono_calavera.visible = true
	elif calavera <= 0:
		icono_calavera.visible = false

	if llave_1 > 0:
		icono_llave1.visible = true
	elif llave_1 <= 0:
		icono_llave1.visible = false

	if llave_2 > 0:
		icono_llave2.visible = true
	elif llave_2 <= 0:
		icono_llave2.visible = false

	if monedas > 0:
		icono_moneda.visible = true
	elif monedas > 1:
		icono_moneda.visible = true
		cantidad_monedas.visible = true
		cantidad_monedas.text = "x" + str(monedas)
	elif monedas <= 0:
		cantidad_monedas.visible = false
	
	if ticket > 0:
		icono_ticket.visible = true
	elif ticket <= 0:
		icono_ticket.visible = false
	
	
	direccion = Vector2(0,0)
	if contador_trampa == 6:
		patron_trampa = true
		if esta_en_trampa2 == true && contador_trampa == 6:
			patron_trampa2 = true
	if Input.is_action_pressed("correr"):
		velocidad = 2160
	else:
		velocidad = 1080
	
	#contador para la puerta trampa 1
	if esta_en_trampa == true:
		if Input.is_action_just_pressed("mover_izquierda"):
			if contador_trampa == 5:
				contador_trampa += 1
			else:
				contador_trampa = 0
			print(contador_trampa)
		if Input.is_action_just_pressed("mover_derecha"):
			if contador_trampa == 1 || contador_trampa == 2:
				contador_trampa += 1
			else:
				contador_trampa = 0
			print(contador_trampa)
		if Input.is_action_just_pressed("mover_arriba"):
			if contador_trampa == 0 || contador_trampa == 4:
				contador_trampa += 1
			else:
				contador_trampa = 0
			print(contador_trampa)
		if Input.is_action_just_pressed("mover_abajo"):
			if contador_trampa == 3:
				contador_trampa += 1
			else:
				contador_trampa = 0
			print(contador_trampa)
	
		#contador para la puerta trampa 2
	if esta_en_trampa2 == true:
		if Input.is_action_just_pressed("mover_izquierda"):
			if contador_trampa == 0:
				contador_trampa += 1
			else:
				contador_trampa = 0
			print(contador_trampa)
		if Input.is_action_just_pressed("mover_derecha"):
			if contador_trampa == 2 || contador_trampa == 4:
				contador_trampa += 1
			else:
				contador_trampa = 0
			print(contador_trampa)
		if Input.is_action_just_pressed("mover_arriba"):
			if contador_trampa == 1 || contador_trampa == 3:
				contador_trampa += 1
			else:
				contador_trampa = 0
			print(contador_trampa)
		if Input.is_action_just_pressed("mover_abajo"):
			if contador_trampa == 5:
				contador_trampa += 1
			else:
				contador_trampa = 0
			print(contador_trampa)
	
	
	#moverse con las flechas
	if Input.is_action_pressed("mover_izquierda"):
		direccion = Vector2(-1,0)
		ultimo_input = 1
	if Input.is_action_pressed("mover_derecha"):
		direccion = Vector2(1,0)
		ultimo_input = 2
	if Input.is_action_pressed("mover_arriba"):
		direccion = Vector2(0,-1)
		ultimo_input = 3
	if Input.is_action_pressed("mover_abajo"):
		direccion = Vector2(0,1)
		ultimo_input = 0
	
	
	#actualiza la aceleración y la dirección
	velocity = direccion * velocidad
	move_and_slide()
	
	#condicionales para las animaciones
	if direccion == Vector2(0,0):
		if ultimo_input == 0:
			animacion.play("idle_frente")
		if ultimo_input == 1:
			animacion.play("idle_costado")
			animacion.flip_h = true
		if ultimo_input == 2:
			animacion.play("idle_costado")
			animacion.flip_h = false
		if ultimo_input == 3:
			animacion.play("idle_espalda")
	else:
		if direccion.y > 0:
			animacion.flip_h = false
			animacion.play("caminar_frente")
		if direccion.y < 0:
			animacion.flip_h = false
			animacion.play("caminar_espalda")
		if direccion.x > 0:
			animacion.flip_h = false
			animacion.play("caminar_costado")
		if direccion.x < 0:
			animacion.flip_h = true
			animacion.play("caminar_costado")
