extends Button


func _on_pressed() -> void:
	get_node("AudioStreamPlayer").play()
