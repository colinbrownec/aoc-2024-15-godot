extends Node2D

@onready var robot: CharacterBody2D = %Robot
@onready var boxes: Node = %Boxes
@onready var walls: Node = %Walls

const BOX = preload("res://box.tscn")
const WALL = preload("res://wall.tscn")
const SIZE = 16

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var txt = FileAccess.open("res://input.txt", FileAccess.READ).get_as_text().split("\n")
	#var robot = None
	#var instructions = ''

	for i in len(txt):
		var line = txt[i]
		if '#' in line:
			for j in len(line):
				var val = line[j]
				match val:
					'#':
						var wall = WALL.instantiate()
						wall.position.x = i * SIZE
						wall.position.y = j * SIZE
						walls.add_child(wall)
					'O':
						var box = BOX.instantiate()
						box.position.x = i * SIZE
						box.position.y = j * SIZE
						boxes.add_child(box)
					'@':
						robot.position.x = i * SIZE
						robot.position.y = j * SIZE
					_:
						pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
