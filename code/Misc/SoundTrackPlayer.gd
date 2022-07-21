extends Node
class_name SOUNDTRACKPLAYER

enum Type {
	Menu,
	Normal,
	End
}

var Tracks = {
	Type.Menu: [preload("res://assests/Music/Cyberpunk Moonlight Sonata.mp3")],
	Type.Normal: [],
	Type.End: []
}

var current: int = Type.Menu
var repeating: bool = true

onready var streamPlayer: AudioStreamPlayer = $AudioStreamPlayer

func play_type(type_theme: int, repeat_themes: bool = true):
	if current != type_theme or !streamPlayer.playing:
		repeating = false
		
		streamPlayer.stop()
		
		repeating = repeat_themes
		current = type_theme
		
		var type_tracks: Array = Tracks[current]
		if type_tracks != []:
			streamPlayer.stream = type_tracks[randi() % type_tracks.size()]
			streamPlayer.play()

func replay_current_type():
	var type_tracks: Array = Tracks[current]
	streamPlayer.stream = type_tracks[randi() % type_tracks.size()]
	streamPlayer.play()

func _on_AudioStreamPlayer_finished():
	if repeating:
		replay_current_type()
