extends Node2D

var light_state = true

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
signal light

var max_flies = 10




# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	var switcher = get_node("LightSwitcher")
	switcher.connect("switch", self, "_on_switcher")
	var fly = preload("res://Fly.tscn")
	for n in max_flies:
		var f = fly.instance()
		f.position.x = rand_range($Background/Sprite.position.x, $Background/Sprite.position.x + 256)
		f.position.y = rand_range($Background/Sprite.position.y, $Background/Sprite.position.y + 100)
		f.set_collision_layer(4)
		#f.set_collision_mask_bit(0, false)
		f.set_collision_mask(8)
		add_child(f)
	
	
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	
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
		emit_signal("light")
#	pass

func _on_switcher():
	light_state = !light_state
	emit_signal("light")
