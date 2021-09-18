extends Area2D

export (int) var MAX_TIME = 120
var radio_on := true
var switch := false
var timer = MAX_TIME


# Called when the node enters the scene tree for the first time.
func _ready():
	var light = get_node("../")
	light.connect("light", self, "_light_switch")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	if radio_on:
		timer -= 1
		
	if timer == 0:
		radio_on = false
		timer = MAX_TIME
	
	
	if switch && radio_on:
		$AnimatedSprite.play("dark_radio_on")
	elif switch && !radio_on:
		$AnimatedSprite.play("dark_radio_off")
	elif !switch && radio_on:
		$AnimatedSprite.play("radio_on")
	elif !switch && !radio_on:
		$AnimatedSprite.play("radio_off")
				
func _on_Radio_body_entered(body):
	radio_on = true #!radio_on
	
func _light_switch():
	switch = !switch
