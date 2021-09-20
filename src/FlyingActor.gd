extends KinematicBody2D

class_name FlyingActor
var speed = 20
var velocity = Vector2.ZERO

# point for catching : 1 for fly and -1 for bee
var point = 1

var collide = false
var switch = false
var theta := 0.0
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimatedSprite.play("fly")
	theta = rand_range(0.0, PI * 2)
	
	var light = get_node("../")
	light.connect("light", self, "_light_switch")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _physics_process(delta):
	pass
	

