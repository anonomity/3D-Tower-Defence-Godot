extends MeshInstance3D

@onready var timer = $Timer
@onready var bullets = $bullet
@onready var marker_3d = $Marker3D

var alien = null

var _bullet = preload("res://Bullet.tscn")

func _on_area_3d_body_entered(body):
	timer.start(0.4)
	alien = body


func _on_area_3d_body_exited(body):
	timer.stop()
	alien = null


func _on_timer_timeout():
	shoot()

func shoot():
	var bullet = _bullet.instantiate()
	bullets.add_child(bullet)
	bullet.global_position = marker_3d.global_position
	bullet.init(alien)
	
	
