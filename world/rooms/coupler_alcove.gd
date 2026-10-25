extends BunkerRoom

const ROOM_WIDTH = 500.0

func build_room() -> void:
	room_title = "Coupler Alcove"
	unlock_coupler_on_enter = true
	show_coupler_hint = true
	BunkerBuilder.build_corridor(self, ROOM_WIDTH)
	BunkerBuilder.add_rect(self, Rect2(200, 124, 64, 12), Color(0.26, 0.28, 0.24, 1))
	BunkerBuilder.add_rect(self, Rect2(90, 100, 36, 12), Color(0.22, 0.24, 0.21, 1))
