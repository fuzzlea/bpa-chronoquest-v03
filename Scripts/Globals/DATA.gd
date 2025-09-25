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
	
	"Stats": {
		
		"Health": 100,
		"Speed": 75,
		"Friction": 0.4,
		
		"Luck": 0,
		"DamageMod" : 1,
		"HealthMod": 1,
		"SpeedMod": 1,
		"CurrencyMod": 1,
		
	},
	
	"Inventory": [
		
		## WEAPONS
		
		{
			"Name": "Rusty Sword", 
			"Type": "Weapon", 
			"Rarity": "Common",
			"Value": 6, 
			"Description": "A battered sword from the ruined library’s armory. Not much, but it can cut.", 
			"Owned": 0 
		},
		
		{
			"Name": "Worn Dagger", 
			"Type": "Weapon", 
			"Rarity": "Common",
			"Value": 7, 
			"Description": "A chipped dagger once used by a scribe-turned-soldier. Quick but fragile.", 
			"Owned": 0 
		},
		
		{
			"Name": "Bronze Axe", 
			"Type": "Weapon", 
			"Rarity": "Uncommon",
			"Value": 15, 
			"Description": "A solid bronze axe, weighted for heavy swings. Reliable, if slow.", 
			"Owned": 0 
		},
		
		{
			"Name": "Iron Mace", 
			"Type": "Weapon", 
			"Rarity": "Uncommon",
			"Value": 18, 
			"Description": "A spiked mace that delivers crushing blows. Favored by the Keeper’s guards in ages past.", 
			"Owned": 0 
		},
		
		{
			"Name": "Steel Spear", 
			"Type": "Weapon", 
			"Rarity": "Rare",
			"Value": 35, 
			"Description": "A finely crafted spear with reach. Said to have pierced the armor of Jimpus’s soldiers before time itself was broken.", 
			"Owned": 0 
		},
		
		{
			"Name": "Knight’s Longsword", 
			"Type": "Weapon", 
			"Rarity": "Rare",
			"Value": 42, 
			"Description": "A shining longsword once carried by a temporal knight. Its balance and edge are unmatched among mortal blades.", 
			"Owned": 0 
		},
		
		{
			"Name": "Great Hammer", 
			"Type": "Weapon", 
			"Rarity": "Epic",
			"Value": 75, 
			"Description": "A massive two-handed hammer. Each swing rattles the air as if shaking the threads of time.", 
			"Owned": 0 
		},
		
		{
			"Name": "Halberd of Ages", 
			"Type": "Weapon", 
			"Rarity": "Epic",
			"Value": 95, 
			"Description": "A polearm etched with markings from forgotten eras. Strikes feel like echoes from across centuries.", 
			"Owned": 0 
		},
		
		{
			"Name": "Keeper’s Blade", 
			"Type": "Weapon", 
			"Rarity": "Legendary",
			"Value": 120, 
			"Description": "A mythic longsword, once wielded by a past Keeper of Time. Its edge never dulls, and it strikes as if guided by destiny.", 
			"Owned": 0 
		},
		
		{
			"Name": "Eternal Waraxe", 
			"Type": "Weapon", 
			"Rarity": "Legendary",
			"Value": 150, 
			"Description": "An axe said to have cleaved through battles across countless timelines. Every swing feels heavy with history.", 
			"Owned": 0 
		},
		
		## ARMOR
		
		{
			"Name": "Torn Cloth Tunic", 
			"Type": "Armor", 
			"Rarity": "Common",
			"Value": 5, 
			"Description": "A simple tunic salvaged from the ruins. Offers minimal protection, but better than nothing.", 
			"Owned": 0 
		},
		{
			"Name": "Leather Vest", 
			"Type": "Armor", 
			"Rarity": "Common",
			"Value": 7, 
			"Description": "Basic stitched leather armor. Light, flexible, and modestly protective.", 
			"Owned": 0 
		},
		{
			"Name": "Bronze Chestplate", 
			"Type": "Armor", 
			"Rarity": "Uncommon",
			"Value": 15, 
			"Description": "A solid bronze chestplate. Heavy, but it can turn aside most strikes.", 
			"Owned": 0 
		},
		{
			"Name": "Iron Chainmail", 
			"Type": "Armor", 
			"Rarity": "Uncommon",
			"Value": 20, 
			"Description": "Interlinked rings of iron. Provides steady defense against cuts and slashes.", 
			"Owned": 0 
		},
		{
			"Name": "Steel Armor", 
			"Type": "Armor", 
			"Rarity": "Rare",
			"Value": 35, 
			"Description": "Polished steel plating that shields the body well. Worn by the Keeper’s knights in ancient battles.", 
			"Owned": 0 
		},
		{
			"Name": "Knight’s Plate", 
			"Type": "Armor", 
			"Rarity": "Rare",
			"Value": 50, 
			"Description": "Full-body plate forged for a temporal knight. Nearly impenetrable, though heavy to wear.", 
			"Owned": 0 
		},
		{
			"Name": "Guardian’s Cuirass", 
			"Type": "Armor", 
			"Rarity": "Epic",
			"Value": 75, 
			"Description": "A cuirass blessed by Keepers of the past. Said to resonate with the heartbeat of time itself.", 
			"Owned": 0 
		},
		{
			"Name": "Warforged Battlegear", 
			"Type": "Armor", 
			"Rarity": "Epic",
			"Value": 100, 
			"Description": "Heavy, intricate armor reinforced with relic shards. Protects against nearly all forms of attack.", 
			"Owned": 0 
		},
		{
			"Name": "Mantle of Eternity", 
			"Type": "Armor", 
			"Rarity": "Legendary",
			"Value": 150, 
			"Description": "A shimmering mantle worn by the first Keeper of Time. Said to bend fate, letting its wearer shrug off mortal blows.", 
			"Owned": 0 
		},
		{
			"Name": "Titan’s Aegis", 
			"Type": "Armor", 
			"Rarity": "Legendary",
			"Value": 200, 
			"Description": "Enormous plate armor infused with timeless essence. Immovable, unbreakable, a wall against Jimpus himself.", 
			"Owned": 0 
		}
		
	]
	
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

func testInitFunction():
	
	## STATS [:x-emoji:] -> BASE_DATA["Stats"]
	
	## INVENTORY [:x-emoji:] -> BASE_DATA["Inventory"]
	
	pass
	
	## EVENTS [:check-emoji:] -> TIME_PERIODS["Events"]
	
	#var tp_table = { 
		#
		#"id" : {"data_type": "int" , "primary_key": true , "not_null": true, "auto_increment": true},
		#"time_period": {"data_type": "text"},
		#"event": {"data_type": "text"},
		#"stage": {"data_type": "int"},
		#
	#}
	#
	#var full_rows = []
	#
	#for tp in TIME_PERIODS:
		## create a row for each tp [id , name , stage (0-3)* , ] * 0 first event -> 3 being entirely completed
		#
		#print(tp + "\n")
		#
		#for event_index in range(TIME_PERIODS[tp]["Events"].size()):
			#
			#var event = TIME_PERIODS[tp]["Events"][event_index]
			#
			#var event_row = {
				#"time_period": tp,
				#"event": event["Name"],
				#"stage": 0,
			#}
			#
			#full_rows.append(event_row)
	#
	#print(full_rows)
	#print("\n")
#

# Connectors

func _ready() -> void:
	testInitFunction()

#
