extends Node

var slime = preload("res://Scene/slime.tscn")
var enemy_types := [slime]
var enemies : Array

const WARRIOR_START_POS := Vector2i(150, 485)
const CAM_START_POS 	:= Vector2i(576, 324)
var score : int
const SCORE_MODIFIER : int = 10
var speed : float
const  START_SPEED : float = 6.0
const MAX_SPEED : int = 25
var screen_size : Vector2i
var game_running : bool
var ground_height : int
var last_en

func _ready():
	screen_size = get_window().size
	ground_height = $Ground.get_node("Sprite2D").texture.get_height()
	new_game()

func new_game():
	score = 0
	show_score()
	game_running = false
	
	$Warrior.position = WARRIOR_START_POS
	$Warrior.velocity = Vector2i(0,0)
	$Camera2D.position = CAM_START_POS
	$Ground.position = Vector2i(0,0)
	
func _process(delta):
	if game_running:
		speed = START_SPEED
		if Input.is_action_pressed("forward"):
			$Warrior.position.x += speed
			$Camera2D.position.x += speed
		if Input.is_action_pressed("attack"):
			speed = 0
			$Warrior.position.x -= speed
			$Camera2D.position.x -= speed
		

		show_score()
		if $Camera2D.position.x - $Ground.position.x > screen_size.x * 1.5:
			$Ground.position.x += screen_size.x
	else:
		if Input.is_action_pressed("ui_accept"):
			game_running = true

func show_score():
	$HUD.get_node("ScoreLabel").text = "SCORE: " + str(score / SCORE_MODIFIER)
