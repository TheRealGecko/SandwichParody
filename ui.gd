extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


var hpCnt = 5
var loveCnt = 0

func _process(delta):
	hpCnt = get_parent().get_node("Player").hp
	$hp.animation = str(hpCnt)
	
	loveCnt = get_parent().get_node("Player").love
	$lovebar.animation = str(loveCnt)

