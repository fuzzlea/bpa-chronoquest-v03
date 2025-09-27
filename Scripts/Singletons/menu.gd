extends CanvasLayer
#

signal OPEN
signal CLOSE

#

func open():
	visible = true
	
	get_parent().emit_signal("DISABLE_MOVEMENT")

func close():
	visible = false
	
	get_parent().emit_signal("ENABLE_MOVEMENT")

#

func _ready():
	OPEN.connect(open)
	CLOSE.connect(close)
	
	CLOSE.emit()

#
