extends Node2D


var arm = preload("res://sindy.tscn")
var qBank = ["What do a story, a cemetery, and a garden have in common?", "How thoroughly is your food chewed?", "K is for __", "Are you starting a pyramid scheme?", "gobble gooble goodle __", "Because of my reputation i have to be specific so you guys dont think im __", "If it has __, it can't be that bad"]
var aBank = [["Plot", "Your mom", "R"], ["Your mom", "Ofc", "No??"], ["Kapitalism", "Kebab", "Your mom"], ["Join me", "Ofc not", "Your mom"], ["Your mom", "poodle", "moodle"], ["a Furry", "Your mom", "asbdkj"], ["Your mom", "Abs", "Food"]]

func _ready():
	$Quiz.visible = false
	#phaseOne()
	quiz()

var q = 0

func quiz():
	$bgsindy.animation = "dab" 
	await get_tree().create_timer(1).timeout
	randomize()
	q = randi()%7
	
	$Quiz/Label.text = qBank[q]
	$Quiz/Button1.text = aBank[q][0]
	$Quiz/Button2.text = aBank[q][1]
	$Quiz/Button3.text = aBank[q][2]
	$Quiz.visible = true
	
	
func phaseTwo():
	$bgsindy.animation = "undab"
	$bgsindy.play()
	await get_tree().create_timer(0.5).timeout
	$bgsindy.animation = "mad"
	$bgsindy.play()
	await get_tree().create_timer(1).timeout
	lArm(450)
	rArm(450)
	await get_tree().create_timer(3).timeout
	uArm(200)
	rArm(300)
	await get_tree().create_timer(3).timeout
	uArm(600)
	lArm(200)
	await get_tree().create_timer(3).timeout
	lArm(450)
	rArm(450)
	await get_tree().create_timer(1.5).timeout
	lArm(250)
	rArm(250)
	quiz()
	

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
