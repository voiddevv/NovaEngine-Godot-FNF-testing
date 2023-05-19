extends FunkinScript
var discord := DiscordRPC.new()


# Called when the node enters the scene tree for the first time.
func _ready_post():
	# PISSING
	add_child(discord)
	discord.establish_connection(1108818151912771675)
	discord.rpc_ready.connect(
		func(user: Dictionary):
			discord.update_presence({
				details = "Haveing Fun",
				state = "Playing %s" % game.SONG.name,
				timestamps = {
					start = int(Time.get_unix_time_from_system())
				},
				assets = {
					large_image = "icon",
				}
			})
	)
