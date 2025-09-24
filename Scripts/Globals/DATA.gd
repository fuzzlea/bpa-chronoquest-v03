extends Node

# Variables

var DATABASE : SQLite

var TIME_PERIODS : Dictionary = {
	
	"Mesozoic" : {
		
		"Events": [],
		"Relics": [],
		"Boss": {}
		
	},
	
	"Pre-History" : {
		
		"Events": [],
		"Relics": [],
		"Boss": {}
		
	},
	
	"Stone Age" : {
		
		"Events": [],
		"Relics": [],
		"Boss": {}
		
	},
	
	"Bronze Age" : {
		
		"Events": [],
		"Relics": [],
		"Boss": {}
		
	},
	
	"The Middle Ages" : {
		
		"Events": [],
		"Relics": [],
		"Boss": {}
		
	},
	
	"Renaissance" : {
		
		"Events": [],
		"Relics": [],
		"Boss": {}
		
	},
	
	"Industrial Revolution" : {
		
		"Events": [],
		"Relics": [],
		"Boss": {}
		
	},
	
	"Modern History" : {
		
		"Events": [],
		"Relics": [],
		"Boss": {}
		
	},
	
	"Y2K" : {
		
		"Events": [],
		"Relics": [],
		"Boss": {}
		
	},
	
}

var RELICS : Dictionary = {}

var MODIFIERS : Dictionary = {
	
	"Positive": [
		
		{"Name": "Speed I", "Type": "Speed", "Value": 1.25},
		{"Name": "Speed II", "Type": "Speed", "Value": 1.5},
		{"Name": "Speed III", "Type": "Speed", "Value": 2},
		{"Name": "Speed IV", "Type": "Speed", "Value": 2.5},
		{"Name": "Speed V", "Type": "Speed", "Value": 3},
		
	],
	
	"Negative": [
		
		{"Name": "Drag I", "Type": "Speed", "Value": 0.9},
		{"Name": "Drag II", "Type": "Speed", "Value": 0.8},
		{"Name": "Drag III", "Type": "Speed", "Value": 0.65},
		{"Name": "Drag IV", "Type": "Speed", "Value": 0.5},
		{"Name": "Drag V", "Type": "Speed", "Value": 0.3},
		
		{"Name": "Slide I", "Type": "Friction", "Value": 0.2},
		{"Name": "Slide II", "Type": "Friction", "Value": 0.1},
		{"Name": "Slide III", "Type": "Friction", "Value": 0.05},
		
		
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

#

# Functions

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

#

# Connectors

func _ready() -> void:
	pass

#
