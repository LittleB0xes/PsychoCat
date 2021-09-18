extends KinematicBody2D


class_name Cat
var speed = 3000
var jumpStrength = 10000
var brake = 0.8
var direction = Vector2.ZERO
var velocity = Vector2.ZERO
var gravity = 500
var sight := true
var jump := false

var switch := false

var on_the_ground := false

func _ready():
	var light = get_node("../")
	light.connect("light", self, "_light_switch")

func _process(_delta):
	
	$AnimatedSprite.flip_h = sight
	if velocity.y == 0 && direction.x != 0:
		if switch:
			$AnimatedSprite.play("dark_walk")
		else:
			$AnimatedSprite.play("walk")
		on_the_ground = true
	elif velocity.y == 0 && direction.x == 0:
		if switch:
			$AnimatedSprite.play("dark_idle")			
		else:
			$AnimatedSprite.play("idle")
		on_the_ground = true
			
	elif velocity.y != 0:
		if switch:
			$AnimatedSprite.play("dark_jump")
		else:
			$AnimatedSprite.play("jump")
			
	if direction.x > 0:
		sight = false
	elif direction.x < 0:
		sight = true

func _physics_process(delta):
	
	# Character slowdown
	if direction.x == 0:
		velocity.x *= 0.7
	else:
		velocity.x = direction.x * speed * delta
			
	if jump && on_the_ground:
		velocity.y -= jumpStrength * delta
		on_the_ground = false
		
	velocity.y += gravity * delta
	#if is_on_floor():
	#	velocity.y = 0
	velocity = move_and_slide(velocity)
		
func _light_switch():
	switch = !switch
	
