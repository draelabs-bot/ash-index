extends Area2D

@export var ammo_amount = 12

func _ready():
	body_entered.connect(_on_body_entered)

func _on_body_entered(body):
	if not body is Player:
		return
	PlayerStats.add_ammo(ammo_amount)
	Sound.play(Sound.powerup, 0.9, -8.0)
	queue_free()
