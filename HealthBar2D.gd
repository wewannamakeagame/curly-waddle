extends TextureProgress

var bar_red = preload("res://assets/barHorizontal_red_mid 200.png")
var bar_green = preload("res://assets/barHorizontal_green_mid 200.png")
var bar_yellow = preload("res://assets/barHorizontal_yellow_mid 200.png")
				
#func _ready():
#	hide()
	
func update_bar(amount, full):
	if amount < full:
		show()
	texture_progress = bar_green
	if amount < 0.75 * full:
		texture_progress = bar_yellow
	if value < 0.45 * full:
		texture_progress = bar_red
	value = amount

func _on_HealthBar2D_gui_input(event):
	if event is InputEventMouseButton and event.pressed:
		show()
		update_bar(value-1, 10)
