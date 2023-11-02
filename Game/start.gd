extends Node2D

class_name User_Player_test
var user_name = ""
var score = 0
var high_score = {
		"value": 0
	}


var user
# Called when the node enters the scene tree for the first time.
func _ready():
	pass

	#var txtLabel = get_node("LineEdit").get_text()
	#get_node("LabelInfo").set_text(txtLabel)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_button_pressed():

	var lineedit = get_node("LineEdit")
	user = User_Player_test.new()
	user.user_name = lineedit
	for i in 10:
		print(user.user_name.text)
	get_tree().change_scene_to_file("res://world.tscn")

