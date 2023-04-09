extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	await get_tree().create_timer(1.5).timeout
	$Button.visible = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_button_pressed():
	get_tree().change_scene_to_file("res://stage_1.tscn")
