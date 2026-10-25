extends BunkerRoom

const ROOM_WIDTH = 520.0

func build_room() -> void:
	room_title = "Tithe Bay"
	BunkerBuilder.build_corridor(self, ROOM_WIDTH)
	BunkerBuilder.add_rect(self, Rect2(160, 120, 56, 12), Color(0.24, 0.22, 0.18, 1))
	BunkerBuilder.add_rect(self, Rect2(340, 128, 48, 12), Color(0.22, 0.24, 0.21, 1))

func _ready():
	super._ready()
	var hint_label: Label = get_node_or_null("Hint")
	if hint_label:
		hint_label.visible = true
		hint_label.text = "Tithe Bay — tag the scarred console (F). Watch ammo."
