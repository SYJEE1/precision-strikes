extends CharacterBody2D

const GRAVITY : int = 8000
const JUMP_SPEED : int = -1800

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	velocity.y += GRAVITY * delta
	if  is_on_floor():
		$RunCol.disabled = false
		if Input.is_action_pressed("jump"):
			velocity.y = JUMP_SPEED
		elif Input.is_action_just_pressed("duck"):
			$AnimatedSprite2D.play("duck")
			$RunCol.disabled = true
		elif Input.is_action_just_pressed("attack"):
			$AnimatedSprite2D.play("attack")
			$RunCol.disabled = true
		else:
			$AnimatedSprite2D.play("run")
	
	else:
		$AnimatedSprite2D.play("jump")
		
	move_and_slide()
