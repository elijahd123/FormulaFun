extends Node2D

@onready var wheels = [$LeftWheel, $RightWheel]
var wheel_rotation_boundary = 50

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	for wheel in wheels:
		if wheel.rotation_degrees > wheel_rotation_boundary:
			wheel.rotation_degrees = wheel_rotation_boundary
		elif wheel.rotation_degrees < -wheel_rotation_boundary:
			wheel.rotation_degrees = -wheel_rotation_boundary
