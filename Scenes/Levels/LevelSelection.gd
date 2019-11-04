extends Node

export var levels: Array = []

class Level:#A Level class for not using Dictonaries
	var name: String = ""
	var preview: String = ""
	var run_path: String = ""
	var valid: bool = false

func get_level_by_string(strings: Array) -> Array:
	var levels: Array
	var reg = RegEx.new()
	var lev: int = -1
	
	for st in strings:#Locate the Level's properties and store them
		if st.begins_with(">"):
			reg.compile("\".*?\"")
			var res = reg.search(st)
			if res:
				lev += 1
				levels.insert(lev, Level.new())#Create a new level
				levels[lev].name = res.get_string().replace("\"", "")#The Level's name
			
		if st.begins_with("prev"):
			reg.compile("\".*?\"")
			var res = reg.search(st)
			if res:
				levels[lev].preview = res.get_string().replace("\"", "")#The path to preview the Level
			
		if st.begins_with("run"):
			reg.compile("\".*?\"")
			var res = reg.search(st)
			if res:
				levels[lev].run_path = res.get_string().replace("\"", "")#The path to run the Level
			
		
	
	return levels

func get_file_lines(file: File) -> Array:
	var reg = RegEx.new()#Create a new RegEx
	var text = file.get_as_text()#Gets the file as a string
	reg.compile(".+")#Compile RegEx for matching all the lines
	var res: Array
	for a in reg.search_all(text):
		res.append(a.get_string())
	return res

func _ready() -> void:
	var reg = RegEx.new()
	reg.compile("")
	var level_file = File.new()
	level_file.open("res://Scenes/Levels/Levels.list", File.READ)#Opens the level list
	levels = get_level_by_string(get_file_lines(level_file))
	
	
	
	
