extends BunkerRoom

const ROOM_WIDTH = 480.0

func build_room() -> void:
	room_title = "Dust Mouth"
	BunkerBuilder.build_corridor(self, ROOM_WIDTH)
	BunkerBuilder.add_rect(self, Rect2(120, 128, 48, 12), Color(0.22, 0.24, 0.21, 1))
	BunkerBuilder.add_rect(self, Rect2(280, 112, 40, 12), Color(0.22, 0.24, 0.21, 1))

func _ready():
	super._ready()
	var hint_label: Label = get_node_or_null("Hint")
	if hint_label:
		hint_label.visible = true
		hint_label.text = "Dust Mouth — A/D move · W jump · LMB surplus rifle · walk into the far door"
