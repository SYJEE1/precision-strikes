extends CharacterBody2D

const GRAVITY : int = 4200
const JUMP_SPEED : int = -1500

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	velocity.y += GRAVITY * delta
	if is_on_floor():
		$RunCol.disabled = false
		if Input.is_action_pressed("ui_up"):
			velocity.y = JUMP_SPEED
			#sound
		elif Input.is_action_just_pressed("crouch"):
			$AnimatedSprite2D.play("duck")
			$RunCol.disabled = true
		else:
			$AnimatedSprite2D.play("run")
	else:
		$AnimatedSprite2D.play("jump")
		
	move_and_slide()
