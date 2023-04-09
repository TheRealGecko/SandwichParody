extends Node2D


var arm = preload("res://sindy.tscn")

func _ready():
	phaseOne()

func quiz():
	$bgsindy.animation = "dab" 
	await get_tree().create_timer(3).timeout
	

func phaseOne():
	await get_tree().create_timer(1).timeout
	lArm(450)
	await get_tree().create_timer(3).timeout
	lArm(450)
	rArm(50)
	await get_tree().create_timer(3).timeout
	uArm(1024)
	await get_tree().create_timer(0.5).timeout
	uArm(824)
	await get_tree().create_timer(0.5).timeout
	uArm(624)
	await get_tree().create_timer(0.5).timeout
	uArm(424)
	await get_tree().create_timer(3).timeout
	rArm(450)
	await get_tree().create_timer(0.5).timeout
	rArm(250)
	await get_tree().create_timer(3).timeout
	lArm(450)
	await get_tree().create_timer(0.5).timeout
	lArm(250)
	await get_tree().create_timer(5).timeout
	quiz()


func lArm(trans):
	var armmm = arm.instantiate()
	armmm.position.y = trans
	add_child(armmm)
	
func rArm(trans):
	var armmm = arm.instantiate()
	armmm.opp = true
	armmm.get_node("Sprite").flip_h = true
	armmm.speed = -15
	armmm.position.x = 1524
	armmm.position.y = trans
	add_child(armmm)
	
func uArm(trans):
	var armmm = arm.instantiate()
	armmm.vert = true
	armmm.rotation = 77
	armmm.speed = 12
	armmm.position.y = -450
	armmm.position.x = trans
	add_child(armmm)
	
func dArm(trans):
	var armmm = arm.instantiate()
	armmm.vert = true
	armmm.opp = true
	armmm.rotation = -77
	armmm.speed = -12
	armmm.position.y = 460+600
	armmm.position.x = trans
	add_child(armmm)
