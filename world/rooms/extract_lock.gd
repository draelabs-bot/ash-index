extends BunkerRoom

const ROOM_WIDTH = 360.0

@onready var extract_ui: CanvasLayer = $ExtractUI
@onready var status_label: Label = $ExtractUI/Panel/Status
@onready var publish_btn: Button = $ExtractUI/Panel/PublishButton
@onready var redact_btn: Button = $ExtractUI/Panel/RedactButton
@onready var ending_label: Label = $ExtractUI/Panel/Ending

func build_room() -> void:
	room_title = "Extract Lock"
	BunkerBuilder.build_corridor(self, ROOM_WIDTH)
	BunkerBuilder.add_rect(self, Rect2(140, 120, 80, 12), Color(0.24, 0.26, 0.22, 1))

func _ready():
	super._ready()
	extract_ui.visible = true
	ending_label.visible = false
	_refresh_status()
	publish_btn.pressed.connect(_on_publish)
	redact_btn.pressed.connect(_on_redact)
	Events.index_tagged.connect(func(_id, _n): _refresh_status())

func _refresh_status() -> void:
	var ready = PlayerStats.has_enough_tags()
	status_label.text = "Index tags %d / %d" % [PlayerStats.index_tags, PlayerStats.required_index_tags]
	if ready:
		status_label.text += "\nUplink ready. Choose how the report leaves."
	else:
		status_label.text += "\nNeed more tags before extract."
	publish_btn.disabled = not ready
	redact_btn.disabled = not ready

func _on_publish() -> void:
	if not PlayerStats.has_enough_tags():
		return
	PlayerStats.cognitive_bleed = minf(100.0, PlayerStats.cognitive_bleed + 12.0)
	ending_label.visible = true
	ending_label.text = "PUBLISH — full index uplink.\nThe report will be filed. The Field flickers once, then settles."
	publish_btn.disabled = true
	redact_btn.disabled = true
	Sound.play(Sound.powerup, 0.8, -4.0)
	await get_tree().create_timer(3.5).timeout
	_return_to_menu()

func _on_redact() -> void:
	if not PlayerStats.has_enough_tags():
		return
	ending_label.visible = true
	ending_label.text = "REDACT — partial burn.\nBureau prefers silence. You leave quieter than you arrived."
	publish_btn.disabled = true
	redact_btn.disabled = true
	Sound.play(Sound.click, 0.7, -8.0)
	await get_tree().create_timer(3.5).timeout
	_return_to_menu()

func _return_to_menu() -> void:
	WorldStash.data = {}
	PlayerStats.reset()
	get_tree().change_scene_to_file("res://menus/start_menu.tscn")
