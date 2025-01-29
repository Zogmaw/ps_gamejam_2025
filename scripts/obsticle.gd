extends Node2D

signal object_destroyed
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.

func _on_area_2d_mouse_entered() -> void:
	object_destroyed.emit()
	queue_free()
