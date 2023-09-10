extends CharacterBody2D


const SPEED = 400.0
const TURNING_SPEED = 10
@onready var body = $Sprites/Car
@onready var wheels = [$Sprites/LeftWheel, $Sprites/RightWheel]

func _ready():
	var frames = body.texture.get_width() / body.region_rect.size.x
	
	body.region_rect.position.x = randi_range(0, frames - 1) * body.region_rect.size.x

func _physics_process(delta):
	var movement_direction = Input.get_axis("ui_down", "ui_up")
	if movement_direction:
		var wheel_rotation = wheels[0].rotation
		self.rotation += wheel_rotation / 10 * movement_direction
		if self.velocity.length() < 2 * SPEED:
			self.velocity.x += movement_direction * SPEED * sin(self.rotation) * delta
			self.velocity.y += movement_direction * SPEED * -cos(self.rotation) * delta
	else:
		self.velocity.x = move_toward(self.velocity.x, 0, SPEED * delta)
		self.velocity.y = move_toward(self.velocity.y, 0, SPEED * delta)

	var rotation_direction = Input.get_axis("ui_left", "ui_right")
	
	if rotation_direction:
		for wheel in wheels:
			wheel.rotation_degrees += TURNING_SPEED * rotation_direction
	else:
		for wheel in wheels:
			wheel.rotation_degrees = move_toward(wheel.rotation_degrees, 0, TURNING_SPEED)

	move_and_slide()
