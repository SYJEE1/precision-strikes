extends CharacterBody2D

const GRAVITY : int = 8000
const JUMP_SPEED : int = -1800

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	velocity.y += GRAVITY * delta
	if  is_on_floor():
		var attack = get_node("Area2D/AttCol")
		$RunCol.disabled = false
		attack.disabled = true
		if Input.is_action_pressed("attack"):
			$AnimatedSprite2D.play("attack")
			attack.disabled = false
			velocity.x = 0
		elif Input.is_action_pressed("forward"):
			$AnimatedSprite2D.play("run")
		else:
			$AnimatedSprite2D.play("idle")
	
	move_and_slide()
