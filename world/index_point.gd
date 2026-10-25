class_name IndexPoint
extends Area2D
## Interactable archive tag — pause briefly, risk nearby, count toward extract.

@export var point_id = "index_unnamed"
@export var lore_line = "Scar residue logged. Field interference noted."
@export var tag_time = 0.85

var tagged = false
var tagging = false
var player_inside = false

@onready var prompt: Label = $Prompt
@onready var visual: ColorRect = $Visual
@onready var lore: Label = $Lore

func _ready():
	body_entered.connect(_on_body_entered)
	body_exited.connect(_on_body_exited)
	if prompt:
		prompt.visible = false
	if lore:
		lore.visible = false
	if PlayerStats.tagged_ids.has(point_id):
		_mark_tagged(false)

func _process(_delta):
	if tagged or tagging or not player_inside:
		return
	if Input.is_action_just_pressed("interact"):
		_begin_tag()

func _on_body_entered(body):
	if body is Player and not tagged:
		player_inside = true
		if prompt:
			prompt.visible = true

func _on_body_exited(body):
	if body is Player:
		player_inside = false
		if prompt:
			prompt.visible = false

func _begin_tag() -> void:
	tagging = true
	if prompt:
		prompt.text = "Indexing…"
	await get_tree().create_timer(tag_time).timeout
	if not is_instance_valid(self):
		return
	if PlayerStats.tag_index(point_id):
		Events.index_tagged.emit(point_id, PlayerStats.index_tags)
		Sound.play(Sound.powerup, 0.65, -6.0)
		_mark_tagged(true)
	tagging = false

func _mark_tagged(show_lore: bool) -> void:
	tagged = true
	if visual:
		visual.color = Color(0.35, 0.48, 0.42, 0.85)
	if prompt:
		prompt.visible = false
	if lore and show_lore:
		lore.text = lore_line
		lore.visible = true
		await get_tree().create_timer(2.4).timeout
		if is_instance_valid(lore):
			lore.visible = false
