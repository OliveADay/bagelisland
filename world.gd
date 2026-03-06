extends Node2D
var enemy = preload("res://enemy.tscn")
var isnt_first = false


func _on_player_lapped(laps: Variant) -> void:
	$CanvasLayer/Label.text = "Laps: "+str(laps)
	if not isnt_first:
		$enemy.visible = true
		$enemy.speed = $enemy.SPEED_MAX
		isnt_first = true
	else:
		var enem_verz = enemy.instantiate()
		add_child(enem_verz)
		enem_verz.visible = true
		enem_verz.speed = enem_verz.SPEED_MAX
		
