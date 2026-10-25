extends BunkerRoom

const ROOM_WIDTH = 560.0

func build_room() -> void:
	room_title = "Ward Gallery"
	BunkerBuilder.build_corridor(self, ROOM_WIDTH)
	BunkerBuilder.add_rect(self, Rect2(140, 132, 80, 12), Color(0.22, 0.24, 0.21, 1))
	BunkerBuilder.add_rect(self, Rect2(300, 116, 72, 12), Color(0.22, 0.24, 0.21, 1))
	BunkerBuilder.add_rect(self, Rect2(420, 88, 64, 12), Color(0.28, 0.26, 0.2, 1))

func _ready():
	super._ready()
	var hint_label: Label = get_node_or_null("Hint")
	if hint_label:
		hint_label.visible = true
		hint_label.text = "Ward Gallery — second index tag on the upper niche. Rifle path below."
