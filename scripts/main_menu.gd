extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_play_pressed() -> void:
	get_tree().change_scene_to_file("res://level_1.tscn")


func _on_how_to_play_pressed() -> void:
	get_tree().change_scene_to_file("res://how_to_play.tscn")


func _on_exit_pressed() -> void:
	get_tree().change_scene_to_file("res://credits.tscn")


func _on_toggle_music_pressed() -> void:
	if (Music.playing):
		Music.stop()
	else:
		Music.play()
