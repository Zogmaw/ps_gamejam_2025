extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Ball.goalPOS = $goal.position
	$Ball.goalPOS.y = $Ball.goalPOS.y - 220

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if($Ball.position == $goal.position):
		$Ball.freeze = true
	
func _input(event: InputEvent) -> void:
	#Reload the level if 'R' is pressed
	if event.is_action_pressed("reload"):
		get_tree().reload_current_scene()

func _on_button_pressed() -> void:
	#Go to next level
	print('Clicked')


func _on_obsticle_object_destroyed() -> void:
	$break.play()


func _on_goal_ball_in_goal() -> void:
	var bb: Node = $Ball.find_child("ballBody")
	bb.gravity_scale = 0
	bb.linear_velocity = Vector2(0,0)
	bb.angular_velocity = 0
	$Ball.inGoal = true



func _on_ball_go_next() -> void:
	get_tree().change_scene_to_file("res://level_2.tscn")
