extends Stage
@onready var bg = $PB/PL1/bg
@onready var defeatfnf = $PB/PL3/Defeatfnf
@onready var pb2 = $PB2


# Called when the node enters the scene tree for the first time.
func _ready_post():
	game.spectator.queue_free()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func on_beat_hit(beat:int):
	match beat:
		68:
			pb2.visible = true
			for node in [$PB/PL1, $PB/PL2]:
				node.visible = true
		292,360:
			defeatfnf.visible = !defeatfnf.visible
			pb2.visible = !pb2.visible
			for node in [$PB/PL1, $PB/PL2]:
				node.visible = !node.visible
		
		
		
	if beat % 4 == 0:
		bg.play("defeat")
