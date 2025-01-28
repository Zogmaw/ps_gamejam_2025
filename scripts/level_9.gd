extends Node2D

@export var baloon_sceen: PackedScene
@export var baloon_buttsceen: PackedScene
var butt
var count: int = 1
var totalBallons: int = 4
var path
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#get_viewport().warp_mouse(Vector2(586,70))
	path = get_node("Path2D")
	#$Ball.contact_monitor = true
	#$Ball.max_contacts_reported = 10
	$Path2D/PathFollow2D/spike.contact_monitor = true
	$Path2D/PathFollow2D/spike.max_contacts_reported = 10

func _input(event: InputEvent) -> void:
	#Reload the level if 'R' is pressed
	if event.is_action_pressed("reload"):
		get_tree().reload_current_scene()

func _physics_process(delta: float) -> void:
	for follow in path.get_children():
		follow.set_progress(follow.get_progress() +200 * delta)

func _on_obsticle_object_destroyed() -> void:
	$break.play()

func _on_ball_ball_destroyed() -> void:
	$break.play()

func _on_rope_rope_destroyed() -> void:
	$snip.play()

func _on_goal_ball_in_goal() -> void:
	$goal.queue_free()
	$ballInGoal.visible = true
	butt.queue_free()

func _on_ball_in_goal_go_next() -> void:
	get_tree().change_scene_to_file("res://level_10.tscn")


func _on_timer_timeout() -> void:
	if (count < totalBallons):
		var baloon = baloon_sceen.instantiate()
		baloon.position = Vector2(1152, 576)
		var child = baloon.find_child('spike')
		child.contact_monitor = true
		child.max_contacts_reported = 10
		path.add_child(baloon)
		count += 1
	elif (count >= totalBallons):
		$Timer.stop()
		butt = baloon_buttsceen.instantiate()
		butt.position = Vector2(1152, 576)
		var child = butt.find_child('Ball')
		child.gravity_scale = 0
		child.contact_monitor = true
		child.max_contacts_reported = 10
		path.add_child(butt)
