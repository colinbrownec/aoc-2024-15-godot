extends CharacterBody2D


const SPEED = 8.0

func _physics_process(delta: float) -> void:
	var input_dir = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	var collision = move_and_collide(input_dir * SPEED)
	if collision:
		if collision.get_collider() is Box:
			var box = collision.get_collider() as Box
			box.apply_central_impulse(input_dir)
			print(box)
		#if collision is Wall:
			#print(collision as Wall)
