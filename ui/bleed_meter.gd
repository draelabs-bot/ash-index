extends Control

@onready var fill: ColorRect = $Fill
@onready var border: ColorRect = $Border
@onready var label: Label = $Label

const BAR_WIDTH = 48.0

func _ready():
	visible = false
	PlayerStats.cognitive_bleed_changed.connect(_update)
	PlayerStats.coupler_unlocked_changed.connect(_on_coupler)
	_on_coupler()

func _on_coupler():
	_update()

func _update():
	visible = PlayerStats.coupler_unlocked or PlayerStats.cognitive_bleed > 0.5
	var t = PlayerStats.cognitive_bleed / 100.0
	fill.size.x = BAR_WIDTH * t
	if PlayerStats.cognitive_bleed >= 70.0:
		fill.color = Color(0.55, 0.35, 0.32, 0.95)
		label.modulate = Color(1.1, 0.85, 0.8, 1)
	else:
		fill.color = Color(0.4, 0.48, 0.44, 0.9)
		label.modulate = Color.WHITE
	label.text = "BLEED %d" % int(PlayerStats.cognitive_bleed)
