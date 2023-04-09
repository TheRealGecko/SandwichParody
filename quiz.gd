extends Control

var qDone = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_button_1_pressed():
	if "mom" in $Button1.text:
		get_parent().get_node("Player").love += 1
	visible = false
	cont()


func _on_button_2_pressed():
	if "mom" in $Button2.text:
		get_parent().get_node("Player").love += 1
	visible = false
	cont()
	

func _on_button_3_pressed():
	if "mom" in $Button3.text:
		get_parent().get_node("Player").love += 1
	visible = false
	cont()

func cont():
	get_parent().get_node("bgsindy").animation = "undab"
	get_parent().get_node("bgsindy").play()
	await get_tree().create_timer(0.5).timeout
	get_parent().get_node("bgsindy").animation = "mad"
	get_parent().get_node("bgsindy").play()
	qDone = true
