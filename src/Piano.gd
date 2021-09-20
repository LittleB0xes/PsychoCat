extends StaticBody2D

var velocity = Vector2(2,2)
# Declare member variab,les here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _on_C_body_entered(body):
	if body.velocity.y >= 0:
		$Do.play()

func _on_D_body_entered(body):
	if body.velocity.y >= 0:
		$Re.play()

func _on_E_body_entered(body):
	if body.velocity.y >= 0:
		$Mi.play()

func _on_F_body_entered(body):
	if body.velocity.y >= 0:
		$Fa.play()

func _on_G_body_entered(body):
	if body.velocity.y >= 0:
		$Sol.play()

func _on_A_body_entered(body):
	if body.velocity.y >= 0:
		$La.play()

func _on_B_body_entered(body):
	if body.velocity.y >= 0:
		$Si.play()
