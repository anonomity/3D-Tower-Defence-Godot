extends Area3D

var target

var speed = 10

var damage = 10

func init(alien):
	target= alien

func _physics_process(delta):
	if target != null:
		look_at(target.global_position)
	position += -transform.basis.z * delta * speed


func _on_body_entered(body):
	body.damage(damage)
	queue_free()


func _on_timer_timeout():
	queue_free()
