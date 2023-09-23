extends Node3D

@export var positions :Node3D
@export var aliens_node : Node3D

var aliens = preload("res://scenes/Alien.tscn")

var waves = 3
var current_wave = 1

func _on_timer_timeout():
	if current_wave == 3:
		print("win")
	else:
		current_wave += 1
		for child in positions.get_children():
			var alien_inst = aliens.instantiate()
			aliens_node.add_child(alien_inst)
			alien_inst.global_position = child.global_position
			
			
