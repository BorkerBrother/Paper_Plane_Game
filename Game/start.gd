extends Node2D

class_name User_Player_test
var user_name = ""
var score = 0
var high_score = {
		"value": 100
	}

var user

# Called when the node enters the scene tree for the first time.
func _ready():
	user = User_Player_test.new()
	update_high_score_label()
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_button_pressed():

	var lineedit = get_node("LineEdit").text
	user.user_name = lineedit
	print(user.user_name)
	save_user_data()
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

	var file = FileAccess.open("res://Data/user_data.json",FileAccess.WRITE_READ)
	if file.open("res://Data/user_data.json", FileAccess.WRITE_READ):
		file.store_string(JSON.stringify(user_data))
		file.close()

# Aktualisieren des Labels mit dem High Score
func update_high_score_label():
	var label = $LabelHighScore
	
	var file = FileAccess.open("res://Data/user_data.json",FileAccess.READ)
	if file.open("res://Data/user_data.json", FileAccess.READ):
		
		var json_text = file.get_as_text()
		file.close()
		
		var json_data = JSON.parse_string(json_text)
		print(json_data)
		if json_data and json_data.has("high_score") and json_data["high_score"].has("value"):
			var highscore = json_data["high_score"]["value"]
			print(highscore)
			label.text = "High Score: " + str(highscore)
		
		
	
	
	
	#label.text = "Score: " + str(high_score)  # Aktualisiere den Text des Labels
