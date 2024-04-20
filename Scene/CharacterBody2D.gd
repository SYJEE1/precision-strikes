extends CharacterBody2D

const GRAVITY : int = 8000
const JUMP_SPEED : int = -1800
var attack
var health
var timer

func _ready():
	attack = get_node("Area2D/AttCol")
	health = get_node("../Heart")
	timer = get_node("../Timer")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	velocity.y += GRAVITY * delta
	if  is_on_floor():
		$RunCol.disabled = false
		attack.disabled = true
		if Input.is_action_pressed("attack"):
			$SwordSound.play()
			$AnimatedSprite2D.play("attack")
			attack.disabled = false
			velocity.x = 0
		elif Input.is_action_pressed("forward"):
			$AnimatedSprite2D.play("run") 
		else:
			$AnimatedSprite2D.play("idle")
	
	move_and_slide()

func _on_area_2d_2_area_shape_entered(area_rid, area, area_shape_index, local_shape_index):
	health.hp -= 1
	timer.wait_time = 3
	
