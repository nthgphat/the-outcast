## Acts as an overlay for any amount of child Control nodes that, when clicked outside, hides all of them.
## This is done by storing a secret Control node in the script and adding it as a child node, then moving it to the first position.
## Since the child Control at the beginning position receives GUI input last, all other child Control nodes of this overlay take GUI input first, then the overlay.
## Useful for panels that can be closed by clicking outside of them.
extends CanvasLayer
class_name G_PanelOverlay


var color :
	get:
		return _private_____ctrl.color
	set(new_color):
		_private_____ctrl.color = new_color

var click_to_escape : bool = true


var _private_____ctrl = ColorRect.new()


func _ready():
	get_viewport().size_changed.connect(_on_window_resize)
	_on_window_resize()
	_private_____ctrl.color = Color(0, 0, 0, 0)
	_private_____ctrl.gui_input.connect(func(event: InputEvent) -> void:
		if click_to_escape && (event is InputEventMouseButton and event.pressed):
			hide()
	)

	add_child(_private_____ctrl, false, Node.INTERNAL_MODE_FRONT)


func _on_window_resize():
	_private_____ctrl.position = Vector2(0, 0)
	_private_____ctrl.size = get_viewport().get_visible_rect().size
