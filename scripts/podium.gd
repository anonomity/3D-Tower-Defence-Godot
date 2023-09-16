extends StaticBody3D

var turret = preload("res://turret_1.tscn")
var mouse_in = false
@onready var node_3d = $Node3D

func _on_mouse_entered():
	mouse_in = true


func _on_mouse_exited():
	mouse_in = false

func _input(event):
	if mouse_in and Input.is_action_just_pressed("click"):
		EventBus.emit_signal("click_podium", self)



func spawn():
	var _turret = turret.instantiate()
	node_3d.add_child(_turret)
#	_turret.global_position = node_3d.global_position

func _on_area_3d_mouse_entered():
	mouse_in = true


func _on_area_3d_mouse_exited():
	mouse_in = false
