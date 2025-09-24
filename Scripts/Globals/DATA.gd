extends Node

# Variables

var DATABASE : SQLite

var TIME_PERIODS : Dictionary = {
	
	# ALL EVENT ID'S ARE EXTRACTED IN THIS FORMAT
	## [Era]-[index_in_array] -> Mesozoic-2 = Event 3 In the Array of Events
	## [Era]-B -> Mesozoic-B = Boss
	
	"Mesozoic" : {
		
		"Events": [
			
			{
				"Name": "Pangea",
				"Description": "Ensure the safety of life, dodge lava bursts and falling rocks while guiding early species to safety.",
				"Year": "200mya",
				"Type": "Mission",
				"Time": 60,
				"Completed": false,
				"ScenePath": "",
			},
			
			{
				"Name": "Take Flight",
				"Description": "What's in the air? Correctly assemble the wing-bones of a new species to introduce flight.",
				"Year": "150mya",
				"Type": "Puzzle",
				"Time": 30,
				"Completed": false,
				"ScenePath": "",
			},
			
			{
				"Name": "Herbivority",
				"Description": "Save the herbivore species, fight against their carniverous predators and ensure herbivores don't go extinct.",
				"Year": "90mya",
				"Type": "Battle",
				"Time": 120,
				"Completed": false,
				"ScenePath": "",
			},
			
		],
		
		"Relics": [
			
			{
				"Name": "Molten Rock",
				"Description": "A rock excavated from the molten-ridden land of Pangea.",
				"Acquired": "Mesozoic-0", # [Event ID] or Shop
				"Modifiers": ["Burn I"],
			},
			
			{
				"Name": "Ancient Fossil",
				"Description": "A bone from an ancient species.",
				"Acquired": "Mesozoic-1",
				"Modifiers": ["Knockback I"],
			},
			
			{
				"Name": "Ancient Flower",
				"Description": "A mesmorizing flower from ancient times.",
				"Acquired": "Mesozoic-2",
				"Modifiers": ["Thorn I"],
			},
			
		],
		
		"Boss": {
			
			"Name": "",
			"Description": "",
			"Time": 0,
			"Health": 0,
			"Completed": false,
			"ScenePath": "",
			
		}
		
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

var MODIFIERS : Array = [
		
	{"Name": "Speed I", "Type": "Speed", "Value": 1.25}, # Speed Is Increased By *=[Value]
	{"Name": "Speed II", "Type": "Speed", "Value": 1.5},
	{"Name": "Speed III", "Type": "Speed", "Value": 2},
	{"Name": "Speed IV", "Type": "Speed", "Value": 2.5},
	{"Name": "Speed V", "Type": "Speed", "Value": 3},
	
	{"Name": "Burn I", "Type": "Applied Effect", "Value": 3}, # Enemy Burns Every [Value] Seconds On Hit
	{"Name": "Burn II", "Type": "Applied Effect", "Value": 1},
	{"Name": "Burn III", "Type": "Applied Effect", "Value": 0.5},
	
	{"Name": "Knockback I", "Type": "Knockback", "Value": 1}, # Enemy Is Knocked Back By [Value] Amount On Hit
	{"Name": "Knockback II", "Type": "Knockback", "Value": 5},
	{"Name": "Knockback III", "Type": "Knockback", "Value": 10},
	
	{"Name": "Thorn I", "Type": "Effect", "Value": 3}, # If Enemy Is In Range Of [Value] , They Take Damage Every Second
	{"Name": "Thorn II", "Type": "Effect", "Value": 10},
	{"Name": "Thorn III", "Type": "Effect", "Value": 25},
	
	{"Name": "Drag I", "Type": "Speed", "Value": 0.9}, # Speed Is Decreased By *=[Value]
	{"Name": "Drag II", "Type": "Speed", "Value": 0.8},
	{"Name": "Drag III", "Type": "Speed", "Value": 0.65},
	{"Name": "Drag IV", "Type": "Speed", "Value": 0.5},
	{"Name": "Drag V", "Type": "Speed", "Value": 0.3},
	
	{"Name": "Slide I", "Type": "Friction", "Value": 0.2}, # Friciton Is Set To [Value]
	{"Name": "Slide II", "Type": "Friction", "Value": 0.1},
	{"Name": "Slide III", "Type": "Friction", "Value": 0.05},
		
]

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
	random: bool = false, 
	_name : String = "Speed I"
	):
	
	var modifier
	
	if not random:
		for mod in MODIFIERS:
			if mod["Name"] == _name: modifier = mod; break
	else:
		var sz = MODIFIERS.size() - 1
		var rand = randi_range(0, sz)
		
		modifier = MODIFIERS.get(rand)
	
	return modifier

#

# Connectors

func _ready() -> void:
	pass

#
