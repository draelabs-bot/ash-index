extends Node

signal add_screenshake(amount, duration)
signal door_entered(door)
signal camera_limits_changed(left, right, top, bottom)
signal player_died
signal coupler_pulse(duration)
signal index_tagged(point_id, tag_count)
signal extract_reached
signal run_failed(reason)
