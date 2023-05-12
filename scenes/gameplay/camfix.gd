extends Camera2D
func _process(delta):
	anchor_mode = Camera2D.ANCHOR_MODE_FIXED_TOP_LEFT
	offset = Vector2(-640, -360)
	
	offset.x -= (zoom.x - 1.0) * -(Global.game_size.x * 0.5)
	offset.y -= (zoom.y - 1.0) * -(Global.game_size.y * 0.5)
