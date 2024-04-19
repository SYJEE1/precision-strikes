extends Node

const WARRIOR_START_POS := Vector2i(150, 485)
const CAM_START_POS := Vector2i(576, 324)

var speed: float = START_SPEED
const START_SPEED: float = 6.0
const MAX_SPEED: float = 24.0
var screen_size: Vector2i

func _ready():
	screen_size = get_viewport().size
	new_game()

func new_game():
	$Warrior.position = WARRIOR_START_POS
	$Warrior.velocity = Vector2i(0, 0)
	$Camera2D.position = CAM_START_POS
	$Ground.position = Vector2i(0, 0)
	speed = START_SPEED

func _process(delta):
	if Input.is_action_pressed("forward"):
		$Warrior.position.x += speed
		$Camera2D.position.x += speed
	if Input.is_action_pressed("attack"):
		$Warrior.position.x -= speed
		$Camera2D.position.x -= speed
	if $Camera2D.position.x - $Ground.position.x > screen_size.x * 1.5:
		$Ground.position.x += screen_size.x

func _input(event):
	if event.is_action_pressed("faster"):
		increase_speed()

func increase_speed():
	speed += 2.0
	speed = min(speed, MAX_SPEED)