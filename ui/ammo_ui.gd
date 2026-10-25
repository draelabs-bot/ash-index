extends HBoxContainer

@onready var label: Label = $Label

func _ready():
	_update()
	PlayerStats.ammo_changed.connect(_update)
	PlayerStats.max_ammo_changed.connect(_update)

func _update():
	label.text = "AMMO %d" % PlayerStats.ammo
