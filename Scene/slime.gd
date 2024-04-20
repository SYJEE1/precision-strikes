extends CharacterBody2D

var main_node

func _ready():
	main_node = get_node("/root/Main")

func _on_animated_sprite_2d_animation_finished():
	queue_free()

func _on_area_2d_area_entered(area):
	if area.is_in_group("charac"):
		$AnimatedSprite2D.play("death")
		$SlimeCol.queue_free()
		$Area2D/SlimeCol.queue_free()
		main_node.score += main_node.SCORE_MODIFIER
