extends Area2D

var distance = 0
var speed = 15
var opp = false
var vert = false

var dg = 1000

func _ready():pass


func _physics_process(delta):
	distance += speed
	if vert:
		position.y += speed
		dg = 580
	else:
		position.x += speed
	if opp:
		if distance < -dg:
			speed = -speed
		if distance > 530:
			self.queue_free()
	else:
		if distance > dg:
			speed = -speed
		if distance < -530:
			self.queue_free()


func _on_body_entered(body):
	if "Player" in body.name:
		get_parent().get_node("Player").hp -= 1
