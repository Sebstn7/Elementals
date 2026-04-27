extends CharacterBody2D

var speed = 120
var grid_size = 32

func _physics_process(delta):
	var direction = Vector2.ZERO

	if Input.is_action_pressed("ui_right"):
		direction.x = 1
	elif Input.is_action_pressed("ui_left"):
		direction.x = -1
	elif Input.is_action_pressed("ui_down"):
		direction.y = 1
	elif Input.is_action_pressed("ui_up"):
		direction.y = -1

	velocity = direction * speed
	move_and_slide()

	if direction == Vector2.ZERO:
		position.x = round(position.x / grid_size) * grid_size
		position.y = round(position.y / grid_size) * grid_size
