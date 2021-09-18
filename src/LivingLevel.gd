extends Node2D

var light_state = true

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
signal light

var max_flies = 10
var flies = []




# Called when the node enters the scene tree for the first time.
func _ready():
	var switcher = get_node("LightSwitcher")
	switcher.connect("switch", self, "_on_switcher")
	var fly = preload("res://Fly.tscn")
	for n in max_flies:
		var f = fly.instance()
		f.position.x = rand_range($Background.position.x, $Background.position.x + 256)
		f.position.y = rand_range($Background.position.y, $Background.position.y + 100)
		flies.append(f)
		add_child(f)
	
	
	randomize()
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#if $LightSwitcher.emit_signal("switch"):
	if light_state:
		$Background.show()
		$Piano.show()
		$ShelfBook.show()
		$BlueSofa.show()
		$LightSwitcher.show()
		$FishBulb.show()
	else:
		$Background.hide()
		$Piano.hide()
		$ShelfBook.hide()
		$BlueSofa.hide()
		$LightSwitcher.hide()
		$FishBulb.hide()
		
	
	if Input.is_action_just_pressed("ui_accept"):
		light_state = !light_state
#	pass

func _on_switcher():
	light_state = !light_state
	emit_signal("light")
