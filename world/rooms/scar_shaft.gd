extends BunkerRoom

const ROOM_WIDTH = 320.0
const ROOM_HEIGHT = 320.0

func build_room() -> void:
	room_title = "Scar Shaft"
	var wall := Color(0.14, 0.16, 0.15, 1)
	var floor_c := Color(0.2, 0.22, 0.2, 1)
	BunkerBuilder.add_rect(self, Rect2(0, ROOM_HEIGHT - 20, ROOM_WIDTH, 24), floor_c)
	BunkerBuilder.add_rect(self, Rect2(0, 0, ROOM_WIDTH, 16), Color(0.12, 0.13, 0.12, 1))
	BunkerBuilder.add_rect(self, Rect2(-8, 0, 16, ROOM_HEIGHT), wall)
	BunkerBuilder.add_rect(self, Rect2(ROOM_WIDTH - 8, 0, 16, ROOM_HEIGHT), wall)
	BunkerBuilder.add_rect(self, Rect2(40, 250, 64, 10), floor_c)
	BunkerBuilder.add_rect(self, Rect2(180, 210, 64, 10), floor_c)
	BunkerBuilder.add_rect(self, Rect2(48, 160, 56, 10), floor_c)
	BunkerBuilder.add_rect(self, Rect2(200, 120, 72, 10), floor_c)
	BunkerBuilder.add_rect(self, Rect2(80, 72, 80, 10), floor_c)

func _ready():
	super._ready()
	var hint_label: Label = get_node_or_null("Hint")
	if hint_label:
		hint_label.visible = true
		hint_label.text = "Scar Shaft — climb. Third tag near the top. Bleed still bills."
