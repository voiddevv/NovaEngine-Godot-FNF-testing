extends FunkinScript
var shakeing:bool = false
var dad:Character 
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	
	if shakeing:
		game.opponent.modulate.a = 0.6 +abs(sin(Conductor.position/1000.0*4.0))
		game.camera.offset.y = sin(Conductor.step_crochet/1000.0 + Conductor.position/1000.0*2.0)*30.0
		game.camera.offset.x = sin(Conductor.crochet/1000.0*4.0 + Conductor.position/1000.0*2.0)*250.0
		for strum in game.cpu_strums.get_children():
			strum.position.y = sin(Conductor.position/1000.0*8.0 - strum.get_index())*30.0
		for strum in game.player_strums.get_children():
			strum.position.y = sin(Conductor.position/1000.0*8.0 - strum.get_index())*30.0

			
# not a mess
func on_step_hit(step:int):
	match step:
		2426:
			shakeing = true
		2943:
			shakeing = false
			for node in game.hud.get_children():
				if node is Node:
								get_tree().create_tween().tween_property(node,"modulate:a",0.0,Conductor.crochet*4.0/1000.0).set_trans(Tween.TRANS_QUART).set_ease(Tween.EASE_OUT)
			get_tree().create_tween().tween_property(game.opponent,"modulate:a",0.0,Conductor.crochet*4.0/1000.0).set_trans(Tween.TRANS_QUART).set_ease(Tween.EASE_OUT)
