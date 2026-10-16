extends Node2D

@onready var garlic_container: HBoxContainer = $GarlicContainer
@onready var garlic: TextureRect = $GarlicContainer/Garlic
@onready var garlic2: TextureRect = $GarlicContainer/Garlic2
@onready var garlic3: TextureRect = $GarlicContainer/Garlic3
@onready var garlic4: TextureRect = $GarlicContainer/Garlic4
@onready var garlic5: TextureRect = $GarlicContainer/Garlic5
@onready var level: RichTextLabel = $Level
@onready var timer: RichTextLabel = $Timer

var time

func _ready() -> void:
	await Timer(5.0)
	
	if Global.minigames_done < 3:
		Global.minigames_done = Global.minigames_done +1
		get_tree().change_scene_to_file("res://scenes/minigame_" + str(Global.minigames_done) + ".tscn")
		
	else:
		get_tree().change_scene_to_file("res://scenes/tite_screen.tscn")

func _process(delta: float) -> void:
	match Global.lives:
		4:
			garlic.hide()
		3:
			garlic.hide()
			garlic2.hide()
		2:
			garlic.hide()
			garlic2.hide()
			garlic3.hide()
		1:
			garlic.hide()
			garlic2.hide()
			garlic3.hide()
			garlic4.hide()
		0:
			garlic_container.hide()
			
	timer.text = str(time)
	level.text = "level" + str(Global.minigames_done)
	
func Timer(start_time: float):
	time = start_time
	while time > 0.0:
		await wait(0.1)
		time -= 0.1
	return
	
func wait(seconds: float) -> void:
	await get_tree().create_timer(seconds).timeout
