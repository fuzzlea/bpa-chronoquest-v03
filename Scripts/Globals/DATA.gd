extends Node

var MODIFIERS : Dictionary = {
	
	"Positive": [
		
		{"Name": "Speed I", "Type": "Speed", "Value": 1.25, "Unlocked": false, "CurrentlyApplied": false},
		{"Name": "Speed II", "Type": "Speed", "Value": 1.5, "Unlocked": false, "CurrentlyApplied": false},
		{"Name": "Speed III", "Type": "Speed", "Value": 2, "Unlocked": false, "CurrentlyApplied": false},
		{"Name": "Speed IV", "Type": "Speed", "Value": 2.5, "Unlocked": false, "CurrentlyApplied": false},
		{"Name": "Speed V", "Type": "Speed", "Value": 3, "Unlocked": false, "CurrentlyApplied": false},
		
	],
	
	"Negative": [
		
		{"Name": "Drag I", "Type": "Speed", "Value": 0.9, "Unlocked": false, "CurrentlyApplied": false},
		{"Name": "Drag II", "Type": "Speed", "Value": 0.8, "Unlocked": false, "CurrentlyApplied": false},
		{"Name": "Drag III", "Type": "Speed", "Value": 0.65, "Unlocked": false, "CurrentlyApplied": false},
		{"Name": "Drag IV", "Type": "Speed", "Value": 0.5, "Unlocked": false, "CurrentlyApplied": false},
		{"Name": "Drag V", "Type": "Speed", "Value": 0.3, "Unlocked": false, "CurrentlyApplied": false},
		
		{"Name": "Slide I", "Type": "Friction", "Value": 0.2, "Unlocked": false, "CurrentlyApplied": false},
		{"Name": "Slide II", "Type": "Friction", "Value": 0.1, "Unlocked": false, "CurrentlyApplied": false},
		{"Name": "Slide III", "Type": "Friction", "Value": 0.05, "Unlocked": false, "CurrentlyApplied": false},
		
		
	]

}

var ICONS : Dictionary = {
	
	"Modifiers": {
		
		"Speed I" = "",
		"Speed II" = "",
		"Speed III" = "",
		"Speed IV" = "",
		"Speed V" = "",
		
		"Drag I" = "",
		"Drag II" = "",
		"Drag III" = "",
		"Drag IV" = "",
		"Drag V" = "",
		
		"Slide I" = "",
		"Slide II" = "",
		"Slide III" = "",
		
	}
	
}

func returnModifier(
	random: bool = true, 
	positive : bool = true, 
	_name : String = "Speed I"
	):
	
	var modifier
	var folderToCheck
	
	if positive: folderToCheck = "Positive" 
	else: folderToCheck = "Negative"
	
	if not random:
		for mod in MODIFIERS[folderToCheck]:
			if mod["Name"] == _name: modifier = mod; break
	else:
		var sz = MODIFIERS[folderToCheck].size() - 1
		var rand = randi_range(0, sz)
		
		modifier = MODIFIERS[folderToCheck].get(rand)
	
	return modifier
