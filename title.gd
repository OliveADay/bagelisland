extends Node2D

var main_scene = preload("res://world.tscn")
var lapFilePath = "user://lap.cfg"
var best_lap = 0

func loadBScore():
	var config = ConfigFile.new()
	var error = config.load(lapFilePath)
	if error!=OK:
		best_lap = 0
		return
	best_lap = config.get_value("main","best_lap")

func _ready() -> void:
	loadBScore()
	$CanvasLayer/best_lap.text = "your best score: "+str(best_lap)




func _on_button_pressed() -> void:
	$CanvasLayer.visible = false
	add_child(main_scene.instantiate())
