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
		
		"Events": [
			
			{
				"Name": "Discovery of Fire",
				"Description": "The flames are spreading — collect burning branches before they burn out while driving away Jimpus' meddling creatures.",
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
			
			{
				"Name": "Wolf Domestication",
				"Description": "A wolf pup has wandered close — lure it with food and protect it from Jimpus' twisted pack. The bond of loyalty must remain intact.",
				"Year": "30kya",
				"Completed": false,
				"ScenePath": "",
			},
			
			{
				"Name": "Ice Age Hunt",
				"Description": "Mammoths roam the frozen plains. Restore the hunt, fend off icy chaos, and keep humanity’s survival alive.",
				"Year": "20kya",
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
			
			{
				"Name": "Wolf Collar",
				"Description": "A braided cord symbolizing the bond between man and wolf.",
				"Icon": ""
			},
			
			{
				"Name": "Mammoth Tusk",
				"Description": "A shard of ivory holding the strength of the great Ice Age hunt.",
				"Icon": ""
			},
			
		],
		
		"Boss": {
			
			"Name": "The Frozen Titan",
			"Description": "A colossal mammoth corrupted by Jimpus' frost. Within its heart lies the Pre-History Key. Defeat it and restore the age of beginnings.",
			"Health": 120,
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
			
			{
				"Name": "Early Village Fire",
				"Description": "Save villagers from chaos — extinguish spreading flames while Jimpus' trickery fuels the blaze.",
				"Year": "4.5kya",
				"Completed": false,
				"ScenePath": "",
			},
			
			{
				"Name": "Trade Caravan",
				"Description": "The road is perilous — escort a caravan safely across the land while fending off raiders and wolves.",
				"Year": "4kya",
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
			
			{
				"Name": "Village Torch",
				"Description": "A charred torch that symbolizes community resilience.",
				"Icon": ""
			},
			
			{
				"Name": "Caravan Token",
				"Description": "A decorated trinket carried along ancient trade routes.",
				"Icon": ""
			},
			
		],
		
		"Boss": {
			
			"Name": "The Beast of Burden",
			"Description": "A colossal ox, twisted into fury by Jimpus. Inside its harness lies the Stone Age Key.",
			"Health": 130,
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
			
			{
				"Name": "Trojan War",
				"Description": "The horse must remain hidden — protect your soldiers from Jimpus' hordes outside the walls of Troy.",
				"Year": "1.2kya",
				"Completed": false,
				"ScenePath": "",
			},
			
			{
				"Name": "Bronze Age Collapse",
				"Description": "The world falls into fire — escape burning cities while retrieving fragments of lost knowledge.",
				"Year": "1.1kya",
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
			
			{
				"Name": "Trojan Spear",
				"Description": "A weapon said to have pierced the fate of Troy.",
				"Icon": ""
			},
			
			{
				"Name": "Charred Scroll",
				"Description": "A half-burned record from the collapse — fragile but vital.",
				"Icon": ""
			},
			
		],
		
		"Boss": {
			
			"Name": "The Colossus",
			"Description": "An enormous bronze guardian animated by Jimpus. Within its chestplate lies the Bronze Age Key.",
			"Health": 150,
			"Completed": false,
			"ScenePath": "",
			
		}
		
	},
	
	"Middle Ages" : {
		
		"Events": [
			
			{
				"Name": "Viking Raid on Lindisfarne",
				"Description": "Defend sacred relics from Jimpus’ raiding warband of Vikings.",
				"Year": "793",
				"Completed": false,
				"ScenePath": "",
			},
			
			{
				"Name": "Signing of Magna Carta",
				"Description": "The parchment must survive — stop Jimpus’ knights from tearing it apart before it’s signed.",
				"Year": "1215",
				"Completed": false,
				"ScenePath": "",
			},
			
			{
				"Name": "Mongols Sack Baghdad",
				"Description": "The libraries burn — save scrolls from the flames before Jimpus’ shadows consume them.",
				"Year": "1258",
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
				"Name": "Monk’s Codex",
				"Description": "A preserved manuscript saved from raiders.",
				"Icon": ""
			},
			
			{
				"Name": "Sealed Charter",
				"Description": "The Magna Carta’s seal, carrying the weight of justice.",
				"Icon": ""
			},
			
			{
				"Name": "Golden Scroll",
				"Description": "One of Baghdad’s illuminated texts, glowing with wisdom.",
				"Icon": ""
			},
			
			{
				"Name": "Longbow String",
				"Description": "A reinforced bowstring — small, but decisive in battle.",
				"Icon": ""
			},
			
		],
		
		"Boss": {
			
			"Name": "The Black Knight",
			"Description": "A towering knight clad in cursed armor forged by Jimpus. Slay him to recover the Middle Ages Key.",
			"Health": 160,
			"Completed": false,
			"ScenePath": "",
			
		}
		
	},
	
	"Renaissance" : {
		
		"Events": [
			
			{
				"Name": "Printing of Gutenberg Bible",
				"Description": "Assemble type pieces and defend the press from Jimpus’ saboteurs.",
				"Year": "1455",
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
			
			{
				"Name": "Galileo’s Trial",
				"Description": "Smuggle Galileo’s telescope past guards in Jimpus’ pay.",
				"Year": "1633",
				"Completed": false,
				"ScenePath": "",
			},
			
			{
				"Name": "Black Death",
				"Description": "Deliver medicine and prayers to plague-stricken villagers while Jimpus spreads pestilence.",
				"Year": "1347",
				"Completed": false,
				"ScenePath": "",
			},
			
		],
		
		"Relics": [
			
			{
				"Name": "Printing Press Gear",
				"Description": "A small cog that turned the tide of knowledge.",
				"Icon": ""
			},
			
			{
				"Name": "Explorer’s Compass",
				"Description": "A brass compass used by Columbus, pointing beyond the horizon.",
				"Icon": ""
			},
			
			{
				"Name": "Galileo’s Lens",
				"Description": "The glass eye that saw the heavens.",
				"Icon": ""
			},
			
			{
				"Name": "Plague Cross",
				"Description": "A talisman hung on plague doors — a warning and a prayer.",
				"Icon": ""
			},
			
		],
		
		"Boss": {
			
			"Name": "The Inquisitor",
			"Description": "A robed figure empowered by Jimpus to suppress truth. The Renaissance Key burns within his grasp.",
			"Health": 170,
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
			
			{
				"Name": "Transcontinental Railroad",
				"Description": "Lay the tracks quickly while fending off Jimpus’ stampeding beasts.",
				"Year": "1869",
				"Completed": false,
				"ScenePath": "",
			},
			
			{
				"Name": "Factory Fire",
				"Description": "Save trapped workers before Jimpus’ flames consume the factory.",
				"Year": "1911",
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
			
			{
				"Name": "Rail Spike",
				"Description": "A steel spike that united a continent.",
				"Icon": ""
			},
			
			{
				"Name": "Charred Gear",
				"Description": "A scorched machine part saved from the flames.",
				"Icon": ""
			},
			
		],
		
		"Boss": {
			
			"Name": "The Iron Titan",
			"Description": "A monstrous automaton powered by Jimpus’ malice. Its furnace holds the Industrial Key.",
			"Health": 190,
			"Completed": false,
			"ScenePath": "",
			
		}
		
	},
	
	"Modern History" : {
		
		"Events": [
			
			{
				"Name": "Titanic Sinks",
				"Description": "Guide survivors to safety before Jimpus drags them into the icy depths.",
				"Year": "1912",
				"Completed": false,
				"ScenePath": "",
			},
			
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
			
			{
				"Name": "Chernobyl Meltdown",
				"Description": "Contain the reactor before Jimpus’ corruption poisons the future.",
				"Year": "1986",
				"Completed": false,
				"ScenePath": "",
			},
			
		],
		
		"Relics": [
			
			{
				"Name": "Frozen Locket",
				"Description": "A keepsake from the icy waters of the Titanic.",
				"Icon": ""
			},
			
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
			
			{
				"Name": "Radiant Core",
				"Description": "A glowing fragment of the reactor — dangerous, yet vital.",
				"Icon": ""
			},
			
		],
		
		"Boss": {
			
			"Name": "The Shadow of Tomorrow",
			"Description": "A shifting figure made of smoke, steel, and fear, birthed by Jimpus to end history itself. Within it lies the Modern Era Key.",
			"Health": 220,
			"Completed": false,
			"ScenePath": "",
			
		}
		
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
