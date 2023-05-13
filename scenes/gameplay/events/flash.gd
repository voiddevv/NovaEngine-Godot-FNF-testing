extends Event


# Called when the node enters the scene tree for the first time.
func _ready():
	var duration:float = 1.0
	if parameters[0]:
		duration = float(parameters[0])
	var cr:ColorRect = ColorRect.new()
	cr.color = Color.WHITE
	cr.size = Global.game_size
	game.hud.add_child(cr)
	get_tree().create_tween().tween_property(cr,"modulate:a",0,duration).finished.connect(queue_free)
