extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass
	
func _input(event: InputEvent) -> void:
	#Reload the level if 'R' is pressed
	if event.is_action_pressed("reload"):
		get_tree().reload_current_scene()
	elif event.is_action_pressed("music"):
		if (Music.playing):
			Music.stop()
		else:
			Music.play()

func _on_obsticle_object_destroyed() -> void:
	$break.play()

func _on_ball_ball_destroyed() -> void:
	$break.play()

func _on_rope_rope_destroyed() -> void:
	$snip.play()

func _on_goal_ball_in_goal() -> void:
	$Ball.queue_free()
	$goal.queue_free()
	$ballInGoal.visible = true
	$ballInGoal/onVisible.play()

func _on_ball_in_goal_go_next() -> void:
	get_tree().change_scene_to_file("res://level_4.tscn")
