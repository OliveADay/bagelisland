extends Node2D
var enemy = preload("res://enemy.tscn")


func _on_player_lapped(laps: Variant) -> void:
	$CanvasLayer/Label.text = "Laps: "+str(laps)
	var enem_verz = enemy.instantiate()
	add_child(enem_verz)
	enem_verz.visible = true
	enem_verz.speed = enem_verz.SPEED_MAX
		
