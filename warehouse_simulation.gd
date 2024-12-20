extends Node2D

@onready var boxes: Node = %Boxes
@onready var walls: Node = %Walls

const SCALE = 16
const BOX = preload("res://box.tscn")
const WALL = preload("res://wall.tscn")
const ROBOT = preload("res://robot.tscn")
var robot: Robot

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var txt = FileAccess.open("res://input.txt", FileAccess.READ).get_as_text().split("\n")
	robot = ROBOT.instantiate()
	#var instructions = ''

	for i in len(txt):
		var line = txt[i]
		if '#' in line:
			for j in len(line):
				var val = line[j]
				match val:
					'#':
						var wall = WALL.instantiate()
						wall.position.x = i * SCALE
						wall.position.y = j * SCALE
						walls.add_child(wall)
					'O':
						var box = BOX.instantiate()
						box.position.x = i * SCALE
						box.position.y = j * SCALE
						boxes.add_child(box)
					'@':
						robot.position.x = i * SCALE
						robot.position.y = j * SCALE
						self.add_child(robot)
					_:
						pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
