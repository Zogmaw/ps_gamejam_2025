extends RigidBody2D

signal ball_destroyed

func _ready() -> void:
	for child in self.get_children():
		if not child.has_meta("original_scale"):
			# save original scale and position as a reference for future modifications
			child.set_meta("original_scale",child.get_scale())
			child.set_meta("original_pos",child.get_position())
		var original_scale = child.get_meta("original_scale")
		var original_pos = child.get_meta("original_pos")
		# When scaled, position also has to be changed to keep offset
		child.set_position(original_pos * scale)
		child.set_scale(original_scale * scale)

func _on_area_2d_mouse_entered() -> void:
	ball_destroyed.emit()
	queue_free()

func _on_body_entered(body: Node) -> void:
	if(body.name.containsn("spike")):
		ball_destroyed.emit()
		queue_free()
