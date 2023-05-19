extends FunkinScript
var dads = []
@onready var black:Character = preload("res://scenes/gameplay/characters/dkblack.tscn").instantiate()
var ogdad:Character
# Called when the node enters the scene tree for the first time.
func _ready_post():
	black.position = game.opponent.position*0.9
	black.z_index = -1
	add_child(black)
	game.spectator.free()


	pass # Replace with function body.
func on_start_song():
	ogdad = game.opponent.duplicate()
	game.opponent.visible = false
	game.add_child(ogdad)
	dads = [ogdad]

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if !game.event_data_array.size() > 0:
		return
	if Conductor.position >= game.event_data_array[0].time:
		match game.event_data_array[0].name:
			"Opponent Two":
				ohgod(game.event_data_array[0].parameters[0])
				game.event_data_array.pop_front()
			"Both Opponents":
				ohgod2(game.event_data_array[0].parameters[0])


func ohgod(char:String):
	print(int(char))
	match char:
	
		"0":
			dads = [ogdad]
			print("white")
		_:
			dads = [black]
			print("black")
func ohgod2(char:String):
	print(int(char))
	match char:

		"0":
			dads = [ogdad]
		_:
			dads = [black,ogdad]
	game.update_camera(Conductor.cur_section)
func on_beat_hit(beat:int):
	for char in [black,ogdad]:
		if not char.anim_player.current_animation.contains("sing"):
			char.dance()
func on_cpu_hit(note:Note):
	for dad in dads:
		var d:Character = dad
		d.hold_timer = 0.0
		d.play_anim("sing%s" % Global.note_directions[abs(note.direction%4)].to_upper(),true)
