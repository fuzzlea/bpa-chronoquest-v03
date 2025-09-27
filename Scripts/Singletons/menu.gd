extends CanvasLayer

# Signals

signal OPEN
signal CLOSE

#

# Onready

@onready var BG : TextureRect = $BG

#

func open():
	
	visible = true
	get_parent().emit_signal("DISABLE_MOVEMENT")
	
	var t = self.create_tween().set_trans(Tween.TRANS_BACK).set_ease(Tween.EASE_OUT)
	t.tween_property(BG, "modulate", Color.from_rgba8(0,0,0,200), 0.2)

func close():
	
	var t = self.create_tween().set_trans(Tween.TRANS_BACK).set_ease(Tween.EASE_OUT)
	t.tween_property(BG, "modulate", Color.from_rgba8(0,0,0,0), 0.2)
	
	await t.finished
	
	get_parent().emit_signal("ENABLE_MOVEMENT")
	visible = false

func init():
	visible = false
	BG.modulate = Color.from_rgba8(0,0,0,0)

#

func _ready():
	
	init()
	
	OPEN.connect(open)
	CLOSE.connect(close)

#
