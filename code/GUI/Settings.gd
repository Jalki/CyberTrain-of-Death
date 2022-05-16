extends Control


const Music_Bus = "Music"
const SFX_Bus = "SFX"

func _on_Global_Vol_value_changed(value):
	AudioServer.set_bus_volume_db(0,value)

func _on_SFX_Slider_value_changed(value):
	var bus = AudioServer.get_bus_index(SFX_Bus)
	AudioServer.set_bus_volume_db(bus, value)

func _on_Music_Slider_value_changed(value):
	var bus = AudioServer.get_bus_index(Music_Bus)
	AudioServer.set_bus_volume_db(bus, value)
