extends KinematicBody2D

var speed = 20
var velocity = Vector2.ZERO
var theta := 0.0

var collide = false

var switch = false

func _ready():
	$AnimatedSprite.play("fly")
	theta = rand_range(0.0, PI * 2)
	
	var light = get_node("../")
	light.connect("light", self, "_light_switch")

func _process(delta):
	if switch:
		self.hide()
	else:
		self.show()
	
	# In case of collision, velocity angle  change
	if collide:
		theta += rand_range(-0.5 * PI, PI * 0.5)
		var k  = round(theta / (2*PI))
		theta -= k * 2 * PI
		collide = false
	
	if theta < 0.5 * PI && theta > 0:
		$AnimatedSprite.flip_v = false
		$AnimatedSprite.flip_h = true
	elif theta > 0.5 * PI && theta < PI:
		$AnimatedSprite.flip_v = false
		$AnimatedSprite.flip_h = false
	elif theta > PI && theta < 1.5 * PI:
		$AnimatedSprite.flip_v = false
		$AnimatedSprite.flip_h = true
	elif theta > 1.5 * PI && theta < 2* PI:
		$AnimatedSprite.flip_v = false
		$AnimatedSprite.flip_h = false

	velocity.x = speed * cos(theta)
	velocity.y = speed * sin(theta)
	velocity *= delta

func _physics_process(_delta):
	if move_and_collide(velocity):
		collide = true

func _on_Area2D_body_entered(body):
	if body is Cat && !body.sleeping:
		queue_free()
	
func _light_switch():
	switch = !switch
