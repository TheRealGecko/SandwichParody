extends CharacterBody2D

# controls love + hp gauges
var hp = 5
var love = 0

var dir = ""
var jmpCnt = 0;
var collide 

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	

func _physics_process(delta):
	# animations
	if jmpCnt > 0:
		get_node("Sprite").animation = "jump"
	else:
		get_node("Sprite").animation = "idle"
	
	# left/right
	if Input.is_action_pressed("left"):
		dir = "l"
		get_node("Sprite").flip_h = true
		$CollisionShape.position.x = -40
	elif Input.is_action_pressed("right"):
		dir = "r"
		get_node("Sprite").flip_h = false
		$CollisionShape.position.x = 0
	else:
		dir = ""
	if dir == "l":
		self.velocity.x = -300
	elif dir == "r":
		self.velocity.x = 300
	else:
		self.velocity.x = 0
	
	#jumping
	self.velocity.y += 30
	if Input.is_action_just_pressed("up") && jmpCnt != 2:
		jmpCnt+=1
		self.velocity.y = -850
		
	#ac moves player	
	collide = move_and_slide()
	
	if collide:
		jmpCnt = 0
	

func _on_area_entered(area):
	if "Arm" in area.name:
		print("hit")
		hp-=1
