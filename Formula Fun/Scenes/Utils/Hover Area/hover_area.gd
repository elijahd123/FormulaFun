extends Area2D

@onready var loadingBar = $TextureProgressBar
@onready var playerBody # = $...

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
	loadingBar.value = 0
	loadingBar.visible = false
	# Do Something

func _on_body_exited(body):
	loadingBar.value = 100
	loadingBar.visible = false
