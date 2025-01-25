extends RigidBody2D

signal rope_destroyed
# Called when the node enters the scene tree for the first time.
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


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_area_2d_2_mouse_entered() -> void:
	rope_destroyed.emit()
	queue_free()


func _on_body_entered(body: Node) -> void:
	if(body.name.containsn("spike")):
		queue_free()
