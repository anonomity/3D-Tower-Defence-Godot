extends Node3D


@onready var aliens = $"../../../Aliens"


func _on_area_3d_body_entered(body):
	if get_child_count() > 0:
		remove_child(get_child(0))
		body.target =aliens
		body.returning = true
		body.pickup()
		EventBus.emit_signal("core_taken")
