extends Node2D


var move: bool = false
var startPOS: Vector2
@export var spike_scene: PackedScene
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Ball.linear_velocity = Vector2(0,0)
	$Ball.contact_monitor = true
	$Ball.max_contacts_reported = 10
	$"Track 1".start()
	$"Track 2".start()
	$"Track 3".start()
	$"Track 4".start()
	$"Track 5".start()
	$"Track 6".start()

func _input(event: InputEvent) -> void:
	#Reload the level if 'R' is pressed
	if event.is_action_pressed("reload"):
		get_tree().reload_current_scene()
	elif event.is_action_pressed("jump"):
		if(!move):
			move = true
			if(get_node_or_null("Ball")):
				startPOS = $Ball.global_position
		

func _physics_process(delta: float) -> void:
	if(get_node_or_null("Ball")):
		if(move and ($Ball.global_position.y > (startPOS + Vector2(0,-10)).y)):
			$Ball.global_position = $Ball.global_position + Vector2(0, -128)
		else:
			$Ball.linear_velocity = Vector2(0,0)
			move = false
			
	#$spike.linear_velocity.x = -200


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
	get_tree().change_scene_to_file("res://level_9.tscn")


func _on_area_2d_2_body_entered(body: Node2D) -> void:
	body.queue_free()

func spawnCar(point, angle, speed):
	var car = spike_scene.instantiate()
	car.gravity_scale = 0
	car.position = point
	car.rotation = angle
	car.linear_damp_mode = 1
	car.name = "spike"
	add_child(car)
	car.name = "spike" 
	car.apply_central_impulse(Vector2(speed,0))

func _on_track_1_timeout() -> void:
	spawnCar(Vector2(1188,896), PI/2, -300)


func _on_track_2_timeout() -> void:
	spawnCar(Vector2(-64,768), -PI/2, 200)


func _on_track_3_timeout() -> void:
	spawnCar(Vector2(1188,640), PI/2, -400)


func _on_track_4_timeout() -> void:
	spawnCar(Vector2(1188,384), PI/2, -250)


func _on_track_5_timeout() -> void:
	spawnCar(Vector2(-64,258), -PI/2, 500)


func _on_track_6_timeout() -> void:
	spawnCar(Vector2(1188,128), PI/2, -200)
