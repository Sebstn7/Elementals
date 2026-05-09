extends Polygon2D

func _ready():

	polygon = PackedVector2Array([
		Vector2(-13, -13),
		Vector2(13, -13),
		Vector2(13, 13),
		Vector2(-13, 13)
	])

	color = Color.GREEN
