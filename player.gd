extends Node2D

var dir = ""
var jmpCnt = 0;
var collide 

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	

func _physics_process(delta):
	# animations
	if jmpCnt > 0:
		get_node("Body/Sprite").animation = "jump"
	else:
		get_node("Body/Sprite").animation = "idle"
	
	# left/right
	if Input.is_action_pressed("left"):
		dir = "l"
		get_node("Body/Sprite").flip_h = true
	elif Input.is_action_pressed("right"):
		dir = "r"
		get_node("Body/Sprite").flip_h = false
	else:
		dir = ""
	if dir == "l":
		$Body.velocity.x = -300
	elif dir == "r":
		$Body.velocity.x = 300
	else:
		$Body.velocity.x = 0
	
	#jumping
	$Body.velocity.y += 30
	if Input.is_action_just_pressed("up") && jmpCnt != 2:
		jmpCnt+=1
		$Body.velocity.y = -850
		
	#ac moves player	
	collide = $Body.move_and_slide()
	
	if collide:
		jmpCnt = 0
	
