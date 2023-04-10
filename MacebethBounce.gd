extends CharacterBody2D
func _ready():
	set_velocity(Vector2(800, 250))

func _physics_process(delta):
	var collision_info = move_and_collide(velocity * delta )
	if collision_info:
		velocity = velocity.bounce(collision_info.get_normal())
		
func _on_area_2d_body_entered(body):
	if "Player" in body.name:
		get_parent().get_node("Player").hp -= 1

