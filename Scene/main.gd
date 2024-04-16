extends Node


const WARRIOR_START_POS := Vector2i(150, 485)
const CAM_START_POS 	:= Vector2i(576, 324)

var speed : float
const  START_SPEED : float = 10.0
const MAX_SPEED : int = 25
var screen_size : Vector2i

func _ready():
	screen_size = get_window().size
	new_game()

func new_game():
	$Warrior.position = WARRIOR_START_POS
	$Warrior.velocity = Vector2i(0,0)
	$Camera2D.position = CAM_START_POS
	$Ground.position = Vector2i(0,0)
	
func _process(delta):
	speed = START_SPEED
	
	$Warrior.position.x += speed
	$Camera2D.position.x += speed
	
	if $Camera2D.position.x - $Ground.position.x > screen_size.x * 1.5:
		$Ground.position.x += screen_size.x
