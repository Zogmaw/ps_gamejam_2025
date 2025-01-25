extends Node2D

func _on_back_pressed() -> void:
	get_tree().change_scene_to_file("res://main_menu.tscn")

func _on_obsticle_object_destroyed() -> void:
	$break.play()

func _on_rope_rope_destroyed() -> void:
	$snip.play()

func _on_ball_body_ball_destroyed() -> void:
	$break.play()
