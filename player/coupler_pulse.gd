extends Node2D
## Relic-coupler thaumic pulse — redirects scar Field into a short enemy slow (MVP mode).

@export var radius = 72.0
@export var slow_factor = 0.28

var duration = 2.4
var _age = 0.0

@onready var ring: ColorRect = $Ring

func setup(pulse_duration: float) -> void:
	duration = pulse_duration
	_apply_slow_to_enemies()

func _ready():
	if ring:
		ring.size = Vector2(radius * 2, radius * 2)
		ring.position = -ring.size * 0.5
		ring.color = Color(0.55, 0.62, 0.58, 0.22)

func _process(delta):
	_age += delta
	var t = clampf(_age / duration, 0.0, 1.0)
	modulate.a = 1.0 - t
	scale = Vector2.ONE * (1.0 + t * 0.85)
	if _age >= duration:
		queue_free()

func _apply_slow_to_enemies() -> void:
	for node in get_tree().get_nodes_in_group("enemies"):
		if not is_instance_valid(node):
			continue
		if global_position.distance_to(node.global_position) > radius:
			continue
		if node.has_method("apply_coupler_slow"):
			node.apply_coupler_slow(duration, slow_factor)
