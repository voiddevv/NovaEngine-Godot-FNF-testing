extends FunkinScript
var shakeing:bool = false
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if shakeing:
		game.opponent.modulate.a = abs(sin(Conductor.position/1000.0))
		game.camera.offset.x = randf_range(-15,15)
		game.camera.offset.y = randf_range(-15,15)
	else:
		game.camera.offset = Vector2.ZERO
# not a mess
func on_step_hit(step:int):
	match step:
		2426:
			shakeing = true
		2943:
			shakeing = false
			get_tree().create_tween().tween_property(game.opponent,"modulate:a",0.0,Conductor.crochet*4.0/1000.0).set_trans(Tween.TRANS_QUART).set_ease(Tween.EASE_OUT)
