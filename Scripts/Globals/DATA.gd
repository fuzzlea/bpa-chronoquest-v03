## EVERYTHING THAT WILL BE SAVED IN THE DATABASE GOES HERE

## Possible Idea for multiple saves
# base data is in a dict
# on first init the database creates [however many save files prob 3] tables w all the base data 
# when a new save is started, a temp array is created IN GAME with all the data from the db
# temp arr is the only thing being updated in game before save, save game = temp arr merge with db table

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
				"Description": "The original continent, without it, what would Earth look like? Don't find out. Bring the pieces of land together, and begin life itself.",
				"Year": "200mya",
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
				"Description": "A rock resembling the land.",
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
		
		"Events": [
			
			{
				"Name": "Discovery of Fire",
				"Description": "The flames are spreading. Collect burning branches before they burn out while driving away Jimpus' meddling creatures.",
				"Year": "400kya",
				"Completed": false,
				"ScenePath": "",
			},
			
			{
				"Name": "First Cave Painting",
				"Description": "Art is power. Restore the first human symbols on the wall before Jimpus erases them from history.",
				"Year": "40kya",
				"Completed": false,
				"ScenePath": "",
			},
			
		],
		
		"Relics": [
			
			{
				"Name": "Ember of Fire",
				"Description": "A smoldering branch, the spark that lit human progress.",
				"Icon": ""
			},
			
			{
				"Name": "Cave Mark",
				"Description": "A painted symbol, proof of the first human imagination.",
				"Icon": ""
			},
			
		],
		
		"Boss": {
			
			"Name": "The Frozen Mammoth",
			"Description": "A colossal mammoth corrupted by Jimpus' frost. Within its heart lies the Pre-History Key. Defeat it and restore the age of beginnings.",
			"Health": 200,
			"Completed": false,
			"ScenePath": "",
			
		}
		
	},
	
	"Stone Age" : {
		
		"Events": [
			
			{
				"Name": "First Farming",
				"Description": "The seeds of civilization are in danger — plant and water crops while fending off Jimpus' beasts.",
				"Year": "10kya",
				"Completed": false,
				"ScenePath": "",
			},
			
			{
				"Name": "Stonehenge Raised",
				"Description": "Push and rotate massive stones into place before Jimpus collapses the monument forever.",
				"Year": "5kya",
				"Completed": false,
				"ScenePath": "",
			},
			
		],
		
		"Relics": [
			
			{
				"Name": "Seed of Life",
				"Description": "A fertile seed representing the dawn of agriculture.",
				"Icon": ""
			},
			
			{
				"Name": "Stone Circle",
				"Description": "A miniature carving of Stonehenge, holding celestial knowledge.",
				"Icon": ""
			},
			
		],
		
		"Boss": {
			
			"Name": "The Beast of Burden",
			"Description": "A colossal ox, twisted into fury by Jimpus. Inside its harness lies the Stone Age Key.",
			"Health": 300,
			"Completed": false,
			"ScenePath": "",
			
		}
		
	},
	
	"Bronze Age" : {
		
		"Events": [
			
			{
				"Name": "Sumerian Writing Invented",
				"Description": "Restore the first records of humanity — collect clay and carve symbols before Jimpus erases the word.",
				"Year": "3.2kya",
				"Completed": false,
				"ScenePath": "",
			},
			
			{
				"Name": "Egyptian Pyramid Completed",
				"Description": "Push massive blocks into place to finish the pyramid — while Jimpus' overseers sabotage the effort.",
				"Year": "2.5kya",
				"Completed": false,
				"ScenePath": "",
			},
			
		],
		
		"Relics": [
			
			{
				"Name": "Clay Tablet",
				"Description": "An etched tablet, humanity’s first written story.",
				"Icon": ""
			},
			
			{
				"Name": "Pharaoh’s Stone",
				"Description": "A polished limestone block imbued with regal power.",
				"Icon": ""
			},
			
		],
		
		"Boss": {
			
			"Name": "The Colossus",
			"Description": "An enormous bronze guardian animated by Jimpus. Within its chestplate lies the Bronze Age Key.",
			"Health": 400,
			"Completed": false,
			"ScenePath": "",
			
		}
		
	},
	
	"Middle Ages" : {
		
		"Events": [
			
			{
				"Name": "Signing of Magna Carta",
				"Description": "The parchment must survive — stop Jimpus’ knights from tearing it apart before it’s signed.",
				"Year": "1215",
				"Completed": false,
				"ScenePath": "",
			},
			
			{
				"Name": "Battle of Agincourt",
				"Description": "Defend the line — fire arrows into Jimpus’ armored knights as they charge.",
				"Year": "1415",
				"Completed": false,
				"ScenePath": "",
			},
			
		],
		
		"Relics": [
			
			{
				"Name": "Sealed Charter",
				"Description": "The Magna Carta’s seal, carrying the weight of justice.",
				"Icon": ""
			},
			
			{
				"Name": "Blood of the Knight",
				"Description": "The Blood of the Wounded on a rock, representing war.",
				"Icon": ""
			},
			
		],
		
		"Boss": {
			
			"Name": "The Black Knight",
			"Description": "A towering knight clad in cursed armor forged by Jimpus. Slay him to recover the Middle Ages Key.",
			"Health": 600,
			"Completed": false,
			"ScenePath": "",
			
		}
		
	},
	
	"Renaissance" : {
		
		"Events": [
			
			{
				"Name": "Black Death",
				"Description": "Deliver medicine and prayers to plague-stricken villagers while Jimpus spreads pestilence.",
				"Year": "1347",
				"Completed": false,
				"ScenePath": "",
			},
			
			{
				"Name": "Columbus Lands in Americas",
				"Description": "Explore the new shore — gather relics before Jimpus corrupts the voyage.",
				"Year": "1492",
				"Completed": false,
				"ScenePath": "",
			},
			
		],
		
		"Relics": [
			
			{
				"Name": "Plague Cross",
				"Description": "A talisman hung on plague doors. A warning and a prayer.",
				"Icon": ""
			},
			
			{
				"Name": "Explorer’s Compass",
				"Description": "A brass compass used by Columbus, pointing beyond the horizon.",
				"Icon": ""
			},
			
		],
		
		"Boss": {
			
			"Name": "The Inquisitor",
			"Description": "A robed figure empowered by Jimpus to suppress truth. The Renaissance Key burns within his grasp.",
			"Health": 1000,
			"Completed": false,
			"ScenePath": "",
			
		}
		
	},
	
	"Industrial Revolution" : {
		
		"Events": [
			
			{
				"Name": "Steam Engine Unveiled",
				"Description": "Keep the valves in check and stop Jimpus from blowing the engine apart.",
				"Year": "1712",
				"Completed": false,
				"ScenePath": "",
			},
			
			{
				"Name": "First Photograph",
				"Description": "Hold the camera steady — preserve the first moment before Jimpus distorts the image.",
				"Year": "1826",
				"Completed": false,
				"ScenePath": "",
			},
			
		],
		
		"Relics": [
			
			{
				"Name": "Pressure Gauge",
				"Description": "An iron dial from the first steam engines.",
				"Icon": ""
			},
			
			{
				"Name": "Glass Plate",
				"Description": "The first photographic impression of time itself.",
				"Icon": ""
			},
			
		],
		
		"Boss": {
			
			"Name": "The Iron Titan",
			"Description": "A monstrous automaton powered by Jimpus’ malice. Its furnace holds the Industrial Key.",
			"Health": 1500,
			"Completed": false,
			"ScenePath": "",
			
		}
		
	},
	
	"Modern History" : {
		
		"Events": [
			
			{
				"Name": "Moon Landing",
				"Description": "Repair circuits in zero gravity while Jimpus bombards the module from the void.",
				"Year": "1969",
				"Completed": false,
				"ScenePath": "",
			},
			
			{
				"Name": "Fall of Berlin Wall",
				"Description": "Break down the wall of division before Jimpus’ guards tighten their grip.",
				"Year": "1989",
				"Completed": false,
				"ScenePath": "",
			},
			
		],
		
		"Relics": [
			
			{
				"Name": "Lunar Rock",
				"Description": "A shard of the moon brought back to Earth.",
				"Icon": ""
			},
			
			{
				"Name": "Wall Fragment",
				"Description": "A chipped piece of the Berlin Wall, symbolizing freedom.",
				"Icon": ""
			},
			
		],
		
		"Boss": {
			
			"Name": "The Shadow of Tomorrow",
			"Description": "A shifting figure made of smoke, steel, and fear, birthed by Jimpus to end history itself. Within it lies the Modern Era Key.",
			"Health": 3000,
			"Completed": false,
			"ScenePath": "",
			
		}
		
	},
	
	"Y2K" : {
		
		"Events": [],
		"Relics": [],
		"Boss": {
			
			"Name": "Jimpus",
			"Description": "heh.. my name's jimpus.. *fart*",
			"Health": 3000,
			"Completed": false,
			"ScenePath": "",
			
		}
		
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

var BASE_DATA : Dictionary = {
	
	
	
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

func testingFunction():
	
	# create table for Time Periods
	
	var tp_table = { 
		
		"id" : {"data_type": "int" , "primary_key": true , "not_null": true, "auto_increment": true},
		"name": {"data_type": "text"},
		"stage": {"data_type": "int"},
		
	}
	
	var full_rows = []
	
	for tp in TIME_PERIODS:
		# create a row for each tp [id , name , stage (0-3)* , ] * 0 first event -> 3 being entirely completed
		
		print(tp + "\n")
		
		for event_index in range(TIME_PERIODS[tp]["Events"].size()):
			
			var event = TIME_PERIODS[tp]["Events"][event_index]
			
			var event_row = {
				"name": event["Name"],
				"stage": 0,
			}
			
			full_rows.append(event_row)
	
	print(full_rows)
	print("\n")
#

# Connectors

func _ready() -> void:
	testingFunction()

#
