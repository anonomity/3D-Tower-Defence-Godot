extends Node3D

@onready var timer = $Timer
@onready var bullets = $bullet
@onready var marker_3d =$Node3D/sphere/Barrel/Marker3D

@onready var node_3d = $Node3D
@onready var barrel = $Node3D/sphere/Barrel
@onready var animation_player = $AnimationPlayer


var alien = null

var _bullet = preload("res://Bullet.tscn")

func _on_area_3d_body_entered(body):
	timer.start(0.4)
	alien = body



func _on_area_3d_body_exited(body):
	timer.stop()
	alien = null


func _on_timer_timeout():
	animation_player.play("shoot")

func shoot():
	var bullet = _bullet.instantiate()
	bullets.add_child(bullet)
	bullet.global_position = marker_3d.global_position
	if alien != null:
		node_3d.look_at(alien.position, Vector3.UP, true)
		bullet.init(alien)
	
	
