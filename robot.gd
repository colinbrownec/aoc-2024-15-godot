extends CharacterBody2D
class_name Robot

const SCALE = 16
const SPEED = 8.0
var target_pos: Vector2
var target_dir: Vector2

func _ready() -> void:
	target_pos = position

func _process(_delta: float) -> void:
	if ['ui_left', 'ui_right', 'ui_up', 'ui_down'].any(Input.is_action_just_pressed):
		target_dir = Input.get_vector('ui_left', 'ui_right', 'ui_up', 'ui_down')
		target_pos += target_dir * SCALE

func _physics_process(_delta: float) -> void:
	#var input_dir = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	#var collision = move_and_collide(input_dir * SPEED)
	if position != target_pos:

		var collision = move_and_collide(target_dir, true)
		if collision:
			if collision.get_collider() is Box:
				var box = collision.get_collider() as Box
				box.apply_central_impulse(target_dir * 1000)
				#print(box)
			#if collision is Wall:
				#print(collision as Wall)
		else:
			position += target_dir
