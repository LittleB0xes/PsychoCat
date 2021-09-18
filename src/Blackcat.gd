extends Cat

var test = true

func _ready():
	position.x = 200
	position.y = 40

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	direction = Vector2(
		Input.get_action_strength("p2_right") - Input.get_action_strength("p2_left"),
		1		
	)
	
	jump = Input.is_action_just_pressed("p2_jump")
	




