extends Area2D

var jumping = false


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if jumping:
		$AnimatedSprite.play("jump")
	else:
		$AnimatedSprite.play("swim")

func _on_FishBulb_body_entered(body):
	jumping = true



func _on_AnimatedSprite_animation_finished():
	jumping = false
