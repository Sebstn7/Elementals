extends Node2D

var grid_size = 32
var width = 800
var height = 600

func _draw():
	for x in range(0, width, grid_size):
		draw_line(Vector2(x, 0), Vector2(x, height), Color(0.5, 0.5, 0.5))

	for y in range(0, height, grid_size):
		draw_line(Vector2(0, y), Vector2(width, y), Color(0.5, 0.5, 0.5))
