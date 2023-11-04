extends Node

# Called when the node enters the scene tree for the first time.
func _ready():
	load_default_stats()  # Lade die Standardwerte aus der JSON-Datei

func _process(delta):
	pass



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
			Global.user.user_name = user_data.user_name
		if "score" in user_data:
			Global.user.score = user_data.score
		if "high_score" in user_data and "value" in user_data.high_score:
			Global.user.high_score.value = user_data.high_score.value

# Called every frame. 'delta' is the elapsed time since the previous frame.


func _on_button_pressed():
	var lineedit = get_node("LineEdit")
	#Global.user.user_name = lineedit.text

	# Jetzt kannst du die geänderten Benutzerdaten in der JSON-Datei speichern
	save_user_data()

	get_tree().change_scene("res://world.tscn")

# Speichern der Benutzerdaten in der JSON-Datei
func save_user_data():
	var user_data = {
		"user_name": Global.user.user_name,
		"score": Global.user.score,
		"high_score": {
			"value": Global.user.high_score.value
		}
	}

	var file = File.new()
	if file.open("user_data.json", File.WRITE) == OK:
		file.store_string(JSON.print(user_data))
		file.close()
