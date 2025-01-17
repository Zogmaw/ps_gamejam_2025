extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Button.visible = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://main_menu.tscn")


func _on_obsticle_object_destroyed() -> void:
	$break.play()
	$Button.visible = true
	$Button.disabled = false
