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
	user = User_Player_test.new()

	#var txtLabel = get_node("LineEdit").get_text()
	#get_node("LabelInfo").set_text(txtLabel)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_button_pressed():

	var lineedit = get_node("LineEdit").text
	user.user_name = lineedit
	print(user.user_name)
	save_user_data()
	#	print(user.user_name.text)
	get_tree().change_scene_to_file("res://world.tscn")




# Laden der Standardwerte aus der JSON-Datei
func load_default_stats():
	var file = FileAccess.open("res://Data/User_Default.json",FileAccess.READ)
	
	if file.open("res://Data/User_Default.json",FileAccess.READ):
		var json = JSON.new()
		var text = file
		print(text)
		file.close()
		var user_data = json.parse(text)
		
		
		if "user_name" in user_data:
			user.user_name = user_data.user_name
		if "score" in user_data:
			user.score = user_data.score
		if "high_score" in user_data and "value" in user_data.high_score:
			user.high_score.value = user_data.high_score.value


# Speichern der Benutzerdaten in der JSON-Datei
func save_user_data():
	var user_data = {
		"user_name": user.user_name,
		"score": user.score,
		"high_score": {
			"value": user.high_score.value
		}
	}

	var file = FileAccess.open("res://Data/user_data.json",FileAccess.WRITE)
	if file.open("res://Data/user_data.json", FileAccess.WRITE):
		file.store_string(JSON.stringify(user_data))
		file.close()
