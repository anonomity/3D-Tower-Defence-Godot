extends Node3D


@export var _target : StaticBody3D
var amount = 4

func _on_area_3d_body_entered(body):
	if body.returning == true:
		body.queue_free()
		amount -= 1
		if amount == 0:
			EventBus.emit_signal("win")
