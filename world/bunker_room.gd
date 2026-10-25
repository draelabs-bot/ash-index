class_name BunkerRoom
extends Level
## Shared Level 1 bunker chamber: muted ash backdrop, room title, optional coupler unlock.

@export var room_title = "Bunker"
@export var unlock_coupler_on_enter = false
@export var show_coupler_hint = false

var _built = false

func _enter_tree():
	super._enter_tree()
	if not _built:
		_built = true
		build_room()

## Override in each chamber to stamp solids before child enemies ready.
func build_room() -> void:
	pass

func _ready():
	RenderingServer.set_default_clear_color(Color(0.05, 0.06, 0.055, 1))
	var title_label: Label = get_node_or_null("RoomTitle")
	var hint_label: Label = get_node_or_null("Hint")
	if title_label:
		title_label.text = room_title
	if unlock_coupler_on_enter and not PlayerStats.coupler_unlocked:
		PlayerStats.coupler_unlocked = true
		Sound.play(Sound.powerup, 0.5, -4.0)
	if hint_label:
		if show_coupler_hint and PlayerStats.coupler_unlocked:
			hint_label.visible = true
			hint_label.text = "Relic-coupler unlocked — RMB pulse slows nearby threats (Cognitive Bleed rises)"
		elif hint_label.text == "…":
			hint_label.visible = false
