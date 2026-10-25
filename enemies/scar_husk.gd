extends "res://enemies/walking_enemy.gd"
## Scar husk — Cataclysm residue puppet; tankier scavenger remix. Coupler slow helps.

func _ready():
	super._ready()
	modulate = Color(0.55, 0.6, 0.52, 1)
	speed = 14.0
	if stats:
		stats.max_health = 6
		stats.health = 6

func apply_coupler_slow(duration: float, factor: float = 0.28) -> void:
	# Over-pulsing near husks spikes bleed slightly (shameful Field contact).
	super.apply_coupler_slow(duration, factor * 0.85)
	PlayerStats.cognitive_bleed = minf(100.0, PlayerStats.cognitive_bleed + 6.0)
