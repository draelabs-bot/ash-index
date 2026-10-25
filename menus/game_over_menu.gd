extends ColorRect

func _ready():
	var reason = "The bunker keeps what you leave behind."
	if has_node("CenterContainer/VBoxContainer/Flavor"):
		$CenterContainer/VBoxContainer/Flavor.text = reason

func _on_retry_button_pressed():
	Sound.play(Sound.click, 1.0, -10.0)
	WorldStash.data = {}
	PlayerStats.reset()
	get_tree().change_scene_to_file("res://world.tscn")

func _on_quit_button_pressed():
	get_tree().quit()
