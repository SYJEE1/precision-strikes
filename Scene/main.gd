extends Node

var slime = preload("res://Scene/slime.tscn")
var enemy_types := [slime]
var enemies : Array

const WARRIOR_START_POS := Vector2i(150, 485)
const CAM_START_POS 	:= Vector2i(576, 324)
var score : int
const SCORE_MODIFIER : int = 1
var speed : float
const  START_SPEED : float = 6.0
const MAX_SPEED : int = 25
var screen_size : Vector2i
var game_running : bool
var ground_height : int
var last_en
var health


func _ready():
	health = get_node("Heart")
	screen_size = get_window().size
	ground_height = $Ground.get_node("Sprite2D").texture.get_height()
	$GameOver.get_node("Button").pressed.connect(new_game)
	new_game()

func new_game():
	health.hp = 2
	health.hp2.show()
	health.has_freed_hp2 = false
	score = 0
	show_score()
	game_running = false
	get_tree().paused = false
	
	$Timer.start()
	$BGM.play()
	$Warrior.position = WARRIOR_START_POS
	$Warrior.velocity = Vector2i(0,0)
	$Camera2D.position = CAM_START_POS
	$Ground.position = Vector2i(0,0)
	
	$HUD.get_node("StartLabel").show()
	
	$GameOver.hide()
	
	
func _process(delta):
	if health.hp <= 0:
		game_over()
	if game_running:
		speed = START_SPEED
		if Input.is_action_pressed("forward"):
			$Warrior.position.x += speed
			$Camera2D.position.x += speed
		if Input.is_action_just_pressed("attack"):
			speed = 1
			$Warrior.position.x -= speed
			$Camera2D.position.x -= speed
		
		show_score()
		if $Camera2D.position.x - $Ground.position.x > screen_size.x * 1.5:
			$Ground.position.x += screen_size.x
	else:
		if Input.is_action_pressed("ui_accept"):
			game_running = true
			$HUD.get_node("StartLabel").hide()
func show_score():
	$HUD.get_node("ScoreLabel").text = "SCORE: " + str(score)
	
func spawn_slime():
	var new_slime = slime.instantiate()
	var warrior_position = $Warrior.position
	new_slime.position = Vector2i(warrior_position.x + 1200, 510)
	new_slime.scale = Vector2(4, 4)
	var current_time = $Timer.wait_time
	$Timer.wait_time = current_time - (score * 0.05)
	if score > 60:
		$Timer.wait_time = 0.20
	elif score > 100:
		$Timer.wait_time = 0.14
	print($Timer.wait_time)
	add_child(new_slime)


func _on_timer_timeout():
	spawn_slime()

func game_over():
	get_tree().paused = true
	game_running = false
	$GameOver.show()
