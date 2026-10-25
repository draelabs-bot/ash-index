extends CharacterBody2D

const EnemyDeathEffectScene = preload("res://effects/enemy_death_effect.tscn")

@export var speed = 30.0
@export var turns_at_ledges = true

var gravity = 200.0
var direction = 1.0
var speed_multiplier = 1.0
var _slow_timer = 0.0

@onready var sprite_2d = $Sprite2D
@onready var floor_cast = $FloorCast
@onready var stats = $Stats
@onready var death_effect_location = $DeathEffectLocation
@onready var starting_position = global_position

func _ready():
	add_to_group("enemies")
	var id = WorldStash.get_id(self, starting_position)
	var died = WorldStash.retrieve(id, "died")
	if died: queue_free()

func apply_coupler_slow(duration: float, factor: float = 0.28) -> void:
	speed_multiplier = factor
	_slow_timer = duration
	modulate = Color(0.65, 0.75, 0.7, 1.0)

func _physics_process(delta):
	if _slow_timer > 0.0:
		_slow_timer -= delta
		if _slow_timer <= 0.0:
			speed_multiplier = 1.0
			modulate = Color.WHITE

	if not is_on_floor():
		velocity.y += gravity * delta

	if is_on_wall():
		turn_around()

	if is_at_ledge() and turns_at_ledges:
		turn_around()

	velocity.x = direction * speed * speed_multiplier
	sprite_2d.scale.x = direction

	move_and_slide()

func is_at_ledge():
	return is_on_floor() and not floor_cast.is_colliding()

func turn_around():
	direction *= -1.0

func _on_hurtbox_hurt(hitbox, damage):
	stats.health -= damage

func _on_stats_no_health():
	Utils.instantiate_scene_on_level(EnemyDeathEffectScene, death_effect_location.global_position)
	var id = WorldStash.get_id(self, starting_position)
	WorldStash.stash(id, "died", true)
	queue_free()
	
