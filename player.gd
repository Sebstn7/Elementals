extends CharacterBody2D

var grid_size = 32
var moving = false
var target_position = Vector2.ZERO
var move_speed = 120

var last_direction = Vector2.RIGHT

var hold_timer = 0.0
var hold_delay = 0.1

@onready var ice_block_scene = preload("res://block.tscn")

func _ready():

	target_position = global_position

func _physics_process(delta):

	if moving:

		global_position = global_position.move_toward(
			target_position,
			move_speed * delta
		)

		if global_position.distance_to(target_position) < 1:

			global_position = target_position
			moving = false

		return

	var input_direction = Vector2.ZERO

	if Input.is_action_pressed("ui_right"):

		input_direction = Vector2.RIGHT

	elif Input.is_action_pressed("ui_left"):

		input_direction = Vector2.LEFT

	elif Input.is_action_pressed("ui_down"):

		input_direction = Vector2.DOWN

	elif Input.is_action_pressed("ui_up"):

		input_direction = Vector2.UP

	# SI PRESIONA UNA DIRECCIÓN
	if input_direction != Vector2.ZERO:

		# CAMBIAR DIRECCIÓN SIN MOVER
		if input_direction != last_direction:

			last_direction = input_direction
			hold_timer = 0
			return

		# CONTAR TIEMPO MANTENIENDO
		hold_timer += delta

		# MOVER SI YA PASÓ EL DELAY
		if hold_timer >= hold_delay:

			move_player(input_direction)

	else:

		hold_timer = 0

	# CREAR BLOQUE
	if Input.is_action_just_pressed("ui_accept"):

		create_ice_block()

func move_player(direction):

	var movement = direction * grid_size

	if not test_move(transform, movement):

		target_position += movement
		moving = true

func create_ice_block():

	var block_position = global_position + (
		last_direction * grid_size
	)

	var block = ice_block_scene.instantiate()

	block.global_position = block_position

	get_parent().add_child(block)
  
