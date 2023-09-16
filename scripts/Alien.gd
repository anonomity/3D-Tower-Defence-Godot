extends CharacterBody3D

@onready var navigation_agent_3d = $NavigationAgent3D

var target =null

var speed  = 2.0

var accel = 10

var health = 100

var returning = false
@onready var core = $CORE

func _ready():
	target = get_parent()._target

func _physics_process(delta):
	var direction = Vector3()
	
	navigation_agent_3d.target_position = target.global_position
	
	direction = navigation_agent_3d.get_next_path_position() - global_position
	direction = direction.normalized()
	
	velocity = velocity.lerp(direction * speed , accel * delta)
	
	move_and_slide()

func pickup():
	core.show()

func damage(amount):
	health -= amount
	if health <= 0 :
		queue_free()
