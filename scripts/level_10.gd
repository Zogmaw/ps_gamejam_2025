extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

func _input(event: InputEvent) -> void:
	#Reload the level if 'R' is pressed
	if event.is_action_pressed("reload"):
		get_tree().reload_current_scene()


func _on_nuke_button_go_next() -> void:
	get_tree().change_scene_to_file("res://level_end.tscn")


func _on_glass_glass_destroyed() -> void:
	$shatter.play()
