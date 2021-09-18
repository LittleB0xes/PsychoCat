extends Cat


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	direction = Vector2(
		Input.get_action_strength("p1_right") - Input.get_action_strength("p1_left"),
		1		
	)
	
	jump = Input.is_action_just_pressed("p1_jump")
	
	
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
