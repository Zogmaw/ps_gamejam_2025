extends Node2D

var remainingFruit: int = 12
@export var fruit: PackedScene

func _ready() -> void:
	$Label.text = str("Break ", remainingFruit, " more watermelon")
	$melonTimer.start()

func _input(event: InputEvent) -> void:
	#Reload the level if 'R' is pressed
	if event.is_action_pressed("reload"):
		get_tree().reload_current_scene()



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
	get_tree().change_scene_to_file("res://level_8.tscn")


func _on_fruit_body_fruit_destroyed() -> void:
	$slice.play()
	remainingFruit -= 1
	$Label.text = str("Break ", remainingFruit, " more watermelon")
	if(remainingFruit < 1):
		launchButton()
		$melonTimer.stop()
	
func launchButton() -> void:
	$Ball.apply_central_impulse(Vector2(0,-1500))


func _on_melon_timer_timeout() -> void:
	var melon = fruit.instantiate()
	var melon_spawn = $melonPath/melonSpawnLocation
	melon_spawn.progress_ratio = randf()
	var direction = melon_spawn.rotation + PI / 2
	melon.position = melon_spawn.position
	direction += randf_range(-PI / 4, PI / 4)
	melon.rotation = direction
	var velocity = Vector2(randf_range(700.0, 700.0), 0.0)
	melon.linear_velocity = velocity.rotated(direction)
	melon.fruit_destroyed.connect(_on_fruit_body_fruit_destroyed)
	add_child(melon)
