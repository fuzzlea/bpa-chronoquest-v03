extends TextureButton

#

signal HOVER
signal CLICK
signal PRESS
signal MOUSE_LEAVE

#

#

@export var CurrentItem : String = ""

#

#

func scaleAnim(x : float, time : float = 0.1):
	
	var t = self.create_tween().set_trans(Tween.TRANS_BACK).set_ease(Tween.EASE_OUT)
	t.tween_property(self, "scale", Vector2(x,x), time)
	
	return t

func hover():
	scaleAnim(1.1)

func resetScale():
	scaleAnim(1)

func press():
	scaleAnim(0.95)

func click():
	resetScale()
	
	# do other

func init():
	modulate = Color.from_rgba8(0,0,0,100)

#

# 

func _ready():
	
	HOVER.connect(hover)
	CLICK.connect(click)
	PRESS.connect(press)
	MOUSE_LEAVE.connect(resetScale)
	
	mouse_entered.connect(func(): HOVER.emit())
	mouse_exited.connect(func(): MOUSE_LEAVE.emit())
	button_down.connect(func(): PRESS.emit())
	pressed.connect(func(): CLICK.emit())

#
