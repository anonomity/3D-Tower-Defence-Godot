extends Node3D


@onready var inner_gimbal = $InnerGimbal
@onready var camera_3d = $InnerGimbal/Camera3D

@export var max_zoom = 3.0
@export var min_zoom = 0.5
@export var zoom_speed = 0.08

var zoom = 1.5

@export var speed = 0.3
@export var drag_speed = 0.005
@export var acceleration = 0.08
@export var mouse_sensitivity = 0.005

var move = Vector3()

func _input(event):
	if Input.is_action_pressed("rotate_cam"):
		if event is InputEventMouseMotion:
			if event.relative.x != 0:
				rotate_object_local(Vector3.UP, -event.relative.x * mouse_sensitivity)
			if event.relative.y != 0:
				var y_rotation = clamp(-event.relative.y, -30,30)
				inner_gimbal.rotate_object_local(Vector3.RIGHT, y_rotation* mouse_sensitivity)
	
	if Input.is_action_pressed("move_cam"):
		if event is InputEventMouseMotion:
			move.x -= event.relative.x * drag_speed
			move.z -= event.relative.x * drag_speed
	
	if event.is_action_pressed("zoom_in"):
		zoom -= zoom_speed
	if event.is_action_pressed("zoom_out"):
		zoom += zoom_speed
	zoom = clamp(zoom, min_zoom, max_zoom)

func _process(delta):
	scale = lerp(scale, Vector3.ONE * zoom, zoom_speed)
	inner_gimbal.rotation.x = clamp(inner_gimbal.rotation.x, -1.1, 0.3)
	move_cam(delta)
	
func move_cam(delta):
	if Input.is_action_pressed("move_forward"):
		move.z = lerp(move.z, -speed, acceleration)
	elif Input.is_action_pressed("move_backward"):
		move.z = lerp(move.z, speed, acceleration)
	else:
		move.z = lerp(move.z, 0.0, acceleration)
	if Input.is_action_pressed("move_left"):
		move.x = lerp(move.x, -speed, acceleration)
	elif Input.is_action_pressed("move_right"):
		move.x = lerp(move.x, speed, acceleration)
	else:
		move.x = lerp(move.x, 0.0, acceleration)

	position += move.rotated(Vector3(0,1,0), self.rotation.y) * zoom
	position.x = clamp(position.x, -20,20)
	position.z = clamp(position.z, -20,20)
