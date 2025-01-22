extends Node2D

var inGoal: bool = false
var goalPOS: Vector2
signal goNext

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if(inGoal):
		var speed: int = 1
		position = position.move_toward(goalPOS, 100 * delta) 
		#find_child("ballBody").move_and_collide(goalPOS)
		

func _on_area_2d_input_event(_viewport: Node, event: InputEvent, _shape_idx: int) -> void:
	if (event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.is_pressed() and inGoal):
		goNext.emit()
