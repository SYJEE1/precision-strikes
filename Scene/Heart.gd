extends CanvasLayer

var hp1
var hp2
var hp = 2
var has_freed_hp2 = false
# Called when the node enters the scene tree for the first time.
func _ready():
	hp1 = get_node("Heart1")
	hp2 = get_node("Heart2")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if hp == 1:
		if not has_freed_hp2: # Check the flag
			hp2.hide()
			has_freed_hp2 = true # Set the flag to true
