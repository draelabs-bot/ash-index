extends Label

func _ready():
	_update()
	PlayerStats.index_tags_changed.connect(_update)

func _update():
	text = "INDEX %d/%d" % [PlayerStats.index_tags, PlayerStats.required_index_tags]
