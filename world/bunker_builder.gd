class_name BunkerBuilder
extends Node
## Runtime helper to stamp muted bunker solids into a room (greybox Level 1).

static func add_rect(parent: Node2D, rect: Rect2, color := Color(0.18, 0.2, 0.19, 1)) -> StaticBody2D:
	var body := StaticBody2D.new()
	body.collision_layer = 1
	body.collision_mask = 0
	body.position = rect.position + rect.size * 0.5
	var shape := CollisionShape2D.new()
	var rect_shape := RectangleShape2D.new()
	rect_shape.size = rect.size
	shape.shape = rect_shape
	body.add_child(shape)
	var visual := ColorRect.new()
	visual.size = rect.size
	visual.position = -rect.size * 0.5
	visual.color = color
	body.add_child(visual)
	parent.add_child(body)
	return body

static func build_corridor(parent: Node2D, width: float, height: float = 180.0, floor_y: float = 160.0) -> void:
	var wall := Color(0.14, 0.16, 0.15, 1)
	var floor_c := Color(0.2, 0.22, 0.2, 1)
	var ceil_c := Color(0.12, 0.13, 0.12, 1)
	# Floor
	add_rect(parent, Rect2(0, floor_y, width, 24), floor_c)
	# Ceiling
	add_rect(parent, Rect2(0, 0, width, 16), ceil_c)
	# Left / right outer walls (thin)
	add_rect(parent, Rect2(-8, 0, 16, height), wall)
	add_rect(parent, Rect2(width - 8, 0, 16, height), wall)
