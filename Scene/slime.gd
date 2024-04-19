extends CharacterBody2D

func _on_animated_sprite_2d_animation_changed():
	$SlimeCol.disabled = true

func _on_animated_sprite_2d_animation_finished():
	
	queue_free()

func _on_area_2d_area_shape_entered(area_rid, area, area_shape_index, local_shape_index):
	$AnimatedSprite2D.play("death")
	print("hello")
