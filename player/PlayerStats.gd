extends Stats

## Ash Index run meters — surplus rifle ammo, Cognitive Bleed, coupler unlock, index tags.

@export var max_ammo = 36 : set = set_max_ammo
@export var bleed_per_pulse = 22
@export var bleed_decay_per_second = 4.0
@export var required_index_tags = 3

@onready var ammo = max_ammo : set = set_ammo
@onready var cognitive_bleed = 0.0 : set = set_cognitive_bleed
@onready var starting_max_health = max_health
@onready var starting_max_ammo = max_ammo

var coupler_unlocked = false : set = set_coupler_unlocked
var index_tags = 0 : set = set_index_tags
var tagged_ids: Dictionary = {}
var _bleed_collapsed_emitted = false

signal ammo_changed
signal max_ammo_changed
signal cognitive_bleed_changed
signal bleed_collapsed
signal coupler_unlocked_changed
signal index_tags_changed

func set_max_ammo(value):
	max_ammo = value
	max_ammo_changed.emit()

func set_ammo(value):
	ammo = clampi(value, 0, max_ammo)
	ammo_changed.emit()

func set_cognitive_bleed(value):
	cognitive_bleed = clampf(value, 0.0, 100.0)
	cognitive_bleed_changed.emit()
	if cognitive_bleed >= 100.0 and not _bleed_collapsed_emitted:
		_bleed_collapsed_emitted = true
		bleed_collapsed.emit()


func set_coupler_unlocked(value):
	coupler_unlocked = value
	coupler_unlocked_changed.emit()

func set_index_tags(value):
	index_tags = maxi(value, 0)
	index_tags_changed.emit()

func can_fire_rifle() -> bool:
	return ammo > 0

func spend_ammo(amount := 1) -> bool:
	if ammo < amount:
		return false
	ammo -= amount
	return true

func add_ammo(amount: int) -> void:
	ammo += amount

func use_coupler_pulse() -> bool:
	if not coupler_unlocked:
		return false
	if cognitive_bleed >= 100.0:
		return false
	cognitive_bleed += bleed_per_pulse
	return true

func tag_index(point_id: String) -> bool:
	if tagged_ids.has(point_id):
		return false
	tagged_ids[point_id] = true
	index_tags += 1
	return true

func has_enough_tags() -> bool:
	return index_tags >= required_index_tags

func _process(delta):
	if cognitive_bleed <= 0.0:
		return
	# Passive decay when idle / not pulsing.
	var next = maxf(0.0, cognitive_bleed - bleed_decay_per_second * delta)
	if not is_equal_approx(next, cognitive_bleed):
		cognitive_bleed = next

func reset():
	max_health = starting_max_health
	max_ammo = starting_max_ammo
	coupler_unlocked = false
	index_tags = 0
	tagged_ids.clear()
	_bleed_collapsed_emitted = false
	cognitive_bleed = 0.0
	refill()

func refill():
	health = max_health
	ammo = max_ammo

func stash_stats():
	WorldStash.stash("player", "max_health", max_health)
	WorldStash.stash("player", "max_ammo", max_ammo)
	WorldStash.stash("player", "ammo", ammo)
	WorldStash.stash("player", "cognitive_bleed", cognitive_bleed)
	WorldStash.stash("player", "coupler_unlocked", coupler_unlocked)
	WorldStash.stash("player", "index_tags", index_tags)

func retrieve_stats():
	max_health = WorldStash.retrieve("player", "max_health")
	max_ammo = WorldStash.retrieve("player", "max_ammo")
	refill()
	ammo = WorldStash.retrieve("player", "ammo")
	cognitive_bleed = WorldStash.retrieve("player", "cognitive_bleed")
	coupler_unlocked = WorldStash.retrieve("player", "coupler_unlocked")
	index_tags = WorldStash.retrieve("player", "index_tags")
