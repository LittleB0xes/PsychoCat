extends Area2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var active = true

# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimatedSprite.play("fly")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Fly_body_entered(body):
	if body is Cat:
		print ("touch")
		active = false
		queue_free()
