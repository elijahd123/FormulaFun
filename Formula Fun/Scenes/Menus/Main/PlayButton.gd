extends Area2D

@onready var loadingBar = $TextureProgressBar
@onready var playerBody = $"../Car"

func _on_body_entered(body):
	if body.name == playerBody.name:
		loadingBar.value = 100
		loadingBar.visible = true

func _process(_delta):
	if loadingBar.visible:
		loadingBar.set_position(playerBody.position - self.position - Vector2(loadingBar.size.x/2, loadingBar.size.y/2))
		if loadingBar.value > 0:
			loadingBar.value -= 1
			if loadingBar.value == 0:
				finished_loading()

func finished_loading():
	loadingBar.value = 100
	loadingBar.visible = false
	get_tree().change_scene_to_file("res://Scenes/Entities/Car/car.tscn")

func _on_body_exited(body):
	loadingBar.value = 100
	loadingBar.visible = false
	
