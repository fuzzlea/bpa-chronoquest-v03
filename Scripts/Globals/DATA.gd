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
				"Description": "The original continent, without it, what would Earth look like? Don't find out. Restore Pangea back to its original state while getting rid of Jimpus' associates.",
				"Year": "200mya",
				"Completed": false,
				"ScenePath": "",
			},
			
			{
				"Name": "Take Flight",
				"Description": "What's in the air? Nothing if you don't restore the fossils of the bird species. Return the fossils back to the library and make sure Jimpus doesn't get his hands on them again.",
				"Year": "150mya",
				"Completed": false,
				"ScenePath": "",
			},
			
			{
				"Name": "Herbivority",
				"Description": "Jimpus is trying to get rid of the Herbivores, make sure he doesn't. Ensure the Heart of the Herb is returned home safely.",
				"Year": "90mya",
				"Completed": false,
				"ScenePath": "",
			},
			
		],
		
		"Relics": [
			
			{
				"Name": "Pangea",
				"Description": "A rock in the shape of the former-continent.",
				"Icon": ""
			},
			
			{
				"Name": "The Wing",
				"Description": "A fossil containing the art of flight.",
				"Icon": ""
			},
			
			{
				"Name": "Heart of the Herb",
				"Description": "A mesmorizing flower that keeps agricultural life from wilting.",
				"Icon": ""
			},
			
		],
		
		"Boss": {
			
			"Name": "Tyranious",
			"Description": "The Mesozoic Key resides in his belly... omnivore at heart huh. Get it out, restore the Mesozoic Era.",
			"Health": 100,
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

var MODIFIERS : Array = [
		
	{"Name": "Speed I", "Type": "Speed", "Value": 1.25, "Icon": ""}, # Speed Is Increased By *=[Value]
	{"Name": "Speed II", "Type": "Speed", "Value": 1.5, "Icon": ""},
	{"Name": "Speed III", "Type": "Speed", "Value": 2, "Icon": ""},
	{"Name": "Speed IV", "Type": "Speed", "Value": 2.5, "Icon": ""},
	{"Name": "Speed V", "Type": "Speed", "Value": 3, "Icon": ""},
	
	{"Name": "Burn I", "Type": "Applied Effect", "Value": 3, "Icon": ""}, # Enemy Burns Every [Value] Seconds On Hit
	{"Name": "Burn II", "Type": "Applied Effect", "Value": 1, "Icon": ""},
	{"Name": "Burn III", "Type": "Applied Effect", "Value": 0.5, "Icon": ""},
	
	{"Name": "Knockback I", "Type": "Knockback", "Value": 1, "Icon": ""}, # Enemy Is Knocked Back By [Value] Amount On Hit
	{"Name": "Knockback II", "Type": "Knockback", "Value": 5, "Icon": ""},
	{"Name": "Knockback III", "Type": "Knockback", "Value": 10, "Icon": ""},
	
	{"Name": "Thorn I", "Type": "Effect", "Value": 3, "Icon": ""}, # If Enemy Is In Range Of [Value] , They Take Damage Every Second
	{"Name": "Thorn II", "Type": "Effect", "Value": 10, "Icon": ""},
	{"Name": "Thorn III", "Type": "Effect", "Value": 25, "Icon": ""},
	
	{"Name": "Drag I", "Type": "Speed", "Value": 0.9, "Icon": ""}, # Speed Is Decreased By *=[Value]
	{"Name": "Drag II", "Type": "Speed", "Value": 0.8, "Icon": ""},
	{"Name": "Drag III", "Type": "Speed", "Value": 0.65, "Icon": ""},
	{"Name": "Drag IV", "Type": "Speed", "Value": 0.5, "Icon": ""},
	{"Name": "Drag V", "Type": "Speed", "Value": 0.3, "Icon": ""},
	
	{"Name": "Slide I", "Type": "Friction", "Value": 0.2, "Icon": ""}, # Friciton Is Set To [Value]
	{"Name": "Slide II", "Type": "Friction", "Value": 0.1, "Icon": ""},
	{"Name": "Slide III", "Type": "Friction", "Value": 0.05, "Icon": ""},
		
]

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
