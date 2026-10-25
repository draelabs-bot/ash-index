extends ColorRect

func _ready():
	PlayerStats.reset()
	RenderingServer.set_default_clear_color(Color(0.04, 0.045, 0.04, 1))

func _on_start_button_pressed():
	Sound.play(Sound.click, 1.0, -10.0)
	WorldStash.data = {}
	PlayerStats.reset()
	get_tree().change_scene_to_file("res://world.tscn")

func _on_quit_button_pressed():
	get_tree().quit()
