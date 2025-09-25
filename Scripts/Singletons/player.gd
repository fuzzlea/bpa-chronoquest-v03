extends CharacterBody2D

# CONFIG

var CONFIG: Dictionary = {
	
	"BaseSpeed": 75,
	"BaseFriction": 0.4
	
}

#

# Signals

signal MODIFIER_ADDED
signal MODIFIER_REMOVED
signal ADD_MODIFIER(_name: String)
signal REMOVE_MODIFIER(_name: String)

#

# Exports

@export var DEBUG_MODE: bool = true

@export var Speed: int = CONFIG["BaseSpeed"]
@export var Dash_Cooldown: float = 500.0 # in ms
@export var Friction: float = CONFIG["BaseFriction"] # less -> more slidey

#

# Onreadys 

@onready var AnimatedSprite: AnimatedSprite2D = $AnimatedSprite2D

#

# Variables

var State: String = "idle"
var Direction: String = "down"
var _Input: Vector2
var Modifiers: Array = []

var Can_Move: bool = true
var Can_Dash: bool = true

var Currently_Animating: bool = false
var Currently_Dashing: bool = false:
	set(v):
		Currently_Dashing = v
		
		if v:
			await get_tree().create_timer(0.3).timeout
			Currently_Dashing = false

var Last_Dash: float = 0.0

#

# Functions

func handleDebug():
	if not DEBUG_MODE: return
	
	$TEMP.visible = true
	$TEMP/Label.text = State + " - " + Direction
	
	if Input.is_action_just_pressed("DEBUG-TEST1"): ADD_MODIFIER.emit("Speed III"); ADD_MODIFIER.emit("Slide III")

func handleMovement():
	if not Can_Move: return
	
	_Input = Vector2(
		Input.get_action_strength("Player-MoveRight") - Input.get_action_strength("Player-MoveLeft"),
		Input.get_action_strength("Player-MoveDown") - Input.get_action_strength("Player-MoveUp")
	)
	
	velocity = lerp(velocity, _Input.normalized() * Speed, Friction)
	
	move_and_slide()

func handleDash():
	if not Can_Dash: return
	if Input.is_action_just_pressed("Player-Dash"):
		if not (Time.get_ticks_msec() - Last_Dash) > Dash_Cooldown: return
		
		Currently_Dashing = true
		
		Last_Dash = Time.get_ticks_msec()
		velocity = _Input * 1000

func handleStateAndDir():
	if _Input == Vector2.ZERO:
		State = "idle"
	elif _Input != Vector2.ZERO && not Currently_Dashing:
		State = "walk"
	else:
		State = "dash"
	
	if _Input.x > 0: Direction = "right"; AnimatedSprite.flip_h = false
	elif _Input.x < 0: Direction = "left"; AnimatedSprite.flip_h = true
	
	if _Input.y > 0: Direction = "down"
	elif _Input.y < 0: Direction = "up"

func handleAnims():
	if not AnimatedSprite.sprite_frames.has_animation(State + "_" + Direction): return
	
	AnimatedSprite.play(State + "_" + Direction)
	Currently_Animating = true

func findModifierInActive(_name):
	for mod in Modifiers:
		if mod["Name"] == _name: return mod
	
	return null

func addModifier(_name: String):
	if findModifierInActive(_name) != null: return
	
	var modifier = DATA.returnModifier(false, _name)
	
	Modifiers.append(modifier.duplicate())
	MODIFIER_ADDED.emit()

func removeModifier(_name: String):
	if findModifierInActive(_name) == null: return
	
	var modifier = findModifierInActive(_name)
	
	Modifiers.erase(modifier)
	MODIFIER_REMOVED.emit()

func handleModifiers():
	print(Modifiers)

func connectSignals():
	ADD_MODIFIER.connect(func(_name: String): addModifier(_name))
	REMOVE_MODIFIER.connect(func(_name: String): removeModifier(_name))
	
	MODIFIER_ADDED.connect(func(): handleModifiers())
	MODIFIER_REMOVED.connect(func(): handleModifiers())

#

# Connectors

func _physics_process(_delta: float) -> void:
	handleMovement()
	handleDash()
	
	handleStateAndDir()
	handleAnims()
	
	handleDebug()
	

func _ready() -> void:
	connectSignals()

#
